using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;


namespace Winny1
{
    public partial class Restaurants : System.Web.UI.Page
    {
        PagedDataSource adsource;
        int pos;
        string conn = "Data Source= localhost; Initial Catalog=dbRestaurants; Integrated Security= SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
            }
            pos = (int)this.ViewState["vs"];
            loadRestaurants();

        }
        public void loadRestaurants()
        {
            
            DAL myDal = new DAL(conn);
            adsource = new PagedDataSource();
            myDal.AddParam("@crud","a");
            DataSet ds = myDal.ExecuteProcedure("spRestaurants");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 3;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            btnfirst.Enabled = !adsource.IsFirstPage;
            btnprevious.Enabled = !adsource.IsFirstPage;
            btnlast.Enabled = !adsource.IsLastPage;
            btnnext.Enabled = !adsource.IsLastPage;
            dlRestaurant.DataSource = adsource;
            dlRestaurant.DataBind();



        }

        protected void btnfirst_Click(object sender, EventArgs e)
        {
            pos = 0;
            loadRestaurants();
        }

        protected void btnprevious_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos -= 1;
            this.ViewState["vs"] = pos;
            loadRestaurants();
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos += 1;
            this.ViewState["vs"] = pos;
            loadRestaurants();
        }

        protected void btnlast_Click(object sender, EventArgs e)
        {
            pos = adsource.PageCount - 1;
            loadRestaurants();
        }
    }
}