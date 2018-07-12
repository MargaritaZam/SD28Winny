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
            string id = Request.QueryString["ID"].ToString();
            DlAbout.DataSource = _about.LoadAbout(null, Convert.ToInt32(id));
            DlAbout.DataBind();
        }

        protected void BtnFirst_Click(object sender, EventArgs e)
        {
            pos = 0;
            loadAbout();
        }

        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos -= 1;
            this.ViewState["vs"] = pos;
            loadAbout();
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos += 1;
            this.ViewState["vs"] = pos;
            loadAbout();
        }

        protected void BtnLast_Click(object sender, EventArgs e)
        {
            pos = adsource.PageCount - 1;
            loadAbout();
        }
    }
}