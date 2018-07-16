using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL_Project;

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
            string id = Request.QueryString["id"].ToString();
            DlAbout.DataSource = _about.LoadAbout(Convert.ToInt32(id));
            DlAbout.DataBind();
        }

        public void loadTemps()
        {
            DAL myDal = new DAL(conn);

            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "r");
            DataSet ds = myDal.ExecuteProcedure("spAvgTempCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 12;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            DlTemp.DataSource = adsource;
            DlTemp.DataBind();
        }
    }
}