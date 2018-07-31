using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    public class Fest : WinnipegEvent
    {
       
       public Fest(string name, string desc, string image, string web, string date )

        {
            this.Date = date;
            base.Name = name;
            base.Description = desc;
            base.Image = image;
            base.Website = web;
        }


    }
}

