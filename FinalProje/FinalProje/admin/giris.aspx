<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="FinalProje.admin.giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
     
        .auto-style2 {
              
            background-color: #FFFFFF;
        }
        .auto-style3 {
        color: #ffffff;
            background-color: #808080;
        }
        .auto-style4 {
                color: #ffffff;
            background-color: #808080;
        }
        .auto-style5 {
            height: 260px;
            text-align: center;
            font-size: xx-large;
            line-height:250px;
               background-color: #808080;
        }
     
        .auto-style6 {
            text-align: center;
            margin-left:auto;
        }
     
        .auto-style7 {
            text-align: center;
            margin-left: auto;
            width: 3px;
        }
        #btnGiris{
            margin-top:15px;
            width:100px;
            height:25px;
            background-color:#808080;
            border-radius:10px;
            cursor:pointer;
        }
          #btnGiris:hover{

              transform:scale(1.1,1.1);
              opacity:0.7;
          }
         #txtKullaniciAdi{
          border-radius:10px;
          width:200px;
          height:25px;
        }
        #txtKullaniciAdi:hover{
            background-color:#ffffff;
            border-radius:0px;
            color:#808080;
        }
        #txtParola{
                border-radius:10px;
                   width:200px;
          height:25px;
        }
            #txtParola:hover {
                background-color: #ffffff;
                border-radius: 0px;
                color: #808080;
            }
        .Giris {
        
      margin-top:50px;
    margin-left:750px;
        }
     
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style5"><em>Yönetici Giriş</em></div>
        <div class="Giris">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6">Kullanıcı Adı:&nbsp; <asp:TextBox ID="txtKullaniciAdi" runat="server" CssClass="auto-style4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">Parola:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtParola" runat="server" TextMode="Password" CssClass="auto-style3"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Button ID="btnGiris" runat="server" OnClick="btnGiris_Click" Text="Giriş" CssClass="auto-style2" />
&nbsp;
                        <asp:Label ID="lblMesaj" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
