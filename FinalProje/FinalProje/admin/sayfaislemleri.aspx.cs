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
    public partial class WebForm3 : System.Web.UI.Page
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
        private void bosalt()
        {
            txtBaslik.Text = "";
            editor1.Text = "";
            txtSira.Text = "";
            chkGorunur.Checked = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex > -1)
            {
                SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["yemektarifleriDBConnectionString3"].ConnectionString);
                SqlDataAdapter dap = new SqlDataAdapter("select * from sayfalar where silindi=0 and sayfa_id=@sayfa_id", baglanti);
                dap.SelectCommand.Parameters.AddWithValue("@sayfa_id", GridView1.SelectedRow.Cells[1].Text);
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

        protected void btnSil_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex > -1)
            {
                SqlDsSayfalar.DeleteParameters["sayfa_id"].DefaultValue = GridView1.SelectedRow.Cells[1].Text;
                if (SqlDsSayfalar.Delete() > 0)
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
            GridView1.SelectedIndex = -1;
            txtBaslik.Focus();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex > -1)//Güncelle
            {
                SqlDsSayfalar.UpdateParameters["sayfa_id"].DefaultValue = GridView1.SelectedRow.Cells[1].Text;
                SqlDsSayfalar.UpdateParameters["icerik"].DefaultValue = editor1.Text;
                if (SqlDsSayfalar.Update() > 0)
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
                if (SqlDsSayfalar.Insert() > 0)
                {
                    SqlDsSayfalar.InsertParameters["icerik"].DefaultValue = editor1.Text;
                    lblMesaj.Text = "Sayfa Eklendi";

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