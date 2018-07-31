using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    public class Play: WinnipegEvent
    {
       
        public Play(string name, string desc, string image, string web, string date)

        {
            base.Date = date;
            base.Name = name;
            base.Description = desc;
            base.Image = image;
            base.Website = web;
        }
    }
}