<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="themloaisp.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adLoaiSanPham.themloaisp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentadmin1" runat="server">

    <div style="width: 1000px; margin-left: 200px; margin-top: 50px">

        <h2>Thêm loại sản phẩm</h2>
    


        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Tên loại</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txttenloai"></asp:TextBox>
        </div>

       

        <div>
            <asp:Button CssClass="btn btn-primary" ID="btnthem" runat="server" Text="Thêm" OnClick="btnthem_Click"/>
        </div>
    </div>

</asp:Content>
