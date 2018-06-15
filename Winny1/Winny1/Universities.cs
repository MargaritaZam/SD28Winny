using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using DAL_Project;

namespace Winny1
{
    public class Universities
    {
        string conn = "Data Source=localhost;Initial Catalog=dbGroupProject;Integrated Security=SSPI;";

        public string SchoolID { get; set; }
        public string SchoolName { get; set; }
        public string SchoolPhoneNumber { get; set; }
        public string SchoolAddress { get; set; }
        public string SchoolPostalCode { get; set; }
        public string SchoolWebsite { get; set; }
        public string SchoolDescription { get; set; }
        public string School_path { get; set; }
        public string SchoolLocationID { get; set; }
    }
}