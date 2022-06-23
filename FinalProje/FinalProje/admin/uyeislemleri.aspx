<%@ Page Title="" Language="C#" MasterPageFile="~/admin/yonetim.Master" AutoEventWireup="true" CodeBehind="uyeislemleri.aspx.cs" Inherits="FinalProje.admin.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .uye-auto-style5 {
        width: 310px;
    }
    .uye-auto-style5 {
        height: 23px;
    }
    .uye-auto-style7 {
        margin-left: 40px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="uye_id" DataSourceID="sqlDsUyeler" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="uye_id" HeaderText="uye_id" InsertVisible="False" ReadOnly="True" SortExpression="uye_id" />
        <asp:BoundField DataField="uye_adi" HeaderText="uye_adi" SortExpression="uye_adi" />
        <asp:BoundField DataField="uye_soyadi" HeaderText="uye_soyadi" SortExpression="uye_soyadi" />
        <asp:BoundField DataField="uyelik_tarihi" HeaderText="uyelik_tarihi" SortExpression="uyelik_tarihi" />
        <asp:CheckBoxField DataField="aktif" HeaderText="aktif" SortExpression="aktif" />
        <asp:CheckBoxField DataField="silindi" HeaderText="silindi" SortExpression="silindi" />
        <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" />
        <asp:BoundField DataField="ilce" HeaderText="ilce" SortExpression="ilce" />
        <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
        <asp:BoundField DataField="foto" HeaderText="foto" SortExpression="foto" />
        <asp:BoundField DataField="eposta" HeaderText="eposta" SortExpression="eposta" />
        <asp:BoundField DataField="parola" HeaderText="parola" SortExpression="parola" />
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
<asp:SqlDataSource ID="sqlDsUyeler" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" DeleteCommand="DELETE FROM [uyeler] WHERE [uye_id] = @uye_id" InsertCommand="INSERT INTO [uyeler] ([uye_adi], [uye_soyadi], [uyelik_tarihi], [aktif], [silindi], [tel], [ilce], [adres], [foto], [eposta], [parola]) VALUES (@uye_adi, @uye_soyadi, @uyelik_tarihi, @aktif, @silindi, @tel, @ilce, @adres, @foto, @eposta, @parola)" SelectCommand="SELECT * FROM [uyeler] WHERE (([aktif] = @aktif) AND ([silindi] = @silindi)) ORDER BY [uye_id]" UpdateCommand="UPDATE uyeler SET uye_adi = @uye_adi, uye_soyadi = @uye_soyadi, aktif = @aktif, tel = @tel, eposta = @eposta WHERE (uye_id = @uye_id)">
    <DeleteParameters>
        <asp:ControlParameter ControlID="txtUyeid" Name="uye_id" PropertyName="Text" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="uye_adi" Type="String" />
        <asp:Parameter Name="uye_soyadi" Type="String" />
        <asp:Parameter Name="uyelik_tarihi" Type="DateTime" />
        <asp:Parameter Name="aktif" Type="Boolean" />
        <asp:Parameter Name="silindi" Type="Boolean" />
        <asp:Parameter Name="tel" Type="String" />
        <asp:Parameter Name="ilce" Type="Int32" />
        <asp:Parameter Name="adres" Type="String" />
        <asp:Parameter Name="foto" Type="String" />
        <asp:Parameter Name="eposta" Type="String" />
        <asp:Parameter Name="parola" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="aktif" Type="Boolean" />
        <asp:Parameter DefaultValue="False" Name="silindi" Type="Boolean" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txtUyeAdi" Name="uye_adi" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtUyeSoyadi" Name="uye_soyadi" PropertyName="Text" />
        <asp:ControlParameter ControlID="chkAktif" Name="aktif" PropertyName="Checked" />
        <asp:ControlParameter ControlID="txtTel" Name="tel" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtEPosta" Name="eposta" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtUyeid" Name="uye_id" PropertyName="Text" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<table class="uye-auto-style1">
    <tr>
        <td class="uye-auto-style7">Üye ID:<asp:TextBox ID="txtUyeid" runat="server" Enabled="False"></asp:TextBox>
        </td>
        <td class="uye-auto-style5">Üye Adı:<asp:TextBox ID="txtUyeAdi" runat="server"></asp:TextBox>
        &nbsp;</td>
        <td>Üye Soyadı<asp:TextBox ID="txtUyeSoyadi" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Üyelik Tarihi:<asp:TextBox ID="txtTarih" runat="server" Enabled="False"></asp:TextBox>
        </td>
        <td class="uye-auto-style5">
            E-posta<asp:TextBox ID="txtEPosta" runat="server"></asp:TextBox>
        </td>
        <td>Telefon:<asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="uye-auto-style6" colspan="3">
            <asp:CheckBox ID="chkAktif" runat="server" Text="Aktif" />
        </td>
    </tr>
    <tr>
        <td class="uye-auto-style6" colspan="3">
              <asp:Button ID="btnSil" runat="server" Text="Sil" Width="56px" OnClick="btnSil_Click" />
            <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" />
            <asp:Label ID="lblMesaj" runat="server" ForeColor="Red" Text="Label"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
