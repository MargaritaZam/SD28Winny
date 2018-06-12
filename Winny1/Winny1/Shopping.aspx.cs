using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Winny1
{
    public partial class Shopping : System.Web.UI.Page
    { SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=dbShopping; Integrated Security=SSPI");
        WinnipegShopping _shop = new WinnipegShopping();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadStores();
            }

        }
        public void loadStores()
        {
            string id = Request.QueryString["id"].ToString();
            dlStores.DataSource = _shop.LoadStores(null, Convert.ToInt32(id));
            dlStores.DataBind();
        }
    }
}