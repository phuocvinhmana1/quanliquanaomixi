<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="themsanpham.aspx.cs" Inherits="QuanLyWebQuanAoMixi.Admin.adSanPham.themsanpham" %>



<asp:Content ID="Content1" ContentPlaceHolderID="contentadmin1" runat="server">

    <div style="width: 1000px; margin-left: 200px; margin-top: 50px">

        <h2>Thêm sản phẩm</h2>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Tên sản phẩm</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txttensp"></asp:TextBox>
        </div>

        <div>
            <label for="exampleFormControlInput1" class="form-label">Loại sản phẩm</label>


            <asp:DropDownList ID="cbbloaisp" runat="server" CssClass="form-select">
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Số lượng</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtsoluong"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Thương hiệu</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtthuonghieu"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Xuất xứ</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtxuatxu"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Ngày thêm</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtngaythem"></asp:TextBox>
        </div>


        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Mô tả</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtmota"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Giới tính</label>
            <asp:DropDownList ID="cbbgioitinh" runat="server" CssClass="form-select">

                <asp:ListItem Selected="True" Value="Nam và nữ"> Nam và nữ </asp:ListItem>
                <asp:ListItem Value="Nam"> Nam </asp:ListItem>
                <asp:ListItem Value="Nữ"> Nữ </asp:ListItem>
            </asp:DropDownList>
        </div>

         <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Màu sắc</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtmausac"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Kích thước</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtkichthuoc"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Giá bán</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtgiaban"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Ghi chú</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtghichu"></asp:TextBox>
        </div>


        <div class="mb-3">
            <label for="formFile" class="form-label">Tải ảnh lên từ máy tính</label>
            <%--        <input class="form-control" type="file" id="formFile">--%>
            <asp:FileUpload CssClass="form-control" runat="server" ID="fileUpLoad" />
        </div>

        <div>
            <asp:Button CssClass="btn btn-primary" ID="btnthem" runat="server" Text="Thêm" OnClick="btnthem_Click" />
        </div>
    </div>

</asp:Content>
