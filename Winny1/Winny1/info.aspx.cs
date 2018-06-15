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
    public partial class info : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source = localhost; Initial Catalog = dbGroupProject; Integrated Security = SSPI");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetInfo();
            }
        }
        private void GetInfo()
        {
            string id = Request.QueryString["id"].ToString();
            MyInfo inf = new MyInfo(Convert.ToInt32(id));
            ImageInfo.ImageUrl = inf.image;
            lbName.Text = inf.name;
            lbDesc.Text = inf.description;
            lbPhone.Text = inf.phone;
            lbAddress.Text = inf.address;




        }
    }
}