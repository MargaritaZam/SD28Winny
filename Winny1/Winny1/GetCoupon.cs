using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public class GetCoupon
    {
        SqlConnection _conn = new SqlConnection("Data Source=localhost; Initial Catalog=dbGroupProject; Integrated Security=SSPI");

        public DataTable LoadMagazineCategories()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spGetMagazineCategories", _conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            _conn.Open();
            da.Fill(ds);
            _conn.Close();

            return ds.Tables[0];
        }
        //A method to retrieve a set of magazines for each category

        public DataTable LoadMagazines(int? magazineId, int? categoryId)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spMagazines", _conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", 'r');
            if (magazineId != null)
                da.SelectCommand.Parameters.AddWithValue("@magId", magazineId);
            if (categoryId != null)
                da.SelectCommand.Parameters.AddWithValue("@categoryId", categoryId);
            _conn.Open();
            da.Fill(ds);
            _conn.Close();

            return ds.Tables[0];
        }

    }
}