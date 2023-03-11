<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="shopping_website.user.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
    table {
        width: 400px;
        height: 300px;
        margin: auto;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 20px;
        box-shadow: 2px 2px 5px #ccc;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
    }

    h2 {
        margin-top: 20px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 3px;
        margin-bottom: 10px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
        border: none;
        border-radius: 3px;
        padding: 10px 20px;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 20px;
    }
</style>

    <table>

        <h1> Login page</h1>

        <h2> email</h2>

        <asp:TextBox ID="TextBox1" runat="server" style="height:20px" required></asp:TextBox>


        <h2> password </h2>

        <asp:TextBox ID="TextBox2" runat="server" style="height:20px" required></asp:TextBox>

         <asp:Button ID="b2" runat="server" Text="Login" OnClick="b2_Click" style="height:30px; width:80px;" />

         <asp:Label ID="l1" runat="server" Text=""></asp:Label>

        <a href="signup.aspx">Do not have an account? signup here</a>
    </table>



</asp:Content>

