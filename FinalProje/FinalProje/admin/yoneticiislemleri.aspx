<%@ Page Title="" Language="C#" MasterPageFile="~/admin/yonetim.Master" AutoEventWireup="true" CodeBehind="yoneticiislemleri.aspx.cs" Inherits="FinalProje.admin.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
  #Content2{
      height:500px;
  }
        .auto-style69 {
            height: 11px;
        }
        .auto-style70 {
            height: 68px;
        }
        .auto-style72 {
            height: 19px;
        }
        .auto-style73 {
            height: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="yonetici_id" DataSourceID="SqlDsYonetici" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
         <Columns>
             <asp:CommandField ShowSelectButton="True" />
             <asp:BoundField DataField="yonetici_id" HeaderText="yonetici_id" InsertVisible="False" ReadOnly="True" SortExpression="yonetici_id" />
             <asp:BoundField DataField="yonetici_adi" HeaderText="yonetici_adi" SortExpression="yonetici_adi" />
             <asp:BoundField DataField="yonetici_eposta" HeaderText="yonetici_eposta" SortExpression="yonetici_eposta" />
             <asp:BoundField DataField="yonetici_soyadi" HeaderText="yonetici_soyadi" SortExpression="yonetici_soyadi" />
             <asp:CheckBoxField DataField="aktif" HeaderText="aktif" SortExpression="aktif" />
             <asp:BoundField DataField="yetki" HeaderText="yetki" SortExpression="yetki" />
         </Columns>
         <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
         <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
         <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#F7F7F7" />
         <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
         <SortedDescendingCellStyle BackColor="#E5E5E5" />
         <SortedDescendingHeaderStyle BackColor="#242121" />
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDsYonetici" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" DeleteCommand="DELETE FROM [yonetici] WHERE [yonetici_id] = @yonetici_id" InsertCommand="INSERT INTO [yonetici] ([yonetici_eposta], [yonetici_adi], [yonetici_soyadi], [aktif], [silindi], [parola], [yetki]) VALUES (@yonetici_eposta, @yonetici_adi, @yonetici_soyadi, @aktif, 0, @parola, @yetki)" SelectCommand="SELECT [yonetici_id], [yonetici_adi], [yonetici_eposta], [yonetici_soyadi], [aktif], [yetki] FROM [yonetici] ORDER BY [yonetici_id]" UpdateCommand="UPDATE [yonetici] SET [yonetici_eposta] = @yonetici_eposta, [yonetici_adi] = @yonetici_adi, [yonetici_soyadi] = @yonetici_soyadi, [aktif] = @aktif, [silindi] = @silindi, [parola] = @parola, [yetki] = @yetki WHERE [yonetici_id] = @yonetici_id">
         <DeleteParameters>
             <asp:ControlParameter ControlID="lblID" Name="yonetici_id" PropertyName="Text" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:ControlParameter ControlID="txtAdi" Name="yonetici_adi" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtEposta" Name="yonetici_eposta" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtSoyadi" Name="yonetici_soyadi" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="chkAktif" Name="aktif" PropertyName="Checked" Type="Boolean" />
             <asp:ControlParameter ControlID="ddlYetki" Name="yetki" PropertyName="SelectedValue" Type="Int32" />
             <asp:Parameter Name="parola" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="yonetici_adi" Type="String" />
             <asp:Parameter Name="yonetici_eposta" Type="String" />
             <asp:Parameter Name="yonetici_soyadi" Type="String" />
             <asp:Parameter Name="aktif" Type="Boolean" />
             <asp:Parameter Name="yetki" Type="Int32" />
             <asp:Parameter Name="yonetici_id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
        
     <table class="auto-style1">
        <tr>
            <td class="auto-style72">ID:
                <asp:Label ID="lblID" runat="server"></asp:Label>
                &nbsp;Yetki:
                <asp:DropDownList ID="ddlYetki" runat="server">
                    <asp:ListItem Value="1">Yönetici</asp:ListItem>
                    <asp:ListItem Selected="True" Value="2">Birim Kullanıcısı</asp:ListItem>
                </asp:DropDownList>
                <asp:CheckBox ID="chkAktif" runat="server" Text="Aktif Kullanıcı" />
            &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style69">E-POSTA:
                <asp:TextBox ID="txtEposta" runat="server"></asp:TextBox>
                Adı:<asp:TextBox ID="txtAdi" runat="server" Height="16px"></asp:TextBox>
                SOYADI: <asp:TextBox ID="txtSoyadi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style73">PAROLA:
                <asp:TextBox ID="txtParola1" runat="server"></asp:TextBox>
                
                PAROLA (Tekrar):
                <asp:TextBox ID="txtParola2" runat="server"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style70">
                <asp:Button ID="btnYeni" runat="server" OnClick="btnYeni_Click" Text="Yeni" />
                <asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="Kaydet" />
                <asp:Button ID="btnSil" runat="server" OnClick="btnSil_Click" OnClientClick="return confirm('Bu yöneticiyi silmek istiyor musunuz?')" Text="  Sil  " />
                <asp:Label ID="lblMesaj" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Content>
