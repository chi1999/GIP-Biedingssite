<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArtikelenLeerlingen.aspx.cs" Inherits="GIP_Biedingssite.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gdvArtikelenLeerling" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ArtikelID" DataSourceID="dtsArtikelenLeerlingen" BackColor="White" BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" Height="10px" Width="381px" OnSelectedIndexChanged="dgvArtikelenLeerling_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ArtikelID" HeaderText="ArtikelID" InsertVisible="False" ReadOnly="True" SortExpression="ArtikelID" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="StartPrijs" DataFormatString="{0:c}" HeaderText="StartPrijs" SortExpression="StartPrijs" />
            <asp:BoundField DataField="FotoNaam" HeaderText="FotoNaam" SortExpression="FotoNaam" />
            <asp:ImageField DataImageUrlField="FotoNaam" DataImageUrlFormatString="~/fotos/{0}" HeaderText="Foto">
                <ControlStyle Width="80px" />
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
    <asp:SqlDataSource ID="dtsArtikelenLeerlingen" runat="server" ConnectionString="<%$ ConnectionStrings:gip %>" ProviderName="<%$ ConnectionStrings:gip.ProviderName %>" SelectCommand="SELECT [ArtikelID], [Naam], [StartPrijs], [FotoNaam] FROM [Artikel]"></asp:SqlDataSource>
</asp:Content>
