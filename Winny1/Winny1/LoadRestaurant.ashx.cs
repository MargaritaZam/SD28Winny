using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Project;
using System.Data;

namespace Winny1
{
    /// <summary>
    /// Summary description for LoadRestaurant
    /// </summary>
    public class LoadRestaurant : IHttpHandler
    {
        
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
           
            context.Response.Write(GetRestaurant());
        }
        private string GetRestaurant()
        {
            
            string conn = "Data Source= localhost; Initial Catalog=dbRestaurants; Integrated Security= SSPI";
            string result = "{ \"Table\": [ ";
            DAL myDal = new DAL(conn);
            myDal.AddParam("@crud", "a");
            myDal.AddParam("@RestaurantId", "a");
            DataSet ds = myDal.ExecuteProcedure("spRestaurants");
         
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                result = result + "{\"RestaurantId\": \"" + ds.Tables[0].Rows[i]["RestaurantId"].ToString() +
                                 "\", \"RestaurantName\":\"" + ds.Tables[0].Rows[i]["RestaurantName"].ToString() +
                                    "\", \"Description\":\"" + ds.Tables[0].Rows[i]["Description"].ToString() +
                                       "\", \"path\":\"" + ds.Tables[0].Rows[i]["path"].ToString() +
                                 "\"}, ";
            }

            result = result.Substring(0, result.Length - 2) + " ]}";
            return result;

        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}