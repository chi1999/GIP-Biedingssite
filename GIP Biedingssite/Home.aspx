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
            <asp:RequiredFieldValidator ID="rfvNaam" runat="server" ControlToValidate="txtnaam" ErrorMessage="Verplicht veld!"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="UserNameLabel1" runat="server" AssociatedControlID="UserName">Familienaam:</asp:Label>
            <asp:TextBox ID="txtfnaam" runat="server" Height="22px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvfnaam" runat="server" ControlToValidate="txtfnaam" ErrorMessage="Verplicht veld!"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="UserNameLabel2" runat="server" AssociatedControlID="UserName">Wachtwoord:</asp:Label>
            <asp:TextBox ID="txtww" runat="server" TextMode="Password"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="rfvww" runat="server" ControlToValidate="txtww" ErrorMessage="Verplicht veld!"></asp:RequiredFieldValidator>
            <br />
            
            <br />
            <asp:Label ID="UserNameLabel3" runat="server" AssociatedControlID="UserName">herhaal wachtwoord</asp:Label>
            <asp:TextBox ID="txthww" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txthww" ErrorMessage="Verplicht veld!"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvhww" runat="server" ControlToCompare="txtww" ControlToValidate="txthww" ErrorMessage="Wachtwoorden komen niet overeen"></asp:CompareValidator>
            <br />
            <br />
            <asp:Label ID="UserNameLabel6" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
            <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtemail" ErrorMessage="Verplicht veld!"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtemail" ErrorMessage="Het veld is niet herkend als email adres" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <br /><asp:Panel ID="pnlAkkoord" runat="server" Visible="False" BackColor="#CCCCFF" Font-Bold="False" Font-Italic="False" Font-Size="Medium">
                Beste gebruiker<br /> Welkom op onze biedingssite hier worden allerlei school producten verkocht aan de hoogste bieder. Om dit van een leiendakje te laten lopen en ervoor te zorgen dat er geen misbruik wordt gemaakt van de website zijn er natuurlijk enkele regels waarmee je je akkoord moet verklaren.<br /> Regel 1: Je moet je echte naam gebruiken en je e-mail adres die j evan het school hebt gekregen.<br /> Regel 2: Er mogen geen valse bedragen geboden worden, al je bied moet je betalen!
                <br />
                Regel 3: Er kan geen bod geplaats worden die lager is dan het mininumbedrag.<br /> Regel 4: In het geval dat een gebruiker misbruik maakt van de biedingssite zal de beheerder de gebruiker in kwestie blokkeren.<br /> Alvast bedankt om u te registreren op onze biedingssite, veel winkelplezier!<br /> We danen u bij voorbaat om akkoord te gaan en het reglement na te leven.<span style="color: rgb(75, 79, 86); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(241, 240, 240); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><br /> </span>
                <br />
                <asp:CheckBox ID="ckbAkkoord" runat="server" Text="Akkoord" />
            </asp:Panel>
            <br />
            <asp:Button ID="btnRegistr" runat="server" Text="Registeren" OnClick="registreren" style="height: 26px" />
            <br />
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlLogin" runat="server" Visible="False">
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
            <asp:TextBox ID="UserName" runat="server" Width="262px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvuser" runat="server" ControlToValidate="UserName" ErrorMessage="Verplicht veld!"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="128px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPasswoord" runat="server" ControlToValidate="Password" ErrorMessage="Verplicht veld!"></asp:RequiredFieldValidator>
            <br />
          
            <br />
            <br />
            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" Width="53px" OnClick="LoginButton_Click" />
            <asp:Label ID="lblNietJuist" runat="server"></asp:Label>
        </asp:Panel> 
        
</asp:Content>
