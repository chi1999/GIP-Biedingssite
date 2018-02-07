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
            pnlLogin.Visible = false;
            pnlregistr.Visible = true;

        }

        protected void registreren(object sender, EventArgs e)
        {
            

            OleDbCommand  cmdRegistreren = new OleDbCommand();

            //cmdRegistreren.Connection = cnn;

            //cmdRegistreren.CommandText = cnn;

            //string strSQL;
            //strSQL = "gip";

            //cmd.CommandText = strSQL;
            //cnn.Open();
            //cnn.Close();
        }
    }
}