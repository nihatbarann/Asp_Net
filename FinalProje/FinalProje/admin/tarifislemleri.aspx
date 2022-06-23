<%@ Page Title="" Language="C#" MasterPageFile="~/admin/yonetim.Master" AutoEventWireup="true" CodeBehind="tarifislemleri.aspx.cs" Inherits="FinalProje.admin.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {
        width: 100%;
        text-align: center;
   
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="auto-style2">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            
            <br />
            <asp:GridView ID="grdTarifler" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="yemek_id" DataSourceID="sdsTarifler" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="grdTarifler_SelectedIndexChanged" Width="80%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="yemek_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="yemek_id" />
                    <asp:BoundField DataField="yemek_adi" HeaderText="Yemek Adı" SortExpression="yemek_adi" />
                    <asp:CheckBoxField DataField="aktif" HeaderText="Görünür" SortExpression="aktif" />
                    <asp:BoundField DataField="sira" HeaderText="Sıra" SortExpression="sira" />
                    <asp:BoundField DataField="eklenme_tarihi" HeaderText="Eklenme Tarihi" SortExpression="eklenme_tarihi" />
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
            <asp:SqlDataSource ID="sdsTarifler" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" DeleteCommand="update yemekler set silindi=1  WHERE [yemek_id] = @yemek_id" InsertCommand="INSERT INTO [yemekler] ([yemek_adi], [tarif], [aktif], [silindi], [sira], [eklenme_tarihi]) VALUES (@yemek_adi, @tarif, @aktif, 0, @sira, getdate())" SelectCommand="SELECT * FROM [yemekler] WHERE ([silindi] = @silindi)" UpdateCommand="UPDATE [yemekler] SET [yemek_adi] = @yemek_adi, [tarif] = @tarif, [aktif] = @aktif,  [sira] = @sira  WHERE [yemek_id] = @yemek_id">
                <DeleteParameters>
                    <asp:Parameter Name="yemek_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtBaslik" Name="yemek_adi" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="editor1" Name="tarif" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="chkGorunur" Name="aktif" PropertyName="Checked" Type="Boolean" />
                    <asp:ControlParameter ControlID="txtSira" Name="sira" PropertyName="Text" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="False" Name="silindi" Type="Boolean" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtBaslik" Name="yemek_adi" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="editor1" Name="tarif" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="chkGorunur" Name="aktif" PropertyName="Checked" Type="Boolean" />
                    <asp:ControlParameter ControlID="txtSira" Name="sira" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="yemek_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
      <p class="auto-style2">
            Başlık: <asp:TextBox ID="txtBaslik" runat="server" Width="766px"></asp:TextBox>
        </p>
        <p class="auto-style2">
            İçerik</p>
       <div id="editor" class="auto-style2">
            <asp:TextBox ID="editor1" runat="server" Height="242px" TextMode="MultiLine" Width="705px"></asp:TextBox>
          
 </div>
     <script>

         ClassicEditor
             .create(document.querySelector('#editor'))
             .catch(error => {
                 console.error(error);
             });
</script>
        <p class="auto-style2">
            Sıra:
            <asp:TextBox ID="txtSira" runat="server" Width="70px" Height="22px"></asp:TextBox>
        </p>
        <p class="auto-style2">
            <asp:CheckBox ID="chkGorunur" runat="server" Text="Sayfa Görünür" />
        </p>
        <p class="auto-style6">
            <asp:Button ID="btnYeni" runat="server" OnClick="btnYeni_Click" Text="Yeni" />
&nbsp;<asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="Kaydet" />
&nbsp;&nbsp;<asp:Button ID="btnSil" runat="server" OnClick="btnSil_Click" OnClientClick="return confirm('Sayfası silmek istiyor musunuz?')" Text="Sil" />
            <asp:Label ID="lblMesaj" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        </p>

</asp:Content>
