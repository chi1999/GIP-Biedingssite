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
                if (Session["SoortGebr"].ToString() == "L" || Session["SoortGebr"].ToString() == "P" || Session["SoortGebr"].ToString() == "B")
                {
                    if (Session["SoortGebr"].ToString() == "B" || Session["SoortGebr"].ToString() == "P")
                    {

                        btnArtikelenBekijken.Visible = true;
                        btnArtikelenToevoegen.Visible = true;

                    }

                    if (Session["SoortGebr"].ToString() == "L")
                    {
                        btnArtikelenBekijken.Visible = true;
                        btnArtikelenToevoegen.Visible = false;

                    }
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
    }
}