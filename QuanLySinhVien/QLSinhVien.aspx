<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QLSinhVien.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:auto">
        <table style="margin:auto">
        <tr>
            <td colspan="2">
                <h1 style="text-align:center">Quản lý Sinh Viên</h1>
            </td>
        </tr>

        <tr>
            <td style="text-align:right">Mã sinh viên:</td>
            <td ><asp:TextBox ID="txtMSV" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td style="text-align:right;" class="auto-style1">Họ tên:</td>
            <td class="auto-style1"><asp:TextBox ID="txtHoten" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td style="text-align:right;">Quê quán:</td>
            <td><asp:TextBox ID="txtQuequan" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td style="text-align:right;">Giới tính:</td>
            <td>
                <asp:RadioButton GroupName="gioitinh" ID="RadioNam" runat="server" Text="Nam" />
                <asp:RadioButton GroupName="gioitinh" ID="RadioNu" runat="server" Text="Nữ" />
            </td>
        </tr>

        <tr>
            <td style="text-align:right">Khoa:</td>
            <td>
                <asp:DropDownList ID="ListKhoa" runat="server" Height="25px" Width="175px"></asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td style="text-align:right">Lớp</td>
            <td><asp:DropDownList ID="ListLop" runat="server" Height="25px" Width="175px"></asp:DropDownList></td>
        </tr>

        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Button ID="btnThem" runat="server" Text="Thêm"  class="buttoncapnhat"/>
                <asp:Button ID="btnCapnhat" runat="server" Text="Cập nhật" class="buttoncapnhat"/>
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" class="buttoncapnhat"/>
            </td>
        </tr>
    </table>
    </div>

        <h2 style="text-align:center">Danh sách</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin:auto">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã Sinh Viên" SortExpression="MaSV" />
                <asp:BoundField DataField="Fullname" HeaderText="Họ tên" SortExpression="Fullname" />
                <asp:BoundField DataField="Gioitinh" HeaderText="Giới tính" SortExpression="Gioitinh" />
                <asp:BoundField DataField="Que" HeaderText="Quê quán" SortExpression="Que" />
                <asp:BoundField DataField="TenLop" HeaderText="Lớp" SortExpression="TenLop" />
                <asp:BoundField DataField="TenKhoa" HeaderText="Khoa" SortExpression="TenKhoa" />
                <asp:TemplateField HeaderText="Sửa">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Edit" Text="Sửa"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Xóa">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Delete" Text="Xóa"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </form>
</body>
</html>
