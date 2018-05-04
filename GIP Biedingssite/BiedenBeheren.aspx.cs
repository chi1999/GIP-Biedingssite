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
                Session["ArtikelID"] = ddvArtikel0.PageIndex - 1;
                dtsbeheerder.FilterExpression = "ArtikelID = " + Session["ArtikelID"];
                gdvbeheerder.DataBind();
            }
        }

        protected void ddvArtikel0_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            Session["ArtikelID"] = ddvArtikel0.PageIndex - 1;
            dtsbeheerder.FilterExpression = "ArtikelID = " + Session["ArtikelID"];
            gdvbeheerder.DataBind();
        }

        protected void gdvbeheerder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}