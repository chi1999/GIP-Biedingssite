﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP_Biedingssite
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddvArtikel0_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            dtsbeheerder.FilterExpression = "ArtikelID =" + Session["ArtikelID"];
            gdvbeheerder.DataBind();
        }
    }
}