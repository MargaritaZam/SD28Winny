using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;

namespace Winny1
{
    public class Security
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI");
        public string access { get; set; }


        public bool Login(string UserID, string Password)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spLogin", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@email", UserID);
            da.SelectCommand.Parameters.AddWithValue("@password", Password);
            conn.Open();
            da.Fill(ds);
            conn.Close();
            // check for ds.Tables[0].Rows[0] has rows/data
            if (ds.Tables.Count > 0)
            {
                // new Client()
                // initialize Client()
                User user = new User();
                user.AccessLevel = ds.Tables[0].Rows[0]["accessLevel"].ToString();
                user.Id = Convert.ToInt32(ds.Tables[0].Rows[0]["id"]);
                user.Address = ds.Tables[0].Rows[0]["address"].ToString();
                user.FirstName = ds.Tables[0].Rows[0]["firstName"].ToString();
                user.LastName = ds.Tables[0].Rows[0]["lastName"].ToString();
                user.Phone = ds.Tables[0].Rows[0]["phoneNumber"].ToString();
                access = user.AccessLevel;
                // add to Session
                HttpContext.Current.Session["user"] = user;

                return true;
            }
            else
            {
                return false;
            }
        }
        public void checkAccess(string levelRequired)
        {
            User user = (User)HttpContext.Current.Session["user"];
            access = user.AccessLevel;
            bool isInvalid = false;
            if (levelRequired == "c")
            {
                if (access == "" || access == "a")
                {
                    isInvalid = true;
                }
            }
            else if (levelRequired == "a")
            {
                if (access != "a")
                {
                    isInvalid = true;
                }
            }
            if (isInvalid)
            {
                HttpContext.Current.Session.Abandon();
                HttpContext.Current.Response.Redirect("index.aspx");
            }
        }
    }
}