using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProje.admin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
                if (GridView1.SelectedIndex > -1)
                {
                    SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["yemektarifleriDBConnectionString3"].ConnectionString);
                    SqlDataAdapter dap = new SqlDataAdapter("select * from yonetici where yonetici_id=@yonetici_id and silindi=0", baglanti);
                    dap.SelectCommand.Parameters.AddWithValue("@yonetici_id", GridView1.SelectedRow.Cells[1].Text);
                    DataTable dtYonetici = new DataTable();

                    try
                    {
                        baglanti.Open();
                        dap.Fill(dtYonetici);
                        baglanti.Close();
                    }
                    catch (Exception ex)
                    {
                        lblMesaj.Text = "Bağlantı sırasında bir hata oluştu: " + ex.Message;

                    }

                    if (dtYonetici.Rows.Count > 0)
                    {
                        txtAdi.Text = dtYonetici.Rows[0]["yonetici_adi"].ToString();
                        txtSoyadi.Text = dtYonetici.Rows[0]["yonetici_soyadi"].ToString();
                        txtEposta.Text = dtYonetici.Rows[0]["yonetici_eposta"].ToString();
                        chkAktif.Checked = Convert.ToBoolean(dtYonetici.Rows[0]["aktif"].ToString());

                        lblID.Text = dtYonetici.Rows[0]["yonetici_id"].ToString();
                        // ddlYetki.DataBind();
                        ddlYetki.SelectedValue = dtYonetici.Rows[0]["yetki"].ToString();
                    }
                }
           
        }

       
            protected void btnSil_Click(object sender, EventArgs e)
            {
                if (SqlDsYonetici.Delete() > 0)
                {
                    lblMesaj.Text = "Yönetici silindi";
                }
                else
                {
                    lblMesaj.Text = "Yönetici silinirken hata oluştu";
                }
            }

        protected void btnYeni_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
            bosalt();
        }
        private void bosalt()
        {
            txtAdi.Text = "";
            txtSoyadi.Text = "";
            txtEposta.Text = "";
            chkAktif.Checked = false;
            ddlYetki.SelectedValue = "2";
            txtParola1.Text = "";
            txtParola2.Text = "";
            txtAdi.Focus();
        }

        private string sifrele(string sifrelenecekMetin)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            //Parametre olarak gelen veriyi byte dizisine dönüştürdük.
            byte[] dizi = Encoding.UTF8.GetBytes(sifrelenecekMetin);
            //dizinin hash'ini hesaplattık.
            dizi = md5.ComputeHash(dizi);
            //Hashlenmiş verileri depolamak için StringBuilder nesnesi oluşturduk.
            StringBuilder sb = new StringBuilder();
            //Her byte'i dizi içerisinden alarak string türüne dönüştürdük.

            foreach (byte ba in dizi)
            {
                sb.Append(ba.ToString("x2").ToLower());
            }

            //hexadecimal(onaltılık) stringi geri döndürdük.
            return sb.ToString();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex == -1)
            {
                if (txtParola1.Text.Trim() != txtParola2.Text.Trim())
                {
                    lblMesaj.Text = "Parolalar uyuşmuyor";
                    return;
                }
                SqlDsYonetici.InsertParameters["parola"].DefaultValue = sifrele(txtParola1.Text);
                if (SqlDsYonetici.Insert() > 0)
                {
                    lblMesaj.Text = "Yönetici eklendi";
                    bosalt();
                }
                else
                {
                    lblMesaj.Text = "Ekleme sırasında bir hata oluştu";
                }
            }
            else
            {
                if (txtParola1.Text.Trim() != "")//parola değişecek
                {
                    SqlDsYonetici.UpdateCommand = "UPDATE [yonetici] SET [yonetici_eposta] = @yonetici_eposta, [yonetici_adi] = @yonetici_adi, [yonetici_soyadi] = @yonetici_soyadi, [aktif] = @aktif,   [parola] = @parola, [yetki] = @yetki WHERE [yonetici_id] = @yonetici_id";
                    SqlDsYonetici.UpdateParameters["parola"].DefaultValue = sifrele(txtParola1.Text);


                }
                else//parola değişmeyecek
                {
                    SqlDsYonetici.UpdateCommand = "UPDATE [yonetici] SET [yonetici_eposta] = @yonetici_eposta, [yonetici_adi] = @yonetici_adi, [yonetici_soyadi] = @yonetici_soyadi, [aktif] = @aktif,   [yetki] = @yetki WHERE [yonetici_id] = @yonetici_id";

                }
                SqlDsYonetici.UpdateParameters["yonetici_adi"].DefaultValue = txtAdi.Text;
                SqlDsYonetici.UpdateParameters["yonetici_soyadi"].DefaultValue = txtSoyadi.Text;
                SqlDsYonetici.UpdateParameters["yonetici_eposta"].DefaultValue = txtEposta.Text;
                SqlDsYonetici.UpdateParameters["aktif"].DefaultValue = chkAktif.Checked.ToString();
                SqlDsYonetici.UpdateParameters["yetki"].DefaultValue = ddlYetki.SelectedValue;
                SqlDsYonetici.UpdateParameters["yonetici_id"].DefaultValue = lblID.Text;
                if (SqlDsYonetici.Update() > 0)
                {
                    lblMesaj.Text = "Yönetici güncellendi";
                    bosalt();
                }
                else
                {
                    lblMesaj.Text = " Güncelleme sırasında bir hata oluştu";
                }
            }
        }
    }
}