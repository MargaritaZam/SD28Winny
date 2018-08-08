using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Winny1
{
    public class WinnipegEventMain
    {
        List<WinnipegEvent> _WinnipegEventMain;
        public WinnipegEventMain()
        {
            if (HttpContext.Current.Session["Winnipeg"] == null)
            {
                _WinnipegEventMain = new List<WinnipegEvent>();
            }
            else
            {
                _WinnipegEventMain = (List<WinnipegEvent>)HttpContext.Current.Session["Winnipeg"];

            }
        }
        public void Save()
        {
            HttpContext.Current.Session["Winnipeg"] = _WinnipegEventMain;

        }
        public void Add(Fest fest)
        {
            _WinnipegEventMain.Add(fest);
            Save();
        }
        public void Add(Play play)
        {
            _WinnipegEventMain.Add(play);
            Save();
        }
        public void Add(Exhibition exhib)
        {
            _WinnipegEventMain.Add(exhib);
            Save();
        }

        public DataTable Get()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("eventID");
            dt.Columns.Add("name");
            dt.Columns.Add("type");
            dt.Columns.Add("description");        
            dt.Columns.Add("image");
            dt.Columns.Add("website");
            dt.Columns.Add("date");

            foreach (WinnipegEvent w in _WinnipegEventMain)
            {
                DataRow dr = dt.NewRow();
                dr["eventID"] = w.eventID;
                dr["name"] = w.name;
                dr["type"] = w.type;
                dr["description"] = w.description;              
                dr["image"] = w.image;
                dr["website"] = w.website;
                dr["date"] = w.date;


                switch (w.GetType().Name)
                {
                    case "Fest":
                        Fest f = (Fest)(w);                    
                        break;

                    case "Play":
                        Play p = (Play)(w);
                        break;

                    case "Exhibition":
                        Exhibition ex = (Exhibition)(w);                       
                        break;

                }

                dt.Rows.Add(dr);
            }
            return dt;
        }
    }

}