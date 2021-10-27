<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adDonHang.index" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentadmin1" runat="server">


    <div>

        <div class="row g-2" style="margin-left: 50px">


            <div class="col-7">
                <div class="container-fluid">

                    <div class="row g-2" style="margin-left: 20px">
                        <div class="col-8">

                            <asp:TextBox ID="txttimkiem" runat="server" CssClass="form-control me-2" placeholder="Nhập một cái gì đó..." AutoPostBack="True"></asp:TextBox>
                        </div>
                        <div class="col-2" style="margin-left: 20px">

                            <asp:Button ID="btntimkiem" runat="server" CssClass="btn btn-outline-success" Text="Tìm kiếm" />
                        </div>

                    </div>
                </div>
            </div>



        </div>


        <div style="margin-left:50px; margin-top:30px">


            <asp:GridView ID="gridviewdonhang" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="1300px" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="MaGioHang" HeaderText="Mã giỏ hàng" />
                    <asp:BoundField DataField="HoTen" HeaderText="Tên khách" />
                    <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                    <asp:BoundField DataField="NgayMua" HeaderText="Ngày mua" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />

            
                    <asp:HyperLinkField Text="Chi tiết" DataNavigateUrlFields="MaGioHang" DataNavigateUrlFormatString="~/Admin/adDonHang/chitietgiohang.aspx?MaGioHang={0}" />
                  
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
