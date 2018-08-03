using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Text;


namespace Winny1
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (txtConformEmail.Text == "")
            {
                lblError.Text = "please enter email..";
                return;
            }
            Session["Email"] = txtConformEmail.Text;

            StringBuilder sb = new StringBuilder();
            sb.Append("Hi,<br/> Click on below given link to Reset Your Password<br/>");
            sb.Append("<a href=http://localhost:54908/ConformPassword.aspx?username =" + txtConformEmail.Text);
            sb.Append("&email=" + txtConformEmail.Text + ">Click here to change your password</a><br/>");

            sb.Append("thanks");

            MailMessage message = new System.Net.Mail.MailMessage("anjali.patel@robertsoncollege.net", txtConformEmail.Text.Trim(), "Reset Your Password", sb.ToString());

            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";

            smtp.Port = 587;

            smtp.Credentials = new System.Net.NetworkCredential("anjali.patel@robertsoncollege.net", "Dasnadas16");

            smtp.EnableSsl = true;

            message.IsBodyHtml = true;

            smtp.Send(message);



        }
    }
}