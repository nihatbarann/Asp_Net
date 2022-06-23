using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProje.admin
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void grdYemekler_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (grdYemekler.SelectedIndex > -1)
            {
                sdsYorumlar.SelectParameters["yemek_id"].DefaultValue = grdYemekler.SelectedRow.Cells[1].Text;
            }
        }

        protected void grdYorumlar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (grdYorumlar.SelectedIndex > -1)
            {
                sdsYorumlar.UpdateParameters["yorum_id"].DefaultValue = grdYorumlar.SelectedRow.Cells[1].Text;

                sdsYorumlar.UpdateParameters["onaylandi"].DefaultValue =
                    (!(grdYorumlar.SelectedRow.Cells[3].Controls[0] as CheckBox).Checked).ToString();

                sdsYorumlar.Update();
            }
        }
    }
}