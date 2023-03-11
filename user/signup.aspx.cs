using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Configuration;
using System.Net;
using System.IO;
using System.Reflection.Emit;
using System.Drawing;

namespace shopping_website.user
{
    public partial class signup : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\zzc\\Desktop\\shop cart\\shopping_website\\App_Data\\shopping.mdf\";Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into signup values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "', '" + TextBox6.Text + "','" + TextBox7.Text + "')";
            cmd.ExecuteNonQuery();

            Response.Redirect("test.aspx");


            con.Close();

        }
    }
}