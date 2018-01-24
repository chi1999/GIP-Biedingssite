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

        }
        protected void Bieden(object sender, EventArgs e)
        {
            string hostName = Dns.GetHostName(); // Retrive the Name of HOST  
            // Get the IP  
            string myIP = Dns.GetHostEntry(hostName).AddressList[0].ToString();
            txtBod.Text = myIP;
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