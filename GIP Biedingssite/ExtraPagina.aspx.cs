using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP_Biedingssite
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnArtikelenToevoegen_Click(object sender, EventArgs e)
        {
            Server.Transfer("ArtikelenLeerkracht.aspx");
        }

        protected void btnArtikelenBekijken_Click(object sender, EventArgs e)
        {
            Server.Transfer("ArtikelenLeerling.aspx");
        }
    }
}