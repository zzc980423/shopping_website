using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace shopping_website.user
{
    public partial class order_continue : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\zzc\\Desktop\\shop cart\\shopping_website\\App_Data\\shopping.mdf\";Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (IsPostBack)
            {
                return;
            }
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from signup where email ='" + Session["user"].ToString() + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                t1.Text = dr["firstname"].ToString();
                t2.Text = dr["lastname"].ToString();
                t3.Text = dr["address"].ToString();
                t4.Text = dr["mobile"].ToString();


            }

            con.Close();

        }
        protected void b1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update signup set firstname='" + t1.Text + "',lastname='" + t2.Text + "', address='" + t3.Text +"', mobile ='" + t4.Text +"' where email='" + Session["user"].ToString() + "'";
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("pay.aspx");
        }
    }
}