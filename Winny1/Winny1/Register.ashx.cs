using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Winny1
{
    /// <summary>
    /// Summary description for Register
    /// </summary>
    public class Register : IHttpHandler
    {
        SqlConnection conn = new SqlConnection(
          "Data Source=localhost;Initial Catalog=dbGroupProject; Integrated Security=SSPI");
        DataSet ds = new DataSet();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.ContentType = "text/plain";

            string first = context.Request.Form["FirstName"];
            string last = context.Request.Form["LastName"];
            string Address = context.Request.Form["Address"];
            string Phone = context.Request.Form["PhoneNo"];
            string email = context.Request.Form["email"];
            string pass = context.Request.Form["pass"];

            SqlCommand cmd = new SqlCommand("spUser", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@crud", "c");
            cmd.Parameters.AddWithValue("@firstName", first);
            cmd.Parameters.AddWithValue("@lastName", last);
            cmd.Parameters.AddWithValue("@phoneNumber", Phone);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", pass);
            cmd.Parameters.AddWithValue("@AccessLevel", "c");

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}