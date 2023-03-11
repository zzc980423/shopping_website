<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="product_desc.aspx.cs" Inherits="shopping_website.user.product_desc" %>

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

    .product-container {

       
        display: flex;
        align-items: center;
        justify-content: center;
        flex-wrap: wrap;
        gap: 20px;
        margin: 20px;
    }
    
    .product-item {

        
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
        max-width: 350px;
        position: relative;
        margin-top:200px;
        margin-left: 600px;
        
    }

        .product-image {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .product-name {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    
    .product-description {
        font-size: 14px;
        margin-bottom: 10px;
    }

    .product-price {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    
    .product-qty {
        font-size: 14px;
        margin-bottom: 10px;
    }
    
    .quantity-input {
        height: 30px;
        padding: 5px;
    }
    
     .add-to-cart-btn {
        height: 30px;
        padding: 5px;
        background-color: #337ab7;
        color: #fff;
        border: none;
        cursor: pointer;
    }
    
    .add-to-cart-btn:hover {
        background-color: #286090;
    }
    
    .error-message {
        color: red;
        margin-top: 10px;
    }

        </style>
    
    <div class ="head">
     <div class =" shopping">&nbsp;<a href ="display_item.aspx">Shopping </a> </div>
    
     <div class =" login"><a href ="login.aspx" > Log in </a> </div>

     <div class =" cart"><a href ="view_cart.aspx"> Cart</a> </div>


        <div class="search" style =" text-align: center;">
     <form action="search_results.aspx" style="display: inline-block;">
          <input type="text" placeholder="Search...">
              <button type="submit">Go</button></div>
     </div>
    </form>

    <div class =" "product-container">
    <asp:Repeater ID="r1" runat="server"> 
       
        <ItemTemplate>
           <div class ="product-item">
                    <img src='../<%#Eval("product_images") %>' class ="product-image" />
                 <div class="product-name">Name: <%#Eval("product_name") %></div>
                    <div class="product-description">Info: <%#Eval("product_desc") %></div>
                    <div class="product-price">Price: $ <%#Eval("product_price") %> </div>
               <div class="product-qty">Quantity: <%#Eval("product_qty") %> in stock</div>
  </ItemTemplate>
             </asp:Repeater>
    <table>
        <tr>
            <td>
                <asp:Label ID="a1" runat="server" Text="Enter Quantity"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="t1" runat="server" CssClass="quantity-input" required></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="x1" runat="server" Text="Add to cart" OnClick="b1_Click" CssClass="add-to-cart-btn" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="y1" runat="server" CssClass="error-message" Text=""></asp:Label>
            </td>
        </tr>
    </table>
         </div>
      
        
    </div>
</asp:Content>

