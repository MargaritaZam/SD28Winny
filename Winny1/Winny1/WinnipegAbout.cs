using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public class WinnipegAbout
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost;Initial Catalog=dbOmegaProject;Integrated Security=SSPI");

        public DataTable LoadAboutCategories()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spAboutCrud", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            conn.Open();
            da.Fill(ds);
            conn.Close();

            return ds.Tables[0];
        }

        public DataTable LoadAbout(int? AboutID)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spAboutCrud", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "r");

            // if (AboutID != null)
            da.SelectCommand.Parameters.AddWithValue("@aboutID", AboutID);

            conn.Open();
            da.Fill(ds);
            conn.Close();

            return ds.Tables[0];
        }
    }
}