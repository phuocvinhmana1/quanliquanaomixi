<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adSanPham.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentadmin1" runat="server">



    <div>

        <div class="row g-2" style="margin-left: 50px">

            <div class="col-3">
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Admin/adSanPham/themsanpham.aspx" runat="server" Text="Thêm sản phẩm"></asp:HyperLink>
            </div>

            <div class="col-7">
                <div class="container-fluid">

                    <div class="row g-2" style="margin-left: 20px">
                        <div class="col-8">

                            <asp:TextBox ID="txttimkiem" runat="server" CssClass="form-control me-2" placeholder="Nhập một cái gì đó..." AutoPostBack="True" OnTextChanged="txttimkiem_TextChanged"></asp:TextBox>
                        </div>
                        <div class="col-2" style="margin-left: 20px">

                            <asp:Button ID="btntimkiem" runat="server" CssClass="btn btn-outline-success" Text="Tìm kiếm" OnClick="btntimkiem_Click" />
                        </div>

                    </div>
                </div>
            </div>



        </div>


        <div style="margin-left:50px; margin-top:30px">


            <asp:GridView ID="gridviewgiohang" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="1300px" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                    <asp:BoundField DataField="TenLoaiSP" HeaderText="Loại SP" />
                    <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                    <asp:BoundField DataField="ThuongHieu" HeaderText="Thương hiệu" />
                    <asp:BoundField DataField="XuatXu" HeaderText="Xuất xứ" />
                    <asp:BoundField DataField="NgayThem" HeaderText="Ngày thêm" />
                    <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                    <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
                    <asp:BoundField DataField="GiaBan" HeaderText="Giá" />
                    <asp:ImageField ControlStyle-Height="100" ControlStyle-Width="100" DataImageUrlField="HinhAnh" HeaderText="Hình ảnh">
                        <ControlStyle Height="100px" Width="100px"></ControlStyle>
                    </asp:ImageField>
                    <asp:HyperLinkField Text="Sửa" DataNavigateUrlFields="MaSP" DataNavigateUrlFormatString="~/Admin/adSanPham/suasanpham.aspx?MaSP={0}" />
                    <asp:HyperLinkField Text="Xóa" DataNavigateUrlFields="MaSP" DataNavigateUrlFormatString="~/Admin/adSanPham/xoasanpham.aspx?MaSP={0}" />
                    <asp:HyperLinkField Text="Chi tiết" DataNavigateUrlFields="MaSP" DataNavigateUrlFormatString="~/Admin/adSanPham/chitietsp.aspx?MaSP={0}" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>


        </div>

    </div>

</asp:Content>
