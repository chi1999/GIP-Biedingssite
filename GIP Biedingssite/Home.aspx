﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HOMe.aspx.cs" Inherits="GIP_Biedingssite.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Panel ID="pnlKeuze0" runat="server">
            <asp:Button ID="btnPnlInlog0" runat="server" Text="Inloggen" OnClick="btnPnlInlog_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPnlRegistr0" runat="server" Text="Registreren" OnClick="btnPnlRegistr_Click" />
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlregistr" runat="server" Visible="False">
            <asp:label runat="server" AssociatedControlID="UserName" ID="UserNameLabel0">Naam:</asp:label>
            <asp:TextBox runat="server" ID="txtnaam"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="UserNameLabel1" runat="server" AssociatedControlID="UserName">Familienaam:</asp:Label>
            <asp:TextBox ID="txtfnaam" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="UserNameLabel2" runat="server" AssociatedControlID="UserName">Wachtwoord:</asp:Label>
            <asp:TextBox ID="txtww" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="UserNameLabel3" runat="server" AssociatedControlID="UserName">herhaal wachtwoord</asp:Label>
            <asp:TextBox ID="txthww" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="UserNameLabel6" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
            <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Het veld is niet herkent als email adres</asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button ID="btnRegistr" runat="server" Text="Registeren" OnClick="registreren" style="height: 26px" />
            <br />
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlLogin" runat="server" Visible="False">
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="128px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" Width="53px" OnClick="LoginButton_Click" />
            <asp:Label ID="lblNietJuist" runat="server"></asp:Label>
        </asp:Panel>
</asp:Content>
