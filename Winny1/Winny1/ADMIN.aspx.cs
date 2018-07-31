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
using System.Web.UI.HtmlControls;

namespace Winny1
{
    public partial class ADMIN : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection("Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI");
            if (!IsPostBack)
            {
                HtmlInputButton LogIn = (HtmlInputButton)Master.FindControl("btnLogIn");
                HtmlInputButton LogOut = (HtmlInputButton)Master.FindControl("btnLogOut");
                LogOut.Visible = true;
                LogIn.Visible = false;
               
                loadAttractions();
                loadRestaurants();
                loadFoodCategory();
                loadLocation();
                loadStoreCategory();
                loadStores();
                //loadAttractionCategory();
               loadHotels();
               loadSchools();
            }
        }
        private void loadStoreCategory()
        {
            SqlDataAdapter da = new SqlDataAdapter("spGetShoppingCategories", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            conn.Open();
            da.Fill(ds);
            conn.Close();
            ddlStoreCategory.DataSource = ds.Tables[0];
            ddlStoreCategory.DataValueField = "CategoryId";
            ddlStoreCategory.DataTextField = "CategoryType";
            ddlStoreCategory.DataBind();

        }
        private void loadFoodCategory()
        {
            SqlDataAdapter da = new SqlDataAdapter("spFood_Category", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            conn.Open();
            da.Fill(ds);
            conn.Close();

            dlFood.DataSource = ds.Tables[0];
            dlFood.DataValueField = "FoodId";
            dlFood.DataTextField = "FoodType";
            dlFood.DataBind();
        }
        private void loadLocation()
        {
            SqlDataAdapter da = new SqlDataAdapter("spLocation", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            conn.Open();
            da.Fill(ds);
            conn.Close();

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
        protected void rblReport_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Report = rblReport.SelectedValue;
            DataSet ds = new DataSet();
            switch (Report)
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
            switch (Choice)
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
        protected void gvRestaurants_SelectedIndexChanged(object sender, EventArgs e)
        {

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
                case "del":
                    Delete(rid);
                    break;
                case "upd":
                    plUpdRest.Visible = true;
                    Update(rid);
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
            da.SelectCommand.Parameters.AddWithValue("@crud", "w");
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

        protected void btbRestSave_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath(@".\Restaurant\");
            string name = flRestImage.FileName;
            flRestImage.PostedFile.SaveAs(path + name);
            SqlCommand cmd = new SqlCommand("spRestaurants", conn);
            plUpdRest.Visible = false;
            //cmd.Connection = conn;
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
                cmd.Parameters.AddWithValue("@FoodId", dlFood.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@LocationId", dlLoc.SelectedItem.Value);


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                loadRestaurants();
            }
            else
            {        
                cmd.Parameters.AddWithValue("@crud", "u");
                cmd.Parameters.AddWithValue("@RestaurantId", lblRest.Text);
                cmd.Parameters.AddWithValue("@RestaurantName", txtRname.Text);
                cmd.Parameters.AddWithValue("@Description", txtRDesc.Text);
                cmd.Parameters.AddWithValue("@Address", txtRAddress.Text);
                cmd.Parameters.AddWithValue("@PostalCode", txtRPostal.Text);
                cmd.Parameters.AddWithValue("@ContactNo", txtRPhone.Text);
                cmd.Parameters.AddWithValue("@Path", name);
                cmd.Parameters.AddWithValue("@website", txtRWebsite.Text);
                cmd.Parameters.AddWithValue("@FoodId", dlFood.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@LocationId", dlLoc.SelectedItem.Value);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                loadRestaurants();
            }
           // loadRestaurants();
        }

        protected void gvRestaurants_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
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
            
            gvShoping.SelectedIndex = Convert.ToInt32(e.CommandArgument);
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

        protected void gvShoping_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvShoping.PageIndex = Convert.ToInt32(e.NewPageIndex);
            loadStores();
        }

        protected void gvShoping_SelectedIndexChanged(object sender, EventArgs e)
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
                comm.Parameters.AddWithValue("@LocationId", ddlLoc.SelectedItem.Value);
                comm.Parameters.AddWithValue("@CategoryId", ddlStoreCategory.SelectedItem.Value);
                comm.Parameters.AddWithValue("@Path", Name);

                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
                loadStores();
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
                comm.Parameters.AddWithValue("@LocationId", ddlLoc.SelectedItem.Value);
                comm.Parameters.AddWithValue("@CategoryId", ddlStoreCategory.SelectedItem.Value);
                comm.Parameters.AddWithValue("@Path", Name);

                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
                loadStores();
            }
          //loadStores();
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

        protected void btnAttrInsert_Click(object sender, EventArgs e)
        {
            pnlUpdateAttr.Visible = true;
            lblAttr.Text = "New";
            txtAttrName.Text = "";
            txtAttrDesc.Text = "";
            txtAttrAddress.Text = "";
            txtAttrPhone.Text = "";
            txtAttrWeb.Text = "";
           
        }

        protected void gvAttractions_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSaveAttr_Click(object sender, EventArgs e)
        {
            string PATH = Server.MapPath(@".\Attractions\");
            string NAME = flAttrImage.FileName;
            flAttrImage.PostedFile.SaveAs(PATH + NAME);
            pnlUpdateAttr.Visible = false;
            SqlCommand com = new SqlCommand("spAttractions", conn);
            //com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;

            if (lblAttr.Text == "New")
            {
                com.Parameters.AddWithValue("@crud", "c");
                com.Parameters.AddWithValue("@name", txtAttrName.Text);
                com.Parameters.AddWithValue("@desc", txtAttrDesc.Text);
                com.Parameters.AddWithValue("@address", txtAttrAddress.Text);
                com.Parameters.AddWithValue("@phone", txtAttrPhone.Text);
                com.Parameters.AddWithValue("@website", txtAttrWeb.Text);
                com.Parameters.AddWithValue("@location", ddllocat.SelectedItem.Value);
                com.Parameters.AddWithValue("@category", ddlAttrCategory.SelectedItem.Text);
                com.Parameters.AddWithValue("@image", NAME);

                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
                loadAttractions();
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
                com.Parameters.AddWithValue("@location", ddllocat.SelectedItem.Value);
                com.Parameters.AddWithValue("@category", ddlAttrCategory.SelectedItem.Text);
                com.Parameters.AddWithValue("@image", NAME);


                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
                loadAttractions();
            }
           // loadAttractions();
    }

        protected void gvAttractions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Page" || e.CommandName == "Sorting")
            {
                return;
            }
            string com = e.CommandName;
            gvAttractions.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            string aid = gvAttractions.SelectedDataKey["attractionID"].ToString();

            switch (e.CommandName)
            {
                case "del":
                    DeleteAttr(aid);
                    break;

                case "upd":
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
            ddlAttrCategory.SelectedItem.Text = dS.Tables[0].Rows[0]["attractionCategory"].ToString();
            ddllocat.SelectedItem.Value = dS.Tables[0].Rows[0]["location"].ToString();
            pnlUpdateAttr.Visible = true;



        }
        private void loadHotels()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spHotelCrud", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "h");
            conn.Open();
            da.Fill(ds);
            conn.Close();

            gvHotels.DataSource = ds.Tables[0];
            gvHotels.DataBind();
        }

        protected void gvHotels_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Page" || e.CommandName == "Sorting")
            {
                return;
            }
            string comd = e.CommandName;
            gvHotels.SelectedIndex = Convert.ToInt32(e.CommandArgument);
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
            SqlCommand comd = new SqlCommand("spHotelCrud", conn);
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
            SqlDataAdapter sda = new SqlDataAdapter("spHotelCrud", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@crud", "h");
            sda.SelectCommand.Parameters.AddWithValue("@hotelID", hid);
            conn.Open();
            sda.Fill(dataset);
            conn.Close();
            lblHotel.Text = hid;

            txtHotelName.Text = dataset.Tables[0].Rows[0]["HotelName"].ToString();
            txtHotelPrice.Text = dataset.Tables[0].Rows[0]["HotelPrice"].ToString();
            txtHotelRating.Text = dataset.Tables[0].Rows[0]["Rating"].ToString();
            txtHotelDesc.Text = dataset.Tables[0].Rows[0]["HotelDescription"].ToString();
            txtHotelPhone.Text = dataset.Tables[0].Rows[0]["HotelPhoneNumber"].ToString();
            txtHotelAddress.Text = dataset.Tables[0].Rows[0]["HotelAddress"].ToString();
            txtHotelPostal.Text = dataset.Tables[0].Rows[0]["HotelPostalCode"].ToString();
            txtHotelWeb.Text = dataset.Tables[0].Rows[0]["HotelWebsite"].ToString();
            ddlHotelLoc.SelectedItem.Value = dataset.Tables[0].Rows[0]["HotelLocationID"].ToString();
            pnlUpdateHotel.Visible = true;


        }
        protected void gvHotels_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvHotels.PageIndex = Convert.ToInt32(e.NewPageIndex);
            loadHotels();
        }

        protected void btnInsertHotel_Click(object sender, EventArgs e)
        {
            pnlUpdateHotel.Visible = true;
            lblHotel.Text = "New";
            txtHotelName.Text = "";
            txtHotelPrice.Text = "";
            txtHotelRating.Text = "";
            txtHotelDesc.Text = "";
            txtHotelPhone.Text = "";
            txtHotelAddress.Text = "";
            txtHotelPostal.Text = "";
            txtHotelWeb.Text = "";
            txtHotelPhone.Text = "";
           
        }

        protected void btnSaveHotel_Click(object sender, EventArgs e)
        {
            string Hpath = Server.MapPath(@".\HotelPictures\");
            string Hname = flHotelImage.FileName;
            flHotelImage.PostedFile.SaveAs(Hpath + Hname);
            pnlUpdateHotel.Visible = false;
            SqlCommand com = new SqlCommand("spHotelCrud", conn);
           // com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;

            if (lblHotel.Text == "New")
            {
                com.Parameters.AddWithValue("@crud", "c");
                com.Parameters.AddWithValue("@hotelName", txtHotelName.Text);
                com.Parameters.AddWithValue("@hotelPrice", txtHotelPrice.Text);
                com.Parameters.AddWithValue("@hotelRatingIDID", txtHotelRating.Text);
                com.Parameters.AddWithValue("@hotelDescription", txtHotelDesc.Text);
                com.Parameters.AddWithValue("@hotelPhoneNumber", txtHotelPhone.Text);
                com.Parameters.AddWithValue("@hotelAddress", txtHotelAddress.Text);
                com.Parameters.AddWithValue("@hotelPostalCode", txtHotelPostal.Text);
                com.Parameters.AddWithValue("@hotelWebsite", txtHotelWeb.Text);
                com.Parameters.AddWithValue("@hotelLocationID", ddlHotelLoc.SelectedItem.Value);
                com.Parameters.AddWithValue("@hotel_path", Hname);

                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
                loadHotels();
            }
            else
            {
                com.Parameters.AddWithValue("@crud", "u");
                com.Parameters.AddWithValue("@hotelID", lblHotel.Text);
                com.Parameters.AddWithValue("@hotelName", txtHotelName.Text);
                com.Parameters.AddWithValue("@hotelPrice", txtHotelPrice.Text);
                com.Parameters.AddWithValue("@hotelRatingID", txtHotelRating.Text);
                com.Parameters.AddWithValue("@hotelDescription", txtHotelDesc.Text);
                com.Parameters.AddWithValue("@hotelPhoneNumber", txtHotelPhone.Text);
                com.Parameters.AddWithValue("@hotelAddress", txtHotelAddress.Text);
                com.Parameters.AddWithValue("@hotelPostalCode", txtHotelPostal.Text);
                com.Parameters.AddWithValue("@hotelWebsite", txtHotelWeb.Text);
                com.Parameters.AddWithValue("@hotelLocationID", ddlHotelLoc.SelectedItem.Value);
                com.Parameters.AddWithValue("@hotel_path", Hname);


                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
                loadHotels();
            }
           // loadHotels();
        }

        protected void gvAttractions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAttractions.PageIndex = Convert.ToInt32(e.NewPageIndex);
            loadAttractions();
        }
        private void loadSchools()
        {

        }

        protected void gvAttractions_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void gvShoping_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void gvRestaurants_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void gvHotels_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvHotels_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
    
    
}