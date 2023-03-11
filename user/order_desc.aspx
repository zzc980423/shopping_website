<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="order_desc.aspx.cs" Inherits="shopping_website.user.order_desc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .table {
        border-collapse: collapse;
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
        font-size: 16px;
    }
    .table th, .table td {
        padding: 8px;
        text-align: left;
        border: 1px solid #ddd;
    }
        .table th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
    .table tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .table a {
        text-decoration: none;
    }
    .table a:hover {
        color: #6d5196;
    }
        center {
        font-size: 24px;
        margin-bottom: 20px;
    }
</style>

<table class="table">

        <center> My Orders</center>

        <asp:Repeater ID="r1" runat="server">

            <HeaderTemplate>
                <thead>
                    <tr>
                        <th >id</th>
                        <th >firstname</th>
                        <th >lastname</th>
                        <th >email</th>
                        <th >mobile</th>
                        <th >status</th>
                        
                        
                    </tr>
                </thead>
                <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("id") %></td>
                    <td><%#Eval("firstname") %></td>
                    <td><%#Eval("lastname") %></td>
                    <td><%#Eval("email") %></td>
                    <td><%#Eval("mobile") %></td>

                    
                    
                    <td><a href="order_display.aspx?id=<%#Eval("id") %>" >Details</a>
                    </td>
                   
                                             

                                            
                </tr>

            </ItemTemplate>

            <FooterTemplate>
                </tbody>
                          
            </FooterTemplate>

        </asp:Repeater>
    <td> <a href ="display_item.aspx"> Go back to main page</a> </td>

    </table>
</asp:Content>
