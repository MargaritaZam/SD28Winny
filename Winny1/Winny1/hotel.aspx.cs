﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;

namespace Winny1
{
    public partial class hotel : System.Web.UI.Page
    {
        PagedDataSource adsource;
        int pos;
        string conn = "Data Source=localhost;Initial Catalog=dbOmegaProject;Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
                loadLocation();
                loadHotelStars();
            }
            pos = (int)this.ViewState["vs"];
            loadHotels();
        }

        public void loadHotels()
        {
            DAL myDal = new DAL(conn);

            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "a");
            DataSet ds = myDal.ExecuteProcedure("spHotelsCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 3;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            btnFirst.Enabled = !adsource.IsFirstPage;
            btnPrevious.Enabled = !adsource.IsFirstPage;
            btnLast.Enabled = !adsource.IsLastPage;
            btnNext.Enabled = !adsource.IsLastPage;
            DlHotels.DataSource = adsource;
            DlHotels.DataBind();
        }
        public void loadLocation()
        {
            DAL myDal = new DAL(conn);

            DataSet ds = myDal.ExecuteProcedure("spLocation");
            DdlLocation.DataSource = ds.Tables[0];
            DdlLocation.DataTextField = "LocationName";
            DdlLocation.DataValueField = "LocationID";
            DdlLocation.DataBind();
        }

        public void loadHotelStars()
        {
            DAL myDal = new DAL(conn);

            DataSet ds = myDal.ExecuteProcedure("spHotelStars");
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {

        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {

        }

        protected void btnLast_Click(object sender, EventArgs e)
        {

        }
    }
}