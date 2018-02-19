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
                Session["SoortGebr"] = "L";
                Session["GebruikerID"] = 2;
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
            
            }

            dtsGebruiker.FilterExpression = "GebruikerID = " + Session["gebruiker"];
            dtvGebruiker.DataBind();

            dtsGeboden.FilterExpression = "GebruikerID = " + Session["gebruiker"];
            gdvBods.DataBind();

        }

        protected void gdvBods_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            Session["ArtikelID"] = gdvBods.SelectedRow.Cells[1];
            TextBox1.Text = Session["ArtikelID"].ToString();
            //Server.Transfer("Bieden.aspx");

        }
    }
}