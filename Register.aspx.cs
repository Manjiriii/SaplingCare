using System;
using System.Drawing.Printing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using SaplingCare.DAL;

namespace SaplingCare
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string pass = txtPassword.Text.Trim();
            string confirm = txtConfirm.Text.Trim();
            string role = ddlRole.SelectedValue;

            if (name == "" || email == "" || pass == "" || role == "")
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (pass != confirm)
            {
                lblMessage.Text = "Passwords do not match.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            UserDAL dal = new UserDAL();
            string hashedPwd = HashPassword(pass);

            string result = dal.RegisterUser(name, email, hashedPwd, role);

            if (result == "EXISTS")
            {
                lblMessage.Text = "User already exists!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblMessage.Text = "Registration successful! Redirecting...";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                //Delay redirected slightly so message can be seen
                Response.AddHeader("REFRESH", "2;URL=Login.aspx");
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
