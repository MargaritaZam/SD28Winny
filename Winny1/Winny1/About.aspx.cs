using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public partial class About1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=dbOmegaProject; Integrated Security=SSPI");
        WinnipegAbout _about = new WinnipegAbout();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadAbout();
            }
        }

        public void loadAbout()
        {
            string id = Request.QueryString["id"].ToString();
            DlAbout.DataSource = _about.loadAbout(null, Convert.ToInt32(id));
            DlAbout.DataBind();
        }
    }
}