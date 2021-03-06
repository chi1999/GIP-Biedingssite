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
    public partial class WebForm3 : System.Web.UI.Page
    {
        public static string strconnectie = ConfigurationManager.ConnectionStrings["gip"].ConnectionString;
        public static OleDbConnection cnn = new OleDbConnection(strconnectie);

        protected void Page_Load(object sender, EventArgs e)
        {
            gdvArtikelenLeerling.Visible = true;

            if (Session["SoortGebr"] == null)
            {
                Server.Transfer("Home.aspx");
            }
           
        }
    

        protected void dgvArtikelenLeerling_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ArtikelID"]= gdvArtikelenLeerling.SelectedRow.Cells[1].Text;
            Server.Transfer("Bieden.aspx");
        }

        protected void dtsArtikelenLeerlingen_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx");
        }
    }
}