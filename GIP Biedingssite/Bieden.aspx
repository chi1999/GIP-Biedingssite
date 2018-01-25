<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bieden.aspx.cs" Inherits="GIP_Biedingssite.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblArtikel" runat="server" Text="Artikel details:"></asp:Label>
    <asp:DetailsView ID="dtvArtikel" runat="server" AutoGenerateRows="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikel" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="StartPrijs" HeaderText="StartPrijs" SortExpression="StartPrijs" />
            <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
            <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
            <asp:BoundField DataField="Einddatum" HeaderText="Einddatum" SortExpression="Einddatum" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="dtsArtikel" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Naam, StartPrijs, Beschrijving, ArtikelID, Startdatum, Einddatum FROM Artikel WHERE (ArtikelID = ?)" OnSelecting="dtsArtikel_Selecting">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="?" SessionField="ArtikelID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="pnlGebruikers" runat="server">
        <asp:Label ID="lblgebruikers" runat="server" Text="Geboden gebruikers:"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dtsGebruikers">
            <Columns>
                <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" SortExpression="ArtikelID" />
                <asp:BoundField DataField="Bod" HeaderText="Bod" SortExpression="Bod" />
                <asp:BoundField DataField="Moment" HeaderText="Moment" SortExpression="Moment" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Familienaam" HeaderText="Familienaam" SortExpression="Familienaam" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dtsGebruikers" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Artikel.ArtikelID, Bod.Bod, Bod.Moment, Gebruiker.Voornaam, Gebruiker.Familienaam FROM Artikel, Bod, Gebruiker WHERE Artikel.ArtikelID = Bod.ArtikelID AND Bod.GebruikerID = Gebruiker.GebruikerID AND (Artikel.ArtikelID = ?)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="?" SessionField="ArtikelID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:TextBox ID="txtBod" runat="server"></asp:TextBox>
    <asp:Button ID="btnBieden" runat="server" Height="26px" OnClick="Bieden" Text="Bod plaatsen" />
</asp:Content>
