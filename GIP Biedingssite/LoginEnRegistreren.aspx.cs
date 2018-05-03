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
        
        }

        protected void btnPnlRegistr_Click(object sender, EventArgs e)
        {
            pnlAkkoord.Visible = true;
            pnlLogin.Visible = false;
            pnlregistr.Visible = true;
            btnPnlInlog0.Visible = false;
            btnPnlRegistr0.Visible = false;
            
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
            UserName.Text = txtnaam.Text;
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
            int intOK;
            OleDbDataReader drGebruiker = cmdLogin.ExecuteReader();
            int teller = 0;
            while (drGebruiker.Read())
            {
                intOK = Convert.ToInt16(drGebruiker[0]);
                string soortgebr = drGebruiker[1].ToString();
                Session["gebruiker"] = intOK;
                Session["SoortGebr"] = soortgebr;
                teller++;
            }
            
            cnn.Close();
            
                    if (teller > 0)
                           {
                    if (Session["SoortGebr"].ToString() == "P")
                {
                    Server.Transfer("Home.aspx");
                }
                Server.Transfer("Home.aspx");
                UserNameLabel.Text = Session["SoortGebr"] + Session["gebruiker"].ToString();
                            }
                       else
                {
                lblNietJuist.Text = "u heeft een verkeerd paswoord ingegeven";
                        }





        }




    }
    }
