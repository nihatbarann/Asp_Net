<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="DinamikSite2021.Yonetim.giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
    </style>
     <script src="https://www.google.com/recaptcha/api.js" async defer></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>Kullanıcı Adı:
                        <asp:TextBox ID="txtKullaniciAdi" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Parola:
                        <asp:TextBox ID="txtParola" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><div class="g-recaptcha" data-sitekey="6Ldav9cdAAAAAGHz6L7QNrTi1sE2mXLFSyWnUQuT"></div>
                        <asp:Button ID="btnGiris" runat="server" OnClick="btnGiris_Click" Text="Giriş" />
&nbsp;
                        <asp:Label ID="lblMesaj" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
