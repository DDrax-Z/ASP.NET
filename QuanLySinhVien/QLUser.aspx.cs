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
        btnCapNhat.Visible = false;
        btnThem.Visible = true;
        btnHuy.Visible = false;
    }

    private void loadGrid()
    {
        SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=QLSV_1;User ID=tranduc; Password=312");
        conn.Open();
        SqlDataAdapter ad = new SqlDataAdapter("SELECT ID,Fullname, Email, Username, Password FROM DangNhap", conn);
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
        resetForm();
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        if (e.CommandName.Equals("Xoa"))
        {
            Xoa(e.CommandArgument.ToString());
            loadGrid();
        }
        if (e.CommandName.Equals("Sua"))
        {
            loadForm((GridViewRow)((Control)e.CommandSource).NamingContainer, e.CommandArgument.ToString());
            btnThem.Visible = false;
            btnCapNhat.Visible = true;
            btnHuy.Visible = true;
        }
    }

    private void Xoa(String ID)
    {
        SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=QLSV_1;User ID=tranduc; Password=312");
        conn.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM DangNhap WHERE ID=@ID", conn);
        cmd.Parameters.AddWithValue("@ID", ID);
        try
        {
            cmd.ExecuteNonQuery();
            loadGrid();
            resetForm();
        }
        catch (SqlException)
        {
        }
    }

    public static String giatridong(GridViewRow r, String col)
    {
        //int columnIndex = 0;
        foreach (DataControlFieldCell cell in r.Cells)
        {
            if (cell.ContainingField is BoundField)
                if (((BoundField)cell.ContainingField).DataField.Equals(col))
                    return HttpUtility.HtmlDecode(cell.Text);
        }
        return "";
    }

    private void loadForm(GridViewRow row, String ID)
    {
        ViewState.Add("ID", ID);
        txtHoten.Text = giatridong(row, "Fullname");
        txtEmail.Text = giatridong(row, "Email");
        txtUser.Text = giatridong(row, "Username");
        txtPass.Text = giatridong(row, "Password");
    }

    private void resetForm()
    {
        ViewState.Remove("ID");
        txtHoten.Text = "";
        txtEmail.Text = "";
        txtUser.Text = "";
        txtPass.Text = "";
    }
    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=QLSV_1;User ID=tranduc;Password=312");
        conn.Open();
        SqlCommand cmd = new SqlCommand("UPDATE DangNhap SET Username=@Username, Password=@Password, Email=@Email, Fullname=@Fullname WHERE ID=@ID", conn);
        cmd.Parameters.AddWithValue("@Username", txtUser.Text);
        cmd.Parameters.AddWithValue("@Password", txtPass.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Fullname", txtHoten.Text);
        cmd.Parameters.AddWithValue("@ID", ViewState["ID"].ToString());
        cmd.ExecuteNonQuery();
        loadGrid();
        resetForm();
    }


    protected void btnHuy_Click(object sender, EventArgs e)
    {
        resetForm();
        btnHuy.Visible = false;
        btnCapNhat.Visible = false;
        btnThem.Visible = true;
    }
}