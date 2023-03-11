<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="orderlist.aspx.cs" Inherits="shopping_website.user.orderlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="table table-striped" style="color:black">

        <h1>Order List</h1>

         <asp:Repeater ID="r1" runat="server">
              <HeaderTemplate>
             <thead>
                 <tr>
                 <th style="color:black">id</th>
                        <th style="color:black">firstname</th>
                        <th style="color:black">lastname</th>
                        <th style="color:black">email</th>
                        <th style="color:black">city</th>
                        <th style="color:black">mobile</th>
                        <th style="color:black">orderstatus</th>

                     </tr>
           </thead>
         </HeaderTemplate>

         <ItemTemplate>
        <tr>
          <td>  <%#Eval("id") %> </td>
          <td>     <%#Eval("firstname") %> </td>
          <td>    <%#Eval("lastname") %> </td>
          <td>    <%#Eval("email") %> </td>

        </tr>
         </ItemTemplate>
               </asp:Repeater>
    </table>




</asp:Content>
