using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DAL_Project;

namespace Winny1
{
    public partial class Shopping : System.Web.UI.Page
    {
        PagedDataSource adsource;
        int pss;

        string conn= "Data Source=localhost; Initial Catalog=dbShopping; Integrated Security=SSPI";
        WinnipegShopping _shop = new WinnipegShopping();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
                loadStores();
            }
            pss = (int)this.ViewState["vs"];
            loadStores();
        }
        public void loadStores()
        {
            DAL myDal = new DAL(conn);
            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "r");
            DataSet ds = myDal.ExecuteProcedure("spStores");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 5;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pss;
            btnfirst.Enabled = !adsource.IsFirstPage;
            btnprevious.Enabled = !adsource.IsFirstPage;
            btnlast.Enabled = !adsource.IsLastPage;
            btnnext.Enabled = !adsource.IsLastPage;
            dlStores.DataSource = adsource;
            dlStores.DataBind();
            //DataSet ds = new DataSet();
            //SqlDataAdapter da = new SqlDataAdapter("spStores", conn);
            //da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.AddWithValue("@crud", "r");
            //conn.Open();
            //da.Fill(ds);
            //conn.Close();

            //dlStores.DataSource = ds.Tables[0];
            //dlStores.DataBind();


            //string id = Request.QueryString["id"].ToString();
            //dlStores.DataSource = _shop.LoadStores(null, Convert.ToInt32(id));
            //dlStores.DataBind();
        }

    
        protected void btnfirst_Click(object sender, EventArgs e)
        {
            pss = 0;
            loadStores();
        }

        protected void btnprevious_Click(object sender, EventArgs e)
        {
            pss = (int)this.ViewState["vs"];
            pss -= 1;
            this.ViewState["vs"] = pss;
            loadStores();
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            pss = (int)this.ViewState["vs"];
            pss += 1;
            this.ViewState["vs"] = pss;
            loadStores();
        }

        protected void btnlast_Click(object sender, EventArgs e)
        {
            pss = adsource.PageCount - 1;
            loadStores();
        }

    }
}