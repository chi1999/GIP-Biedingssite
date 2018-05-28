<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profiel.aspx.cs" Inherits="GIP_Biedingssite.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnMenu" runat="server" OnClick="Menu_click" Text="Menu" />
    <br />
    <asp:Label ID="lblGebruiker" runat="server" Text="Persoonlijke gegevens:"></asp:Label>
    <asp:DetailsView ID="dtvGebruiker" runat="server" AutoGenerateRows="False" DataSourceID="dtsGebruiker" Height="50px" Width="125px" DataKeyNames="GebruikerID" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
            <asp:BoundField DataField="Familienaam" HeaderText="Familienaam" SortExpression="Familienaam" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="dtsGebruiker" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [Voornaam], [Familienaam], [Email], [Type], [GebruikerID] FROM [Gebruiker]"></asp:SqlDataSource>
    <p>Geplaatste bods:</p>
    <asp:GridView ID="gdvBods" runat="server" AutoGenerateColumns="False" DataSourceID="dtsGeboden" OnSelectedIndexChanged="gdvBods_SelectedIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
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
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <asp:SqlDataSource ID="dtsGeboden" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Artikel.Naam, Artikel.Beschrijving, Artikel.Einddatum, Bod.Bod, Bod.Moment, Artikel.FotoNaam, Bod.GebruikerID, Bod.ArtikelID FROM Bod, Artikel WHERE Bod.ArtikelID = Artikel.ArtikelID ORDER BY Bod.Bod DESC"></asp:SqlDataSource>
</asp:Content>
