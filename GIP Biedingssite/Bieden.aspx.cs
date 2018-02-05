﻿using System;
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

            OleDbCommand cmdStartprijs = new OleDbCommand();
            cmdStartprijs.Connection = cnn;

            cmdStartprijs.CommandText = "SELECT StartPrijs FROM Artikel WHERE ArtikelID = @artikel";
            cmdStartprijs.Parameters.AddWithValue("@artikel", Session["ArtikelID"]);

            cnn.Open();
            Session["Startprijs"] = cmdStartprijs.ExecuteScalar();
            cnn.Close();

           // btnBieden.Text = Session["Startprijs"].ToString();
        }
        protected void Bieden(object sender, EventArgs e)
        {
            int intbod = Convert.ToInt16(txtBod.Text);

            string strHostName = System.Net.Dns.GetHostName();
            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            string myIP = addr[addr.Length - 2].ToString();
            btnBieden.Text = myIP;

            int intgeboden = Convert.ToInt32(ddvArtikel.Rows);



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