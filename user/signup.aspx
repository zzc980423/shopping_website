<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="shopping_website.user.signup" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    table {
        margin: auto; 
        border-collapse: collapse; 
        width: 80%; 
    }
    h1 {
        text-align: center;
        margin-bottom: 20px; 
    }
    h2 {
        margin-top: 20px; 
    }
    td {
        text-align: center;
        padding: 10px; 
    }
    input[type="text"], input[type="password"] {
        padding: 10px; 
        border-radius: 5px; 
        border: none; 
        box-shadow: 1px 1px 1px grey; 
        width: 100%; 
        margin-bottom: 10px; 
    }
    input[type="submit"] {
        background-color: #4CAF50; 
        border: none; 
        color: white; 
        padding: 10px 20px; 
        text-align: center; 
        text-decoration: none; 
        display: inline-block; 
        font-size: 16px; 
        border-radius: 5px; 
        margin-top: 10px; 
    }
    input[type="submit"]:hover {
        background-color: #3e8e41; 
    }
</style>


    <table>

        <h1> Signup page</h1>

        <h2> firstname</h2>

        <asp:TextBox ID="TextBox1" runat="server"  required></asp:TextBox>


        <h2> lastname </h2>

        <asp:TextBox ID="TextBox2" runat="server"  required></asp:TextBox>

        <h2> email </h2>

        <asp:TextBox ID="TextBox3" runat="server"  required></asp:TextBox>

        <h2> password </h2>

        <asp:TextBox ID="TextBox4" runat="server"  required></asp:TextBox>

        <h2> comfirm password</h2>

        <asp:TextBox ID="TextBox5" runat="server"  required></asp:TextBox>
       
        <h2> address</h2>

        <asp:TextBox ID="TextBox6" runat="server"  required></asp:TextBox>

        <h2> mobile</h2>

        <asp:TextBox ID="TextBox7" runat="server"  required></asp:TextBox>
      
        <td>
        <asp:Button ID ="b1" runat = "server"  Text =" Sign up " onclick="b1_Click"  > </asp:Button> 
        </td>
       
    </table>
</asp:Content>
