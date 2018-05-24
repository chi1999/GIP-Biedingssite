<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profiel.aspx.cs" Inherits="GIP_Biedingssite.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <asp:Label ID="lblGebruiker" runat="server" Text="Persoonlijke gegevens" style="font-weight: 700; text-decoration: underline"></asp:Label>
    <br />
    <asp:DetailsView ID="dtvGebruiker" runat="server" AutoGenerateRows="False" DataSourceID="dtsGebruiker" Height="50px" Width="125px" DataKeyNames="GebruikerID" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" BorderStyle="None">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <EditRowStyle BackColor="#738A9C" ForeColor="#F7F7F7" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
            <asp:BoundField DataField="Familienaam" HeaderText="Familienaam" SortExpression="Familienaam" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        </Fields>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="dtsGebruiker" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [Voornaam], [Familienaam], [Email], [Type], [GebruikerID] FROM [Gebruiker]"></asp:SqlDataSource>
    <p class="auto-style2"><strong>Geplaatste bods</strong></p>
    <asp:GridView ID="gdvBods" runat="server" AutoGenerateColumns="False" DataSourceID="dtsGeboden" OnSelectedIndexChanged="gdvBods_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" BorderStyle="None">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Bod" HeaderText="Bod" SortExpression="Bod" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
            <asp:BoundField DataField="Einddatum" HeaderText="Einddatum" SortExpression="Einddatum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Moment" HeaderText="Moment" SortExpression="Moment" DataFormatString="{0:d}" />
            <asp:BoundField DataField="FotoNaam" HeaderText="FotoNaam" SortExpression="FotoNaam" />
            <asp:BoundField DataField="GebruikerID" HeaderText="GebruikerID" SortExpression="GebruikerID" Visible="False" />
            <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" SortExpression="ArtikelID" Visible="False" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" ForeColor="#F7F7F7" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="dtsGeboden" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Artikel.Naam, Artikel.Beschrijving, Artikel.Einddatum, Bod.Bod, Bod.Moment, Artikel.FotoNaam, Bod.GebruikerID, Bod.ArtikelID FROM Bod, Artikel WHERE Bod.ArtikelID = Artikel.ArtikelID ORDER BY Bod.Bod DESC"></asp:SqlDataSource>
            

</asp:Content>
