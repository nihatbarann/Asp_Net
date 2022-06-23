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

namespace FinalProje
{
    public partial class AnaSablon : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["uye_id"].ToString().Trim()!="")
                {
                    lbl_uyeadi.Text = Session["uye_adi"].ToString();
                    pnlcikis.Visible = true;
                    pnluyegirisi.Visible = false;
                }
            }
            catch
            {
                pnluyegirisi.Visible = true;
                pnlcikis.Visible = false;
            }
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            pnluyegirisi.Visible = true;
            pnlcikis.Visible = false;
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {

            SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["yemektarifleriDBConnectionString3"].ConnectionString);
            SqlDataAdapter dap = new SqlDataAdapter("select * from uyeler where eposta=@eposta and parola=@parola and silindi=0 and aktif=1", baglanti);
            dap.SelectCommand.Parameters.AddWithValue("@eposta", txtKullaniciAdi.Text.Trim());
            dap.SelectCommand.Parameters.AddWithValue("@parola", sifrele(txtParola.Text.Trim()));
            DataTable dtUyeler = new DataTable();
            try
            {
                baglanti.Open();
                dap.Fill(dtUyeler);
                baglanti.Close();
            }
            catch
            {

                lbl_giris.Text = "Hata oluştu. Lütfen Tekrar Deneyiniz.";
            }

            if (dtUyeler.Rows.Count>0)//Bu üye var
            {
                pnluyegirisi.Visible = false;
                pnlcikis.Visible = true;
                Session["uye_id"]=dtUyeler.Rows[0]["uye_id"].ToString();
                Session["uye_adi"]=dtUyeler.Rows[0]["uye_adi"].ToString();

             
            }
            else
            {
                lbl_giris.Text = "Üye bulunamadı";
                return;
            }

        }
    }
}