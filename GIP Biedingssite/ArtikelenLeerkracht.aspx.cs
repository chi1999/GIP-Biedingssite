using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP_Biedingssite
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelAddArtikel.Visible = false;

        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            PanelAddArtikel.Visible = true;

        }
    }
}