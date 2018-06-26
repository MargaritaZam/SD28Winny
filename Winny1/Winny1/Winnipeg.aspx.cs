using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DAL_Project;

namespace Winny1
{
    public partial class Winnipeg1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source = localhost; Initial Catalog = dbGroupProject; Integrated Security = SSPI");
        WinnipegMain myWinnipeg;

        protected void Page_Load(object sender, EventArgs e)
        {
            myWinnipeg = new WinnipegMain();
            loadDataBase();
        }

        private void LoadWinnipeg()
        {
            gvWinnipeg.DataSource = myWinnipeg.Get();
            gvWinnipeg.DataBind();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
       private void loadDataBase()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
        }
    }
}