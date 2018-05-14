using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;

namespace GIP_Biedingssite
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        public static string strconnectie = ConfigurationManager.ConnectionStrings["gip"].ConnectionString;
        public static OleDbConnection cnn = new OleDbConnection(strconnectie);

        protected void Page_Load(object sender, EventArgs e)
        {
            PanelAddArtikel.Visible = false;
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

        protected void gdvArtikelenLeerkrachten(object sender, EventArgs e)
        {
            Session["ArtikelID"] = gdvArtikelenLeerkracht.SelectedRow.Cells[1].Text;

            Server.Transfer("Bieden.aspx");


        }
        protected void btnToevoegen_Click(object sender, EventArgs e)
        {

            PanelAddArtikel.Visible = true;

        }

        protected void btnVerzenden_Click(object sender, EventArgs e)
        {
            OleDbCommand cmdToevoegen = new OleDbCommand();
            cmdToevoegen.Connection = cnn;

            string strtoevoegen;

            strtoevoegen = "INSERT INTO Artikel(Naam, Startprijs, Beschrijving, Startdatum, Einddatum, FotoNaam ) ";
            strtoevoegen += "VALUES(@naam, @prijs, @beschrijving, @Sdatum, @Edatum)";

            cmdToevoegen.CommandText = strtoevoegen;

            cmdToevoegen.Parameters.AddWithValue("@naam", txtNaam.Text);
            cmdToevoegen.Parameters.AddWithValue("@prijs", Convert.ToInt16(TxtPrijs.Text));
            cmdToevoegen.Parameters.AddWithValue("@beschrijving", txtBeschrijving.Text);
            cmdToevoegen.Parameters.AddWithValue("@Sdatum", Convert.ToDateTime(txtStartDatum.Text));
            cmdToevoegen.Parameters.AddWithValue("@Edatum", Convert.ToDateTime(txtEindDatum.Text));

            OleDbCommand cmdArtikel = new OleDbCommand();
            cmdArtikel.Connection = cnn;

            cmdArtikel.CommandText = "SELECT TOP 1 ArtikelID FROM Artikel ORDER BY ArtikelID DESC";

            cnn.Open();
            Session["ArtikelID"] = cmdArtikel.ExecuteScalar();
            cnn.Close();

            
            // Naam van het gekozen bestand en doelpad nieuwe foto
            string strBestandsnaam, strDoelpad, strNummer;

            strBestandsnaam = System.IO.Path.GetFileName(fileupFoto.PostedFile.FileName);
            strDoelpad = Server.MapPath("fotos" + @"\" + strBestandsnaam);

            //Bestand opslaan in map op de internetserver

            fileupFoto.PostedFile.SaveAs(strDoelpad);

            //Ophalen sleutel
            strNummer = Session["ArtikelID"].ToString();

            //Bijwerken record via connected toegang

            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = cnn;

            string strsql;
            strsql = "UPDATE Artikel SET Foto= @foto ";
            strsql += " WHERE ArtikelID = @ID";

            cmd.CommandText = strsql;
            cmd.Parameters.AddWithValue("@foto", strBestandsnaam);
            cmd.Parameters.AddWithValue("@ID", strNummer);

            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();

            //Terug naar vorige webpagina
            Server.Transfer("ArtikelenLeerkracht.aspx");

            cmdToevoegen.CommandText = strtoevoegen;
            cnn.Open();
            cmdToevoegen.ExecuteNonQuery();
            cnn.Close();
        }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx");

        }
    }
}