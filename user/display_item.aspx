<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="display_item.aspx.cs" Inherits="shopping_website.user.display_item" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>

                  .head {

           display: flex;
           justify-content: space-between;
           align-items: center;
           height:50px;
           border:solid 1px;
           background-color:antiquewhite;

}

          .shopping{
              position:absolute;
              margin-left:30px;
            top: 25px;
            left: 20px;
            width: 92px;
            margin-bottom: 0px;
        }

          .login{
                 position:absolute;
            top: 25px;
            right: 200px;
            height: 22px;
            width: 56px;
        }

          .cart{
              position:absolute;
              right: 20px;
              top: 25px;
              width: 51px;
           }
          .list{
              position:absolute;
              right: 360px;
              top: 25px;
              width: 51px;
           }

          .search {
           text-align: center;
           margin: auto;
           }

            .search input[type="text"] {
                padding: 5px;
                font-size: 16px;
                border: 2px solid #ccc;
                border-radius: 4px;
                width: 300px;
            }
            .search button[type="submit"] {
  background-color: #4caf50;
  color: white;
  padding: 5px 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.search button[type="submit"]:hover {
  background-color: #45a049;
}

          #d1 {
  list-style-type: none;
  margin: 0;
  padding: 0;
   top: 500px;
}

.main {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

.main img {
  margin-right: 10px;
}

.main a {
  text-decoration: none;
  color: #333;
}



           </style>
   
    <div class ="head">
     <div class =" shopping">&nbsp;<a href ="display_item.aspx">Shopping </a> </div>
    
     <div class =" login"><a href ="login.aspx" > Log in </a> </div>

     <div class =" cart"><a href ="view_cart.aspx"> Cart</a> </div>

        <div class ="list"> <a href ="order_desc.aspx"> Orders </a></div>


        <div class="search" style =" text-align: center;">
     <form action="search_results.aspx" style="display: inline-block;">
          <input type="text" placeholder="Search...">
              <button type="submit">Go</button></div>
        <td></td>
        
     </div>
    </form>
            
    



        
    <asp:Repeater ID="d1" runat="server">
       

      

    
        <ItemTemplate>
           
          <li class="main"> <a href="product_desc.aspx?id=<%#Eval("id") %>">
          <img src="../<%#Eval("product_images") %>" /></a>
                        <%#Eval("product_name") %>
                   <b>Quantity:</b><%#Eval("product_qty") %><br /><b>Price:</b> $ <%#Eval("product_price") %>  </> <br />

              
                       
                
        </ItemTemplate>
       
    </asp:Repeater>
</asp:Content>


