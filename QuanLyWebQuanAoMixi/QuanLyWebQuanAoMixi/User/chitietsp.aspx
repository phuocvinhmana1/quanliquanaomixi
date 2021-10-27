<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="chitietsp.aspx.cs" Inherits="QuanLyWebQuanAoMixi.User.chitietsp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="admin1" runat="server">
    <form id="form1" runat="server">
        <div class="shop-detail-box-main">
            <div class="container">

                 <div class='row'>
                <div class='col-xl-5 col-lg-5 col-md-6'>
                    <div id='carousel-example-1' class='single-product-slider carousel slide' data-ride='carousel'>
                        <div class='carousel-inner' role='listbox'>
                            <div class='carousel-item active'>                              
                                <asp:Literal ID="lblanhsp" runat="server"></asp:Literal>
                            </div>                        
                        </div>
                        
                       
                    </div>
                </div>
                <div class='col-xl-7 col-lg-7 col-md-6'>
                    <div class='single-product-details'>
                        <asp:Literal ID="lbltensp" runat="server"></asp:Literal>
                        <asp:Literal ID="lblgiaban" runat="server"></asp:Literal>
                        <p class='available-stock'>
                            <asp:Literal ID="lblDemSLSP" runat="server"></asp:Literal>
                            <asp:Literal ID="lblmota" runat="server"></asp:Literal>
                            </p>
                        <ul>
                            <li>
                                <div class='form-group quantity-box'>
                                    <label class='control-label'>Số lượng</label>                               
                                    <asp:TextBox ID="txtsoluong" runat="server" CssClass="form-control" TextMode="Number" min="0" max="10" step="1" Text="1"></asp:TextBox>
                                    <label class='control-label'>Chọn size</label>
                                    <asp:DropDownList ID="dropdowchonsize"
                                        AutoPostBack="True"
                                        runat="server"
                                        CssClass="selectpicker show-tick form-control">
                                    </asp:DropDownList>
                                </div>
                            </li>
                        </ul>

                        <div class='price-box-bar'>

                            
                            <div class='cart-and-bay-btn'>
                                <asp:Button id="btnthemvaogio" runat="server" CssClass="btn hvr-hover" Text="Thêm vào giỏ" OnClick="btnthemvaogio_Click"/> 
                                <asp:Literal ID="lblkiemtradangnhap" runat="server"></asp:Literal>                        
                            </div>
                        </div>
                            

                      
                    </div>
                </div>
            </div>







            </div>
        </div>
    </form>
</asp:Content>
