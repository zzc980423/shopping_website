using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace shopping_website.user

{
    public partial class refresh_cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\zzc\\Desktop\\shop cart\\shopping_website\\App_Data\\shopping.mdf\";Integrated Security=True");

        int id;
        int qty ;
        string s;
        string t;
        string[] list = new string[6];
        double countt = 0;
        double total_price = 0;
        double x;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            qty = Convert.ToInt32(Request.QueryString["textvalue"].ToString());

            
           

            string productname = "",  productprice = "", productqty = "", productimages = "";

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from product where id=" + id + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                productname = dr["product_name"].ToString();
                productprice = dr["product_price"].ToString();
                productqty = dr["product_qty"].ToString();
                productimages = dr["product_images"].ToString();
            }


            if (Convert.ToInt32(qty.ToString()) > Convert.ToInt32(productqty.ToString()))
            {
                Response.Write("<script>alert('Please decrease the quantity'); window.location='view_cart.aspx';</script>");
            }
            else
            {


                if (Request.Cookies["cookie"] == null)
                {
                    Response.Cookies["cookie"].Value = productname.ToString() + "&" + productprice.ToString() + "&" + qty.ToString() + "&" + productimages.ToString() + "&" + id.ToString();
                    Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {

                    DataTable dt1 = new DataTable();
                    dt1.Columns.AddRange(new DataColumn[7] { new DataColumn("productname"), new DataColumn("productprice"), new DataColumn("productqty"), new DataColumn("producttotal"), new DataColumn("productimages"), new DataColumn("id"), new DataColumn("cookieid") });

                    DataTable dt2 = new DataTable();
                    dt2.Columns.AddRange(new DataColumn[7] { new DataColumn("productname"), new DataColumn("productprice"), new DataColumn("productqty"), new DataColumn("producttotal"), new DataColumn("productimages"), new DataColumn("id"), new DataColumn("cookieid") });


                    if (Request.Cookies["cookie"] != null)
                    {
                        s = Convert.ToString(Request.Cookies["cookie"].Value);
                        string[] strArr = s.Split('|');
                        for (int i = 0; i < strArr.Length; i++)
                        {
                            t = Convert.ToString(strArr[i].ToString());
                            string[] strArr1 = t.Split('&');
                            for (int j = 0; j < strArr1.Length; j++)
                            {

                                list[j] = strArr1[j].ToString();

                            }
                            total_price = Convert.ToDouble(list[1].ToString()) * Convert.ToDouble(list[2].ToString());
                            dt1.Rows.Add(list[0].ToString(), list[1].ToString(), list[2].ToString(), total_price.ToString(), list[3].ToString(), list[4].ToString(), i.ToString());

                            countt = countt + (Convert.ToDouble(list[1].ToString()) * Convert.ToDouble(list[2].ToString()));
                        }
                    }

                    Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(-1);

                    int found = 0;
                    dt2.Rows.Clear();
                    foreach (DataRow dr1 in dt1.Rows)
                    {
                        x = 0;
                        if (dr1["id"].ToString() == id.ToString())
                        {
                            found = 1;
                            String oldqty = dr1["productqty"].ToString();
                            String newqty = Convert.ToString(Convert.ToInt32(qty.ToString()));

                            x = Convert.ToDouble(dr1["productprice"].ToString()) * Convert.ToDouble(newqty.ToString());
                            dt2.Rows.Add(dr1["productname"].ToString(), dr1["productprice"].ToString(), newqty.ToString(), x.ToString(), dr1["productimages"].ToString(), dr1["id"].ToString(), dr1["cookieid"].ToString());
                        }
                        else
                        {
                            dt2.Rows.Add(dr1["productname"].ToString(), dr1["productprice"].ToString(), dr1["productqty"].ToString(), dr1["producttotal"].ToString(), dr1["productimages"].ToString(), dr1["id"].ToString(), dr1["cookieid"].ToString());
                        }

                    }


                    if (found == 0)
                    {
                        x = Convert.ToDouble(productprice.ToString()) * Convert.ToDouble(qty.ToString());
                        dt2.Rows.Add(productname.ToString(), productprice.ToString(), qty.ToString(), x.ToString(), productimages.ToString(), id.ToString(), "");

                    }




                    int count = 0;
                    foreach (DataRow dr2 in dt2.Rows)
                    {

                        if (count == 0)
                        {
                            Response.Cookies["cookie"].Value = dr2["productname"].ToString() + "&" + dr2["productprice"].ToString() + "&" + dr2["productqty"].ToString() + "&" + dr2["productimages"].ToString() + "&" + dr2["id"].ToString();
                            Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(1);
                        }

                        else
                        {
                          
                            Response.Cookies["cookie"].Value = Response.Cookies["cookies"].Value + "|" + dr2["productname"].ToString() + "&" + dr2["productprice"].ToString() + "&" + dr2["productqty"].ToString() + "&" + dr2["productimages"].ToString() + "&" + dr2["id"].ToString();
                            Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(1);
                        }

                        count++;

                    }
                }
                Response.Redirect("view_cart.aspx");
            }


        }
    }
}