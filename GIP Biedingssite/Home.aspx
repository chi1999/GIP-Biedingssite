<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HOMe.aspx.cs" Inherits="GIP_Biedingssite.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Panel ID="pnlKeuze0" runat="server">
            <asp:Button ID="btnPnlInlog0" runat="server" Text="Inloggen" OnClick="btnPnlInlog_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPnlRegistr0" runat="server" Text="Registreren" OnClick="btnPnlRegistr_Click" CausesValidation="False" />
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlregistr" runat="server" Visible="False">
            <asp:label runat="server" AssociatedControlID="UserName" ID="UserNameLabel0">Naam:</asp:label>
            <asp:TextBox runat="server" ID="txtnaam"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNaam" runat="server" ControlToValidate="txtnaam" ErrorMessage="Gelieve je naam in te vullen"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="UserNameLabel1" runat="server" AssociatedControlID="UserName">Familienaam:</asp:Label>
            <asp:TextBox ID="txtfFamilieNaam" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFamilienaam" runat="server" ControlToValidate="txtfFamilieNaam" ErrorMessage="Gelieve je familienaam in te vullen"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="UserNameLabel2" runat="server" AssociatedControlID="UserName">Wachtwoord:</asp:Label>
            <asp:TextBox ID="txtww" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvWachtwoord" runat="server" ControlToValidate="txtww" ErrorMessage="Gelieve een wachtwoord in te vullen"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="UserNameLabel3" runat="server" AssociatedControlID="UserName">herhaal wachtwoord</asp:Label>
            <asp:TextBox ID="txthww" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="cvWachtwoord" runat="server" ControlToCompare="txtww" ControlToValidate="txthww" ErrorMessage="Wachtwoord is niet hetzelfde"></asp:CompareValidator>
            <br />
            <br />
            <asp:Label ID="UserNameLabel6" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
            <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="rfvEmail" runat="server" ControlToValidate="txtemail" ErrorMessage="Het veld is niet herkent als email adres" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button ID="btnRegistr" runat="server" Text="Registeren" OnClick="registreren" style="height: 26px" />
            <br />
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlLogin" runat="server" Visible="False">
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Naam:</asp:Label>
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="LogNaam" runat="server" ControlToValidate="UserName" ErrorMessage="Gelieve je naam in te vullen"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Wachtwoord:</asp:Label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="128px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="LogWachtwoord" runat="server" ControlToValidate="Password" ErrorMessage="Gelieve je wachtwoord in te vullen"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" Width="53px" OnClick="LoginButton_Click" />
            <asp:Label ID="lblNietJuist" runat="server"></asp:Label>
        </asp:Panel>
</asp:Content>
