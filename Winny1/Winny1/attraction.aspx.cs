using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public partial class attraction : System.Web.UI.Page
    {
        PagedDataSource adsource;
        int ps;
        string conn = "Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
               
                loadLocation();
                loadCategory();
            }
            ps = (int)this.ViewState["vs"];
            loadAttraction();
        }

       
        public void loadLocation()
        {
            DAL myDal = new DAL(conn);
            DataSet ds = myDal.ExecuteProcedure("spLocation");
            ddlLocation.DataSource = ds.Tables[0];
            ddlLocation.DataTextField = "LocationName";
            ddlLocation.DataValueField = "LocationID";
            ddlLocation.DataBind();
        }


        public void loadCategory()
        {
            //string conn = "Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI";
            //DAL myDal = new DAL(conn);          
            //DataSet ds = myDal.ExecuteProcedure("spGetCategory");
            //ddlCategory.DataSource = ds.Tables[0];
            //ddlCategory.DataTextField = "attractionCategory";
            //ddlCategory.DataBind();
        }
        public void loadAttraction()
        {
            DAL myDal = new DAL(conn);
            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "a");
            DataSet ds = myDal.ExecuteProcedure("spAttractions");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 5;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = ps;
            btnfirst.Enabled = !adsource.IsFirstPage;
            btnprevious.Enabled = !adsource.IsFirstPage;
            btnlast.Enabled = !adsource.IsLastPage;
            btnnext.Enabled = !adsource.IsLastPage;
            dlAttraction.DataSource = adsource;
            dlAttraction.DataBind();
        }
        protected void btnfirst_Click(object sender, EventArgs e)
        {
            ps = 0;
            loadAttraction();
        }

        protected void btnprevious_Click(object sender, EventArgs e)
        {
            ps = (int)this.ViewState["vs"];
            ps -= 1;
            this.ViewState["vs"] = ps;
            loadAttraction();
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            ps = (int)this.ViewState["vs"];
            ps += 1;
            this.ViewState["vs"] = ps;
            loadAttraction();
        }

        protected void btnlast_Click(object sender, EventArgs e)
        {
            ps = adsource.PageCount - 1;
            loadAttraction();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string id = ddlCategory.SelectedItem.Value;
            string LocationID = ddlLocation.SelectedItem.Value;
            DAL myDal = new DAL(conn);
            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "a");
            myDal.AddParam("@id", id);
            myDal.AddParam("@Location", LocationID);
            DataSet ds = myDal.ExecuteProcedure("spAttractions");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 3;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = ps;
            btnfirst.Enabled = !adsource.IsFirstPage;
            btnprevious.Enabled = !adsource.IsFirstPage;
            btnlast.Enabled = !adsource.IsLastPage;
            btnnext.Enabled = !adsource.IsLastPage;
            dlAttraction.DataSource = adsource;
            dlAttraction.DataBind();
        }
    }
}