﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArtikelenLeerkracht.aspx.cs" Inherits="GIP_Biedingssite.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="dgvArtikelenLeerkrachten" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikelLeerkracht">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="StartPrijs" DataFormatString="{0:C}" HeaderText="StartPrijs" SortExpression="StartPrijs" />
            <asp:ImageField DataImageUrlField="FotoNaam" DataImageUrlFormatString="~/fotos/{0}" HeaderText="Foto">
            </asp:ImageField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dtsArtikelLeerkracht" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [Artikel] WHERE [ArtikelID] = ?" InsertCommand="INSERT INTO [Artikel] ([ArtikelID], [Naam], [StartPrijs], [FotoNaam]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [ArtikelID], [Naam], [StartPrijs], [FotoNaam] FROM [Artikel]" UpdateCommand="UPDATE [Artikel] SET [Naam] = ?, [StartPrijs] = ?, [FotoNaam] = ? WHERE [ArtikelID] = ?">
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
        <asp:RequiredFieldValidator ID="rfvNaamArtikel" runat="server" ErrorMessage="Gelieve een naam in te vullen" ControlToValidate="txtFoto"></asp:RequiredFieldValidator>
        <br />
        Startprijs:<asp:TextBox ID="TxtPrijs" runat="server" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPrijs" runat="server" ErrorMessage="Gelieve een prijs in te vullen" ControlToValidate="TxtPrijs"></asp:RequiredFieldValidator>
        <br />
        Beschrijving:<asp:TextBox ID="txtBeschrijving" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvBeschrijving" runat="server" ControlToValidate="txtBeschrijving" ErrorMessage="Gelieve een beschrijving in te voegen"></asp:RequiredFieldValidator>
        <br />
        Startdatum:<asp:TextBox ID="txtStartDatum" runat="server" TextMode="DateTime"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSdatum" runat="server" ControlToValidate="txtStartDatum" ErrorMessage="Gelieve een startdatum in te voegen"></asp:RequiredFieldValidator>
        <br />
        Einddatum:<asp:TextBox ID="txtEindDatum" runat="server" TextMode="DateTime"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEdatum" runat="server" ControlToValidate="txtEindDatum" ErrorMessage="Gelieve een einddatum in te voegen"></asp:RequiredFieldValidator>
        <br />
        FotoNaam:<asp:TextBox ID="txtFoto" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFoto" runat="server" ControlToValidate="txtFoto" ErrorMessage="Gelieve een foto in te voegen"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnVerzenden" runat="server" OnClick="Button2_Click" Text="Verzenden" />
    </asp:Panel>
</asp:Content>
