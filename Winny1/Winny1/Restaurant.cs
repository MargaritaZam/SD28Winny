using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Project;
using System.Data;

namespace Winny1
{

    public class Restaurant:Winnipeg
    {
        public string FoodType { get; set; }
        public string PostalCode { get; set; }

        public Restaurant(string rname, string rdesc, string rphone,
           string raddress, string rwebsite,
           string rimage, string rlocation, string foodtype, string rpostal)
        {
            base.Name = rname;
            base.Description = rdesc;
            base.Address = raddress;
            base.Phone = rphone;
            base.Website = rwebsite;
            base.Image = rimage;
            base.Location = rlocation;
            this.PostalCode = rpostal;
            this.FoodType = foodtype;


        }

        }
}