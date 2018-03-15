using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP_Biedingssite
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["SoortGebr"] = "B";
            if (Session["SoortGebr"].ToString() == "L" || Session["SoortGebr"].ToString() == "P")
            {

            }
            else
            {
                if (Session["SoortGebr"].ToString() == "B")
                {
                    //Server.Transfer("Home.aspx");
                }
                else
                {
                    Server.Transfer("Home.aspx");
                }
            }

            dtsGebruiker.FilterExpression = "GebruikerID = " + Session["gebruiker"];
            dtsGebruiker.DataBind();

            dtsGeboden.FilterExpression = "GebruikerID = " + Session["gebruiker"];
            dtsGeboden.DataBind();

        }

        protected void gdvBods_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ArtikelID"] = gdvBods.SelectedRow.Cells[2];
            Server.Transfer("Bieden.aspx");

        }
    }
}