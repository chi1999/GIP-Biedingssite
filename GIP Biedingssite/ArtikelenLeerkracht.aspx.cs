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

            cmdToevoegen.CommandText = "INSERT INTO Artikel(ArtikelID, Naam, StartPrijs, Beschrijving, Startdatum, Einddatum, FotoNaam) " +
                "VALUES(@ID, @naam, @prijs, @beschrijving, @Sdatum, @Edatum, @foto)";

            cmdToevoegen.Parameters.AddWithValue("@ID", txtArtikelID.Text);
            cmdToevoegen.Parameters.AddWithValue("@naam", txtNaam.Text);
            cmdToevoegen.Parameters.AddWithValue("@prijs", TxtPrijs.Text);
            cmdToevoegen.Parameters.AddWithValue("@beschrijving", txtBeschrijving.Text);
            cmdToevoegen.Parameters.AddWithValue("@Sdatum", txtStartDatum.Text);
            cmdToevoegen.Parameters.AddWithValue("@Edatum", txtEindDatum.Text);
            cmdToevoegen.Parameters.AddWithValue("@foto", txtFoto.Text);

            cnn.Open();

            cmdToevoegen.ExecuteNonQuery();

            cnn.Close();

        }
    }
}