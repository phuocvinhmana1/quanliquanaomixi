<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adLoaiSanPham.index" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentadmin1" runat="server">

    <div>

        <div class="row g-2" style="margin-left: 50px">

            <div class="col-3">
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Admin/adLoaiSanPham/themloaisp.aspx" runat="server" Text="Thêm sản phẩm"></asp:HyperLink>
            </div>

            <div class="col-7">
                <div class="container-fluid">

                    <div class="row g-2" style="margin-left: 20px">
                        <div class="col-8">

                            <asp:TextBox ID="txttimkiem" runat="server" CssClass="form-control me-2" placeholder="Nhập một cái gì đó..." AutoPostBack="True"></asp:TextBox>
                        </div>
                        <div class="col-2" style="margin-left: 20px">

                            <asp:Button ID="btntimkiem" runat="server" CssClass="btn btn-outline-success" Text="Tìm kiếm"/>
                        </div>

                    </div>
                </div>
            </div>



        </div>


        <div style="margin-left: 300px; margin-top: 30px">


            <asp:GridView ID="gridviewloaisp" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="800px" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="MaLoaiSP" HeaderText="Mã loại" />
                    <asp:BoundField DataField="TenLoaiSP" HeaderText="Tên Loại SP" />
                    
                   
                    <asp:HyperLinkField Text="Sửa" DataNavigateUrlFields="MaLoaiSP" DataNavigateUrlFormatString="~/Admin/adLoaiSanPham/sualoaisp.aspx?maloaisp={0}" />
   
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
