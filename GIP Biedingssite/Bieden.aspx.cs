using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;

namespace GIP_Biedingssite
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        
        public static string strconnectie = ConfigurationManager.ConnectionStrings["gip"].ConnectionString;

        public static OleDbConnection cnn = new OleDbConnection(strconnectie);
        protected void Page_Load(object sender, EventArgs e)
        {
            //Controleren als de gebruiker is aangemeld en welk type
            try
            {
                switch (Session["SoortGebr"].ToString())
                {
                    case "P":
                    case "L":
                        pnlGebruikers.Visible = true;
                        pnlBieden.Visible = true;
                        pnlBeheerder.Visible = false;
                        break;
                    case "B":
                        pnlBeheerder.Visible = true;
                        pnlBieden.Visible = true;
                        pnlGebruikers.Visible = false;
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

            //

            if (!IsPostBack)
            {
                lblMelding.Visible = false;
            }

            //Filteren van de detailsviews
            try
            {
                dtsArtikel.FilterExpression = "ArtikelID=" + Session["ArtikelID"];
                ddvArtikel.DataBind();

                dtsGebruikers.FilterExpression = "ArtikelID=" + Session["ArtikelID"];
                gdvGebruiker.DataBind();

                dtsbeheerder.FilterExpression = "ArtikelID =" + Session["ArtikelID"];
                gdvbeheerder.DataBind();

            }
            catch
            {
                Server.Transfer("Menu.aspx");
            }
            

            //opvragen van de startprijs en einddatum voor controle te kunnen uitvoeren bij het bod plaatsen

            OleDbCommand cmdStartprijs = new OleDbCommand();
            cmdStartprijs.Connection = cnn;

            cmdStartprijs.CommandText = "SELECT StartPrijs, Einddatum FROM Artikel WHERE ArtikelID = @artikel";
            cmdStartprijs.Parameters.AddWithValue("@artikel", Session["ArtikelID"]);

            cnn.Open();
            OleDbDataReader drGegevens = cmdStartprijs.ExecuteReader();
            while (drGegevens.Read())
            {
            Session["Startprijs"] = Convert.ToInt32(drGegevens[0]);
            Session["Einddatum"] = Convert.ToDateTime(drGegevens[1]);
            }

            cnn.Close();
            
            //Het hoogste bod opvragen van het artikel voor te controleren bij het plaatsten van een bod

            OleDbCommand cmdhoogste = new OleDbCommand();
            cmdhoogste.Connection = cnn;

            cmdhoogste.CommandText = "SELECT TOP 1 Bod.Bod, Artikel.ArtikelID FROM Gebruiker INNER JOIN(Artikel INNER JOIN Bod ON Artikel.ArtikelID = Bod.ArtikelID) ON Gebruiker.GebruikerID = Bod.GebruikerID WHERE Bod.ArtikelID = @artikel ORDER BY BodID DESC";
            
            cmdhoogste.Parameters.AddWithValue("@artikel", Session["ArtikelID"]);

            cnn.Open();
            Session["HBod"] = cmdhoogste.ExecuteScalar();

            cnn.Close();

            if (Convert.ToInt16(Session["HBod"]) <= 0)
            {
                Session["HBod"] = 0;
            }

           //Bieden onmogelijk maken als de einddatum is bereikt
            if (Convert.ToDateTime(Session["Einddatum"]) < DateTime.Today)
            {
                pnlBieden.Visible = false;
                lblFout.Visible = true;
                lblFout.Text = "Het bieden voor dit artikel is afgesloten.";
            }
            else
            {
                pnlBieden.Visible = true;
                lblFout.Visible = false;
            }
            
        }
        protected void Bieden(object sender, EventArgs e)
        {

            int intbod = Convert.ToInt16(txtBod.Text);

            //ophalen van het ipadres van de gebruiker
            string strHostName = System.Net.Dns.GetHostName();
            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            string myIP = addr[addr.Length - 2].ToString();

            //Plaatsen van het bod als het bedrag hoger is dan het hoogste bod en de startprijs
            if (intbod > Convert.ToInt32(Session["HBod"].ToString()))
            {
                if (intbod > Convert.ToInt32(Session["Startprijs"].ToString()))
                {
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = cnn;

                    string strsql;
                    strsql = "INSERT INTO Bod(Bod, Moment, IPadres, GebruikerID, ArtikelID) ";
                    strsql += "VALUES(@bod, @moment, @ip, @gebruiker, @Artikel)";
                    cmd.Parameters.AddWithValue("@bod", intbod);
                    cmd.Parameters.AddWithValue("@moment", DateTime.Today);
                    cmd.Parameters.AddWithValue("@ip", myIP);
                    cmd.Parameters.AddWithValue("@gebruiker", Session["gebruiker"]);
                    cmd.Parameters.AddWithValue("@Artikel", Session["ArtikelID"]);

                    cmd.CommandText = strsql;

                    cnn.Open();

                    cmd.ExecuteNonQuery();

                    cnn.Close();

                    lblMelding.Visible = true;
                    lblMelding.Text = "Uw bod is geplaatst op " + DateTime.Today.Date;

                    dtsGebruikers.FilterExpression = "ArtikelID=" + Session["ArtikelID"];
                    gdvGebruiker.DataBind();
                    dtsbeheerder.FilterExpression = "ArtikelID =" + Session["ArtikelID"];
                    gdvbeheerder.DataBind();


                }
                else
                {
                    lblMelding.Visible = true;
                    lblMelding.Text = "Het bedrag moet hoger zijn dan " + Session["Startprijs"].ToString();
                }
            }
            else
            {
                lblMelding.Visible = true;
                lblMelding.Text = "Het bedrag moet hoger zijn dan het hoogste bod " + Session["HBod"].ToString();

            }

        }

    }
}