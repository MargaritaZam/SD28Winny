using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    public class Hotel:Winnipeg
    {
        public string HotelPostalCode { get; set; }

        public Hotel(string hname, string hdesc, string hphone,
            string haddress, string hwebsite,
            string himage, string hlocation, string hpostal )
        {
            base.Name = hname;
            base.Description = hdesc;
            base.Address = haddress;
            base.Phone = hphone;
            base.Website = hwebsite;
            base.Image = himage;
            base.Location = hlocation;
            this.HotelPostalCode = hpostal;
        }
    }
}
