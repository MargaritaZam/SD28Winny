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
    public partial class hotel : System.Web.UI.Page
    {
        PagedDataSource adsource;
        int pos;
        string conn = "Data Source=localhost;Initial Catalog=dbGroupProject;Integrated Security=SSPI";

        public string HotelStarsID { get; private set; }
        public string Stars { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
                loadLocation();
                this.ViewState["vs"] = 0;
                loadHotelStars();
            }
            pos = (int)this.ViewState["vs"];
            loadHotels();
        }

        public void loadLocation()
        {
            DAL myDal = new DAL(conn);

            DataSet ds = myDal.ExecuteProcedure("spLocation");
            DdlLocation.DataSource = ds.Tables[0];
            DdlLocation.DataTextField = "LocationName";
            DdlLocation.DataValueField = "LocationID";
            DdlLocation.DataBind();
        }

        public void loadHotelStars()
        {
            DAL myDal = new DAL(conn);

            DataSet ds = myDal.ExecuteProcedure("spHotelStars");
            DdlHotelStars.DataSource = ds.Tables[0];
            DdlHotelStars.DataTextField = "Stars";
            DdlHotelStars.DataValueField = "StarsID";
            DdlHotelStars.DataBind();
        }

        public void loadHotels()
        {
            DAL myDal = new DAL(conn);

            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "r");
            DataSet ds = myDal.ExecuteProcedure("spHotelsCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 2;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            btnFirst.Enabled = !adsource.IsFirstPage;
            btnPrevious.Enabled = !adsource.IsFirstPage;
            btnLast.Enabled = !adsource.IsLastPage;
            btnNext.Enabled = !adsource.IsLastPage;
            DlHotels.DataSource = adsource;
            DlHotels.DataBind();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string StarsID = DdlHotelStars.SelectedItem.Value;
            string LocationId = DdlLocation.SelectedItem.Value;
            string Location = DdlLocation.SelectedItem.Text;

            TxtSearch.Text = Location;

            DAL myDal = new DAL(conn);
            adsource = new PagedDataSource();
            myDal.AddParam("@crud", "s");
            myDal.AddParam("@hotelStarsID", HotelStarsID);
            myDal.AddParam("@hotelLocationID", LocationId);
            DataSet ds = myDal.ExecuteProcedure("spHotelsCrud");
            adsource.DataSource = ds.Tables[0].DefaultView;
            adsource.PageSize = 2;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            btnFirst.Enabled = !adsource.IsFirstPage;
            btnPrevious.Enabled = !adsource.IsFirstPage;
            btnLast.Enabled = !adsource.IsLastPage;
            btnNext.Enabled = !adsource.IsLastPage;
            DlHotels.DataSource = adsource;
            DlHotels.DataBind();
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            pos = 0;
            loadHotels();
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos -= 1;
            this.ViewState["vs"] = pos;
            loadHotels();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos += 1;
            this.ViewState["vs"] = pos;
            loadHotels();
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            pos = adsource.PageCount - 1;
            loadHotels();
        }
    }
}