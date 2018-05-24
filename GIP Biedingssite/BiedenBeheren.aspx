<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BiedenBeheren.aspx.cs" Inherits="GIP_Biedingssite.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:Panel ID="pnlBeheerder" runat="server">
        <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Menu" Height="40px" Width="90px" />
        <br />
        <br />
        <asp:Label ID="lblArtikelen" runat="server" Text="Artikelen" style="font-weight: 700; text-decoration: underline"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gdvArtikels" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" DataKeyNames="ArtikelID" DataSourceID="dtsArtikel0" GridLines="Horizontal" OnSelectedIndexChanged="indexchanged" BorderStyle="None">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="Beschrijving" HeaderText="Beschrijving" SortExpression="Beschrijving" />
                <asp:BoundField DataField="StartPrijs" HeaderText="StartPrijs" SortExpression="StartPrijs" />
                <asp:BoundField DataField="Startdatum" DataFormatString="{0:d}" HeaderText="Startdatum" SortExpression="Startdatum" />
                <asp:BoundField DataField="Einddatum" DataFormatString="{0:d}" HeaderText="Einddatum" SortExpression="Einddatum" />
                <asp:ImageField DataImageUrlField="FotoNaam" DataImageUrlFormatString="~/fotos/{0}">
                    <ControlStyle Width="75px" />
                </asp:ImageField>
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
        <br />
        <asp:Label ID="lblbeheerder" runat="server" Text="Geboden gebruikers" style="font-weight: 700; text-decoration: underline"></asp:Label>
        <br />
        <asp:GridView ID="gdvbeheerder" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dtsbeheerder" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanged="gdvbeheerder_SelectedIndexChanged" BorderStyle="None">
            <AlternatingRowStyle BackColor="#F7F7F7" />
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
        <asp:SqlDataSource ID="dtsbeheerder" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT Bod.BodID, Bod.Bod, Bod.Moment, Bod.IPadres, Gebruiker.Voornaam, Gebruiker.GebruikerID, Gebruiker.Familienaam, Gebruiker.Type, Gebruiker.Akoord, Gebruiker.Email, Artikel.ArtikelID FROM Gebruiker, Bod, Artikel WHERE Gebruiker.GebruikerID = Bod.GebruikerID AND Bod.ArtikelID = Artikel.ArtikelID ORDER BY Bod.Bod DESC"></asp:SqlDataSource>
    </asp:Panel>
            
      
    </asp:Content>
