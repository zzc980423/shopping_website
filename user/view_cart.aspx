<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="view_cart.aspx.cs" Inherits="shopping_website.user.view_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>


        .container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.row {
  width: 100%;
  max-width: 960px;
  margin: 0 auto;
}

.col-md-12 {
  padding: 15px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 30px;
}

table th,
table td {
  padding: 10px;
  text-align: left;
  border: 1px solid #ddd;
}

table th {
  background-color: silver;
  color: #fff;
  font-weight: bold;
}


.btn {
  margin-top: 15px;
  margin-right: 10px;
}

.text-right {
  text-align: right;
}

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

     
   
        <div class="container">
  <div class="row">
    <div class="col-md-12">
         <div>
        <asp:Repeater ID="d1" runat="server">
            <HeaderTemplate>
                <table border="1">
                    <tr style="background-color: silver; color: White; font-weight: bold">
                        <td> </td>
                        <td>Name</td>

                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Total Price</td>
                        <td>Action</td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <img src="../<%#Eval("productimages") %>" height="100" width="100" />
                    </td>
                    <td>
                        <%#Eval("productname") %>
                    </td>

                    <td>
                        <%#Eval("productprice") %>$
                    </td>
                    <td>
                        <input id="text<%#Eval("id")%>" type="number" value="<%#Eval("productqty") %>" min="1" style="height: 30px;">
                        </div>
                    </td>
                    <td>
                       $ <%#Eval("producttotal") %>
                    </td>
                    <td>
                        <button type="button"
                            class="btn btn-info btn-sm" onclick="update_cart(<%#Eval("id")%>)" >
                            <i class="fa fa-refresh" ></i>
                        refresh</button>
                        <button type="button" class="btn btn-danger btn-sm"  onclick="window.location='delete_cart.aspx?id=<%#Eval("id") %>'">
                            <i class="fa fa-trash-o" ></i>
                            delete
                        </button>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <br />


        <div class="row">

            <div class="col-lg-7 col-md-7 col-sm-8 ">
                <a href="display_item.aspx" class="btn btn-warning"><i
                    class="fa fa-angle-left"> <i class="fa fa-angle-left"> </i>Go back shopping</a>
            </div>


            <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2 col-lg-push-1 text-right">
                <strong>
                <h4>Total $ <asp:Label ID="total" runat="server" Text="0"></asp:Label>
                        </h4>
            </strong></div>
           <div class="col-lg-4 col-md-4 col-sm-2 col-xs-2 text-right">
            <div>
                <asp:Button ID="bb1" runat="server" Text="Checkout" class="btn btn-info" OnClick="bb1_Click"  />
            </div>

        </div>

                </div>
          </div>
         </div>

    </div>
      <script type="text/javascript">
        function update_cart(id)
        {
            var tid = 'text' + id;
            var textvalue = document.getElementById(tid).value;
            window.location = 'refresh_cart.aspx?id='+id + '&textvalue=' + textvalue;
        }
      </script>
         
</asp:Content>


