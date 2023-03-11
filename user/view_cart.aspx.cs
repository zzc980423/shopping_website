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
    public partial class view_cart : System.Web.UI.Page
    {
        string convert;
        string convert2;
        string[] list = new string[6];
        double count = 0;
        double total_price = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] { new DataColumn("productname"), new DataColumn("productprice"), new DataColumn("productqty"), new DataColumn("producttotal"), new DataColumn("productimages"), new DataColumn("id"), new DataColumn("cookieid") });

            if (Request.Cookies["cookie"] != null)
            {
                convert = Convert.ToString(Request.Cookies["cookie"].Value);
                string[] strArr = convert.Split('|');
                for (int i = 0; i < strArr.Length; i++)
                {
                    convert2 = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = convert2.Split('&');
                    for (int j = 0; j < strArr1.Length; j++)
                    {

                        list[j] = strArr1[j].ToString();

                    }
                    total_price = Convert.ToDouble(list[1].ToString()) * Convert.ToDouble(list[2].ToString());
                    dt.Rows.Add(list[0].ToString(), list[1].ToString(), list[2].ToString(), total_price.ToString(), list[3].ToString(), list[4].ToString(), i.ToString());

                    count = count + (Convert.ToDouble(list[1].ToString()) * Convert.ToDouble(list[2].ToString()));
                }
            }

            else
            {
                Response.Write("<script>alert('The cart is empty.'); window.location='display_item.aspx';</script>");
            }
                d1.DataSource = dt;
                d1.DataBind();


            total.Text = count.ToString();
        }

        protected void b1_Click(object sender, EventArgs e)
        {

        }

        protected void bb1_Click(object sender, EventArgs e)
        {
            Session["checkoutbutton"] = "yes";
            Response.Redirect("checkout.aspx");
        }
    }
}