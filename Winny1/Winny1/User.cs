using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny1
{
    // Creating a public class to represent client (user) object from database in session
    public class User
    {
        public int Id;
        public string FirstName;
        public string LastName;
        public string AccessLevel;
        public string Address;
        public string Phone;

        public User()
        {
            FirstName = "";
            LastName = "";
            AccessLevel = "";
            Address = "";
            Phone = "";
        }
    }
}