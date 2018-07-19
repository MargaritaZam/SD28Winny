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
    public partial class Coupons : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI");
        GetCoupon _coupon= new GetCoupon();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadCoupons();
            }
        }
           
        public void loadCoupons()
        {
            string id = Request.QueryString["id"].ToString();
            dlCouponOrder.DataSource=_coupon.loadCoupons(null, Convert.ToInt32(id));
            dlCouponOrder.DataBind();

        }
        protected void dlCouponOrder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dlCouponOrder_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DropDownList ddl = (DropDownList)e.Item.FindControl("ddlNumofCoupons");
            string id = e.CommandArgument.ToString();
            //AddCouponOrder(id, ddl.SelectedValue);
                
        }
        //private void AddCouponOrder (string coupon_id, string qtty)
        //{
        //    Response.Redirect(string.Format)
        //}
    }
}