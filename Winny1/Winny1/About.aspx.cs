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
    public partial class About1 : System.Web.UI.Page
    {
        PagedDataSource adsource;
        int pos;
        string conn = "Data Source=localhost;Initial Catalog=dbGroupProject;Integrated Security= SSPI";
        WinnipegAbout _about = new WinnipegAbout();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
                loadAbout();
            }
            pos = (int)this.ViewState["vs"];
            loadAbout();
        }

        public void loadAbout()
        {
            DAL myDal = new DAL(conn);

            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "r");
            DataSet ds = myDal.ExecuteProcedure("spAboutCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 4;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            DlAbout.DataSource = adsource;
            DlAbout.DataBind();
        }

        public void loadTemps()
        {
            DAL myDal = new DAL(conn);

            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "r");
            DataSet ds = myDal.ExecuteProcedure("spMonthCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 6;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            DlTemp.DataSource = adsource;
            DlTemp.DataBind();
        }

        protected void BtnFirst_Click(object sender, EventArgs e)
        {
            pos = 0;
            loadTemps();
        }

        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos -= 1;
            this.ViewState["vs"] = pos;
            loadTemps();
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos += 1;
            this.ViewState["vs"] = pos;
            loadTemps();
        }

        protected void BtnLast_Click(object sender, EventArgs e)
        {
            pos = adsource.PageCount - 1;
            loadTemps();
        }
    }
}