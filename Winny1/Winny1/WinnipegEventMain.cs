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
        public void Add(Events events)
        {
            _Events.Add(events);
            Save();
        }
                    
        public DataTable Get()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Description");        
            dt.Columns.Add("Image");           
            
            foreach (WinnipegEvent w in _Events)
            {
                DataRow dr = dt.NewRow();
                dr["Name"] = w.Name;
                dr["Description"] = w.Description;              
                dr["Image"] = w.Image;             
                switch (w.GetType().Name)
                {
                    case "Events":
                        Events at = (Events)(w);
                      
                        break;                  

                }
                dt.Rows.Add(dr);
            }
            return dt;
        }
    }

}