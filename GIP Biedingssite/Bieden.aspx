<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bieden.aspx.cs" Inherits="GIP_Biedingssite.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblArtikel" runat="server" Text="Artikel details:"></asp:Label>
    <asp:Panel ID="pnlGebruikers" runat="server">
        <br />
        <asp:DetailsView ID="ddvArtikel" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikel" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="StartPrijs" HeaderText="StartPrijs" SortExpression="StartPrijs" />
                <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
                <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
                <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
                <asp:BoundField DataField="Einddatum" HeaderText="Einddatum" SortExpression="Einddatum" />
                <asp:BoundField DataField="FotoNaam" HeaderText="FotoNaam" SortExpression="FotoNaam" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="dtsArtikel" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" OnSelecting="dtsArtikel_Selecting" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [Naam], [StartPrijs], [Beschrijving], [ArtikelID], [Startdatum], [Einddatum], [FotoNaam] FROM [Artikel]"></asp:SqlDataSource>
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
        <asp:DetailsView ID="ddvArtikel0" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikel0" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="StartPrijs" HeaderText="StartPrijs" SortExpression="StartPrijs" />
                <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
                <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
                <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
                <asp:BoundField DataField="Einddatum" HeaderText="Einddatum" SortExpression="Einddatum" />
                <asp:BoundField DataField="FotoNaam" HeaderText="FotoNaam" SortExpression="FotoNaam" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="dtsArtikel0" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" DeleteCommand="DELETE FROM [Artikel] WHERE [ArtikelID] = ?" InsertCommand="INSERT INTO [Artikel] ([Naam], [StartPrijs], [Beschrijving], [ArtikelID], [Startdatum], [Einddatum], [FotoNaam]) VALUES (?, ?, ?, ?, ?, ?, ?)" OnSelecting="dtsArtikel_Selecting" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [Naam], [StartPrijs], [Beschrijving], [ArtikelID], [Startdatum], [Einddatum], [FotoNaam] FROM [Artikel]" UpdateCommand="UPDATE [Artikel] SET [Naam] = ?, [StartPrijs] = ?, [Beschrijving] = ?, [Startdatum] = ?, [Einddatum] = ?, [FotoNaam] = ? WHERE [ArtikelID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="ArtikelID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Naam" Type="String" />
                <asp:Parameter Name="StartPrijs" Type="Double" />
                <asp:Parameter Name="Beschrijving" Type="String" />
                <asp:Parameter Name="ArtikelID" Type="Int32" />
                <asp:Parameter Name="Startdatum" Type="DateTime" />
                <asp:Parameter Name="Einddatum" Type="DateTime" />
                <asp:Parameter Name="FotoNaam" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Naam" Type="String" />
                <asp:Parameter Name="StartPrijs" Type="Double" />
                <asp:Parameter Name="Beschrijving" Type="String" />
                <asp:Parameter Name="Startdatum" Type="DateTime" />
                <asp:Parameter Name="Einddatum" Type="DateTime" />
                <asp:Parameter Name="FotoNaam" Type="String" />
                <asp:Parameter Name="ArtikelID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblbeheerder" runat="server" Text="Geboden gebruikers:"></asp:Label>
        <asp:GridView ID="gdvbeheerder" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dtsbeheerder">
            <Columns>
                <asp:BoundField DataField="BodID" HeaderText="BodID" InsertVisible="False" SortExpression="BodID" Visible="False" />
                <asp:BoundField DataField="Bod" HeaderText="Bod" SortExpression="Bod" />
                <asp:BoundField DataField="Moment" HeaderText="Moment" SortExpression="Moment" />
                <asp:BoundField DataField="IPadres" HeaderText="IPadres" SortExpression="IPadres" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="GebruikerID" HeaderText="GebruikerID" InsertVisible="False" SortExpression="GebruikerID" />
                <asp:BoundField DataField="Familienaam" HeaderText="Familienaam" SortExpression="Familienaam" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:CheckBoxField DataField="Akoord" HeaderText="Akoord" SortExpression="Akoord" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" SortExpression="ArtikelID" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dtsbeheerder" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Bod.BodID, Bod.Bod, Bod.Moment, Bod.IPadres, Gebruiker.Voornaam, Gebruiker.GebruikerID, Gebruiker.Familienaam, Gebruiker.Type, Gebruiker.Akoord, Gebruiker.Email, Artikel.ArtikelID FROM Gebruiker, Bod, Artikel WHERE Gebruiker.GebruikerID = Bod.GebruikerID AND Bod.ArtikelID = Artikel.ArtikelID ORDER BY Bod.Bod DESC"></asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlBieden" runat="server">
        <asp:TextBox ID="txtBod" runat="server"></asp:TextBox>
        <asp:Button ID="btnBieden" runat="server" Height="26px" OnClick="Bieden" Text="Bod plaatsen" />
        <asp:Label ID="lblMelding" runat="server" Text="Label" Visible="False"></asp:Label>
    </asp:Panel>
    <asp:Label ID="lblFout" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    </asp:Content>
