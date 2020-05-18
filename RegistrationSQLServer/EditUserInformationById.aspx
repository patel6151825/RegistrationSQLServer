<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUserInformationById.aspx.cs" Inherits="RegistrationSQLServer.EditUserInformationById" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <h1><span style="color:Highlight">Edit User Information</span></h1>
             <hr />
            
            <asp:Panel ID="editUserInfoPanel" runat="server">
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
                            <asp:Button ID="updateInfoButton" runat="server" Text="Update User Information" Font-Bold="true" BackColor="Blue" ForeColor="White" Height="50" Width="250" OnClick="updateInfoButton_Click" />
                            <asp:Button ID="goBackToRegistration" runat="server" Text="Go Back To Registration Page" Font-Bold="true" BackColor="Teal" ForeColor="White" Height="50" Width="250" OnClick="goBackToRegistration_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="lblUpdateResultMessage" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
