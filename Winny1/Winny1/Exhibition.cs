using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    public class Exhibition : WinnipegEvent
    {
       
        public Exhibition(string name, string desc, string image, string web, string date)

        {
            base.Date = date;
            base.Name = name;
            base.Description = desc;
            base.Image = image;
            base.Website = web;
        }
    }
}