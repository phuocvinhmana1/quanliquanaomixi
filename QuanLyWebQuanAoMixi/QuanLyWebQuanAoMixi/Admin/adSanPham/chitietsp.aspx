<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="chitietsp.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adSanPham.chitietsp" %>

<asp:Content ContentPlaceHolderID="contentadmin1" runat="server">

    <div class="row g-2" style="margin-left: 200px; margin-bottom:15px;margin-top:50px">

        <div class="col-3">
          
            <asp:Literal ID="lblthemspLink" runat="server"></asp:Literal> 
           
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

    <asp:GridView ID="GridView2" runat="server" HorizontalAlign="Center" RowHeaderColumn="TenSP" Width="1100px" CellPadding="4" EnableModelValidation="False" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCommand="GridView2_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MaChiTietSP" HeaderText="Mã CTSP" />
            <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
            <asp:BoundField DataField="KichThuoc" HeaderText="Kích thước" />
            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
            <asp:HyperLinkField Text="Sửa" DataNavigateUrlFields="MaChiTietSP" DataNavigateUrlFormatString="/Admin/adSanPham/suachitietsp.aspx?masp={0}" />
            <asp:ButtonField Text="Xóa" ButtonType="Link"  HeaderText="Xóa" CommandName="xoactsp"/>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Justify" VerticalAlign="Bottom" />
        <SelectedRowStyle BorderStyle="Dotted" BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

    </asp:GridView>
</asp:Content>



