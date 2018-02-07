<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bieden.aspx.cs" Inherits="GIP_Biedingssite.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblArtikel" runat="server" Text="Artikel details:"></asp:Label>
    <asp:DetailsView ID="ddvArtikel" runat="server" AutoGenerateRows="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikel" Height="50px" Width="125px" AllowPaging="True">
        <Fields>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="StartPrijs" HeaderText="StartPrijs" SortExpression="StartPrijs" />
            <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
            <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
            <asp:BoundField DataField="Einddatum" HeaderText="Einddatum" SortExpression="Einddatum" />
            <asp:BoundField DataField="FotoNaam" HeaderText="FotoNaam" SortExpression="FotoNaam" />
            <asp:ImageField DataImageUrlField="FotoNaam" DataImageUrlFormatString="~/foto's/{0}">
            </asp:ImageField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="dtsArtikel" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [Naam], [StartPrijs], [Beschrijving], [ArtikelID], [Startdatum], [Einddatum], [FotoNaam] FROM [Artikel]" OnSelecting="dtsArtikel_Selecting">
    </asp:SqlDataSource>
    <asp:Panel ID="pnlGebruikers" runat="server">
        <br />
        <asp:Label ID="lblgebruikers" runat="server" Text="Reeds geboden:"></asp:Label>
        <asp:GridView ID="gdvGebruiker" runat="server" AutoGenerateColumns="False" DataSourceID="dtsGebruikers">
            <Columns>
                <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" SortExpression="ArtikelID" />
                <asp:BoundField DataField="Bod" HeaderText="Bod" SortExpression="Bod" />
                <asp:BoundField DataField="Moment" HeaderText="Moment" SortExpression="Moment" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Familienaam" HeaderText="Familienaam" SortExpression="Familienaam" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dtsGebruikers" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Artikel.ArtikelID, Bod.Bod, Bod.Moment, Gebruiker.Voornaam, Gebruiker.Familienaam FROM Artikel, Bod, Gebruiker WHERE Artikel.ArtikelID = Bod.ArtikelID AND Bod.GebruikerID = Gebruiker.GebruikerID ORDER BY Bod.Bod DESC">
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlBeheerder" runat="server">
        <br />
        <asp:Label ID="lblbeheerder" runat="server" Text="Geboden gebruikers:"></asp:Label>
        <asp:GridView ID="gdvbeheerder" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dtsbeheerder">
            <Columns>
                <asp:BoundField DataField="BodID" HeaderText="BodID" InsertVisible="False" SortExpression="BodID" Visible="False" />
                <asp:BoundField DataField="Bod" HeaderText="Bod" SortExpression="Bod" />
                <asp:BoundField DataField="Moment" HeaderText="Moment" SortExpression="Moment" />
                <asp:BoundField DataField="IPadres" HeaderText="IPadres" SortExpression="IPadres" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="GebruikerID" HeaderText="GebruikerID" InsertVisible="False" SortExpression="GebruikerID" Visible="False" />
                <asp:BoundField DataField="Familienaam" HeaderText="Familienaam" SortExpression="Familienaam" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:CheckBoxField DataField="Akoord" HeaderText="Akoord" SortExpression="Akoord" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dtsbeheerder" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Bod.BodID, Bod.Bod, Bod.Moment, Bod.IPadres, Gebruiker.Voornaam, Gebruiker.GebruikerID, Gebruiker.Familienaam, Gebruiker.Type, Gebruiker.Akoord, Gebruiker.Email FROM Gebruiker, Bod WHERE Gebruiker.GebruikerID = Bod.GebruikerID ORDER BY Bod.Bod DESC"></asp:SqlDataSource>
    </asp:Panel>
    <br />
    <asp:TextBox ID="txtBod" runat="server"></asp:TextBox>
    <asp:Button ID="btnBieden" runat="server" Height="26px" OnClick="Bieden" Text="Bod plaatsen" />
    <asp:Label ID="lblMelding" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>
