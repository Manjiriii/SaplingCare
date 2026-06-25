//Data Access Layer for Users table
using System;
using System.Data.SqlClient;
using System.Configuration;
using SaplingCare.Models;

namespace SaplingCare.DAL
{
    public class UserDAL
    {   //The connection string is stored in Web.config and accessed using ConfigurationManager for better security and maintainability
        private string conStr =
            ConfigurationManager.ConnectionStrings["SaplingCareDB"].ConnectionString;

        //REGISTER NEW USERS
        public string RegisterUser(string name, string email, string passwordHash, string role)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // Step 1: Check if email already exists
                SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE Email=@e", con);

                checkCmd.Parameters.AddWithValue("@e", email);

                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    return "EXISTS";   // Duplicate user
                }

                // Step 2: Insert new user
                SqlCommand cmd = new SqlCommand(
                    @"INSERT INTO Users (FullName, Email, PasswordHash, Role)
              VALUES (@n, @e, @p, @r)", con);

                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@e", email);
                cmd.Parameters.AddWithValue("@p", passwordHash);
                cmd.Parameters.AddWithValue("@r", role);

                cmd.ExecuteNonQuery();

                return "SUCCESS";
            }
        }
        //LOGIN (If count > 0 → user exists → return true)
        public bool ValidateUser(string email, string passwordHash)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE Email=@e AND PasswordHash=@p",
                    con);

                cmd.Parameters.AddWithValue("@e", email);
                cmd.Parameters.AddWithValue("@p", passwordHash);

                con.Open();
                return (int)cmd.ExecuteScalar() > 0;
                //ExecuteScalar() is used when a query returns a single value, like COUNT(*)
            }

        }
        //Returns user data
        public User GetUser(string email, string passwordHash)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(
                    @"SELECT FullName, Email, Role 
              FROM Users 
              WHERE Email=@e AND PasswordHash=@p", con);

                cmd.Parameters.AddWithValue("@e", email);
                cmd.Parameters.AddWithValue("@p", passwordHash);
                
                con.Open();
                //Uses SqlDataReader (reads one row at a time from database)
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return new User
                    {
                        FullName = dr["FullName"].ToString(),
                        Email = dr["Email"].ToString(),
                        Role = dr["Role"].ToString()
                    };
                }
                return null;
            }
        }

    }
}
