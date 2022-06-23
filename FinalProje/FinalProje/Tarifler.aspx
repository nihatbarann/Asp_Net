<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSablon.Master" AutoEventWireup="true" CodeBehind="Tarifler.aspx.cs" Inherits="FinalProje.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>

        .yemek-adi{
            background-color:cadetblue;
            width:150px;
            height:50px;
            text-align:center;
            line-height:50px;
            border-radius:10px;
            cursor:pointer;
         
        }


    </style>


  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlYemekler" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDsYemekler">
            <ItemTemplate>
                <div class="yemek-adi">
                    <a href='Tarifler.aspx?id=<%#Eval("yemek_id") %>' style="color:#000000"><%#Eval("yemek_adi") %></a>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <br />
            </SeparatorTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDsYemekler" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" SelectCommand="SELECT * FROM [yemekler] WHERE (([silindi] = @silindi) AND ([aktif] = @aktif)) ORDER BY [eklenme_tarihi] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="false" Name="silindi" Type="Boolean" />
                <asp:Parameter DefaultValue="true" Name="aktif" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="pnlTarifler" runat="server">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="sdsTarifler">
                <ItemTemplate>
                    <h3><%#Eval("yemek_adi")%></h3>
                    <%#Eval("tarif") %>
                    <br />
                    <div style="font-size: 10px"><%#Eval("eklenme_tarihi","{0:d MMMM yyyy}") %> tarihinde eklendi</div>
                </ItemTemplate>
                <SeparatorTemplate>
                    <br />
                </SeparatorTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="sdsTarifler" ConnectionString='<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>' SelectCommand="SELECT * FROM [yemekler] WHERE (([aktif] = @aktif) AND ([silindi] = @silindi) AND ([yemek_id] = @yemek_id))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="aktif" Type="Boolean"></asp:Parameter>
                    <asp:Parameter DefaultValue="false" Name="silindi" Type="Boolean"></asp:Parameter>
                    <asp:QueryStringParameter QueryStringField="id" DefaultValue="0" Name="yemek_id" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDsYorumlar">
                   <ItemTemplate>
                       <br /><br />
                    <%#Eval("yorum") %><br />
                     <%# Eval("yorum_tarihi","{0:d:MM:yyyy hh:mm}") %> tarihinde 
                       <br> </br>
                       <br></br>
                    
                   
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDsYorumlar" runat="server" ConnectionString="<%$ ConnectionStrings:yemektarifleriDBConnectionString3 %>" SelectCommand="SELECT * FROM [yorumlar] WHERE (([onaylandi] = @onaylandi) AND ([yemek_id] = @yemek_id))" InsertCommand="insert into yorumlar (yorum,onaylandi,yorum_tarihi,yemek_id,uye_id,IP_adresi) values
(@yorum,0,getdate(),@yemek_id,@uye_id,@IP_adresi)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtYorum" Name="yorum" PropertyName="Text" />
                    <asp:QueryStringParameter Name="yemek_id" QueryStringField="id" />
                    <asp:SessionParameter Name="uye_id" SessionField="uye_id" />
                    <asp:ControlParameter ControlID="lblIP" Name="IP_adresi" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="onaylandi" Type="Boolean" />
                    <asp:QueryStringParameter QueryStringField="id" DefaultValue="0" Name="yemek_id" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
     
        <br />
   
   
             <asp:UpdatePanel ID="udtpnlyorum" runat="server">
                 <ContentTemplate>
                          Yorum:<br />
                <asp:TextBox ID="txtYorum" runat="server" Height="51px" TextMode="MultiLine" Width="192px"></asp:TextBox>
                <br />
                IP Adresiniz:
                <asp:Label ID="lblIP" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Button ID="BtnYorum" runat="server" OnClick="btnYorumGonder_Click" Text="Gönder" />
                <asp:Label ID="lblMesaj" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
             <br />
                 </ContentTemplate>
                 <Triggers>
                     <asp:AsyncPostBackTrigger ControlID="BtnYorum" EventName="Click" />
                 </Triggers>
             </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
