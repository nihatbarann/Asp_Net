<%@ Page Title="" Language="C#" MasterPageFile="~/admin/yonetim.Master" AutoEventWireup="true" CodeBehind="sayfaislemleri.aspx.cs" Inherits="FinalProje.admin.WebForm3" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 100%;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="sayfa_id" DataSourceID="SqlDsSayfalar" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ForeColor="Black">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="sayfa_id" HeaderText="sayfa_id" InsertVisible="False" ReadOnly="True" SortExpression="sayfa_id" />
            <asp:BoundField DataField="sayfa_basligi" HeaderText="sayfa_basligi" SortExpression="sayfa_basligi" />
            <asp:BoundField DataField="icerik" HeaderText="icerik" SortExpression="icerik" />
            <asp:BoundField DataField="sira" HeaderText="sira" SortExpression="sira" />
            <asp:CheckBoxField DataField="aktif" HeaderText="aktif" SortExpression="aktif" />
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

    <asp:SqlDataSource ID="SqlDsSayfalar" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" DeleteCommand="DELETE FROM [sayfalar] WHERE [sayfa_id] = @sayfa_id" InsertCommand="INSERT INTO [sayfalar] ([sayfa_basligi], [icerik], [sira],  [aktif],silindi) VALUES (@sayfa_basligi, @icerik, @sira, @aktif,0)" SelectCommand="SELECT [sayfa_id], [sayfa_basligi], [icerik], [sira], [aktif] FROM [sayfalar]" UpdateCommand="UPDATE [sayfalar] SET [sayfa_basligi] = @sayfa_basligi, [icerik] = @icerik, [sira] = @sira,   [aktif] = @aktif WHERE [sayfa_id] = @sayfa_id">
        <DeleteParameters>
            <asp:Parameter Name="sayfa_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtBaslik" Name="sayfa_basligi" PropertyName="Text" Type="String" />
            <asp:Parameter Name="icerik" Type="String" />
            <asp:ControlParameter ControlID="txtSira" Name="sira" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="chkGorunur" Name="aktif" PropertyName="Checked" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtBaslik" Name="sayfa_basligi" PropertyName="Text" Type="String" />
            <asp:Parameter Name="icerik" Type="String" />
            <asp:ControlParameter ControlID="txtSira" Name="sira" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="chkGorunur" Name="aktif" PropertyName="Checked" Type="Boolean" />
            <asp:Parameter Name="sayfa_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
      <p class="auto-style2">
            Başlık: <asp:TextBox ID="txtBaslik" runat="server" Width="766px"></asp:TextBox>
        </p>
        <p class="auto-style2">
            İçerik</p>
     
    
        <div id="editor">
            <asp:TextBox ID="editor1" runat="server" Height="242px" TextMode="MultiLine" Width="705px"></asp:TextBox> 
        </div>
            <script>

        ClassicEditor
            .create( document.querySelector( '#editor' ) )
            .catch( error => {
                console.error( error );
            } );
    </script>
       
        <p class="auto-style2">
            Sıra:
            <asp:TextBox ID="txtSira" runat="server" Width="70px"></asp:TextBox>
        </p>
        <p class="auto-style2">
            <asp:CheckBox ID="chkGorunur" runat="server" Text="Sayfa Görünür" />
        </p>
        <p class="auto-style6">
            <asp:Button ID="btnYeni" runat="server" OnClick="btnYeni_Click" Text="Yeni" />
&nbsp;<asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="Kaydet" />
&nbsp;<asp:Button ID="btnSil" runat="server" OnClick="btnSil_Click" OnClientClick="return confirm('Sayfası silmek istiyor musunuz?')" Text="Sil" />
&nbsp;<asp:Label ID="lblMesaj" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        </p>
    <br />
</asp:Content>
