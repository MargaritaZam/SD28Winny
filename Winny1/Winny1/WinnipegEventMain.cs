using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Winny1
{
    public class WinnipegEventMain
    {


        List<WinnipegEvent> _Events;
        public WinnipegEventMain()
        {
            if (HttpContext.Current.Session["Winnipeg"] == null)
            {
                _Events = new List<WinnipegEvent>();
            }
            else
            {
                _Events = (List<WinnipegEvent>)HttpContext.Current.Session["Winnipeg"];

            }
        }
        public void Save()
        {
            HttpContext.Current.Session["Winnipeg"] = _Events;

        }
        public void Add(Fest fest)
        {
            _Events.Add(fest);
            Save();
        }
        public void Add(Play play)
        {
            _Events.Add(play);
            Save();
        }
        public void Add(Exhibition exhib)
        {
            _Events.Add(exhib);
            Save();
        }

        public DataTable Get()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Description");        
            dt.Columns.Add("Image");
            dt.Columns.Add("Website");
            dt.Columns.Add("Date");

            foreach (WinnipegEvent w in _Events)
            {
                DataRow dr = dt.NewRow();
                dr["Name"] = w.Name;
                dr["Description"] = w.Description;              
                dr["Image"] = w.Image;
                dr["Website"] = w.Website;
                dr["Date"] = w.Date;

                
                dt.Rows.Add(dr);
            }
            return dt;
        }
    }

}