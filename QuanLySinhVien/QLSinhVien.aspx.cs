using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadGrid();
        btnCapnhat.Visible = false;
        btnHuy.Visible = false;
        btnThem.Visible = true;
    }

    private void loadGrid()
    {
        SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=QLSV_1;User ID=tranduc; Password=312");
        conn.Open();
        SqlCommand cmd = new SqlCommand("LoadSinhVien", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable table = new DataTable();
        ad.Fill(table);
        GridView1.DataSource = table;
        GridView1.DataBind();
    }
}