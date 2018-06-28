using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
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
            if (!IsPostBack)
            {
                loadRestaurants();
                loadFoodCategory();
                loadLocation();
                //loadAttractions();
                //loadStores();
                //loadHotels();
                //loadSchools();
            }

        }
        private void loadLocation()
        {
            string conn = "Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI";
            DAL myDAL = new DAL(conn);
            DataSet ds = myDAL.ExecuteProcedure("spLocation");
            dlLoc.DataSource = ds.Tables[0];
            dlLoc.DataTextField = "LocationName";
            dlLoc.DataValueField = "LocationId";
            dlLoc.DataBind();
        }
        private void loadFoodCategory()
        {
            string conn = "Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI";
            DAL myDal = new DAL(conn);

            DataSet ds = myDal.ExecuteProcedure("spGetFoodType");
            dlFood.DataSource = ds.Tables[0];
            dlFood.DataTextField = "FoodType";         
            dlFood.DataBind();
        }
        private void loadRestaurants()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spRestaurants", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "r");
            conn.Open();
            da.Fill(ds);
            conn.Close();

            gvRestaurants.DataSource = ds.Tables[0];
            gvRestaurants.DataBind();
        }
        protected void btnInsertRestaurant_Click(object sender, EventArgs e)
        {
            plUpdRest.Visible = true;
            lblRest.Text = "New";
            txtRname.Text = "";
            txtRDesc.Text = "";
            txtRAddress.Text = "";
            txtRPostal.Text = "";
            txtRPhone.Text = "";
            txtRWebsite.Text = "";
            dlFood.SelectedItem.Text = "";
            dlLoc.SelectedItem.Text = "";

        }
        protected void gvRestaurants_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="Page" || e.CommandName=="Sorting")
            {
                return;
            }
            string cmd = e.CommandName;
            gvRestaurants.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            string rid = gvRestaurants.SelectedDataKey["RestaurantId"].ToString();

            switch (e.CommandName)
            {
                case "Delete":
                    Delete(rid);
                    break;
                case "Update":
                    plUpdRest.Visible = true;
                    UpdateModel(rid);
                    break;
            }
        }
        public void Delete(string rid)
        {
            SqlCommand cmd = new SqlCommand("spRestaurants", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@crud", "d");
            cmd.Parameters.AddWithValue("@RestaurantId", rid);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            loadRestaurants();
        }
        public void Update(string rid)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spRestaurants", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "r");
            da.SelectCommand.Parameters.AddWithValue("@RestaurantId", rid);
            conn.Open();
            da.Fill(ds);
            conn.Close();
            lblRest.Text = rid;

            txtRname.Text = ds.Tables[0].Rows[0]["RestaurantName"].ToString();
            txtRDesc.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            txtRAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            txtRPostal.Text = ds.Tables[0].Rows[0]["PostalCode"].ToString();              
            txtRPhone.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
            txtRWebsite.Text = ds.Tables[0].Rows[0]["Website"].ToString();
            dlFood.SelectedValue = ds.Tables[0].Rows[0]["FoodId"].ToString();
            dlLoc.SelectedValue = ds.Tables[0].Rows[0]["LocationId"].ToString();
            plUpdRest.Visible = true;
            
            
        }
        protected void gvRestaurants_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRestaurants.PageIndex = Convert.ToInt32(e.NewPageIndex);
            loadRestaurants();
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
            string path = Server.MapPath(@".\Pictires\Restaurants");
            string name = flRestImage.FileName;
            flRestImage.PostedFile.SaveAs(path + name);
            SqlCommand cmd = new SqlCommand("spRestaurants", conn);
            plUpdRest.Visible = false;
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
                cmd.Parameters.AddWithValue("@website", txtRWebsite.Text);
                cmd.Parameters.AddWithValue("@FoodId", dlFood.SelectedValue);
                cmd.Parameters.AddWithValue("@LocationId", dlLoc.SelectedValue);


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                cmd.Parameters.AddWithValue("@crud", "u");

                cmd.Parameters.AddWithValue("@RestaurantName", txtRname.Text);
                cmd.Parameters.AddWithValue("@Description", txtRDesc.Text);
                cmd.Parameters.AddWithValue("@Address", txtRAddress.Text);
                cmd.Parameters.AddWithValue("@PostalCode", txtRPostal.Text);
                cmd.Parameters.AddWithValue("@ContactNo", txtRPhone.Text);
                cmd.Parameters.AddWithValue("@Path", name);
                cmd.Parameters.AddWithValue("@website", txtRWebsite.Text);
                cmd.Parameters.AddWithValue("@FoodId", dlFood.SelectedValue);
                cmd.Parameters.AddWithValue("@LocationId", dlLoc.SelectedValue);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            loadRestaurants();
        }

        protected void gvRestaurants_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void gvRestaurants_Sorting(object sender, GridViewSortEventArgs e)
        {

        }
    }
}