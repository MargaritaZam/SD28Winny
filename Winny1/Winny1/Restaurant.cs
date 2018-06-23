﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Project;
using System.Data;

namespace Winny1
{

    public class Restaurant
    {
        string conn = "Data Source= localhost; Initial Catalog=dbRestaurants; Integrated Security= SSPI";
        public int RestaurantId { get; set; }
        public string RestaurantName { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public string PostalCode { get; set; }
        public string ContactNo { get; set; }
        public string path { get; set; }
        public int FoodId { get; set; }


        public DataTable LoadRestaurant()
        {
            
            DAL myDal = new DAL(conn);
             myDal.AddParam("@crud", "a");
            DataSet ds = myDal.ExecuteProcedure("spRestaurants"); 
            return ds.Tables[0];
        }
    }
}