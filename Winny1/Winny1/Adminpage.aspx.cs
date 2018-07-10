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
        string con = "Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadAttractions();
                loadRestaurants();
                loadFoodCategory();
                loadLocation();
                loadStoreCategory();
                loadStores();

                loadHotels();
                loadSchools();
            }

        }
        private void loadStoreCategory()
        {
            string con = "Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI";
            DAL myDAL = new DAL(con);
            DataSet DS = myDAL.ExecuteProcedure("spGetShoppingCategories");
            ddlStoreCategory.DataSource = DS.Tables[0];
            ddlStoreCategory.DataTextField = "CategoryId";
            ddlStoreCategory.DataTextField = "CategoryType";
            ddlStoreCategory.DataBind();

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

            ddlLoc.DataSource = ds.Tables[0];
            ddlLoc.DataTextField = "LocationName";
            ddlLoc.DataValueField = "LocationId";
            ddlLoc.DataBind();

            ddllocat.DataSource = ds.Tables[0];
            ddllocat.DataTextField = "LocationName";
            ddllocat.DataValueField = "LocationId";
            ddllocat.DataBind();

            ddlHotelLoc.DataSource = ds.Tables[0];
            ddlHotelLoc.DataTextField = "LocationName";
            ddlHotelLoc.DataValueField = "LocationId";
            ddlHotelLoc.DataBind();


        }
        private void loadFoodCategory()
        {
           
            DAL myDal = new DAL(con);

            DataSet ds = myDal.ExecuteProcedure("spFood_Category");
            dlFood.DataSource = ds.Tables[0];
            dlFood.DataTextField = "FoodId";
            dlFood.DataTextField = "FoodType";
            dlFood.DataBind();
        }

       

        private void loadRestaurants()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spRestaurants", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "w");
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
            if (e.CommandName == "Page" || e.CommandName == "Sorting")
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
            dlFood.SelectedItem.Text = ds.Tables[0].Rows[0]["FoodId"].ToString();
            dlLoc.SelectedItem.Text = ds.Tables[0].Rows[0]["LocationId"].ToString();
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



        protected void btbRestSave_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath(@".\Pictires\Restaurants");
            string name = flRestImage.FileName;
            flRestImage.PostedFile.SaveAs(path + name);
            SqlCommand cmd = new SqlCommand("spRestaurants", conn);
            plUpdRest.Visible = false;
            cmd.CommandType = CommandType.StoredProcedure;
            if (lblRest.Text == "New")
            {
                cmd.Parameters.AddWithValue("@crud", "c");
                cmd.Parameters.AddWithValue("@RestaurantName", txtRname.Text);
                cmd.Parameters.AddWithValue("@Description", txtRDesc.Text);
                cmd.Parameters.AddWithValue("@Address", txtRAddress.Text);
                cmd.Parameters.AddWithValue("@PostalCode", txtRPostal.Text);
                cmd.Parameters.AddWithValue("@ContactNo", txtRPhone.Text);
                cmd.Parameters.AddWithValue("@Path", name);
                cmd.Parameters.AddWithValue("@website", txtRWebsite.Text);
                cmd.Parameters.AddWithValue("@FoodId", dlFood.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@LocationId", dlLoc.SelectedItem.Text);


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
                cmd.Parameters.AddWithValue("@FoodId", dlFood.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@LocationId", dlLoc.SelectedItem.Text);

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

        private void loadStores()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spStores", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "r");
            conn.Open();
            da.Fill(ds);
            conn.Close();

            gvShoping.DataSource = ds.Tables[0];
            gvShoping.DataBind();
        }


        protected void gvShoping_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Page" || e.CommandName == "Sorting")
            {
                return;
            }
            string comm = e.CommandName;
            gvShoping.SelectedIndex = Convert.ToInt32(e.CommandName);
            string sid = gvShoping.SelectedDataKey["StoreId"].ToString();

            switch (e.CommandName)
            {
                case "Del":
                    DeleteStore(sid);
                    break;

                case "Upd":
                    plUpdateStore.Visible = true;
                    UpdateStore(sid);
                    break;
            }

        }
        public void DeleteStore(string sid)
        {
            SqlCommand comm = new SqlCommand("spStores", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@crud", "d");
            comm.Parameters.AddWithValue("@StoreId", sid);
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            loadStores();

        }
        public void UpdateStore(string sid)
        {
            DataSet DS = new DataSet();
            SqlDataAdapter DA = new SqlDataAdapter("spStores", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@crud", "r");
            DA.SelectCommand.Parameters.AddWithValue("@StoreId", sid);
            conn.Open();
            DA.Fill(DS);
            conn.Close();
            lblStore.Text = sid;

            txtStoreName.Text = DS.Tables[0].Rows[0]["StoreName"].ToString();
            txtStoreDesc.Text = DS.Tables[0].Rows[0]["Description"].ToString();
            txtStoreAddress.Text = DS.Tables[0].Rows[0]["Address"].ToString();
            txtStorePhone.Text = DS.Tables[0].Rows[0]["PhoneNumber"].ToString();
            txtStoreWeb.Text = DS.Tables[0].Rows[0]["Web"].ToString();


        }
        protected void gvShoping_Sorting(object sender, GridViewSortEventArgs e)
        {


        }

        protected void gvShoping_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvShoping.PageIndex = Convert.ToInt32(e.NewPageIndex);
            loadStores();
        }

        protected void gvShoping_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void btnStoreInsert_Click(object sender, EventArgs e)
        {
            plUpdateStore.Visible = true;
            lblStore.Text = "New";
            txtStoreName.Text = "";
            txtStoreDesc.Text = "";
            txtStoreAddress.Text = "";
            txtStorePhone.Text = "";
            txtStoreWeb.Text = "";
            ddlStoreCategory.SelectedItem.Text = "";
            ddlLoc.SelectedItem.Text = "";

        }

        protected void btnSavestore_Click(object sender, EventArgs e)
        {
            string Path = Server.MapPath(@".\Shopping\");
            string Name = flStoreImage.FileName;
            flStoreImage.PostedFile.SaveAs(Path + Name);
            plUpdateStore.Visible = false;
            SqlCommand comm = new SqlCommand("spStores", conn);
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;

            if (lblStore.Text == "New")
            {
                comm.Parameters.AddWithValue("@crud", "c");
                comm.Parameters.AddWithValue("@StoreName", txtStoreName.Text);
                comm.Parameters.AddWithValue("@Description", txtStoreDesc.Text);
                comm.Parameters.AddWithValue("@Address", txtStoreAddress.Text);
                comm.Parameters.AddWithValue("@PhoneNumber", txtStorePhone.Text);
                comm.Parameters.AddWithValue("@Web", txtStoreWeb.Text);
                comm.Parameters.AddWithValue("@LocationId", ddlLoc.SelectedItem.Text);
                comm.Parameters.AddWithValue("@CategoryId", ddlStoreCategory.SelectedItem.Text);
                comm.Parameters.AddWithValue("@Path", Name);

                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                comm.Parameters.AddWithValue("@crud", "u");
                comm.Parameters.AddWithValue("@StoreId", lblStore.Text);
                comm.Parameters.AddWithValue("@StoreName", txtStoreName.Text);
                comm.Parameters.AddWithValue("@Description", txtStoreDesc.Text);
                comm.Parameters.AddWithValue("@Address", txtStoreAddress.Text);
                comm.Parameters.AddWithValue("@PhoneNumber", txtStorePhone.Text);
                comm.Parameters.AddWithValue("@Web", txtStoreWeb.Text);
                comm.Parameters.AddWithValue("@LocationId", ddlLoc.SelectedItem.Text);
                comm.Parameters.AddWithValue("@CategoryId", ddlStoreCategory.SelectedItem.Text);
                comm.Parameters.AddWithValue("@Path", Name);

                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
            }
            loadStores();
        }

        protected void lbStores_Click(object sender, EventArgs e)
        {
            gvShoping.Visible = true;
        }





        private void loadAttractions()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spAttractions", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "r");
            conn.Open();
            da.Fill(ds);
            conn.Close();

            gvAttractions.DataSource = ds.Tables[0];
            gvAttractions.DataBind();
        }
        protected void lbAttractions_Click(object sender, EventArgs e)
        {
            gvAttractions.Visible = true;
        }

        protected void lbHotels_Click(object sender, EventArgs e)
        {
            gvHotels.Visible = true;
        }

        protected void lbSchools_Click(object sender, EventArgs e)
        {
            //gvUniversity.Visible = true;
        }



        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            gvRestaurants.Visible = true;
        }

        protected void btnAttrInsert_Click(object sender, EventArgs e)
        {
            pnlUpdateAttr.Visible = true;
            lblAttr.Text = "New";
            txtAttrName.Text = "";
            txtAttrDesc.Text = "";
            txtAttrAddress.Text = "";
            txtAttrPhone.Text = "";
            txtAttrWeb.Text = "";       
            ddlAttrCategory.SelectedItem.Text = "";
            ddllocat.SelectedItem.Text = "";
        }
        protected void gvAttractions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Page" || e.CommandName == "Sorting")
            {
                return;
            }
            string com = e.CommandName;
            gvAttractions.SelectedIndex = Convert.ToInt32(e.CommandName);
            string aid = gvAttractions.SelectedDataKey["attractionID"].ToString();

            switch (e.CommandName)
            {
                case "del":
                    DeleteAttr(aid);
                    break;

                case "Upd":
                    pnlUpdateAttr.Visible = true;
                    UpdateAttr(aid);
                    break;
            }

        }
        public void DeleteAttr(string aid)
        {
            SqlCommand com = new SqlCommand("spAttractions", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@crud", "d");
            com.Parameters.AddWithValue("@id", aid);
            conn.Open();
            com.ExecuteNonQuery();
            conn.Close();

            loadAttractions();

        }
        public void UpdateAttr(string aid)
        {
            DataSet dS = new DataSet();
            SqlDataAdapter dA = new SqlDataAdapter("spAttractions", conn);
            dA.SelectCommand.CommandType = CommandType.StoredProcedure;
            dA.SelectCommand.Parameters.AddWithValue("@crud", "r");
            dA.SelectCommand.Parameters.AddWithValue("@id", aid);
            conn.Open();
            dA.Fill(dS);
            conn.Close();
            lblAttr.Text = aid;

            txtAttrName.Text = dS.Tables[0].Rows[0]["atName"].ToString();
            txtAttrDesc.Text = dS.Tables[0].Rows[0]["atDesc"].ToString();
            txtAttrAddress.Text = dS.Tables[0].Rows[0]["atAddress"].ToString();
            txtAttrPhone.Text = dS.Tables[0].Rows[0]["atPhone"].ToString();
            txtAttrWeb.Text = dS.Tables[0].Rows[0]["atWebsite"].ToString();

        }
        protected void btnSaveAttr_Click(object sender, EventArgs e)
        {
            string PATH = Server.MapPath(@".\Attractions\");
            string NAME = flStoreImage.FileName;
            flStoreImage.PostedFile.SaveAs(PATH + NAME);
            pnlUpdateAttr.Visible = false;
            SqlCommand com = new SqlCommand("spAttractions", conn);
            com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;

            if (lblStore.Text == "New")
            {
                com.Parameters.AddWithValue("@crud", "c");
                com.Parameters.AddWithValue("@name", txtAttrName.Text);
                com.Parameters.AddWithValue("@desc", txtAttrDesc.Text);
                com.Parameters.AddWithValue("@address", txtAttrAddress.Text);
                com.Parameters.AddWithValue("@phone", txtAttrPhone.Text);
                com.Parameters.AddWithValue("@website", txtAttrWeb.Text);
                com.Parameters.AddWithValue("@location", ddllocat.SelectedItem.Text);
                com.Parameters.AddWithValue("@category", ddlAttrCategory.SelectedItem.Text);
                com.Parameters.AddWithValue("@image", NAME);

                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                com.Parameters.AddWithValue("@crud", "u");
                com.Parameters.AddWithValue("@id", lblAttr.Text);
                com.Parameters.AddWithValue("@name", txtAttrName.Text);
                com.Parameters.AddWithValue("@desc", txtAttrDesc.Text);
                com.Parameters.AddWithValue("@address", txtAttrAddress.Text);
                com.Parameters.AddWithValue("@phone", txtAttrPhone.Text);
                com.Parameters.AddWithValue("@website", txtAttrWeb.Text);
                com.Parameters.AddWithValue("@location", ddllocat.SelectedItem.Text);
                com.Parameters.AddWithValue("@category", ddlAttrCategory.SelectedItem.Text);
                com.Parameters.AddWithValue("@image", NAME);


                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
            }
            loadAttractions();
        }


        private void loadHotels()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spHotelsCrud", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "r");
            conn.Open();
            da.Fill(ds);
            conn.Close();

            gvHotels.DataSource = ds.Tables[0];
            gvHotels.DataBind();
        }
        protected void gvHotels_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnInsertHotel_Click(object sender, EventArgs e)
        {
            pnlUpdateHotel.Visible = true;
            lblHotel.Text = "New";
            txtHotelName.Text = "";
            txtHotelPrice.Text = "";
            txtHotelStars.Text = "";
            txtHotelDesc.Text = "";
            txtHotelPhone.Text = "";
            txtHotelAddress.Text = "";
            txtHotelPostal.Text = "";
            txtHotelWeb.Text = "";
            txtHotelPhone.Text = "";
            ddllocat.SelectedItem.Text = "";
        }

        protected void btnSaveHotel_Click(object sender, EventArgs e)
        {
            string Hpath = Server.MapPath(@".\HotelPictures\");
            string Hname = flHotelImage.FileName;
            flHotelImage.PostedFile.SaveAs(Hpath + Hname);
            pnlUpdateHotel.Visible = false;
            SqlCommand com = new SqlCommand("spHotelsCrud", conn);
            com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;

            if (lblHotel.Text == "New")
            {
                com.Parameters.AddWithValue("@crud", "c");
                com.Parameters.AddWithValue("@hotelName", txtHotelName.Text);
                com.Parameters.AddWithValue("@hotelPrice", txtHotelPrice.Text);
                com.Parameters.AddWithValue("@hotelStars", txtHotelStars.Text);
                com.Parameters.AddWithValue("@hotelDescription", txtHotelDesc.Text);
                com.Parameters.AddWithValue("@hotelPhoneNumber", txtHotelPhone.Text);
                com.Parameters.AddWithValue("@hotelAddress", txtHotelAddress.Text);
                com.Parameters.AddWithValue("@hotelPostalCode", txtHotelPostal.Text);
                com.Parameters.AddWithValue("@hotelWebsite", txtHotelWeb.Text);
                com.Parameters.AddWithValue("@location", ddlHotelLoc.SelectedItem.Text);              
                com.Parameters.AddWithValue("@hotel_path", Hname);

                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
            com.Parameters.AddWithValue("@crud", "u");
                com.Parameters.AddWithValue("@hotelID", lblHotel.Text);
            com.Parameters.AddWithValue("@hotelName", txtHotelName.Text);
            com.Parameters.AddWithValue("@hotelPrice", txtHotelPrice.Text);
            com.Parameters.AddWithValue("@hotelStars", txtHotelStars.Text);
            com.Parameters.AddWithValue("@hotelDescription", txtHotelDesc.Text);
            com.Parameters.AddWithValue("@hotelPhoneNumber", txtHotelPhone.Text);
            com.Parameters.AddWithValue("@hotelAddress", txtHotelAddress.Text);
            com.Parameters.AddWithValue("@hotelPostalCode", txtHotelPostal.Text);
            com.Parameters.AddWithValue("@hotelWebsite", txtHotelWeb.Text);
            com.Parameters.AddWithValue("@location", ddlHotelLoc.SelectedItem.Text);
            com.Parameters.AddWithValue("@hotel_path", Hname);


                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
            }
            loadHotels();
        }

        protected void gvHotels_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Page" || e.CommandName == "Sorting")
            {
                return;
            }
            string comd = e.CommandName;
            gvHotels.SelectedIndex = Convert.ToInt32(e.CommandName);
            string hid = gvHotels.SelectedDataKey["HotelID"].ToString();

            switch (e.CommandName)
            {
                case "DEL":
                    DeleteHotel(hid);
                    break;

                case "UPD":
                    pnlUpdateHotel.Visible = true;
                    UpdateHotel(hid);
                    break;
            }
        }
        public void DeleteHotel(string hid)
        {
            SqlCommand comd = new SqlCommand("spHotelsCrud", conn);
            comd.CommandType = CommandType.StoredProcedure;
            comd.Parameters.AddWithValue("@crud", "d");
            comd.Parameters.AddWithValue("@hotelID", hid);
            conn.Open();
            comd.ExecuteNonQuery();
            conn.Close();

            loadHotels();
        }
        public void UpdateHotel(string hid)
        {
            DataSet dataset = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter("spHotelsCrud", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@crud", "r");
            sda.SelectCommand.Parameters.AddWithValue("@hotelID", hid);
            conn.Open();
            sda.Fill(dataset);
            conn.Close();
            lblHotel.Text = hid;

            txtHotelName.Text = dataset.Tables[0].Rows[0]["HotelName"].ToString();
            txtHotelPrice.Text = dataset.Tables[0].Rows[0]["HotelPrice"].ToString();
            txtHotelStars.Text = dataset.Tables[0].Rows[0]["HotelStars"].ToString();
            txtHotelDesc.Text = dataset.Tables[0].Rows[0]["HotelDescription"].ToString();
            txtHotelPhone.Text = dataset.Tables[0].Rows[0]["HotelPhoneNumber"].ToString();
            txtHotelAddress.Text = dataset.Tables[0].Rows[0]["HotelAddress"].ToString();
            txtHotelPostal.Text = dataset.Tables[0].Rows[0]["HotelPostalCode"].ToString();
            txtHotelWeb.Text = dataset.Tables[0].Rows[0]["HotelWebsite"].ToString();


        }
        protected void gvHotels_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void gvHotels_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvHotels.PageIndex = Convert.ToInt32(e.NewPageIndex);
            loadHotels();
        }

        protected void gvAttractions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAttractions.PageIndex = Convert.ToInt32(e.NewPageIndex);
            loadAttractions();
        }
        private void loadSchools()
        {

        }
        protected void gvUniversity_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //gvUniversity.PageIndex = Convert.ToInt32(e.NewPageIndex);
            //loadSchools();
        }

        protected void rblReport_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Report = rblReport.SelectedValue;
            DataSet ds = new DataSet();
            switch(Report)
            {
                case "f":
                    SqlDataAdapter da1 = new SqlDataAdapter("spReports", conn);
                    da1.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da1.SelectCommand.Parameters.AddWithValue("@crud", "f");
                    conn.Open();
                    da1.Fill(ds);
                    conn.Close();
                    gvreport.DataSource = ds.Tables[0];
                    gvreport.DataBind();
                    break;

                case "i":
                    SqlDataAdapter da2 = new SqlDataAdapter("spReports", conn);
                    da2.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da2.SelectCommand.Parameters.AddWithValue("@crud", "i");
                    conn.Open();
                    da2.Fill(ds);
                    conn.Close();
                    gvreport.DataSource = ds.Tables[0];
                    gvreport.DataBind();
                    break;

                case "at":
                    SqlDataAdapter da3 = new SqlDataAdapter("spReports", conn);
                    da3.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da3.SelectCommand.Parameters.AddWithValue("@crud", "at");
                    conn.Open();
                    da3.Fill(ds);
                    conn.Close();
                    gvreport.DataSource = ds.Tables[0];
                    gvreport.DataBind();
                    break;

                case "st":
                    SqlDataAdapter da4 = new SqlDataAdapter("spReports", conn);
                    da4.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da4.SelectCommand.Parameters.AddWithValue("@crud", "st");
                    conn.Open();
                    da4.Fill(ds);
                    conn.Close();
                    gvreport.DataSource = ds.Tables[0];
                    gvreport.DataBind();
                    break;
            }
        }

        protected void rblAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Choice = rblAdmin.SelectedValue;
            switch(Choice)
            {
                case "R":
                    panelRestaurants.Visible = true;
                    panelStores.Visible = false;
                    panelAttraction.Visible = false;
                    panelHotel.Visible = false;
                    break;
                case "S":
                    panelStores.Visible = true;
                    panelRestaurants.Visible = false;
                    panelAttraction.Visible = false;
                    panelHotel.Visible = false;
                    break;
                case "A":
                    panelAttraction.Visible = true;             
                    panelRestaurants.Visible = false;
                    panelStores.Visible = false;
                    panelHotel.Visible = false;
                    break;
                case "H":
                    panelHotel.Visible = true;
                    panelRestaurants.Visible = false;
                    panelStores.Visible = false;
                    panelAttraction.Visible = false;
                    break;
            }
        }
    }

   
}


    
    
