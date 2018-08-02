using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Winny1
{
    public partial class attraction : System.Web.UI.Page
    {

        PagedDataSource adsource;
        int ps;
        string conn = "Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI";
        //WinnipegAttr attr = new WinnipegAttr();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;

                loadLocation();
                loadCategory();
                //loadAttrWithCategory();

            }
            ps = (int)this.ViewState["vs"];
            loadAttraction();
            // loadAttrWithCategory();
        }

        //public void loadAttrWithCategory()
        // {
        //     string id = Request.QueryString["id"].ToString();
        //     dlAttraction.DataSource = attr.loadAttrWithCategory(null, Convert.ToInt32(id));
        //     dlAttraction.DataBind();

        // }
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
            //loadAttrWithCategory();
        }

        protected void btnprevious_Click(object sender, EventArgs e)
        {
            ps = (int)this.ViewState["vs"];
            ps -= 1;
            this.ViewState["vs"] = ps;
            loadAttraction();
            // loadAttrWithCategory();
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            ps = (int)this.ViewState["vs"];
            ps += 1;
            this.ViewState["vs"] = ps;
            loadAttraction();
            //  loadAttrWithCategory();
        }

        protected void btnlast_Click(object sender, EventArgs e)
        {
            ps = adsource.PageCount - 1;
            loadAttraction();
            // loadAttrWithCategory();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text == "")
            {
                string id = ddlCategory.SelectedItem.Value;
                string LocationId = ddlLocation.SelectedItem.Value;
                DAL myDal = new DAL(conn);
                adsource = new PagedDataSource();
                myDal.AddParam("@crud", "a");
                myDal.AddParam("@category", id);
                myDal.AddParam("@location", LocationId);
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
            else
            {
                DAL myDal = new DAL(conn);
                adsource = new PagedDataSource();
                myDal.AddParam("@crud", "search");
                myDal.AddParam("@search", txtSearch.Text);
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

        protected void rdChoice1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdChoice1.SelectedValue == "1")
            {
                DAL myDal = new DAL(conn);
                adsource = new PagedDataSource();
                myDal.AddParam("@crud", "AtoF");
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
            else if (rdChoice1.SelectedValue == "2")
            {
                DAL myDal = new DAL(conn);
                adsource = new PagedDataSource();
                myDal.AddParam("@crud", "GtoL");
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
            else if (rdChoice1.SelectedValue == "3")
            {
                DAL myDal = new DAL(conn);
                adsource = new PagedDataSource();
                myDal.AddParam("@crud", "MtoR");
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
            else if (rdChoice1.SelectedValue == "4")
            {
                DAL myDal = new DAL(conn);
                adsource = new PagedDataSource();
                myDal.AddParam("@crud", "StoZ");
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
            else if (rdChoice1.SelectedValue == "a")
            {
                DAL myDal = new DAL(conn);
                adsource = new PagedDataSource();
                myDal.AddParam("@crud", "a");
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
            else if (rdChoice1.SelectedValue == "0")
            {
                DAL myDal = new DAL(conn);
                adsource = new PagedDataSource();
                myDal.AddParam("@crud", "1to10");
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
}