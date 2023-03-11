<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="order_continue.aspx.cs" Inherits="shopping_website.user.order_continue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
body {
background-color: #f2f2f2;
font-family: Arial, sans-serif;
}

        table {
        background-color: #fff;
        border-radius: 10px;
        border-collapse: collapse;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        margin: auto;
        padding: 30px;
        width: 80%;
    }

    h1 {
        color: #333;
        font-size: 28px;
        margin-bottom: 20px;
        text-align: center;
    }


        td {
        font-size: 16px;
        color: #333;
        padding: 10px;
        text-align: left;
        vertical-align: middle;
    }

    input[type="text"], textarea {
        background-color: #f2f2f2;
        border: none;
        border-radius: 5px;
        box-sizing: border-box;
        color: #333;
        font-size: 16px;
        margin: 0;
         padding: 10px;
        width: 100%;
    }

        
    input[type="text"]:focus, textarea:focus {
        background-color: #fff;
        box-shadow: 0 0 5px #3498db;
        outline: none;
    }

        button {
        background-color: #3498db;
        border: none;
        border-radius: 5px;
        color: #fff;
        cursor: pointer;
        font-size: 16px;
        margin-top: 20px;
        padding: 10px;
        width: 150px;
    }

    button:hover {
        background-color: #2980b9;
    }
          a {
        color: #3498db;
        font-size: 16px;
        text-decoration: none;
    }

    a:hover {
        color: #2980b9;
        text-decoration: underline;
    }
</style>

    <table>
    <tr>
    <td colspan="2" align="center">
    <h1>Personal Information</h1>
    </td>
    </tr>

    <tr>
    <td>&nbsp;</td>
    </tr>
        <tr>
            <td >
                <label for="t1">First Name:</label>
            </td>
            <td>
                <asp:TextBox ID="t1" runat="server" required></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td >
                <label for="t2">Last Name:</label>
            </td>
            <td>
                <asp:TextBox ID="t2" runat="server"  required></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td >
                <label for="t3">Address:</label>
            </td>
            <td>
                <asp:TextBox ID="t3" runat="server"  TextMode="MultiLine" 
                     required></asp:TextBox>
            </td>
        </tr>

         <tr>
            <td >
                 <label for="t4">Mobile:</label>
            </td>
            <td>
                <asp:TextBox ID="t4" runat="server" required></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td colspan="2" align="center">
        <asp:Button ID="b1" runat="server" Text="continue" onclick="b1_Click"  />

            <td>  <a href = "view_cart.aspx"> Go back to cart</a></td>
           
        </td>
        </tr>
    </table>
  
</asp:Content>
