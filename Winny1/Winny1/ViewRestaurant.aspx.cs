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
    public partial class ViewRestaurant : System.Web.UI.Page
    {
        string conn = "Data Source= localhost; Initial Catalog=dbRestaurants; Integrated Security= SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRest();
            }
        }
        public void LoadRest()
        {
            string id = Request.QueryString["id"];
            DAL myDal = new DAL(conn);
            myDal.AddParam("@crud","r");
            myDal.AddParam("@RestaurantId", id);
            DataSet ds = myDal.ExecuteProcedure("spRestaurants");
            dlRest.DataSource = ds.Tables[0];
            dlRest.DataBind();


        }
    }
}