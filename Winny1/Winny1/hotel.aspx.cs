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
        string conn = "Data Source=localhost;Initial Catalog=dbGroupProject;Integrated Security=SSPI";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
                loadLocation();
                loadRating();
            }
            pos = (int)this.ViewState["vs"];
            loadHotels();
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

        public void loadRating()
        {
            DAL myDal = new DAL(conn);
            
            DataSet ds = myDal.ExecuteProcedure("spGetRating");
            DdlRating.DataSource = ds.Tables[0];
            DdlRating.DataTextField = "Rating";
            DdlRating.DataValueField = "RatingID";
            DdlRating.DataBind();
        }

        public void loadHotels()
        {
            DAL myDal = new DAL(conn);

            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "r");
            DataSet ds = myDal.ExecuteProcedure("spHotelCrud");
            DdlLocation.DataTextField = "HotelLocation";
            DdlLocation.DataTextField = "HotelRating";
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 2;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            btnFirst.Enabled = !adsource.IsFirstPage;
            btnPrevious.Enabled = !adsource.IsFirstPage;
            btnLast.Enabled = !adsource.IsLastPage;
            btnNext.Enabled = !adsource.IsLastPage;
            DlHotels.DataSource = adsource;
            DlHotels.DataBind();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string RatingId = DdlRating.SelectedItem.Value;
            string LocationId = DdlLocation.SelectedItem.Value;
            
            DAL myDal = new DAL(conn);
            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "r");
            myDal.AddParam("@hotelRatingID", RatingId);
            myDal.AddParam("@hotelLocationID", LocationId);
            DataSet ds = myDal.ExecuteProcedure("spHotelCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 2;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            btnFirst.Enabled = !adsource.IsFirstPage;
            btnPrevious.Enabled = !adsource.IsFirstPage;
            btnLast.Enabled = !adsource.IsLastPage;
            btnNext.Enabled = !adsource.IsLastPage;
            DlHotels.DataSource = adsource;
            DlHotels.DataBind();
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            pos = 0;
            loadHotels();
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos -= 1;
            this.ViewState["vs"] = pos;
            loadHotels();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos += 1;
            this.ViewState["vs"] = pos;
            loadHotels();
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            pos = adsource.PageCount - 1;
            loadHotels();
        }

    }
}