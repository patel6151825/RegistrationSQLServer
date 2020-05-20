<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListUserInformation.aspx.cs" Inherits="RegistrationSQLServer.ListUserInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1><span style="color: Highlight">List Of Users</span></h1>
            <hr />
            <asp:GridView ID="GridViewUserInfo" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AlternatingRowStyle-BackColor="Aquamarine" AllowPaging="True" AllowSorting="True">
                <AlternatingRowStyle BackColor="Aquamarine"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" ItemStyle-BackColor="Maroon" ItemStyle-ForeColor="White" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"  HeaderStyle-Height="40" HeaderStyle-Width="25"/>
                    
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"/>
                    
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"/>
                        
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"/>
                        
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"/>
                        
                    <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"/>
                        
                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"/>
                        
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"/>

                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="EditUserInformationById.aspx?id={0}" HeaderText="Edit User" Text="Edit" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Maroon" />

                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="DeleteUserInformationById.aspx?id={0}" HeaderText="Delete User" Text="Delete" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Maroon" />

                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationDBConnectionString2 %>" SelectCommand="SELECT * FROM [UserInformation]"></asp:SqlDataSource>
            <br />
            <!--------------ListView----------------->
           
            <asp:ListView ID="ListViewUserInformation" Visible="false" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FAFAD2;color: #284775;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinceLabel" runat="server" Text='<%# Eval("Province") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #FFCC66;color: #000080;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ProvinceTextBox" runat="server" Text='<%# Bind("Province") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ProvinceTextBox" runat="server" Text='<%# Bind("Province") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #FFFBD6;color: #333333;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinceLabel" runat="server" Text='<%# Eval("Province") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                        <th runat="server">Id</th>
                                        <th runat="server">FirstName</th>
                                        <th runat="server">LastName</th>
                                        <th runat="server">Address</th>
                                        <th runat="server">City</th>
                                        <th runat="server">Province</th>
                                        <th runat="server">PostalCode</th>
                                        <th runat="server">Country</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinceLabel" runat="server" Text='<%# Eval("Province") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

        </div>
    </form>
</body>
</html>
