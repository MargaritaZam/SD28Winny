using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public class WinnipegSchools
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost;Initial Catalog=dbOmegaProject;Integrated Security=SSPI");

        public DataTable LoadSchoolTypes()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("GetSchoolTypes",conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            conn.Open();
            da.Fill(ds);
            conn.Close();

            return ds.Tables[0];
        }

        public DataTable LoadSchools(int? SchoolID, int? SchoolType)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spSchoolsCrud", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@Crud", 'r');

            //if (SchoolId != null)
            da.SelectCommand.Parameters.AddWithValue("@schoolID", SchoolID);
            //if(TypeId != null)         
            da.SelectCommand.Parameters.AddWithValue("@schoolTypeId", SchoolType);

            conn.Open();
            da.Fill(ds);
            conn.Close();

            return ds.Tables[0];
        }
    }
}