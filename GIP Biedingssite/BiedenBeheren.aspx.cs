using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP_Biedingssite
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SoortGebr"] == null)
            {
                Server.Transfer("Home.aspx");
            }

            if (!IsPostBack)
            {
                Session["ArtikelID"] = 1;
                dtsbeheerder.FilterExpression = "ArtikelID = " + Session["ArtikelID"];
                gdvbeheerder.DataBind();
            }
        }

        protected void indexchanged(object sender, DetailsViewPageEventArgs e)
        {
        }

        protected void gdvbeheerder_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx");
        }

        protected void indexchanged(object sender, EventArgs e)
        {
            Session["ArtikelID"] = Convert.ToInt32(gdvArtikels.SelectedRow.Cells[1].Text);
            dtsbeheerder.FilterExpression = "ArtikelID = " + Session["ArtikelID"];
            gdvbeheerder.DataBind();
        }
    }
}