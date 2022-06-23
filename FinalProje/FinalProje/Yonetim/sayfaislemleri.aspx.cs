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

namespace DinamikSite2021.Yonetim
{
    public partial class sayfaislemleri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["yonetici_eposta"].ToString()=="")
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

        protected void grdSayfalar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (grdSayfalar.SelectedIndex > -1)
            {
                SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["yemektarifleriDBConnectionString"].ConnectionString);
                SqlDataAdapter dap = new SqlDataAdapter("select * from sayfalar where silindi=0 and sayfa_id=@sayfa_id", baglanti);
                dap.SelectCommand.Parameters.AddWithValue("@sayfa_id", grdSayfalar.SelectedRow.Cells[1].Text);
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
                    txtBaslik.Text = dtSayfalar.Rows[0]["sayfa_basligi"].ToString();
                    editor1.Text = dtSayfalar.Rows[0]["icerik"].ToString();
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
            if (grdSayfalar.SelectedIndex > -1)
            {
                sdsSayfalar.DeleteParameters["sayfa_id"].DefaultValue = grdSayfalar.SelectedRow.Cells[1].Text;
                if (sdsSayfalar.Delete() > 0)
                {
                    lblMesaj.Text = "Sayfa silindi";

                }
                else
                {
                    lblMesaj.Text = "Silme başarısız";
                }
            }
            else
            {
                lblMesaj.Text = "Silinecek sayfası seçin";
                return;
            }
        }

        protected void btnYeni_Click(object sender, EventArgs e)
        {
            bosalt();
            grdSayfalar.SelectedIndex = -1;
            txtBaslik.Focus();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {

            if (grdSayfalar.SelectedIndex > -1)//Güncelle
            {
                sdsSayfalar.UpdateParameters["sayfa_id"].DefaultValue = grdSayfalar.SelectedRow.Cells[1].Text;
                sdsSayfalar.UpdateParameters["icerik"].DefaultValue = editor1.Text;
                if (sdsSayfalar.Update() > 0)
                {
                    lblMesaj.Text = "Sayfa güncellendi";

                }
                else
                {
                    lblMesaj.Text = "Güncelleme başarısız";
                }
            }
            else//Ekle
            {
                if (sdsSayfalar.Insert() > 0)
                {
                    sdsSayfalar.InsertParameters["icerik"].DefaultValue = editor1.Text;
                    lblMesaj.Text = "Sayfa Eklendi";

                }
                else
                {
                    lblMesaj.Text = "Ekleme başarısız";
                }
            }
            bosalt();
        }

        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.RemoveAll();
            FormsAuthentication.SignOut();
            Response.Redirect("/");
            
        }
    }
}