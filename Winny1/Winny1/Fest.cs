using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    public class Fest : WinnipegEvent
    {
        public Fest(string text1, string text2, string text3, string text4, string v)
        {
        }

        public Fest(int eventID, string name,string type, string desc, string image, string web, string date )

        {
            base.eventID = eventID;
            base.type = type;
            base.date = date;
            base.name = name;
            base.description = desc;
            base.image = image;
            base.website = web;
        }


    }
}

