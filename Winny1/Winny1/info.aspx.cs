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
            Image.ImageUrl = inf.image;
            txtName.Text = inf.name;
            txtDesc.Text = inf.description;
            txtPhone.Text = inf.phone;
            txtAddress.Text = inf.address;
            hlWeb.Text = inf.website;


            //DataSet ds = new DataSet();
            //SqlDataAdapter da = new SqlDataAdapter("spAttractions", conn);
            //da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.AddWithValue("@crud", "r");
            //conn.Open();
            //da.Fill(ds);
            //conn.Close();
        }
    }
}