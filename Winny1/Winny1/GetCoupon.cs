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

        public string AddCouponOrder(int user_id, int coupon_id)
        {
            SqlCommand cmd = new SqlCommand("spAddCouponOrder", _conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CouponId", coupon_id);
           // Security mySecurity = new Security();
            cmd.Parameters.AddWithValue("@UserId", user_id);
            _conn.Open();
            string message = (string)cmd.ExecuteScalar();
            _conn.Close();

            return message;
        }
        public DataTable loadCoupons(int? couponId)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spCoupon", _conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@Crud", 'r');
            if (couponId != null)
                da.SelectCommand.Parameters.AddWithValue("@CouponId", couponId);
            //if (categoryId != null)
            //    da.SelectCommand.Parameters.AddWithValue("@TypeId", categoryId);
            _conn.Open();
            da.Fill(ds);
            _conn.Close();

            return ds.Tables[0];
        }
        public DataTable loadCouponOrders()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spGetOrder", _conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            _conn.Open();
            da.Fill(ds);
            _conn.Close();

            return ds.Tables[0];
        }
    }

}