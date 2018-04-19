<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profiel.aspx.cs" Inherits="GIP_Biedingssite.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblGebruiker" runat="server" Text="Persoonlijke gegevens:"></asp:Label>
    <asp:DetailsView ID="dtvGebruiker" runat="server" AutoGenerateRows="False" DataSourceID="dtsGebruiker" Height="50px" Width="125px" DataKeyNames="GebruikerID">
        <Fields>
            <asp:BoundField DataField="GebruikerID" HeaderText="GebruikerID" InsertVisible="False" ReadOnly="True" SortExpression="GebruikerID" />
            <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
            <asp:BoundField DataField="Familienaam" HeaderText="Familienaam" SortExpression="Familienaam" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="dtsGebruiker" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [Voornaam], [Familienaam], [Email], [Type], [GebruikerID] FROM [Gebruiker]"></asp:SqlDataSource>
    <p>
        &nbsp;</p>
    <asp:GridView ID="gdvBods" runat="server" AutoGenerateColumns="False" DataSourceID="dtsGeboden" OnSelectedIndexChanged="gdvBods_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="GebruikerID" HeaderText="GebruikerID" SortExpression="GebruikerID" />
            <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" SortExpression="ArtikelID" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
            <asp:BoundField DataField="Einddatum" HeaderText="Einddatum" SortExpression="Einddatum" />
            <asp:BoundField DataField="Bod" HeaderText="Bod" SortExpression="Bod" />
            <asp:BoundField DataField="Moment" HeaderText="Moment" SortExpression="Moment" />
            <asp:BoundField DataField="StartPrijs" HeaderText="StartPrijs" SortExpression="StartPrijs" />
            <asp:BoundField DataField="FotoNaam" HeaderText="FotoNaam" SortExpression="FotoNaam" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dtsGeboden" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Artikel.Naam, Artikel.Beschrijving, Artikel.Startdatum, Artikel.Einddatum, Bod.Bod, Bod.Moment, Artikel.StartPrijs, Artikel.FotoNaam, Bod.GebruikerID, Bod.ArtikelID FROM Bod, Artikel WHERE Bod.ArtikelID = Artikel.ArtikelID ORDER BY Bod.Bod DESC"></asp:SqlDataSource>
</asp:Content>
