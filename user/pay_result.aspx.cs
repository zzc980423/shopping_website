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
    public partial class pay_result: System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\zzc\\Desktop\\shop cart\\shopping_website\\App_Data\\shopping.mdf\";Integrated Security=True");


        string order = "";
        string order_id;
        string s;
        string t;
        string[] a = new string[6];
        protected void Page_Load(object sender, EventArgs e)
        {

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


            order = Request.QueryString["order"].ToString();

            if (order == Session["order_no"].ToString())
            {

                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from signup where email='" + Session["user"].ToString() + "'";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "insert into [order] values('" + dr["firstname"].ToString() + "','" + dr["lastname"].ToString() + "','" + dr["email"].ToString() + "','" + dr["address"].ToString() + "','" + dr["mobile"].ToString() + "')";
                    cmd1.ExecuteNonQuery();
                }


                SqlCommand cmd2 = con.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "select top 1 * from [order] where email='" + Session["user"].ToString() + "' order by id desc ";
                cmd2.ExecuteNonQuery();
                DataTable dt2 = new DataTable();
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                da2.Fill(dt2);
                foreach (DataRow dr2 in dt2.Rows)
                {
                    order_id = dr2["id"].ToString();
                }


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

                            a[j] = strArr1[j].ToString();

                        }

                        SqlCommand cmd1 = con.CreateCommand();
                        cmd1.CommandType = CommandType.Text;
                        cmd1.CommandText = "update product set product_qty=product_qty-" + a[2].ToString() + " where id=" + a[4].ToString();
                        cmd1.ExecuteNonQuery();

                        double gtotal = 0;
                        gtotal = Convert.ToDouble(a[1].ToString()) * Convert.ToDouble(a[2].ToString());

                        SqlCommand cmd3 = con.CreateCommand();
                        cmd3.CommandType = CommandType.Text;
                        cmd3.CommandText = "insert into order_details values('" + order_id.ToString() + "','" + a[0].ToString() + "','" + a[1].ToString() + "','" + a[2].ToString() + "','" + gtotal.ToString() + "','" + a[3].ToString() + "')";
                        cmd3.ExecuteNonQuery();

                    }

                }

            }
            else
            {
                Response.Redirect("login.aspx");
            }



            Session["user"] = null;
            Session["checkoutbutton"] = null;
            Session["deliverydate"] = null;
            Session["deliverytime"] = null;

            Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(-1);

            Response.Write("<script> alert('Your order is on the way'); window.location='display_item.aspx'; </script> ");


        }
    }
}