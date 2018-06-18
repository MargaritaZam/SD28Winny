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
    public partial class About1 : System.Web.UI.Page
    {
        PagedDataSource adsource;
        int pos;
        string conn = "Data Source= localhost; Initial Catalog=dbOmegaProject; Integrated Security= SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
                loadAbout();
            }
            pos = (int)this.ViewState["vs"];
        }

        public void loadAbout()
        {
            DAL myDal = new DAL(conn);

            DataSet ds = myDal.ExecuteProcedure("spAbout");
            DdlAbout.DataSource = ds.Tables[0];
            DdlAbout.DataTextField = "AboutTitle";
            DdlAbout.DataTextField = "AboutDescription";
            DdlAbout.DataBind();
        }
    }
}