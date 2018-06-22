using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Winny1
{
    public partial class Winnipeg1 : System.Web.UI.Page
    {
        WinnipegMain myWinnipeg;

        protected void Page_Load(object sender, EventArgs e)
        {
            myWinnipeg = new WinnipegMain();
        }

        private void LoadWinnipeg()
        {
            gvWinnipeg.DataSource = myWinnipeg.Get();
            gvWinnipeg.DataBind();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}