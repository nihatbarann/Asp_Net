<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sayfaislemleri.aspx.cs" Inherits="DinamikSite2021.Yonetim.sayfaislemleri" %>
 

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
    <script src="../ckeditor/ckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Button ID="btnCikis" runat="server" OnClick="btnCikis_Click" Text="Çıkış" />
            <br />
            <asp:GridView ID="grdSayfalar" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sayfa_id" DataSourceID="sdsSayfalar" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="grdSayfalar_SelectedIndexChanged" Width="80%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="sayfa_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="sayfa_id" />
                    <asp:BoundField DataField="sayfa_basligi" HeaderText="BAŞLIK" SortExpression="sayfa_basligi" />
                    <asp:BoundField DataField="sira" HeaderText="SIRA" SortExpression="sira" />
                    <asp:CheckBoxField DataField="aktif" HeaderText="GÖRÜNÜR" SortExpression="aktif" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsSayfalar" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString %>" DeleteCommand="update  [sayfalar] set silindi=1 WHERE [sayfa_id] = @sayfa_id" InsertCommand="INSERT INTO [sayfalar] ([sayfa_basligi], [icerik], [sira],  [aktif],silindi) VALUES (@sayfa_basligi, @icerik, @sira, @aktif,0)" SelectCommand="SELECT * FROM [sayfalar] WHERE ([silindi] = @silindi) ORDER BY [sayfa_basligi]" UpdateCommand="UPDATE [sayfalar] SET [sayfa_basligi] = @sayfa_basligi, [icerik] = @icerik, [sira] = @sira,   [aktif] = @aktif WHERE [sayfa_id] = @sayfa_id">
                <DeleteParameters>
                    <asp:Parameter Name="sayfa_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtBaslik" Name="sayfa_basligi" PropertyName="Text" Type="String" />
                    <asp:Parameter Name="icerik" Type="String" />
                    <asp:ControlParameter ControlID="txtSira" Name="sira" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="chkGorunur" Name="aktif" PropertyName="Checked" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="False" Name="silindi" Type="Boolean" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtBaslik" Name="sayfa_basligi" PropertyName="Text" />
                    <asp:Parameter Name="icerik" />
                    <asp:ControlParameter ControlID="txtSira" Name="sira" PropertyName="Text" />
                    <asp:ControlParameter ControlID="chkGorunur" Name="aktif" PropertyName="Checked" />
                    <asp:Parameter Name="sayfa_id" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <p>
            Başlık: <asp:TextBox ID="txtBaslik" runat="server" Width="766px"></asp:TextBox>
        </p>
        <p>
            İçerik</p>
        <p>
            <asp:TextBox ID="editor1" runat="server" Height="242px" TextMode="MultiLine" Width="705px"></asp:TextBox>
           <script>
               CKEDITOR.replace('editor1');
            </script>
            <ajaxToolkit:HtmlEditorExtender ID="editor1_HtmlEditorExtender" runat="server" BehaviorID="editor1_HtmlEditorExtender" TargetControlID="editor1">
            </ajaxToolkit:HtmlEditorExtender>
          
        </p>
        <p>
            Sıra:
            <asp:TextBox ID="txtSira" runat="server" Width="70px"></asp:TextBox>
        </p>
        <p>
            <asp:CheckBox ID="chkGorunur" runat="server" Text="Sayfa Görünür" />
        </p>
        <p class="auto-style1">
            <asp:Button ID="btnYeni" runat="server" OnClick="btnYeni_Click" Text="Yeni" />
&nbsp;<asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="Kaydet" />
&nbsp;<asp:Button ID="btnSil" runat="server" OnClick="btnSil_Click" OnClientClick="return confirm('Sayfası silmek istiyor musunuz?')" Text="Sil" />
&nbsp;<asp:Label ID="lblMesaj" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        </p>
    </form>
</body>
</html>
