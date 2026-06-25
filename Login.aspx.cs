using System;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;
using SaplingCare.DAL;
using SaplingCare.Models;



namespace SaplingCare
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (email == "" || password == "")
            {
                lblMessage.Text = "Please enter email and password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            UserDAL dal = new UserDAL();
            string hashedPwd = HashPassword(password);

            //  REAL DB CHECK
            User user = dal.GetUser(email, hashedPwd);

            if (user != null)
            {
                Session["UserEmail"] = user.Email;
                Session["UserName"] = user.FullName;
                Session["UserRole"] = user.Role;

                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid email or password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }



        private string HashPassword(string password)
        {
            using (var sha = System.Security.Cryptography.SHA256.Create())
            {
                var bytes = sha.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }
    }
}
