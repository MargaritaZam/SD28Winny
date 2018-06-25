using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;

namespace Winny1
{
    public partial class Adminpage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=dbGroupProject; Integrated Security=SSPI ");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsertRestaurant_Click(object sender, EventArgs e)
        {

        }

        protected void gvRestaurants_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dlFood_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dlLoc_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            gvRestaurants.Visible = true;
        }

        protected void btbRestSave_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath(@".\Pictures\Restaurants");
            string name = flRestImage.FileName;
            flRestImage.PostedFile.SaveAs(path + name);
            SqlCommand cmd = new SqlCommand("spRestaurants", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if(lblRest.Text=="New")
            {
                cmd.Parameters.AddWithValue("@crud", "c");
                cmd.Parameters.AddWithValue("@RestaurantName", txtRname.Text);
                cmd.Parameters.AddWithValue("@Description", txtRDesc.Text);
                cmd.Parameters.AddWithValue("@Address", txtRAddress.Text);
                cmd.Parameters.AddWithValue("@PostalCode", txtRPostal.Text);
                cmd.Parameters.AddWithValue("@ContactNo", txtRPhone.Text);
                cmd.Parameters.AddWithValue("@Path", name);
                cmd.Parameters.AddWithValue("@website", hlRest.Text);
                cmd.Parameters.AddWithValue("@FoodId", dlFood.SelectedValue);
                cmd.Parameters.AddWithValue("@LocationId", dlLoc.SelectedValue);


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                cmd.Parameters.AddWithValue("@crud", "c");
            }
        }
    }
}