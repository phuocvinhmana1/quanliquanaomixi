<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="QuanLyWebQuanAoMixi.User.TrangChu" %>



<asp:Content ID="Content1" ContentPlaceHolderID="admin1" runat="server">
    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                
                <asp:Image ID="Image1" runat="server" ImageUrl="../HinhAnh/AnhSlider/slider1.jpg" />
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To
                                <br>
                                 MixiShop</strong></h1>
                            <p class="m-b-40">
                               Đây là website được lấy dữ liệu từ shop.mixigaming.com
                                <br>
                              
                            </p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <asp:Image ID="Image4" runat="server" ImageUrl="../HinhAnh/AnhSlider/slider2.jpg" />
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To
                                <br>
                                MixiShop</strong></h1>
                            <p class="m-b-40">
                               Đây là website được lấy dữ liệu từ shop.mixigaming.com
                                <br>
                                Không sử dụng với mục đích thương mại
                            </p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <asp:Image ID="Image5" runat="server" ImageUrl="../HinhAnh/AnhSlider/slider3.jpg" />
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To
                                <br>
                               MixiShop</strong></h1>
                            <p class="m-b-40">
                               Đây là website được lấy dữ liệu từ shop.mixigaming.com
                                <br>
                                Không sử dụng với mục đích thương mại
                            </p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->


</asp:Content>
