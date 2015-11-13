<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QLUser.aspx.cs" Inherits="QLUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
        .auto-style2 {
            height: 24px;
        }
    </style>
    <link rel="stylesheet" href="1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:auto;">
    <table style="margin:auto">
        <tr>
            <td colspan="2">
                <h1 style="text-align:center">Cập nhật User</h1>
            </td>
        </tr>

        <tr>
            <td style="text-align:right;" class="auto-style1">Họ tên:</td>
            <td class="auto-style1"><asp:TextBox ID="txtHoten" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td style="text-align:right;">Email:</td>
            <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>

            <td style="text-align:right;">Tên đăng nhập:</td>
            <td><asp:TextBox ID="txtUser" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td style="text-align:right;" class="auto-style2">Mật khẩu:</td>
            <td class="auto-style2"><asp:TextBox ID="txtPass" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td colspan="2" style="text-align:center" class="auto-style1">
                <asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" class="buttoncapnhat"/>
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" class="buttoncapnhat" OnClick="btnCapNhat_Click"/>
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" class="buttoncapnhat" OnClick="btnHuy_Click"/>
            </td>
        </tr>
    </table>
    </div>

        <div>
            <h2 style="text-align:center">Danh sách</h2>
            <p style="margin:auto; ">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" class="grid" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Fullname" HeaderText="Họ và tên" SortExpression="Fullname" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Username" HeaderText="Tên đăng nhập" SortExpression="Username" />
                        <asp:BoundField DataField="Password" HeaderText="Mật khẩu" SortExpression="Password" />
                        <asp:TemplateField HeaderText="Sửa">
                            <ItemTemplate>
                                <asp:LinkButton ID="Button1" runat="server" CausesValidation="false" CommandName="Sua" Text="Sửa" CommandArgument='<%# Eval("ID") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Xóa">
                            <ItemTemplate>
                                <asp:LinkButton ID="Button2" runat="server" CausesValidation="false" CommandName="Xoa" Text="Xóa" CommandArgument='<%# Eval("ID") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataTemplate>
                    </EmptyDataTemplate>
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
            </p>

        </div>
    </form>
</body>
</html>
