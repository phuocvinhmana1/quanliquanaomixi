<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="giohang.aspx.cs" Inherits="QuanLyWebQuanAoMixi.User.giohang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin1" runat="server">
    <form id="form1" runat="server">
        <div class="cart-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-main table-responsive">
                            <asp:Literal ID="lblkiemtradn" runat="server"></asp:Literal>
                            <asp:GridView ID="gridviewgiohang" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="1100px" CellSpacing="2" ForeColor="Black" OnRowCommand="gridviewgiohang_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="MaChiTietSP" HeaderText="Mã SP" />
                                    <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                                    <asp:BoundField DataField="KichThuoc" HeaderText="Size" />
                                    <asp:ImageField DataImageUrlField="HinhAnh" HeaderText="Hình ảnh" ControlStyle-Height="100" ControlStyle-Width="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                                    </asp:ImageField>
                                    <asp:BoundField DataField="GiaBan" HeaderText="Giá" />
                                    <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                                    <asp:ButtonField Text="Xóa" ButtonType="Link"  HeaderText="Xóa" CommandName="xoasp"/>
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

                            <%--<table class="table">
                            <thead>
                                <tr>
                                    <th>Mã SP</th>
                                    <th>Tên SP</th>
                                    <th>Size</th>
                                    <th>Hình ảnh</th>
                                    <th>Giá niêm yết</th>
                                    <th>Số lượng</th>
                                    <th>Giá tiền</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="name-pr">
                                        <a href="#">1
                                        </a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">Lorem ipsum dolor sit amet
                                        </a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">XL
                                        </a>
                                    </td>
                                    <td class="thumbnail-img">
                                        <a href="#">
                                            <img class="img-fluid" src="images/img-pro-01.jpg" alt="" />
                                        </a>
                                    </td>

                                    <td class="total-pr">
                                        <p>$ 80.0</p>
                                    </td>

                                    <td class="quantity-box">
                                        <input type="number" size="4" value="1" min="0" step="1" class="c-input-text qty text">
                                    </td>
                                    
                                    <td class="total-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="remove-pr">
                                        <a href="#">
                                            <i class="fas fa-times"></i>
                                        </a>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>--%>
                        </div>
                    </div>
                </div>

                <div class="row my-5">
                    <div class="col-lg-6 col-sm-6">
                        <div class="coupon-box">
                            <div class="input-group input-group-sm">
                                <input class="form-control" placeholder="Nhập mã giảm giá của bạn vào đây" aria-label="Coupon code" type="text">
                                <div class="input-group-append">
                                    <button class="btn btn-theme" type="button">Nhập mã giảm giá</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <div class="update-box">
                            <input value="Update Cart" type="submit">
                        </div>
                    </div>
                </div>

                <div class="row my-5">
                    <div class="col-lg-8 col-sm-12"></div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="order-box">
                            <h3>Thông tin đặt hàng</h3>
                            <div class="d-flex">
                                <h4>Tổng hóa đơn</h4>
                                <asp:Literal ID="lbltonghoadon" runat="server"></asp:Literal>
                            </div>
                            <div class="d-flex">
                                <h4>Giảm giá</h4>
                                <asp:Literal ID="lblgiamgia" runat="server"></asp:Literal>
                            </div>
                            <hr class="my-1">
                            <div class="d-flex">
                                <h4>Mã giảm giá</h4>
                                <asp:Literal ID="lblmagiamgia" runat="server"></asp:Literal>
                            </div>
                            <div class="d-flex">
                                <h4>VAT</h4>
                                <asp:Literal ID="lblvat" runat="server"></asp:Literal>
                            </div>
                            <div class="d-flex">
                                <h4>Vận chuyển</h4>
                                <asp:Literal ID="lblphivanchuyen" runat="server"></asp:Literal>
                            </div>
                            <hr>
                            <div class="d-flex gr-total">
                                <h5>Tổng thanh toán</h5>
                                <asp:Literal ID="lbltongthanhtoan" runat="server"></asp:Literal>
                            </div>
                            <hr>
                        </div>
                    </div>
                    <div class="col-12 d-flex shopping-box">
                        <asp:Button id="btndathang" runat="server" CssClass="ml-auto btn hvr-hover" Text="Hoàn tất đặt hàng" OnClick="btndathang_Click"/>

                    </div>
                </div>

            </div>
        </div>
    </form>
</asp:Content>
