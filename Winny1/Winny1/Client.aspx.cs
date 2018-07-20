using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public partial class Client : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI");
        GetCoupon _coupon = new GetCoupon();
        protected void Page_Load(object sender, EventArgs e)
        {

            HtmlInputButton LogIn = (HtmlInputButton)Master.FindControl("btnLogIn");
            HtmlInputButton LogOut = (HtmlInputButton)Master.FindControl("btnLogOut");
            LogOut.Visible = true;
            LogIn.Visible = false;

            if (!IsPostBack)
            {
                loadCoupons();
            }
        }
            public void loadCoupons()
            {
                //string id = Request.QueryString["id"].ToString();
                dlCouponOrder.DataSource = _coupon.loadCoupons(null, null);
                dlCouponOrder.DataBind();

            }

        protected void dlCouponOrder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dlCouponOrder_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DropDownList ddl = (DropDownList)e.Item.FindControl("ddlNumofCoupons");
            string id = e.CommandArgument.ToString();
            AddCouponOrder(id, ddl.SelectedValue);

        }
        private void AddCouponOrder(string coupon_id, string qtty)
        {

        }
    }

       
}