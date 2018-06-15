﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Project;
using System.Data;

namespace Winny1
{
    /// <summary>
    /// Summary description for LoadInformation
    /// </summary>
    public class LoadInformation : IHttpHandler
    {
        string conn = "Data Source= localhost; Initial Catalog=dbRestaurants; Integrated Security= SSPI";
        public void ProcessRequest(HttpContext context)
        {
            string id = context.Request.Form["Id"];
            string choice= context.Request.Form["choice"];
            context.Response.ContentType = "text/plain";
            
            context.Response.Write(GetInformation(id,choice));
           
        }

        private string GetInformation(string id, string choice)
        {
            string result = "{ \"Table\": [ ";
            DAL myDal = new DAL(conn);
            Console.WriteLine(choice);
             if(choice=="Rest")
            {
                myDal.AddParam("@crud", "r");
                myDal.AddParam("@RestaurantId", id);
                DataSet ds = myDal.ExecuteProcedure("spRestaurants");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    result = result +/* "{\"Id\": \"" + ds.Tables[0].Rows[i]["RestaurantId"].ToString() +*/
                                     /* "\",*/ "{\"Name\":\"" + ds.Tables[0].Rows[i]["RestaurantName"].ToString() +
                                         "\", \"Description\":\"" + ds.Tables[0].Rows[i]["Description"].ToString() +
                                            "\", \"Address\":\"" + ds.Tables[0].Rows[i]["Address"].ToString() +
                                               //"\", \"PostalCode\":\"" + ds.Tables[0].Rows[i]["PostalCode"].ToString() +
                                                  "\", \"ContactNo\":\"" + ds.Tables[0].Rows[i]["ContactNo"].ToString() +
                                                     "\", \"Website\":\"" + ds.Tables[0].Rows[i]["Website"].ToString() +
                                            "\", \"path\":\"" + ds.Tables[0].Rows[i]["path"].ToString() +
                                      "\"}, ";
                }

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