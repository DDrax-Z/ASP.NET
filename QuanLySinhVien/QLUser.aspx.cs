using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class QLUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadGrid();
    }

    private void loadGrid()
    {
        SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=QLSV_1;User ID=tranduc; Password=312");
        conn.Open();
        SqlDataAdapter ad = new SqlDataAdapter("SELECT Fullname, Email, Username, Password FROM DangNhap", conn);
        DataTable table = new DataTable();
        ad.Fill(table);
        GridView1.DataSource = table;
        GridView1.DataBind();
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=QLSV_1;User ID=tranduc; Password=312");
        conn.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO DangNhap (Username, Password, Email, Fullname) VALUES (@username, @password, @email, @fullname)", conn);
        cmd.Parameters.AddWithValue("@username", txtUser.Text);
        cmd.Parameters.AddWithValue("@password", txtPass.Text);
        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@fullname", txtHoten.Text);
        cmd.ExecuteNonQuery();
        loadGrid();
    }
}