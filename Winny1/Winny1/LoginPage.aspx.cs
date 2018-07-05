using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Winny1
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Security security = new Security();
            if (security.Login(txtUserEmail.Text, txtPassword.Text))
            {
                if (security.access == "a")
                {
                    Response.Redirect("Adminpage.aspx");
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
    }
}