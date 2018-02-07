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

        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            PanelAddArtikel.Visible = true;

            OleDbCommand cmdToevoegen = new OleDbCommand();

            cmdToevoegen.Connection = cnn;

            cmdToevoegen.CommandText = "INSERT INTO Artikel(ArtikelID, Naam, Startprijs, Beschrijving, Startdatum, Einddatum, Fotonaam) " +
                "VALUES(@ID, @Naam, @Prijs, @Beschrijving, @Start, @Eind, @Foto)";
            cmdToevoegen.Parameters.AddWithValue("@ID", txtArtikelID.Text);
            cmdToevoegen.Parameters.AddWithValue("@Naam", txtArtikelID.Text);
            cmdToevoegen.Parameters.AddWithValue("@Prijs", txtArtikelID.Text);
            cmdToevoegen.Parameters.AddWithValue("@Beschrijving", txtArtikelID.Text);
            cmdToevoegen.Parameters.AddWithValue("@Start", txtArtikelID.Text);

        }
    }
}