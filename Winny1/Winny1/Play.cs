﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    public class Play: WinnipegEvent
    {
        public Play(string text1, string text2, string text3, string text4, string v)
        {
        }

        public Play(int id,string name, string type, string desc, string image, string web, string date)

        {
            base.eventID = id;
            base.date = date;
            base.name = name;
            base.type = type;
            base.description = desc;
            base.image = image;
            base.website = web;
        }
    }
}