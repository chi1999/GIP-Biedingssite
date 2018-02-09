﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArtikelenLeerkracht.aspx.cs" Inherits="GIP_Biedingssite.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gdvArtikelenLeerkracht" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikelLeerkracht" OnSelectedIndexChanged="gdvArtikelenLeerkrachten" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="StartPrijs" DataFormatString="{0:C}" HeaderText="StartPrijs" SortExpression="StartPrijs" />
            <asp:ImageField DataImageUrlField="FotoNaam" DataImageUrlFormatString="~/fotos/{0}">
            </asp:ImageField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="dtsArtikelLeerkracht" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" DeleteCommand="DELETE FROM [Artikel] WHERE [ArtikelID] = ?" InsertCommand="INSERT INTO [Artikel] ([ArtikelID], [Naam], [StartPrijs], [FotoNaam]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [ArtikelID], [Naam], [StartPrijs], [FotoNaam] FROM [Artikel]" UpdateCommand="UPDATE [Artikel] SET [Naam] = ?, [StartPrijs] = ?, [FotoNaam] = ? WHERE [ArtikelID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ArtikelID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ArtikelID" Type="Int32" />
            <asp:Parameter Name="Naam" Type="String" />
            <asp:Parameter Name="StartPrijs" Type="Double" />
            <asp:Parameter Name="FotoNaam" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naam" Type="String" />
            <asp:Parameter Name="StartPrijs" Type="Double" />
            <asp:Parameter Name="FotoNaam" Type="String" />
            <asp:Parameter Name="ArtikelID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnToevoegen" runat="server" OnClick="btnToevoegen_Click" Text="Toevoegen" Width="121px" />
    <asp:Panel ID="PanelAddArtikel" runat="server">
        ArtikelID:
        <asp:TextBox ID="txtArtikelID" runat="server"></asp:TextBox>
        <br />
        Naam:<asp:TextBox ID="txtNaam" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNaam" runat="server" ControlToValidate="txtNaam" ErrorMessage="Gelieve een naam in te vullen"></asp:RequiredFieldValidator>
        <br />
        Startprijs:<asp:TextBox ID="TxtPrijs" runat="server" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPrijs" runat="server" ErrorMessage="Gelieve een prijs in te voegen" ControlToValidate="TxtPrijs"></asp:RequiredFieldValidator>
        <br />
        Beschrijving:<asp:TextBox ID="txtBeschrijving" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvBeschrijving" runat="server" ErrorMessage="Gelieve een beschrijving toe te voegen" ControlToValidate="txtBeschrijving"></asp:RequiredFieldValidator>
        <br />
        Startdatum:<asp:TextBox ID="txtStartDatum" runat="server" TextMode="DateTime"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSdatum" runat="server" ErrorMessage="Gelieve een startdatum toe te voegen" ControlToValidate="txtStartDatum"></asp:RequiredFieldValidator>
        <br />
        Einddatum:<asp:TextBox ID="txtEindDatum" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEdatum" runat="server" ErrorMessage="Gelieve een einddatum toe te voegen" ControlToValidate="txtEindDatum"></asp:RequiredFieldValidator>
        <br />
        FotoNaam:<asp:FileUpload ID="fileupFoto" runat="server" />
        <asp:RequiredFieldValidator ID="rfvFoto" runat="server" ErrorMessage="Gelieve een foto toe te voegen" ControlToValidate="txtFoto"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnVerzenden" runat="server" OnClick="btnVerzenden_Click" Text="Verzenden" />
    </asp:Panel>
</asp:Content>
