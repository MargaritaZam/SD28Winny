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
    public partial class Restaurants : System.Web.UI.Page
    {
        string conn = "Data Source= localhost; Initial Catalog=dbRestaurants; Integrated Security= SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            loadRestaurants();

        }
        public void loadRestaurants()
        {
            DAL myDal = new DAL(conn);
            myDal.AddParam("@crud", "a");
            DataSet ds = myDal.ExecuteProcedure("spRestaurants");
            
            dlRestaurant.DataSource = ds.Tables[0];
            dlRestaurant.DataBind();
            
            

        }
    }
}