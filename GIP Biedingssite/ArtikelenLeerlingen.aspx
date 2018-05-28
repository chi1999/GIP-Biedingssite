<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArtikelenLeerlingen.aspx.cs" Inherits="GIP_Biedingssite.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <asp:Button ID="btnMenu" runat="server" OnClick="btnMenu_Click" Text="Menu" Height="40px" Width="90px" />
        <br />
        <br />
    <asp:GridView ID="gdvArtikelenLeerling" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikelenLeerlingen" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="10px" Width="381px" OnSelectedIndexChanged="dgvArtikelenLeerling_SelectedIndexChanged" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="StartPrijs" DataFormatString="{0:c}" HeaderText="StartPrijs" SortExpression="StartPrijs" />
            <asp:ImageField DataImageUrlField="FotoNaam" DataImageUrlFormatString="~/fotos/{0}" HeaderText="Foto">
                <ControlStyle Width="80px" />
            </asp:ImageField>
        </Columns>
    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    <SortedAscendingCellStyle BackColor="#F4F4FD" />
    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
    <SortedDescendingCellStyle BackColor="#D8D8F0" />
    <SortedDescendingHeaderStyle BackColor="#3E3277" />
</asp:GridView>
    <asp:SqlDataSource ID="dtsArtikelenLeerlingen" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [ArtikelID], [Naam], [StartPrijs], [FotoNaam] FROM [Artikel]"></asp:SqlDataSource>
        
   
            

</asp:Content>
