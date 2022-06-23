using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;

namespace DinamikSite2021.Yonetim
{
    public partial class giris : System.Web.UI.Page
    {
        string[] hatamesajlari = new string[] {"Kullanıcı bulunamadı","Bilgiler yanlış","Kullanıcı adı veya parola hatalı","Girdiğiniz bilgilere sahip bir kulalnıcı bulunamadı","Bilgilerinizi kontrol edip tekrar deneyin" };
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["yemektarifleriDBConnectionString"].ConnectionString);
            SqlDataAdapter dap = new SqlDataAdapter("select * from yonetici where yonetici_eposta=@eposta and parola=@parola and silindi=0 and aktif=1", baglanti);
            dap.SelectCommand.Parameters.AddWithValue("@eposta", txtKullaniciAdi.Text.Trim());
            dap.SelectCommand.Parameters.AddWithValue("@parola", sifrele(txtParola.Text.Trim()));
            DataTable dtYonetici = new DataTable();
            try
            {
                baglanti.Open();
                dap.Fill(dtYonetici);
                baglanti.Close();
            }
            catch
            { }
            if (dtYonetici.Rows.Count > 0)
            {
                Session["yonetici_eposta"] = dtYonetici.Rows[0]["yonetici_eposta"].ToString();
                Session["yonetici_id"] = dtYonetici.Rows[0]["yonetici_id"].ToString();

                FormsAuthentication.RedirectFromLoginPage(txtKullaniciAdi.Text, true);

                Response.Redirect("sayfaislemleri.aspx");

            }
            else
            {
                Random r = new Random();
                lblMesaj.Text = hatamesajlari[r.Next(0,4)]+"<span style='color:white'>"+(char)r.Next(50,200)+"</span>";
                return;
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
    }
}