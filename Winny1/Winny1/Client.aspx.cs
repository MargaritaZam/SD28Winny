﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Winny1
{
    public partial class Client : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlInputButton LogIn = (HtmlInputButton)Master.FindControl("btnLogIn");
            HtmlInputButton LogOut = (HtmlInputButton)Master.FindControl("btnLogOut");
            LogOut.Visible = true;
            LogIn.Visible = false;
        }
    }
}