using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    public class Exhibition : WinnipegEvent
    {
        
        public Exhibition(int id, string type,string name, string desc, string image, string web, string date)

        {
            base.eventID = id;
            base.type = type;
            base.date = date;
            base.name = name;
            base.description = desc;
            base.image = image;
            base.website = web;
        }
    }
}