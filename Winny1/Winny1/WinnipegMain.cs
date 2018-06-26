using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Winny1
{
    public class WinnipegMain
    {
        List<Winnipeg> _WinnipegMain;
        public WinnipegMain()
        {
            if (HttpContext.Current.Session["Winnipeg"] == null)
            {
                _WinnipegMain = new List<Winnipeg>();
            }
            else
            {
                _WinnipegMain = (List<Winnipeg>)HttpContext.Current.Session["Winnipeg"];

            }
        }
        public void Save()
        {
            HttpContext.Current.Session["Winnipeg"] = _WinnipegMain;

        }
        public void Add(Restaurant restaurant)
        {
            _WinnipegMain.Add(restaurant);
            Save();
        }
        public void Add(Attraction attraction)
        {
            _WinnipegMain.Add(attraction);
            Save();
        }
        public void Add(Store store)
        {
            _WinnipegMain.Add(store);
            Save();
        }
        public void Add(Hotel hotel)
        {
            _WinnipegMain.Add(hotel);
            Save();
        }
        public void Add(School school)
        {
            _WinnipegMain.Add(school);
            Save();
        }
        public DataTable Get()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Description");
            dt.Columns.Add("Phone");
            dt.Columns.Add("Address");
            dt.Columns.Add("Website");
            dt.Columns.Add("Image");
            dt.Columns.Add("Location");
            dt.Columns.Add("Additional");
            foreach (Winnipeg w in _WinnipegMain)
            {
                DataRow dr = dt.NewRow();
                dr["Name"] = w.Name;
                dr["Description"] = w.Description;
                dr["Phone"] = w.Phone;
                dr["Address"] = w.Address;
                dr["Website"] = w.Website;
                dr["Image"] = w.Image;
                dr["Location"] = w.Location;
                switch (w.GetType().Name)
                {
                    case "Attraction":
                        Attraction at = (Attraction)(w);
                        dr["Additional"] = at.attractionCategory;
                        break;

                    case "Restaurant":
                        Restaurant rt = (Restaurant)(w);
                        dr["Additional"] = rt.FoodType + ", " + rt.PostalCode;
                        break;

                    case "Hotel":
                        Hotel h = (Hotel)(w);
                        dr["Additional"] = h.HotelPostalCode;
                        break;

                    case "School":
                        School sl = (School)(w);
                        dr["Additional"] = sl.SchoolPostalCode + ", " + sl.SchoolType;
                        break;

                    case "Store":
                        Store st = (Store)(w);
                        dr["Additional"] = st.StoreCategory;
                        break;

                }
                dt.Rows.Add(dr);
            }
            return dt;
        }
    }

}