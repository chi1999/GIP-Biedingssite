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

            try
            {
                switch (Session["SoortGebr"].ToString())
                {
                    case "P":
                    case "B":
                        btnArtikelenBekijken.Visible = true;
                        btnArtikelenToevoegen.Visible = true;
                        break;
                    case "L":
                        btnArtikelenBekijken.Visible = true;
                        btnArtikelenToevoegen.Visible = false;
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

        protected void btnArtikelenToevoegen_Click(object sender, EventArgs e)
        {
            Server.Transfer("ArtikelenLeerkracht.aspx");
        }

        protected void btnArtikelenBekijken_Click(object sender, EventArgs e)
        {
            Server.Transfer("ArtikelenLeerlingen.aspx");
        }

        protected void btnProfiel_Click(object sender, EventArgs e)
        {
            Server.Transfer("Profiel.aspx");
        }

        protected void btnAfmelden_Click(object sender, EventArgs e)
        {
            Session["SoortGebr"] = "";
            Session["gebruiker"] = "";
        }
    }
}