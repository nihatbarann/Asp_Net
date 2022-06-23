using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProje.admin
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex > -1)
            {
                SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["yemektarifleriDBConnectionString3"].ConnectionString);
                SqlDataAdapter dap = new SqlDataAdapter("select * from uyeler where uyeler.silindi=0 and uye_id=@uye_id order by uye_adi,uye_soyadi ", baglanti);
                dap.SelectCommand.Parameters.AddWithValue("@uye_id", GridView1.SelectedRow.Cells[1].Text);
                DataTable dtUyeler = new DataTable();

                try
                {
                    baglanti.Open();
                    dap.Fill(dtUyeler);
                    baglanti.Close();
                }
                catch (Exception ex)
                {
                    lblMesaj.Text = "Bağlantı sırasında bir hata oluştu: " + ex.Message;

                }
                if (dtUyeler.Rows.Count > 0)
                {
                    txtUyeAdi.Text = dtUyeler.Rows[0]["uye_adi"].ToString();
                    txtUyeSoyadi.Text = dtUyeler.Rows[0]["uye_soyadi"].ToString();
                    txtEPosta.Text = dtUyeler.Rows[0]["eposta"].ToString();
                    chkAktif.Checked = Convert.ToBoolean(dtUyeler.Rows[0]["aktif"].ToString());
                    txtTel.Text = dtUyeler.Rows[0]["tel"].ToString();
                    txtUyeid.Text= dtUyeler.Rows[0]["uye_id"].ToString();

                    txtTarih.Text = Convert.ToDateTime(dtUyeler.Rows[0]["uyelik_tarihi"].ToString()).ToShortDateString();
                }
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex != -1)
            {
                if (sqlDsUyeler.Delete() > 0)
                {
                    lblMesaj.Text = "Üye Silindi";
                }
            }
            else
            {
                lblMesaj.Text = "Lütfen silinecek üyeyi seçin";

            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex == -1)
            {
                lblMesaj.Text = "Lütfen güncellenecek üyeyi seçin";
                return;
            }
            if (sqlDsUyeler.Update() > 0)
            {
                lblMesaj.Text = "Üye Güncellendi";
            }
        }
    }
}
