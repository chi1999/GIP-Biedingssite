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
            btnPnlInlog.Visible = false;
            btnPnlRegistr.Visible = true;
        }

        protected void btnPnlRegistr_Click(object sender, EventArgs e)
        {
            pnlAkkoord.Visible = true;
            pnlLogin.Visible = false;
            pnlregistr.Visible = true;
            btnPnlInlog.Visible = false;
            btnPnlRegistr.Visible = false;
            
        }

        protected void registreren(object sender, EventArgs e)
        {
            bool ok = false;

            if (ckbAkkoord.Checked==true)
            {
                ok = true;
            }

            OleDbCommand cmdRegistreren = new OleDbCommand();

            cmdRegistreren.Connection = cnn;

            cmdRegistreren.CommandText = "INSERT INTO Gebruiker(Voornaam, Familienaam, Wachtwoord, Email, Type, Akoord) VALUES(@Voornaam, @Familienaam, @Wachtwoord, @Email, @Type, @Akkoord)";

            cmdRegistreren.Parameters.AddWithValue("@Voornaam", txtnaam.Text);
            cmdRegistreren.Parameters.AddWithValue("@Familienaam", txtfnaam.Text);
            cmdRegistreren.Parameters.AddWithValue("@Wachtwoord", txtww.Text);
            cmdRegistreren.Parameters.AddWithValue("@Email", txtemail.Text);
            cmdRegistreren.Parameters.AddWithValue("@Type", "L");
            cmdRegistreren.Parameters.AddWithValue("@Akkoord", ok);

            cnn.Open();

            cmdRegistreren.ExecuteNonQuery();

            cnn.Close();
            pnlLogin.Visible = true;
            UserName.Text = txtemail.Text;
            pnlregistr.Visible = false;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

            OleDbCommand cmdLogin = new OleDbCommand();
            
            cmdLogin.Connection = cnn;
            
            cmdLogin.CommandText = "SELECT gebruikerId, Type FROM Gebruiker WHERE Wachtwoord = @Wachtwoord AND email = @Gebruikersnaam";
            
            cmdLogin.Parameters.AddWithValue("@Wachtwoord", Password.Text);
            cmdLogin.Parameters.AddWithValue("@Gebruikersnaam", UserName.Text);
            
            cnn.Open();
            int intID;
            OleDbDataReader drGebruiker = cmdLogin.ExecuteReader();
            int teller = 0;
            while (drGebruiker.Read())
            {
                intID = Convert.ToInt16(drGebruiker[0]);
                string soortgebr = drGebruiker[1].ToString();
                Session["gebruiker"] = intID;
                Session["SoortGebr"] = soortgebr;
                teller++;
            }
            
            cnn.Close();

            if (teller > 0)
            {
                
                switch (Session["SoortGebr"].ToString())
                {
                    case "P":
                    case "B":
                    case "L":
                        Server.Transfer("Menu.aspx");
                        break;

                }
            }

            else
            {
                lblNietJuist.Text = "U heeft een verkeerd paswoord ingegeven";
            }





        }

    }
    }
