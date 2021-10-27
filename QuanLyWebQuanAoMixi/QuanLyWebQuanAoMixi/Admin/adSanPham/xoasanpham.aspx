<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="xoasanpham.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adSanPham.xoasanpham" %>


<asp:Content ID="Content1" ContentPlaceHolderID="contentadmin1" runat="server">
    <div style="width: 1000px; margin-left: 200px; margin-top: 50px">

        <h2>Xóa sản phẩm</h2>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Mã sản phẩm</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtmasp" Enabled="false"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Tên sản phẩm</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txttensp" Enabled="false"></asp:TextBox>
        </div>

        <div>
            <label for="exampleFormControlInput1" class="form-label">Loại sản phẩm</label>


            <asp:DropDownList ID="cbbloaisp" runat="server" CssClass="form-select" Enabled="false">
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Số lượng</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtsoluong" Enabled="false"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Thương hiệu</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtthuonghieu" Enabled="false"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Xuất xứ</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtxuatxu" Enabled="false"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Ngày thêm</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtngaythem" Enabled="false"></asp:TextBox>
        </div>
      

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Mô tả</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtmota" Enabled="false"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Giới tính</label>
            <asp:DropDownList ID="cbbgioitinh" runat="server" CssClass="form-select" Enabled="false">

                <asp:ListItem Selected="True" Value="Nam và nữ"> Nam và nữ </asp:ListItem>
                <asp:ListItem Value="Nam"> Nam </asp:ListItem>
                <asp:ListItem Value="Nữ"> Nữ </asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Giá bán</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtgiaban" Enabled="false"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Ghi chú</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtghichu" Enabled="false"></asp:TextBox>
        </div>


        <div class="mb-3">
            <label for="formFile" class="form-label">Tải ảnh lên từ máy tính</label>
            <%--        <input class="form-control" type="file" id="formFile">--%>
            <asp:FileUpload CssClass="form-control" runat="server" ID="fileUpLoad" Enabled="false" />
        </div>

        <div>
            <asp:Button ID="btnsua" CssClass="btn btn-primary" Text="Xóa" runat="server" OnClick="Unnamed2_Click" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');" />
        </div>
    </div>



</asp:Content>
