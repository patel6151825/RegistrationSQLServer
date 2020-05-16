﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="RegistrationSQLServer.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1><span style="color:purple">User Information</span></h1>
            
            <asp:Panel ID="enterUserInfoPanel" runat="server">
                <table cellpadding="3" border="0">
                    <tr>
                        <td>First name:</td>
                        <td>
                            <asp:TextBox ID="firstNameTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="firstNameTextBoxValidator" ControlToValidate="firstNameTextBox" runat="server" ErrorMessage="Please enter a First name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Last name:</td>
                        <td>
                            <asp:TextBox ID="lastNameTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="lastNameTextBoxValidator" ControlToValidate="lastNameTextBox" runat="server" ErrorMessage="Please enter a Last name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td>
                            <asp:TextBox ID="addressTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="addressTextBoxValidator" ControlToValidate="addressTextBox" runat="server" ErrorMessage="Please enter a address" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td>
                            <asp:TextBox ID="cityTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="cityTextBoxValidator1" ControlToValidate="cityTextBox" runat="server" ErrorMessage="Please enter a city" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>State or Province:</td>
                        <td>
                            <asp:TextBox ID="stateOrProvinceTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="stateOrProvinceTextBoxValidator1" ControlToValidate="stateOrProvinceTextBox" runat="server" ErrorMessage="Please enter a State or Province" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="stateOrProvinceTextBoxValidator2" ControlToValidate="stateOrProvinceTextBox" runat="server" ValidationExpression="^[A-Za-z]{2}" ErrorMessage="Please enter two characters province" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Zip Code/Postal Code:</td>
                        <td>
                            <asp:TextBox ID="zipCodeTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="zipCodeTextBoxValidator" ControlToValidate="zipCodeTextBox" runat="server" ErrorMessage="Please enter a zipcode/postal code" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Country:</td>
                        <td>
                            <asp:TextBox ID="countryTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="countryTextBoxValidator" ControlToValidate="countryTextBox" runat="server" ErrorMessage="Please enter a country" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <br />
                            <asp:Button ID="enterInfoButton" runat="server" Text="Enter User Information" Font-Bold="true" BackColor="Blue" ForeColor="White" Height="40" OnClick="enterInfoButton_Click" /></td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="lblResultMessage" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
