<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="taikhoan.aspx.cs" Inherits="QuanLyWebQuanAoMixi.DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin1" runat="server">

    <form id="form1" runat="server">
        <
        <div class="cart-box-main">
            <div class="container">
                <div class="row new-account-login">
                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="title-left">
                            <h3>Đăng nhập</h3>
                        </div>


                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Tên đăng nhập</label>
                                <asp:TextBox ID="txttendangnhap" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="InputPassword" class="mb-0">Password</label>
                                <asp:TextBox ID="txtmatkhau" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button id="btndangnhap" runat="server" CssClass="btn hvr-hover" Text="Đăng nhập" OnClick="btndangnhap_Click"/>

                    </div>


                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="title-left">
                            <h3>Đăng ký</h3>
                        </div>


                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Tên đăng nhập</label>
                                <asp:TextBox ID="txttendangnhapdk" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                             <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Mật khẩu</label>
                                <asp:TextBox ID="txtmatkhaudk" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Họ và tên</label>
                                <asp:TextBox ID="txthoten" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Số điện thoại</label>
                                <asp:TextBox ID="txtsdt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Email</label>
                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Địa chỉ</label>
                                <asp:TextBox ID="txtdiachi" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                       
                        <asp:Button id="btndangky" runat="server" CssClass="btn hvr-hover" Text="Đăng ký" OnClick="btndangky_Click1" />

                    </div>

                </div>


            </div>
        </div>
    </form>
</asp:Content>
