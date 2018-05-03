<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BiedenBeheren.aspx.cs" Inherits="GIP_Biedingssite.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlBeheerder" runat="server">
        <asp:TextBox ID="TextBox1" runat="server">Artikelen:</asp:TextBox>
        <br />
        <asp:DetailsView ID="ddvArtikel0" runat="server" AutoGenerateRows="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikel0" Height="50px" Width="125px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AllowPaging="True" OnPageIndexChanging="ddvArtikel0_PageIndexChanging">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <Fields>
                <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="StartPrijs" HeaderText="Minimum bod" SortExpression="StartPrijs" />
                <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
                <asp:BoundField DataField="Startdatum" DataFormatString="{0:d}" HeaderText="Startdatum" SortExpression="Startdatum" />
                <asp:BoundField DataField="Einddatum" DataFormatString="{0:d}" HeaderText="Einddatum" SortExpression="Einddatum" />
                <asp:ImageField DataImageUrlField="FotoNaam" DataImageUrlFormatString="~/fotos/{0}" HeaderText="Foto">
                    <ControlStyle Width="75px" />
                </asp:ImageField>
            </Fields>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dtsArtikel0" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" DeleteCommand="DELETE FROM [Artikel] WHERE [ArtikelID] = ?" InsertCommand="INSERT INTO [Artikel] ([Naam], [StartPrijs], [Beschrijving], [ArtikelID], [Startdatum], [Einddatum], [FotoNaam]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [Naam], [StartPrijs], [Beschrijving], [ArtikelID], [Startdatum], [Einddatum], [FotoNaam] FROM [Artikel]" UpdateCommand="UPDATE [Artikel] SET [Naam] = ?, [StartPrijs] = ?, [Beschrijving] = ?, [Startdatum] = ?, [Einddatum] = ?, [FotoNaam] = ? WHERE [ArtikelID] = ?">
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
        <asp:GridView ID="gdvbeheerder" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dtsbeheerder" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
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
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="dtsbeheerder" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Bod.BodID, Bod.Bod, Bod.Moment, Bod.IPadres, Gebruiker.Voornaam, Gebruiker.GebruikerID, Gebruiker.Familienaam, Gebruiker.Type, Gebruiker.Akoord, Gebruiker.Email, Artikel.ArtikelID FROM Gebruiker, Bod, Artikel WHERE Gebruiker.GebruikerID = Bod.GebruikerID AND Bod.ArtikelID = Artikel.ArtikelID ORDER BY Bod.Bod DESC"></asp:SqlDataSource>
    </asp:Panel>
    </asp:Content>
