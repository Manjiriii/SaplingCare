//Data Access Layer Class
//It uses SqlConnection, SqlCommand, and SqlDataAdapter to execute queries
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SaplingCare.DAL
{
    public class SaplingDAL
    {   //Connection string is stored in Web.config (it reads from there)
        private string conStr =
            ConfigurationManager.ConnectionStrings["SaplingCareDB"].ConnectionString;

        //SAPLINGS 

        public DataTable GetAllSaplings()
        {   //Returns data related to all saplings
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    @"SELECT SaplingCode, SaplingName, Location, LastWatered, Health
                      FROM Saplings",
                    con
                );

                DataTable dt = new DataTable(); //It stores rows and columns
                da.Fill(dt);                    //Easy to bind with GridView
                return dt;
            }
        }


        //INSERT HISTORY 
        public void InsertSaplingHistory(
            string saplingCode,
            string watered,
            string health,
            string remarks)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(
                    @"INSERT INTO SaplingUpdateHistory
                      (SaplingCode, UpdateDate, Watered, Health, Remarks)
                      VALUES
                      (@code, CAST(GETDATE() AS DATE), @watered, @health, @remarks)",
                    con
                );
                //These prevent SQL injections
                cmd.Parameters.AddWithValue("@code", saplingCode);
                cmd.Parameters.AddWithValue("@watered", watered);
                cmd.Parameters.AddWithValue("@health", health);
                cmd.Parameters.AddWithValue("@remarks", remarks);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // FETCH HISTORY (Returns last update first)

        public DataTable GetSaplingHistory()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    @"SELECT HistoryId,SaplingCode,UpdateDate,Watered,Health,Remarks FROM SaplingUpdateHistory ORDER BY HistoryId DESC",con
                );

                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        //UPDATE SAPLING (Main table)
        public void UpdateSapling(string code, DateTime lastWatered, string health)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(
                    @"UPDATE Saplings
              SET LastWatered = @date,
                  Health = @health
              WHERE SaplingCode = @code",
                    con
                );

                cmd.Parameters.AddWithValue("@date", lastWatered);
                cmd.Parameters.AddWithValue("@health", health);
                cmd.Parameters.AddWithValue("@code", code);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        //Update history records
        public void UpdateHistory(int historyId, DateTime updateDate, string watered, string health, string remarks)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(
                    @"UPDATE SaplingUpdateHistory SET UpdateDate=@date,Watered = @watered,
                  Health = @health,
                  Remarks = @remarks
              WHERE HistoryId = @id",
                    con
                );
                cmd.Parameters.Add("@date", SqlDbType.Date).Value = updateDate;
                cmd.Parameters.AddWithValue("@watered", watered);
                cmd.Parameters.AddWithValue("@health", health);
                cmd.Parameters.AddWithValue("@remarks", remarks);
                cmd.Parameters.AddWithValue("@id", historyId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //This is for returning values on landing page snapshot
        public DataTable GetDashboardSnapshot()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
            SELECT
                (SELECT COUNT(*) FROM Saplings) AS TotalSaplings,

                (SELECT COUNT(DISTINCT SaplingCode)
                 FROM SaplingUpdateHistory
                 WHERE UpdateDate = CAST(GETDATE() AS DATE)
                 AND Watered = 'Yes') AS WateredToday,

                (SELECT COUNT(*) FROM Saplings
                 WHERE Health = 'Poor') AS NeedAttention,

                CAST(
                    (SELECT COUNT(*) FROM Saplings WHERE Health = 'Good') * 100.0 /
                    NULLIF((SELECT COUNT(*) FROM Saplings),0)       
                AS INT) AS SurvivalPercent
        ", con);
                //NULLIF(...,0)--- Prevents divide by 0 error
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }



    }
}
