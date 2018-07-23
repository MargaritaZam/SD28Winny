using System;
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
        //string conn = "Data Source= localhost; Initial Catalog=dbRestaurants; Integrated Security= SSPI";
        //string conn1 = "Data Source=localhost; Initial Catalog=dbShopping; Integrated Security=SSPI";
        string conn = "Data Source= localhost; Initial Catalog=dbGroupProject; Integrated Security= SSPI";
        //string conn3 = "Data Source=localhost;Initial Catalog=dbOmegaProject;Integrated Security=SSPI";

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
            
            Console.WriteLine(choice);
            if (choice == "Rest")
            {
                DAL myDal = new DAL(conn);
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
            else if (choice == "Shop")
            {
                DAL myDal = new DAL(conn);
                myDal.AddParam("@Crud", "r");
                myDal.AddParam("@StoreId",id);
                DataSet ds = myDal.ExecuteProcedure("spStores");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    result = result +/* "{\"Id\": \"" + ds.Tables[0].Rows[i]["RestaurantId"].ToString() +*/
                                     /* "\",*/ "{\"Name\":\"" + ds.Tables[0].Rows[i]["StoreName"].ToString() +
                                         "\", \"Description\":\"" + ds.Tables[0].Rows[i]["Description"].ToString() +
                                            "\", \"Address\":\"" + ds.Tables[0].Rows[i]["Address"].ToString() +
                                                  //"\", \"PostalCode\":\"" + ds.Tables[0].Rows[i]["PostalCode"].ToString() +
                                                  "\", \"ContactNo\":\"" + ds.Tables[0].Rows[i]["PhoneNumber"].ToString() +
                                                     "\", \"Website\":\"" + ds.Tables[0].Rows[i]["Web"].ToString() +
                                            "\", \"path\":\"" + ds.Tables[0].Rows[i]["Path"].ToString() +
                                      "\"}, ";
                }
                

            }

            else if (choice == "Attract")
            {
                DAL myDal = new DAL(conn);
                myDal.AddParam("@crud", "r");
                myDal.AddParam("@id", id);
                DataSet ds = myDal.ExecuteProcedure("spAttractions");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    result = result +/* "{\"Id\": \"" + ds.Tables[0].Rows[i]["RestaurantId"].ToString() +*/
                                     /* "\",*/ "{\"Name\":\"" + ds.Tables[0].Rows[i]["atName"].ToString() +
                                         "\", \"Description\":\"" + ds.Tables[0].Rows[i]["atDesc"].ToString() +
                                            "\", \"Address\":\"" + ds.Tables[0].Rows[i]["atAddress"].ToString() +
                                                  //"\", \"PostalCode\":\"" + ds.Tables[0].Rows[i]["PostalCode"].ToString() +
                                                  "\", \"ContactNo\":\"" + ds.Tables[0].Rows[i]["atPhone"].ToString() +
                                                     "\", \"Website\":\"" + ds.Tables[0].Rows[i]["atWebsite"].ToString() +
                                            "\", \"path\":\"" + ds.Tables[0].Rows[i]["atImage"].ToString() +
                                      "\"}, ";
                }


            }
            else if (choice == "Hotel")
            {
                DAL myDal = new DAL(conn);
                myDal.AddParam("@crud", "r");
                myDal.AddParam("@id", id);
                DataSet ds = myDal.ExecuteProcedure("spHotelsCrud");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    result = result +/* "{\"Id\": \"" + ds.Tables[0].Rows[i]["HotelId"].ToString() +*/
                                     /* "\",*/ "{\"Name\":\"" + ds.Tables[0].Rows[i]["HotelName"].ToString() +
                                         "\", \"Price\":\"" + ds.Tables[0].Rows[i]["HotelPrice"].ToString() +
                                         "\", \"Stars\":\"" + ds.Tables[0].Rows[i]["HotelStars"].ToString() +
                                         "\", \"Description\":\"" + ds.Tables[0].Rows[i]["HotelDescription"].ToString() +
                                         "\", \"ContactNo\":\"" + ds.Tables[0].Rows[i]["HotelPhoneNumber"].ToString() +
                                         "\", \"Address\":\"" + ds.Tables[0].Rows[i]["HotelAddress"].ToString() +
                                         "\", \"PostalCode\":\"" + ds.Tables[0].Rows[i]["HotelPostalCode"].ToString() +
                                         "\", \"Website\":\"" + ds.Tables[0].Rows[i]["HotelWebsite"].ToString() +
                                         "\", \"path\":\"" + ds.Tables[0].Rows[i]["Hotel_path"].ToString() +
                                         "\", \"Location\":\"" + ds.Tables[0].Rows[i]["HotelLocationID"].ToString() +
                                         "\"}, ";
                }
            }

            else if (choice == "Universities/Colleges")
            {
                DAL myDal = new DAL(conn);
                myDal.AddParam("@crud", "r");
                myDal.AddParam("@id", id);
                DataSet ds = myDal.ExecuteProcedure("spSchoolsCrud");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    result = result +/* "{\"Id\": \"" + ds.Tables[0].Rows[i]["SchoolId"].ToString() +*/
                                     /* "\",*/ "{\"Name\":\"" + ds.Tables[0].Rows[i]["SchoolName"].ToString() +
                                     "\", \"Type\":\"" + ds.Tables[0].Rows[i]["SchoolType"].ToString() +
                                     "\", \"ContactNo\":\"" + ds.Tables[0].Rows[i]["SchoolPhoneNumber"].ToString() +
                                     "\", \"Address\":\"" + ds.Tables[0].Rows[i]["SchoolAddress"].ToString() +
                                     "\", \"PostalCode\":\"" + ds.Tables[0].Rows[i]["SchoolPostalCode"].ToString() +
                                     "\", \"Website\":\"" + ds.Tables[0].Rows[i]["SchoolWebsite"].ToString() +
                                     "\", \"Description\":\"" + ds.Tables[0].Rows[i]["SchoolDescription"].ToString() +
                                     "\", \"path\":\"" + ds.Tables[0].Rows[i]["School_path"].ToString() +
                                     "\", \"Location\":\"" + ds.Tables[0].Rows[i]["SchoolLocationID"].ToString() +
                                     "\"}, ";
                }
            }

            else if (choice == "About")
            {
                DAL myDal = new DAL(conn);
                myDal.AddParam("@crud", "r");
                myDal.AddParam("@id", id);
                DataSet ds = myDal.ExecuteProcedure("spAboutCrud");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    result = result +/* "{\"Id\": \"" + ds.Tables[0].Rows[i]["AboutId"].ToString() +*/
                                     /* "\",*/ "{\"Title\":\"" + ds.Tables[0].Rows[i]["AboutTitle"].ToString() +
                                     "\", \"Description\":\"" + ds.Tables[0].Rows[i]["AboutDescription"].ToString() +
                                     "\"}, ";
                }
            }

            else if (choice == "Weather")
            {
                DAL myDal = new DAL(conn);
                myDal.AddParam("@id", id);
                DataSet ds = myDal.ExecuteProcedure("spReadWeather");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    result = result +/* "{\"Id\": \"" + ds.Tables[0].Rows[i]["WeatherId"].ToString() +*/
                                     /* "\",*/ "{\"Month\":\"" + ds.Tables[0].Rows[i]["Month"].ToString() +
                                     "\", \"High\":\"" + ds.Tables[0].Rows[i]["High"].ToString() +
                                     "\", \"Low\":\"" + ds.Tables[0].Rows[i]["Low"].ToString() +
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