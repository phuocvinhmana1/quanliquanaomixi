<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="sanpham.aspx.cs" Inherits="QuanLyWebQuanAoMixi.User.sanpham" %>



<asp:Content ID="Content1" ContentPlaceHolderID="admin1" runat="server">
    <!-- Start Shop Page  -->
    <form id="form1" runat="server">
    <asp:Literal ID="lbl2" runat="server"></asp:Literal>

    <div class="shop-box-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span id="sapxep">Sắp xếp theo</span>
                                    <%-- <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
                                        <option data-display="Select">Tất cả</option>
                                        <option value="1">Giá từ cao đến thấp</option>
                                        <option value="2">Giá từ thấp đến cao</option>
                                        <option value="3">Mới nhất</option>
                                        <option value="4">Cũ nhất</option>
                                    </select>--%>

                                    <asp:Literal ID="lbltest1" runat="server"></asp:Literal>
                                    <asp:DropDownList ID="dropdownSapXep"
                                        AutoPostBack="True"
                                        runat="server"
                                        CssClass="selectpicker show-tick form-control" OnSelectedIndexChanged="dropdownSapXep_SelectedIndexChanged">

                                        <asp:ListItem Selected="True" Value="Mặc định"> Mặc định </asp:ListItem>
                                        <asp:ListItem Value="Giá từ thấp đến cao"> Giá từ thấp đến cao </asp:ListItem>
                                        <asp:ListItem Value="Giá từ cao đến thấp"> Giá từ cao đến thấp </asp:ListItem>
                                        <asp:ListItem Value="Mới nhất">  Mới nhất  </asp:ListItem>
                                        <asp:ListItem Value="Cũ nhất"> Cũ nhất </asp:ListItem>

                                    </asp:DropDownList>

                                    <style style="text/css">
                                        #sapxep {
                                            font-size: 13px;
                                        }
                                    </style>
                                </div>
                                <asp:Literal ID="lblHienThiSoSP" runat="server"></asp:Literal>
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"><i class="fa fa-th"></i></a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"><i class="fa fa-list-ul"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">
                                        <asp:Literal ID="lblHienThiSP" runat="server"></asp:Literal>
                                     
                                    </div>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form action="#">

                                <asp:TextBox ID="txttimkiem" CssClass="form-control" runat="server" placeholder="Tìm kiếm..." OnTextChanged="txttimkiem_TextChanged"></asp:TextBox>
                                
                                <asp:Button runat="server" id="btntimkiem" Text="Tìm" Width="90px" CssClass="btn btn-black" OnClick="btntimkiem_Click" />
                            </form>
                        </div>
                        <div class="filter-sidebar-left" style="margin-top:20px">
                            <div class="title-left">
                                <h3>Danh mục</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">

                                <asp:Literal ID="lbldanhmuc" runat="server"></asp:Literal>
                                <style type="text/css">
                                    #danhmuc1 {
                                        font-size: 18px;
                                        font-weight: bold;
                                    }
                                </style>

                            </div>
                        </div>
                        <div class="filter-price-left">
                            <div class="title-left">
                                <h3>Price</h3>
                            </div>
                            <div class="price-box-slider">
                                <div id="slider-range"></div>
                                <p>
                                    <input type="text" id="amount" readonly style="border: 0; color: #fbb714; font-weight: bold;">
                                    <button class="btn hvr-hover" type="submit">Filter</button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Page -->

    <!-- Start Instagram Feed  -->
  
    <!-- End Instagram Feed  -->
</form>
</asp:Content>

