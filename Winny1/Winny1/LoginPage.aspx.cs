using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public partial class LoginPage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=dbGroupProject; Integrated Security=SSPI ");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblNewAccount.Text = "";
            }
                
            
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Security security = new Security();
            if (security.Login(txtUserEmail.Text, txtPassword.Text))
            {
                if (security.access == "a")
                {
                    
                    Response.Redirect("index.aspx");
                }
                else if (security.access == "c")
                {
                    Response.Redirect("Client.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid Login";
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
           
            if (Page.IsValid)
            {

                SqlCommand cmd = new SqlCommand("spUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@crud", "c");
                cmd.Parameters.AddWithValue("@firstName", txtNewFirstName.Text);
                cmd.Parameters.AddWithValue("@lastName", txtNewLastName.Text);
                cmd.Parameters.AddWithValue("@phoneNumber", txtNewPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@Address", txtNewAddress.Text);
                cmd.Parameters.AddWithValue("@Email", txtNewEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text);
                cmd.Parameters.AddWithValue("@AccessLevel", txtAccessLevel.Text);
                
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
              
                lblNewAccount.Text = "Registration is successfully completed!";
            //Response.Redirect("Client.aspx");

        }
            else
            {
                lblNewAccount.Text = " Something went wrong...";
            }

}
    }
}
