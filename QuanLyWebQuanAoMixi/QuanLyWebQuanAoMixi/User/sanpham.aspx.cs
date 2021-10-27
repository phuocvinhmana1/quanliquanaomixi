using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.User
{
    public partial class sanpham : System.Web.UI.Page
    {
        int loaisp = 99;
        string request = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            request = Request.QueryString["uc"];

            if (request != null)
            {
                if (request == "all")
                {
                    loadsp();
                }
                else
                {
                    using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
                    {
                        var listLoaiSP = (from a in qlmp.LoaiSanPham
                                          select a.TenLoaiSP).ToList();


                        for (int i = 0; i < listLoaiSP.Count; i++)
                        {
                            if (loaiBoDauTiengViet(listLoaiSP[i]) == request)
                            {
                                loadspTheoLoai(listLoaiSP[i].ToString());
                            }
                        }


                    }
                }
            }

            loaddanhmuc();
        }

        void loadsp()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var sp =
                    (
                       from a in qlmp.SanPham
                       from b in qlmp.LoaiSanPham
                       where a.MaLoai == b.MaLoaiSP
                       select new
                       {
                           a.MaSP,
                           a.TenSP,
                           a.GiaBan,
                           a.HinhAnh

                       }
                    ).ToList();

                lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                hienThiSanPham(sp);

            }

        }

        void loadspTheoLoai(string tenloai)
        {


            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {

                var sp =
                    (
                       from a in qlmp.SanPham
                       from b in qlmp.LoaiSanPham
                       where a.MaLoai == b.MaLoaiSP && b.TenLoaiSP == tenloai
                       select new
                       {
                           a.MaSP,
                           a.TenSP,
                           a.GiaBan,
                           a.HinhAnh

                       }
                    ).ToList();

                lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";
                hienThiSanPham(sp);

            }

        }

        void loaddanhmuc()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var loaisp = (from a in qlmp.LoaiSanPham
                              select a).ToList();

                for (int i = 0; i < loaisp.Count; i++)
                {
                    lbldanhmuc.Text += @"
                     <a id='danhmuc1' href='/User/sanpham.aspx?uc=" + loaiBoDauTiengViet(loaisp[i].TenLoaiSP) + @"' class='list-group-item list-group-item-action'>" + loaisp[i].TenLoaiSP + @"<small class='text-muted'>(" + demSoSPTuLoai(loaisp[i].MaLoaiSP) + @") </small></a>
                    ";
                }
            }

        }

        int demSoSPTuLoai(int maloai)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                int dem = 0;

                dem = (from a in qlmp.SanPham
                       from b in qlmp.LoaiSanPham
                       where a.MaLoai == b.MaLoaiSP && a.MaLoai == maloai
                       select a).Count();
                return dem;

            }

        }

        string loaiBoDauTiengViet(string text)
        {
            string result = text.ToLower();
            result = Regex.Replace(result, "à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|/g", "a");
            result = Regex.Replace(result, "è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|/g", "e");
            result = Regex.Replace(result, "ì|í|ị|ỉ|ĩ|/g", "i");
            result = Regex.Replace(result, "ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|/g", "o");
            result = Regex.Replace(result, "ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|/g", "u");
            result = Regex.Replace(result, "ỳ|ý|ỵ|ỷ|ỹ|/g", "y");
            result = Regex.Replace(result, "đ", "d");
            result = result.Replace(" ", "-");
            return result;
        }

        protected void dropdownSapXep_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                lblHienThiSP.Text = "";

                if (request == "all")
                {
                    if (dropdownSapXep.SelectedValue == "Mặc định")
                    {
                        loadsp();
                    }
                    if (dropdownSapXep.SelectedValue == "Giá từ thấp đến cao")
                    {

                        var sp =
                             (
                                from a in qlmp.SanPham
                                from b in qlmp.LoaiSanPham
                                where a.MaLoai == b.MaLoaiSP
                                select new
                                {
                                    a.MaSP,
                                    a.TenSP,
                                    a.GiaBan,
                                    a.HinhAnh

                                }
                             ).OrderBy(d => d.GiaBan).ToList();

                        lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                        hienThiSanPham(sp);

                    }

                    if (dropdownSapXep.SelectedValue == "Giá từ cao đến thấp")
                    {

                        var sp =
                             (
                                from a in qlmp.SanPham
                                from b in qlmp.LoaiSanPham
                                where a.MaLoai == b.MaLoaiSP
                                select new
                                {
                                    a.MaSP,
                                    a.TenSP,
                                    a.GiaBan,
                                    a.HinhAnh

                                }
                             ).OrderByDescending(d => d.GiaBan).ToList();

                        lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                        hienThiSanPham(sp);

                    }

                    if (dropdownSapXep.SelectedValue == "Mới nhất")
                    {

                        var sp =
                             (
                                from a in qlmp.SanPham
                                from b in qlmp.LoaiSanPham
                                where a.MaLoai == b.MaLoaiSP
                                select new
                                {
                                    a.MaSP,
                                    a.TenSP,
                                    a.GiaBan,
                                    a.HinhAnh,
                                    a.NgayThem

                                }
                             ).OrderByDescending(d => d.NgayThem).ToList();

                        lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                        hienThiSanPham(sp);

                    }

                    if (dropdownSapXep.SelectedValue == "Cũ nhất")
                    {

                        var sp =
                             (
                                from a in qlmp.SanPham
                                from b in qlmp.LoaiSanPham
                                where a.MaLoai == b.MaLoaiSP
                                select new
                                {
                                    a.MaSP,
                                    a.TenSP,
                                    a.GiaBan,
                                    a.HinhAnh,
                                    a.NgayThem

                                }
                             ).OrderBy(d => d.NgayThem).ToList();

                        lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                        hienThiSanPham(sp);

                    }

                }
                else
                {
                    //if (dropdownSapXep.SelectedValue == "Mặc định")
                    //{
                    //    //loadspTheoLoai();
                    //}
                    //if (dropdownSapXep.SelectedValue == "Giá từ thấp đến cao")
                    //{

                    //    var sp =
                    //         (
                    //            from a in qlmp.SanPham
                    //            from b in qlmp.LoaiSanPham
                    //            where a.MaLoai == b.MaLoaiSP
                    //            select new
                    //            {
                    //                a.MaSP,
                    //                a.TenSP,
                    //                a.GiaBan,
                    //                a.HinhAnh

                    //            }
                    //         ).OrderBy(d => d.GiaBan).ToList();

                    //    lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                    //    hienThiSanPham(sp);

                    //}

                    //if (dropdownSapXep.SelectedValue == "Giá từ cao đến thấp")
                    //{

                    //    var sp =
                    //         (
                    //            from a in qlmp.SanPham
                    //            from b in qlmp.LoaiSanPham
                    //            where a.MaLoai == b.MaLoaiSP
                    //            select new
                    //            {
                    //                a.MaSP,
                    //                a.TenSP,
                    //                a.GiaBan,
                    //                a.HinhAnh

                    //            }
                    //         ).OrderByDescending(d => d.GiaBan).ToList();

                    //    lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                    //    hienThiSanPham(sp);

                    //}

                    //if (dropdownSapXep.SelectedValue == "Mới nhất")
                    //{

                    //    var sp =
                    //         (
                    //            from a in qlmp.SanPham
                    //            from b in qlmp.LoaiSanPham
                    //            where a.MaLoai == b.MaLoaiSP
                    //            select new
                    //            {
                    //                a.MaSP,
                    //                a.TenSP,
                    //                a.GiaBan,
                    //                a.HinhAnh,
                    //                a.NgayThem

                    //            }
                    //         ).OrderByDescending(d => d.NgayThem).ToList();

                    //    lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                    //    hienThiSanPham(sp);

                    //}

                    //if (dropdownSapXep.SelectedValue == "Cũ nhất")
                    //{

                    //    var sp =
                    //         (
                    //            from a in qlmp.SanPham
                    //            from b in qlmp.LoaiSanPham
                    //            where a.MaLoai == b.MaLoaiSP
                    //            select new
                    //            {
                    //                a.MaSP,
                    //                a.TenSP,
                    //                a.GiaBan,
                    //                a.HinhAnh,
                    //                a.NgayThem

                    //            }
                    //         ).OrderBy(d => d.NgayThem).ToList();

                    //    lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                    //    hienThiSanPham(sp);

                    //}

                }
            }
        }

        void hienThiSanPham(dynamic sp)
        {
            for (int i = 0; i < sp.Count; i++)
            {
                lblHienThiSP.Text += @"

                                        <div class='col-sm-6 col-md-6 col-lg-4 col-xl-4'>
                                            <div class='products-single fix'>
                                                <div class='box-img-hover'>
                                                    <div class='type-lb'>
                                                        <p class='new'>New</p>
                                                    </div>
                                                    
                                                    <img class='img-fluid' src='" + sp[i].HinhAnh + @"'>
                                                   
                                                      
                                                     
                                                    <div class='mask-icon'>
                                                      
                                                        <a class='cart' href=''>Thêm vào giỏ</a>
                                                        
                                                    </div>
                                                </div>
                                                <div class='why-text'>
                                                   
                                                    <a href='/User/chitietsp.aspx?MaSP=" + sp[i].MaSP + "'> <h4>" + sp[i].TenSP + @"</h4></a>
                                                    <h5>" + sp[i].GiaBan + @" " + " VNĐ" + @"</h5>
                                                </div>
                                            </div>
                                        </div>";
            }

        }

        protected void btnthemvaogio_Click(object sender, EventArgs e)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                if (Session["KH"] == null)
                {
                    Response.Write("<script>alert('Bạn cần đăng nhập để thực hiện thao tác này!');</script>");
                    Response.Redirect("/User/taikhoan");
                }
            }
        }

        protected void btntimkiem_Click(object sender, EventArgs e)
        {
            lblHienThiSP.Text = "";

            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var sp =
                    (
                       from a in qlmp.SanPham
                       from b in qlmp.LoaiSanPham
                       where a.MaLoai == b.MaLoaiSP && a.TenSP.Contains(txttimkiem.Text)
                       select new
                       {
                           a.MaSP,
                           a.TenSP,
                           a.GiaBan,
                           a.HinhAnh

                       }
                    ).ToList();

                lblHienThiSoSP.Text = "<p>Hiển thị " + sp.Count.ToString() + " sản phẩm</p>";

                hienThiSanPham(sp);

            }
        }

        protected void txttimkiem_TextChanged(object sender, EventArgs e)
        {
            if (txttimkiem.Text == "")
            {
                loadsp();
            }
        }

    }
}