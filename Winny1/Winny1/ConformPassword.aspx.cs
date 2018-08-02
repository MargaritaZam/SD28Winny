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
    public partial class ConformPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["Email"].ToString();
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string email = Session["Email"].ToString();

            SqlConnection conn = new SqlConnection("Data Source=localhost;Initial Catalog=dbGroupProject;integrated security=SSPI");
            SqlCommand cmd = new SqlCommand("Update tbUsers set password='" + txtpwd.Text + "'where Email='" + email + "'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert ('your password has been successfully updated')</script>");
            txtpwd.Text = "";
            txtcofrmpwd.Text = "";
            Response.Redirect("index.aspx");

        }
    }
}