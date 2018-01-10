<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BodPlaatsen.aspx.cs" Inherits="GIP_Biedingssite.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        &nbsp;&nbsp;<asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="dtsBodArt" Height="50px" Width="125px">
        </asp:DetailsView>
        <asp:SqlDataSource ID="dtsBodArt" runat="server"></asp:SqlDataSource>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </form>
</body>
</html>
</body>
</html>
</body>
</html>
</asp:Content>
