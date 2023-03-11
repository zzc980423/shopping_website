using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace shopping_website.user

{
    public partial class pay : System.Web.UI.Page
    {
        double b = 0;
        string x;
        string y;
        string[] q = new string[6];
        string order;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (Request.Cookies["cookie"] != null)
            {
                x = Convert.ToString(Request.Cookies["cookie"].Value);
                string[] strArr = x.Split('|');
                for (int i = 0; i < strArr.Length; i++)
                {
                    y = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = y.Split('&');
                    for (int j = 0; j < strArr1.Length; j++)
                    {

                        q[j] = strArr1[j].ToString();

                    }
                    b = b + (Convert.ToDouble(q[1].ToString()) * Convert.ToDouble(q[2].ToString()));
                }

                Session["tot"] = b.ToString();
            }


            order = GetRandomPassword(10).ToString();
            Session["order_no"] = order.ToString();


            Response.Write("<form action='https://www.sandbox.paypal.com/cgi-bin/webscr' method='post' name='buyCredits' id='buyCredits'>");
            Response.Write("<input type='hidden' name='cmd' value='_xclick'>");
            Response.Write("<input type='hidden' name='business' value='sb-s50ps25257383@business.example.com'>");
            Response.Write("<input type='hidden' name='currency_code' value='USD'>");
            Response.Write("<input type='hidden' name='item_name' value='payment for purchase'>");
            Response.Write("<input type='hidden' name='item_number' value='0'>");
            Response.Write("<input type='hidden' name='amount' value='" + Session["tot"].ToString() + "'>");
            Response.Write("<input type='hidden' name='return' value='https://localhost:44337/user/pay_result.aspx?order=" + order.ToString() + "'>");
            Response.Write("</form>");

            Response.Write("<script type='text/javascript'>");
            Response.Write("document.getElementById('buyCredits').submit();");
            Response.Write("</script>");




        }

        public static string GetRandomPassword(int length)
        {
            char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            string password = string.Empty;
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                int x = random.Next(1, chars.Length);
                if (!password.Contains(chars.GetValue(x).ToString()))
                    password += chars.GetValue(x);
                else
                    i = i - 1;
            }
            return password;
        }
    }
}