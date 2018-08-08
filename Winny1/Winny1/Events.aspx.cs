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
    public partial class Events : System.Web.UI.Page
    {
        WinnipegEventMain winevents;
        SqlConnection conn = new SqlConnection("Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI");

        protected void Page_Load(object sender, EventArgs e)
        {
            Security security = new Security();



            winevents = new WinnipegEventMain();

            if (!IsPostBack)
            {
                loadEvents();
            }
        }
        public void loadEvents()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spEvents", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@crud", "r");
            conn.Open();
            da.Fill(ds);
            conn.Close();

            dlEvents.DataSource = ds.Tables[0];
            dlEvents.DataBind();
        }
        public void AddEvents()
        {
            dlEvents.DataSource = winevents.Get();
            dlEvents.DataBind();
        }

        protected void dlEvents_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void dlEvents_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void rblEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            string show = rblEvents.SelectedValue;
            DataSet ds = new DataSet();
            switch (show)
            {
                case "f":
                    SqlDataAdapter da1 = new SqlDataAdapter("spSearchFest", conn);
                    da1.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da1.SelectCommand.Parameters.AddWithValue("@festival", "Festival");
                    conn.Open();
                    da1.Fill(ds);
                    conn.Close();
                    dlEvents.DataSource = ds.Tables[0];
                    dlEvents.DataBind();
                    break;

                case "e":
                    SqlDataAdapter da2 = new SqlDataAdapter("spSearchExhibition", conn);
                    da2.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da2.SelectCommand.Parameters.AddWithValue("@exhibition", "Exhibition");
                    conn.Open();
                    da2.Fill(ds);
                    conn.Close();
                    dlEvents.DataSource = ds.Tables[0];
                    dlEvents.DataBind();
                    break;

                case "p":
                    SqlDataAdapter da3 = new SqlDataAdapter("spSearchPlay", conn);
                    da3.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da3.SelectCommand.Parameters.AddWithValue("@play", "Play");
                    conn.Open();
                    da3.Fill(ds);
                    conn.Close();
                    dlEvents.DataSource = ds.Tables[0];
                    dlEvents.DataBind();
                    break;


            }
        }

        
        
    }
}