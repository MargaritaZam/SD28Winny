using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public class WinnipegAttr
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=dbShopping; Integrated Security=SSPI");
        public DataTable loadAttractionCategory(string attractionCategory)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spAttractions", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", 'f');
            da.SelectCommand.Parameters.AddWithValue("@category", attractionCategory);

            conn.Open();
            da.Fill(ds);
            conn.Close();

            return ds.Tables[0];
        }
        public DataTable loadAttrWithCategory(int? attractionID, int? attractionCategory)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spAttractions", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", 'x');
            da.SelectCommand.Parameters.AddWithValue("@id", attractionID);
            da.SelectCommand.Parameters.AddWithValue("@category", attractionCategory);
            conn.Open();
            da.Fill(ds);
            conn.Close();

            return ds.Tables[0];

        }
    }
}