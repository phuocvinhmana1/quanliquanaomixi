<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="chitietgiohang.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adDonHang.chitietgiohang" %>

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


        <div style="margin-left: 50px; margin-top: 30px">


            <asp:GridView ID="gridviewctgiohang" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="1300px" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="MaChiTietSP" HeaderText="Mã SP" />
                    <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                    <asp:BoundField DataField="KichThuoc" HeaderText="Kích thước" />
                    <asp:BoundField DataField="GiaBan" HeaderText="Giá" />
                    <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />               

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
