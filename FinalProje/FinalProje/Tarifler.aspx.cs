using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProje
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           try
            {
                if (Request.QueryString["id"].ToString().Trim() != "")
                {//bir yemek seçili
                    pnlTarifler.Visible = true;
                    pnlYemekler.Visible = false;
                }
            }
            catch
            {
                pnlTarifler.Visible = false;
                pnlYemekler.Visible = true;

            }

            try
            {
                if (Session["uye_id"].ToString().Trim() != "")
                {//üye girişi yapılmış
                    udtpnlyorum.Visible = true;
                    lblIP.Text = GetIP();

                }
            }
            catch
            {
                udtpnlyorum.Visible = false;
            }
           
        }
        
        protected void btnYorumGonder_Click(object sender, EventArgs e)
        {
            if (SqlDsYorumlar.Insert() > 0)
            {
                lblMesaj.Text = "Yorumunuz alındı, yönetici onayından sonra görüntülenecektir";
                txtYorum.Text = "";
            }
        }
        private string GetIP()
        {
            string strHostName = "";
            strHostName = System.Net.Dns.GetHostName();

            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);

            IPAddress[] addr = ipEntry.AddressList;

            return addr[addr.Length - 1].ToString();

        }
    }
}