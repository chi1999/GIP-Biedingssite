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
            if (!IsPostBack)
            {
                try
                {
                    switch (Session["SoortGebr"].ToString())
                    {
                        case "P":
                        case "L":
                        case "B":
                            break;
                        default:
                            Server.Transfer("Home.aspx");
                            break;

                    }
                }
                catch
                {
                    Server.Transfer("Home.aspx");
                }
            }


        

            dtsGebruiker.FilterExpression = "GebruikerID = " + Session["gebruiker"];
            dtvGebruiker.DataBind();

            dtsGeboden.FilterExpression = "GebruikerID = " + Session["gebruiker"];
            gdvBods.DataBind();

        }

        protected void gdvBods_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            Session["ArtikelID"] = gdvBods.SelectedRow.Cells[2].Text;
            
            Server.Transfer("Bieden.aspx");

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}