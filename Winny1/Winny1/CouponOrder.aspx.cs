using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public partial class CouponOrder : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI");
        GetCoupon _coupon = new GetCoupon();
        string _coupon_id;
        string _qtty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Security security = new Security();
            //security.checkAccess("c");
            if(!IsPostBack)
            try
            {
                _coupon_id = Request["id"];
                _qtty = Request["qtty"];
                loadTotalCouponOrder();
            }
            catch (Exception)
            {

            }
        }
        private void loadTotalCouponOrder()
        {
            var result = _coupon.loadCoupons(Convert.ToInt32(_coupon_id, null));
            ImgCoupons.ImageUrl = result.Rows[0]["Path"].ToString();
            lblName.Text = string.Format("Coupon : {0}", result.Rows[0]["CouponName"].ToString());
        }
    }
}