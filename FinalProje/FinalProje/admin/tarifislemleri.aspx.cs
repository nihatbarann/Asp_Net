using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProje.admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["yonetici_eposta"].ToString() == "")
                {
                    Session.Abandon();
                    Session.RemoveAll();
                    FormsAuthentication.SignOut();
                    Response.Redirect("giris.aspx");
                }
            }
            catch
            {

                Session.Abandon();
                Session.RemoveAll();
                FormsAuthentication.SignOut();
                Response.Redirect("giris.aspx");
            }
        }
        protected void grdTarifler_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (grdTarifler.SelectedIndex > -1)
            {
                SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["yemektarifleriDBConnectionString3"].ConnectionString);
                SqlDataAdapter dap = new SqlDataAdapter("select * from yemekler where silindi=0 and yemek_id=@yemek_id", baglanti);
                dap.SelectCommand.Parameters.AddWithValue("@yemek_id", grdTarifler.SelectedRow.Cells[1].Text);
                DataTable dtSayfalar = new DataTable();
                try
                {
                    baglanti.Open();
                    dap.Fill(dtSayfalar);
                    baglanti.Close();
                }
                catch
                {


                }

                if (dtSayfalar.Rows.Count > 0)
                {
                    txtBaslik.Text = dtSayfalar.Rows[0]["yemek_adi"].ToString();
                    editor1.Text = dtSayfalar.Rows[0]["tarif"].ToString();
                    txtSira.Text = dtSayfalar.Rows[0]["sira"].ToString();
                    chkGorunur.Checked = Convert.ToBoolean(dtSayfalar.Rows[0]["aktif"].ToString());
                }
            }
            else
            {
                bosalt();
            }
        }
        private void bosalt()
        {
            txtBaslik.Text = "";
            editor1.Text = "";
            txtSira.Text = "";
            chkGorunur.Checked = false;
        }
        protected void btnSil_Click(object sender, EventArgs e)
        {
            if (grdTarifler.SelectedIndex > -1)
            {
                sdsTarifler.DeleteParameters["yemek_id"].DefaultValue = grdTarifler.SelectedRow.Cells[1].Text;
                if (sdsTarifler.Delete() > 0)
                {
                    lblMesaj.Text = "Tarif silindi";

                }
                else
                {
                    lblMesaj.Text = "Silme başarısız";
                }
            }
            else
            {
                lblMesaj.Text = "Silinecek tarifi seçin";
                return;
            }
        }
        protected void btnYeni_Click(object sender, EventArgs e)
        {
            bosalt();
            grdTarifler.SelectedIndex = -1;
            txtBaslik.Focus();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {

            if (grdTarifler.SelectedIndex > -1)//Güncelle
            {
                sdsTarifler.UpdateParameters["yemek_id"].DefaultValue = grdTarifler.SelectedRow.Cells[1].Text;
                sdsTarifler.UpdateParameters["tarif"].DefaultValue = editor1.Text;
                if (sdsTarifler.Update() > 0)
                {
                    lblMesaj.Text = "Tarif güncellendi";

                }
                else
                {
                    lblMesaj.Text = "Güncelleme başarısız";
                }
            }
            else//Ekle
            {
                if (sdsTarifler.Insert() > 0)
                {
                    sdsTarifler.InsertParameters["tarif"].DefaultValue = editor1.Text;
                    lblMesaj.Text = "Tarif Eklendi";

                }
                else
                {
                    lblMesaj.Text = "Ekleme başarısız";
                }
            }
            bosalt();
        }

       
    }
}