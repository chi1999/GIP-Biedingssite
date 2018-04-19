<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="GIP_Biedingssite.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 197px;
        }
        .auto-style3 {
            width: 239px;
        }
        .auto-style4 {
            width: 221px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2"><asp:Button ID="btnArtikelenBekijken" runat="server" OnClick="btnArtikelenBekijken_Click" Text="Artikelen Bekijken" />
            </td>
            <td class="auto-style3">
    <asp:Button ID="btnArtikelenToevoegen" runat="server" Height="26px" OnClick="btnArtikelenToevoegen_Click" Text="Artikelen toevoegen" Width="170px" />
            </td>
            <td class="auto-style4">
    <asp:Button ID="btnProfiel" runat="server" OnClick="btnProfiel_Click" Text="Profiel" />
            </td>
            <td>
                <asp:Button ID="btnAfmelden" runat="server" Text="Afmelden" OnClick="btnAfmelden_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
