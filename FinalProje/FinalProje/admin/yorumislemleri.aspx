<%@ Page Title="" Language="C#" MasterPageFile="~/admin/yonetim.Master" AutoEventWireup="true" CodeBehind="yorumislemleri.aspx.cs" Inherits="FinalProje.admin.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="grdYemekler" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="yemek_id" DataSourceID="sdsYemekTarifleri" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="grdYemekler_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="yemek_id" HeaderText="yemek_id" InsertVisible="False" ReadOnly="True" SortExpression="yemek_id" />
                        <asp:BoundField DataField="yemek_adi" HeaderText="YEMEK ADI" SortExpression="yemek_adi" />
                        <asp:BoundField DataField="sira" HeaderText="SIRA NO" SortExpression="sira" />
                        <asp:BoundField DataField="eklenme_tarihi" HeaderText="EKLENME TARİHİ" SortExpression="eklenme_tarihi" DataFormatString="{0:dd/MM/yyyy}" />
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
                <asp:SqlDataSource ID="sdsYemekTarifleri" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" SelectCommand="SELECT * FROM [yemekler] WHERE (([aktif] = @aktif) AND ([silindi] = @silindi)) ORDER BY [sira]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="aktif" Type="Boolean" />
                        <asp:Parameter DefaultValue="False" Name="silindi" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                   <asp:GridView ID="grdYorumlar" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="yorum_id" DataSourceID="sdsYorumlar" ForeColor="#333333" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="grdYorumlar_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Onayla/Onayı İptal Et" ShowSelectButton="True" />
                        <asp:BoundField DataField="yorum_id" HeaderText="yorum_id" InsertVisible="False" ReadOnly="True" SortExpression="yorum_id" />
                        <asp:BoundField DataField="yorum" HeaderText="yorum" SortExpression="yorum" />
                        <asp:CheckBoxField DataField="onaylandi" HeaderText="onaylandi" SortExpression="onaylandi" />
                        <asp:BoundField DataField="yorum_tarihi" HeaderText="yorum_tarihi" SortExpression="yorum_tarihi" />
                        <asp:BoundField DataField="IP_adresi" HeaderText="IP_adresi" SortExpression="IP_adresi" />
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
                <asp:SqlDataSource ID="sdsYorumlar" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" DeleteCommand="DELETE FROM [yorumlar] WHERE [yorum_id] = @yorum_id" InsertCommand="INSERT INTO [yorumlar] ([yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (@yorum, @onaylandi, @yorum_tarihi, @yemek_id, @uye_id, @IP_adresi)" SelectCommand="SELECT * FROM [yorumlar] WHERE ([yemek_id] = @yemek_id) ORDER BY [onaylandi], [yorum_tarihi]" UpdateCommand="UPDATE [yorumlar] SET   [onaylandi] =@onaylandi  WHERE [yorum_id] = @yorum_id">
                    <DeleteParameters>
                        <asp:Parameter Name="yorum_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="yorum" Type="String" />
                        <asp:Parameter Name="onaylandi" Type="Boolean" />
                        <asp:Parameter Name="yorum_tarihi" Type="DateTime" />
                        <asp:Parameter Name="yemek_id" Type="Int32" />
                        <asp:Parameter Name="uye_id" Type="Int32" />
                        <asp:Parameter Name="IP_adresi" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter Name="yemek_id" Type="Int32" DefaultValue="0" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="onaylandi" />
                        <asp:Parameter Name="yorum_id" />
                    </UpdateParameters>
                </asp:SqlDataSource>
</asp:Content>
