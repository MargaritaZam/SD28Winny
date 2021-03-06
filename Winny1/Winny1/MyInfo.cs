﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Winny1
{
    public class MyInfo
    {
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string phone { get; set; }
        public string address { get; set; }
        public string image { get; set; }
        public string website { get; set; }

        public MyInfo(int id)
        {
            this.id = id;
            
            SqlConnection conn = new SqlConnection("Data Source = localhost; Initial Catalog = dbGroupProject; Integrated Security = SSPI");
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("spGetAttraction", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@id", id);
            conn.Open();
            da.Fill(ds);
            conn.Close();

            
            name = ds.Tables[0].Rows[0]["atName"].ToString();
            description = ds.Tables[0].Rows[0]["atDesc"].ToString();
            phone= ds.Tables[0].Rows[0]["atPhone"].ToString();
            address = ds.Tables[0].Rows[0]["atAddress"].ToString();
            website = ds.Tables[0].Rows[0]["atWebsite"].ToString();
            image = "./Attractions/" + ds.Tables[0].Rows[0]["atImage"].ToString();
        }
    }
}