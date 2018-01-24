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
    public partial class WebForm4 : System.Web.UI.Page
    {
        public static string strconnectie = ConfigurationManager.ConnectionStrings["Appel"].ConnectionString;

        public static OleDbConnection cnn = new OleDbConnection(strconnectie);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Bieden(object sender, EventArgs e)
        {

            OleDbCommand cmd = new OleDbCommand();

            cmd.Connection = cnn;

            string strsql;
            strsql = "INSERT INTO tblBod(Bod, Moment, IPadres, GebruikerID, ArtikelID) ";
            strsql += "VALUES(@bod, @moment, @ip, @gebruiker, @Artikel)";

            cmd.CommandText = strsql;

            cnn.Open();


            cnn.Close();
        }
       
    }
}