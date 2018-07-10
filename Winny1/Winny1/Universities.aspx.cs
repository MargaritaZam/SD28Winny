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
    public partial class Universities1 : System.Web.UI.Page
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
                loadTypeOfSchool();
            }
            pos = (int)this.ViewState["vs"];
            loadSchools();
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

        public void loadTypeOfSchool()
        {
            DAL myDal = new DAL(conn);

            DataSet ds = myDal.ExecuteProcedure("spGetSchoolType");
            ddlTypeOfSchool.DataSource = ds.Tables[0];
            ddlTypeOfSchool.DataTextField = "TypeOfSchool";
            ddlTypeOfSchool.DataValueField = "TypeID";
            ddlTypeOfSchool.DataBind();
        }

        public void loadSchools()
        {
            DAL myDal = new DAL(conn);

            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "r");
            DataSet ds = myDal.ExecuteProcedure("spSchoolsCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 3;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            BtnFirst.Enabled = !adsource.IsFirstPage;
            BtnPrevious.Enabled = !adsource.IsFirstPage;
            BtnLast.Enabled = !adsource.IsLastPage;
            BtnNext.Enabled = !adsource.IsLastPage;
            DlSchools.DataSource = adsource;
            DlSchools.DataBind();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string TypeId = ddlTypeOfSchool.SelectedItem.Value;
            string LocationId = ddlLocation.SelectedItem.Value;
            DAL myDal = new DAL(conn);
            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "s");
            myDal.AddParam("@typeId", TypeId);
            myDal.AddParam("@locationId", LocationId);
            DataSet ds = myDal.ExecuteProcedure("spSchoolsCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 3;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            BtnFirst.Enabled = !adsource.IsFirstPage;
            BtnPrevious.Enabled = !adsource.IsFirstPage;
            BtnLast.Enabled = !adsource.IsLastPage;
            BtnNext.Enabled = !adsource.IsLastPage;
            DlSchools.DataSource = adsource;
            DlSchools.DataBind();
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            pos = 0;
            loadSchools();
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos -= 1;
            this.ViewState["vs"] = pos;
            loadSchools();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos += 1;
            this.ViewState["vs"] = pos;
            loadSchools();
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            pos = adsource.PageCount - 1;
            loadSchools();
        }
    }
}