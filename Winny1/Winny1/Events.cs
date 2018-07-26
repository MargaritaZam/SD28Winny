using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    public class Events : WinnipegEvent
    {
       public Events(string name, string desc, string image )

        {
            base.Name = name;
            base.Description = desc;
            base.Image = image;
        }


    }
}

