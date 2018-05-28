<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bieden.aspx.cs" Inherits="GIP_Biedingssite.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Terug naar artikellijst" Height="34px" Width="193px" />
    <br />
    <br />
    <asp:Label ID="lblArtikel" runat="server" Text="Artikel details" style="font-weight: 700; text-decoration: underline"></asp:Label>
    <asp:Panel ID="pnlGebruikers" runat="server">
        <br />
        <asp:DetailsView ID="ddvArtikel" runat="server" AutoGenerateRows="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikel" Height="50px" Width="125px" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" BorderStyle="None">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" ForeColor="#F7F7F7" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="StartPrijs" HeaderText="Minimum bod" SortExpression="StartPrijs" />
                <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
                <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Einddatum" HeaderText="Einddatum" SortExpression="Einddatum" DataFormatString="{0:d}" />
                <asp:ImageField DataImageUrlField="FotoNaam" DataImageUrlFormatString="~/fotos/{0}" HeaderText="Foto">
                    <ControlStyle Width="75px" />
                </asp:ImageField>
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dtsArtikel" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [Naam], [StartPrijs], [Beschrijving], [ArtikelID], [Startdatum], [Einddatum], [FotoNaam] FROM [Artikel]"></asp:SqlDataSource>
        <strong>
        <br class="auto-style2" />
        <span class="auto-style2">Reeds geboden<br /> </span></strong>
        <asp:GridView ID="gdvGebruiker" runat="server" AutoGenerateColumns="False" DataSourceID="dtsGebruikers" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" BorderStyle="None">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" SortExpression="ArtikelID" Visible="False" />
                <asp:BoundField DataField="Bod" HeaderText="Bod" SortExpression="Bod" />
                <asp:BoundField DataField="Moment" HeaderText="Moment" SortExpression="Moment" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Familienaam" HeaderText="Familienaam" SortExpression="Familienaam" />
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
        <asp:SqlDataSource ID="dtsGebruikers" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Artikel.ArtikelID, Bod.Bod, Bod.Moment, Gebruiker.Voornaam, Gebruiker.Familienaam FROM Artikel, Bod, Gebruiker WHERE Artikel.ArtikelID = Bod.ArtikelID AND Bod.GebruikerID = Gebruiker.GebruikerID ORDER BY Bod.Bod DESC">
        </asp:SqlDataSource>
        <br />
    </asp:Panel>
    <asp:Panel ID="pnlBieden" runat="server" Visible="False">
        <asp:TextBox ID="txtBod" runat="server"></asp:TextBox>
        <asp:Button ID="btnBieden" runat="server" Height="26px" OnClick="Bieden" Text="Bod plaatsen" />
        <asp:Label ID="lblMelding" runat="server" Text="Label" Visible="False" style="font-style: italic"></asp:Label>
        <br />
        <asp:Label ID="lblFout" runat="server" Text="Label" Visible="False" style="font-style: italic"></asp:Label>
    </asp:Panel>
    <br />
            
            


        

    
  

            

    </asp:Content>
