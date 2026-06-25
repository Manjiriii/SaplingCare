using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SaplingCare.DAL;

namespace SaplingCare
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
               

                LoadSaplings();
                LoadSaplingDropdown();
                LoadHistory();
            }
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();     // remove all session values
            Session.Abandon();   // destroy session

            Response.Redirect("Login.aspx");
        }

        void LoadSaplings()
        {
            SaplingDAL dal = new SaplingDAL();
            gvSaplings.DataSource = dal.GetAllSaplings();
            gvSaplings.DataBind();
        }

        void LoadSaplingDropdown()
        {
            SaplingDAL dal = new SaplingDAL();
            DataTable dt = dal.GetAllSaplings();

            dt.Columns.Add(
                "DisplayText",
                typeof(string),
                "SaplingCode + ' - ' + SaplingName"
            );

            ddlSapling.DataSource = dt;
            ddlSapling.DataTextField = "DisplayText";
            ddlSapling.DataValueField = "SaplingCode";
            ddlSapling.DataBind();

            ddlSapling.Items.Insert(0,
                new System.Web.UI.WebControls.ListItem("-- Select Sapling --", "")
            );
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ddlSapling.SelectedValue == "")
                return;

            SaplingDAL dal = new SaplingDAL();

            string watered = chkWatered.Checked ? "Yes" : "No";

            dal.InsertSaplingHistory(
                ddlSapling.SelectedValue,
                watered,
                ddlHealth.SelectedValue,
                txtRemarks.Text
            );

            LoadHistory();
            LoadSaplings();

            ddlSapling.SelectedIndex = 0;
            chkWatered.Checked = false;
            ddlHealth.SelectedIndex = 0;
            txtRemarks.Text = "";
        }

        protected void gvHistory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvHistory.EditIndex = e.NewEditIndex;
            LoadHistory();
        }

        protected void gvHistory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvHistory.EditIndex = -1;
            LoadHistory();
        }

        protected void gvHistory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int historyId =
                Convert.ToInt32(gvHistory.DataKeys[e.RowIndex].Value);

            // Cell index reference:
            // 0 → Edit button
            // 1 → SaplingCode
            // 2 → UpdateDate
            // 3 → Watered
            // 4 → Health
            // 5 → Remarks

            string dateText =
                ((TextBox)gvHistory.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            DateTime updateDate = Convert.ToDateTime(dateText);

            string watered =
                ((TextBox)gvHistory.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

            string health =
                ((TextBox)gvHistory.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            string remarks =
                ((TextBox)gvHistory.Rows[e.RowIndex].Cells[5].Controls[0]).Text;

            SaplingDAL dal = new SaplingDAL();
            dal.UpdateHistory(historyId, updateDate, watered, health, remarks);

            gvHistory.EditIndex = -1;
            LoadHistory();
        }



        void LoadHistory()
        {
            SaplingDAL dal = new SaplingDAL();
            gvHistory.DataSource = dal.GetSaplingHistory();
            gvHistory.DataBind();
        }
    }
}
