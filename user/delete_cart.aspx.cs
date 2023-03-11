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
    public partial class delete_cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\zzc\\Desktop\\shop cart\\shopping_website\\App_Data\\shopping.mdf\";Integrated Security=True");
        int x; 
        string y;
        string t;
        string[] list = new string[6]; 
        double amount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {


            x = Convert.ToInt32(Request.QueryString["id"].ToString());

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


           

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from product where id=" + x + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        

            int m = 0;
            if (Request.Cookies["cookie"] != null)
            {
                y = Convert.ToString(Request.Cookies["cookie"].Value);
                string[] strArr = y.Split('|');
                for (int i = 0; i < strArr.Length; i++)
                {
                    m++;
                }
            }

            if (m == 1)
            {
                Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(-1);
            }
            else
            {

                DataTable dt1 = new DataTable();
                dt1.Columns.AddRange(new DataColumn[7] { new DataColumn("productname"), new DataColumn("productprice"), new DataColumn("productqty"), new DataColumn("producttotal"), new DataColumn("productimages"), new DataColumn("id"), new DataColumn("cookieid") });



                if (Request.Cookies["cookie"] != null)
                {
                    y = Convert.ToString(Request.Cookies["cookie"].Value);
                    string[] strArr = y.Split('|');
                    for (int i = 0; i < strArr.Length; i++)
                    {
                        t = Convert.ToString(strArr[i].ToString());
                        string[] strArr1 = t.Split('&');
                        for (int j = 0; j < strArr1.Length; j++)
                        {

                            list[j] = strArr1[j].ToString();

                        }

                     
                       
                           amount = Convert.ToDouble(list[1].ToString()) * Convert.ToDouble(list[2].ToString());
                            dt1.Rows.Add(list[0].ToString(), list[1].ToString(), list[2].ToString(), amount.ToString(), list[3].ToString(), list[4].ToString(), i.ToString());

                        






                    }
                }




                int count = 0;
                foreach (DataRow dr2 in dt1.Rows)
                {

                    if (count == 0)
                    {
                        Response.Cookies["cookie"].Value = dr2["productname"].ToString() + "&" + dr2["productprice"].ToString() + "&" + dr2["productqty"].ToString() + "&" + dr2["productimages"].ToString() + "&" + dr2["id"].ToString();
                        Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(1);
                    }

                    else
                    {

                        Response.Cookies["cookie"].Value = Response.Cookies["cookie"].Value + "|" + dr2["productname"].ToString() + "&" + dr2["productprice"].ToString() + "&" + dr2["productqty"].ToString() + "&" + dr2["productimages"].ToString() + "&" + dr2["id"].ToString();
                        Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(1);
                    }

                    count++;

                }




            }
            Response.Redirect("view_cart.aspx");


        }
    }
}