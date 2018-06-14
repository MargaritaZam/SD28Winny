using System;
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

        }
    }
}