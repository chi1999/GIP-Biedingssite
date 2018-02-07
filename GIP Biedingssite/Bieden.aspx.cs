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
            if (!IsPostBack)
            {

                lblMelding.Visible = false;

                if (Convert.ToDateTime(Session["Einddatum"]) < DateTime.Today)
                {
                    pnlBieden.Visible = false;
                    lblFout.Visible = true;
                    lblFout.Text = "Het bieden voor dit artikel is afgesloten.";
                }
                else
                {
                    lblFout.Visible = false;
                }

            }

            Session["gebruiker"] = 2;
            Session["ArtikelID"] = 2;

            dtsArtikel.FilterExpression = "ArtikelID=" + Session["ArtikelID"];
            ddvArtikel.DataBind();

            dtsGebruikers.FilterExpression = "ArtikelID=" + Session["ArtikelID"];
            gdvGebruiker.DataBind();

            dtsbeheerder.FilterExpression = "ArtikelID =" + Session["ArtikelID"];
            gdvbeheerder.DataBind();

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

            OleDbCommand cmdhoogste = new OleDbCommand();
            cmdhoogste.Connection = cnn;

            cmdhoogste.CommandText = "SELECT TOP 1 Bod.Bod, Artikel.ArtikelID FROM Gebruiker INNER JOIN(Artikel INNER JOIN Bod ON Artikel.ArtikelID = Bod.ArtikelID) ON Gebruiker.GebruikerID = Bod.GebruikerID ORDER BY Bod.BodID DESC";
            
            cmdhoogste.Parameters.AddWithValue("@artikel", Session["ArtikelID"]);

            cnn.Open();
            Session["HBod"] = cmdhoogste.ExecuteScalar();
            cnn.Close();

            


        }
        protected void Bieden(object sender, EventArgs e)
        {
            int intbod = Convert.ToInt16(txtBod.Text);

            string strHostName = System.Net.Dns.GetHostName();
            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            string myIP = addr[addr.Length - 2].ToString();

            if (intbod > Convert.ToInt32(Session["HBod"]))
            {
                if (intbod > Convert.ToInt32(Session["Startprijs"]))
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
                    lblMelding.Text = "Uw bod is geplaats op " + DateTime.Today.Date;
                }
                else
                {
                    lblMelding.Visible = true;
                    lblMelding.Text = "Het bedrag moet hoger zijn dan " + Session["Startprijs"];
                }
            }
            else
            {
                lblMelding.Visible = true;
                lblMelding.Text = "Het bedrag moet hoger zijn dan " + Session["HBod"];

            }

        }

        protected void dtsArtikel_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}