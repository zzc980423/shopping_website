<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="order_display.aspx.cs" Inherits="shopping_website.user.order_display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    table {
        border-collapse: collapse;
        margin-bottom: 20px;
        width: 100%;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
        .table-striped tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    img {
        display: block;
        margin: 0 auto;
        max-height: 100px;
        max-width: 100px;
    }
    a {
        display: inline-block;
        margin-top: 20px;
    }
    p {
        text-align: right;
    }
        </style>

     <table>
                    <tr>
                        <td>Firstname</td>
                        <td><asp:Label ID="Firstname" runat="server"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>Lastname</td>
                        <td><asp:Label ID="Lastname" runat="server"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>Email</td>
                        <td><asp:Label ID="Email" runat="server"></asp:Label></td>
                    </tr>
                     <tr>
                        <td>Address</td>
                        <td><asp:Label ID="Address" runat="server"></asp:Label></td>
                    </tr>
                     
                     <tr>
                        <td>Mobile</td>
                        <td><asp:Label ID="Mobile" runat="server"></asp:Label></td>
                    </tr>
                   
                </table>


                <br /><br />

                <table class="table">

                    <asp:Repeater ID="x" runat="server">

                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th>Product Image</th>
                                    <th>Product Name</th>
                                    <th>Product Price</th>
                                    <th>Product Quantity</th>
                                    <th>Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><img src="../<%#Eval("product_images") %>" /></td>
                                <td><%#Eval("product_name") %></td>
                                <td><%#Eval("product_price") %>$</td>
                                <td><%#Eval("product_qty") %></td>
                                <td> $ <%#Eval("product_gtotal") %></td>
                            </tr>

                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody>
                          
                        </FooterTemplate>

                    </asp:Repeater>
                    

                </table>

                <a href ="order_desc.aspx "> Back</a>

                <p align="right">
               <asp:Label ID="total" runat="server" ForeColor="Red"></asp:Label>
                    </p>
</asp:Content>


