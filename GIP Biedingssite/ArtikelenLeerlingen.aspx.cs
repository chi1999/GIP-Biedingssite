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
    public partial class WebForm3 : System.Web.UI.Page
    {
        public static string strconnectie = ConfigurationManager.ConnectionStrings["gip"].ConnectionString;
        public static OleDbConnection cnn = new OleDbConnection(strconnectie);

        protected void Page_Load(object sender, EventArgs e)
        {
            gdvArtikelenLeerling.Visible = true;
        }

        protected void dgvArtikelenLeerling_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ArtikelID"]= gdvArtikelenLeerling.SelectedRow.Cells[0].Text;
            Server.Transfer("Bieden.aspx");
        }
    }
}