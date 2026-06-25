using System;
using System.Data;
using SaplingCare.DAL;   // Data Access Layer reference

namespace SaplingCare
{
    public partial class Landing : System.Web.UI.Page
    {
        // Page Load event - executes when page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if page is loading first time
            if (!IsPostBack)
            {
                // Load dashboard data only once
                LoadLandingSnapshot();
            }
        }

        // Method to fetch dashboard snapshot data from database
        void LoadLandingSnapshot()
        {
            // Create object of Data Access Layer
            SaplingDAL dal = new SaplingDAL();

            // Call method to get dashboard data
            DataTable dt = dal.GetDashboardSnapshot();

            // Check if data exists
            if (dt.Rows.Count > 0)
            {
                // Bottom statistics section
                lblTracked.Text = dt.Rows[0]["TotalSaplings"].ToString();
                lblSurvival.Text = dt.Rows[0]["SurvivalPercent"] + "%";
                lblWeeks.Text = "4 Weeks";

                // Today's Snapshot section
                lblSaplings.Text = dt.Rows[0]["TotalSaplings"].ToString();
                lblWatered.Text = dt.Rows[0]["WateredToday"].ToString();
                lblAttention.Text = dt.Rows[0]["NeedAttention"].ToString();
            }
        }
    }
}