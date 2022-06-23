    <%@ Page Title="" Language="C#" MasterPageFile="~/AnaSablon.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FinalProje.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h3 {
            text-align: center;
            margin-bottom: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SQLDsicerik">
    <ItemTemplate>
            <h3><%#Eval("sayfa_basligi") %></h3>
            <%#Eval("Icerik") %>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SQLDsicerik" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" SelectCommand="SELECT * FROM [sayfalar] WHERE ([sayfa_id] = @sayfa_id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="sayfa_id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
