using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public class WinnipegShopping
    {
        SqlConnection _conn = new SqlConnection("Data Source=localhost; Initial Catalog=dbShopping; Integrated Security=SSPI");

        public DataTable LoadShoppingCategories()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spGetShoppingCategories", _conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            _conn.Open();
            da.Fill(ds);
            _conn.Close();

            return ds.Tables[0];
        }
    
        public DataTable LoadStores( int? StoreId, int? CategoryId)
        {
            
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spStores", _conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@Crud", 'x');
            //if (StoreId != null)
                da.SelectCommand.Parameters.AddWithValue("@StoreId", StoreId);
            //if(CategoryId != null)         
                da.SelectCommand.Parameters.AddWithValue("@CategoryId", CategoryId);

                _conn.Open();
                da.Fill(ds);
                _conn.Close();

                return ds.Tables[0];
            }
        }
    }
