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
            Session["gebruiker"] = 2;
            Session["ArtikelID"] = 1;

            //dtsArtikel.FilterExpression = "ArtikelID=" + Session["ArtikelID"];
            //ddvArtikel.DataBind();

            //dtsGebruikers.FilterExpression = "ArtikelID=" + Session["ArtikelID"];
            //gdvGebruiker.DataBind();

            


        }
        protected void Bieden(object sender, EventArgs e)
        {
            int intbod = Convert.ToInt16(txtBod.Text);

            string strHostName = System.Net.Dns.GetHostName();
            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            string myIP = addr[addr.Length - 2].ToString();
            btnBieden.Text = myIP;

            switch (intbod)
            {
                case 0:
                    
                    break;
            }



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
        }

        protected void dtsArtikel_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}