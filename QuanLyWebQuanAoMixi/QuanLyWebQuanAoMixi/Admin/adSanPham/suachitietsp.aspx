<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="suachitietsp.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adSanPham.suachitietsp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentadmin1" runat="server">


    <div style="width: 1000px; margin-left: 200px; margin-top: 50px">

        <h2>Thêm chi tiết sản phẩm</h2>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Kích thước</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtkichthuoc"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Số lượng</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtsoluong"></asp:TextBox>
        </div>



        <div>
            <asp:Button CssClass="btn btn-primary" ID="btnLuu" runat="server" Text="Lưu" OnClick="btnLuu_Click"/>
        </div>
    </div>

</asp:Content>
