﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;


namespace GIP_Biedingssite
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public static string strconnectie = ConfigurationManager.ConnectionStrings["gip"].ConnectionString;
        public static OleDbConnection cnn = new OleDbConnection(strconnectie);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPnlInlog_Click(object sender, EventArgs e)
        {
            pnlLogin.Visible = true;
            pnlregistr.Visible = false;
        
        }

        protected void btnPnlRegistr_Click(object sender, EventArgs e)
        {
            pnlLogin.Visible = false;
            pnlregistr.Visible = true;
            btnPnlInlog0.Visible = false;
            btnPnlRegistr0.Visible = false;
        }

        protected void registreren(object sender, EventArgs e)
        {


            OleDbCommand cmdRegistreren = new OleDbCommand();

            cmdRegistreren.Connection = cnn;

            cmdRegistreren.CommandText = "INSERT INTO Gebruiker(Voornaam, Familienaam, Wachtwoord, Email) VALUES(@Voornaam, @Familienaam, @Wachtwoord, @Email)";

            cmdRegistreren.Parameters.AddWithValue("@Voornaam", txtnaam.Text);
            cmdRegistreren.Parameters.AddWithValue("@Familienaam", txtfFamilieNaam.Text);
            cmdRegistreren.Parameters.AddWithValue("@Wachtwoord", txtww.Text);
            cmdRegistreren.Parameters.AddWithValue("@Email", txtemail.Text);

            cnn.Open();

            cmdRegistreren.ExecuteNonQuery();

            cnn.Close();
            pnlLogin.Visible = true;
            UserName.Text = txtnaam.Text;
            pnlregistr.Visible = false;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            





        }
    }
}