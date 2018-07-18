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
    /// Summary description for login
    /// </summary>
    public class login : IHttpHandler
    {
        string Access;
        public void ProcessRequest(HttpContext context)
        {
            string user = context.Request.Form["email"];
            string pass = context.Request.Form["password"];
            DataSet ds = Login(user, pass);
            context.Response.ContentType = "text/javascript";
            context.Response.Write(Access);
        }
        private DataSet Login(string user, string pass)
        {

            SqlConnection conn = new SqlConnection(
           "Data Source=localhost;Initial Catalog=dbGroupProject; Integrated Security=SSPI");
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spLogin", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@email", user);
            da.SelectCommand.Parameters.AddWithValue("@password", pass);
            conn.Open();
            da.Fill(ds);
            conn.Close();

            Access = ds.Tables[0].Rows[0]["accessLevel"].ToString();
            return ds;
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