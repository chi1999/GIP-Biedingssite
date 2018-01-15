using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP_Biedingssite
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPnlInlog_Click(object sender, EventArgs e)
        {
            pnlLogin.Visible = true;
            pnlregistr.Visible = false;
        
        }

        protected void btnPnlRegistr_Click(object sender, EventArgs e)
        {
            pnlLogin.Visible = false;
            pnlregistr.Visible = true;

        }
    }
}