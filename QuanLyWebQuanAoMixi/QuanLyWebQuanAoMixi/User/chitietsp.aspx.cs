using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.User
{
    public partial class chitietsp : System.Web.UI.Page
    {
        int masp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            masp = int.Parse(Request.QueryString["MaSP"]);
            loadchiTietSP();
            if (!IsPostBack)
            {
                loadSizeSanPham();
            }
        }

        void loadchiTietSP()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var sp = (from a in qlmp.SanPham
                          from b in qlmp.LoaiSanPham
                          where a.MaLoai == b.MaLoaiSP && a.MaSP == masp
                          select a).SingleOrDefault();

                lblanhsp.Text = @"
                                   <div class='zoom'>
                                   <img class='d-block w-100' src='" + sp.HinhAnh + @"' alt='First slide'>
                                   </div>

                                   <style>
                                     .zoom {
                                   
                                     background-color: green;
                                     transition: transform .2s; /* Animation */

                                     margin: 0 auto;
                                            }

                                     .zoom:hover {
                                      transform: scale(2); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
                                      }
                                   </style>
                                                       


                                 ";

                lbltensp.Text = "<h2>" + sp.TenSP + @"</h2>";
                lblgiaban.Text = "<h5>" + sp.GiaBan + " VND" + @"</h5>";
                lblDemSLSP.Text = "<span>Còn " + sp.SoLuong + @" sản phẩm</span>";
                lblmota.Text = @"<p>
                                <h4>Mô tả:</h4>
                                <p>" + sp.MoTa + @"</p>";
            }


        }

        void loadSizeSanPham()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var listSize =
                    (
                      from a in qlmp.SanPham
                      from b in qlmp.ChiTietSanPham
                      where a.MaSP == b.MaSP && b.SoLuong > 0 && a.MaSP == masp
                      select b.KichThuoc
                    ).ToList();

                dropdowchonsize.DataSource = listSize;
                dropdowchonsize.DataBind();
            }
        }

        protected void btnthemvaogio_Click(object sender, EventArgs e)
        {

            if (Session["KH"] == null)
            {
                lblkiemtradangnhap.Text = "</br></br>Bạn chưa đăng nhập" + "<a href='/User/taikhoan.aspx'> <h4>Click vào đây để đến trang đăng nhập</h4></a>";
            }
            else
            {
                using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
                {
                    int makh = Convert.ToInt32(Session["MaKhachHang"]);

                    var giohang = (from a in qlmp.GioHang
                                   from b in qlmp.ThongTinTaiKhoan
                                   where a.MaKH == b.MaTaiKhoan && a.MaKH == makh
                                   select b).FirstOrDefault();

                    if (giohang == null)
                    {
                        GioHang gh = new GioHang();
                        gh.MaKH = makh;
                        gh.NgayMua = DateTime.Now;
                        gh.TrangThai = "Đang trong quá trình mua";
                        gh.TongTien = 0;
                        qlmp.GioHang.Add(gh);
                        qlmp.SaveChanges();



                        themChiTietSP();

                        Response.Write("<script>alert('Đã thêm vào giỏ hàng');</script>");
                    }
                    else
                    {
                        if (kiemTraSPCoTrongGioHang() == false)
                        {
                            Response.Write("<script>alert('Sản phẩm này đã có trong giỏ');</script>");
                        }
                        else
                        {
                            themChiTietSP();
                            Response.Write("<script>alert('Đã thêm vào giỏ hàng');</script>");

                        }
                    }
                }

            }
        }

        bool kiemTraSPCoTrongGioHang()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                int machitiet = Convert.ToInt32(layMaChiTietSP(masp, dropdowchonsize.SelectedValue));
                var kiemtra = (from a in qlmp.ChiTietGioHang
                               from b in qlmp.ChiTietSanPham
                               where a.MaSP == b.MaChiTietSP && a.MaSP == machitiet
                               select a).FirstOrDefault();
                if (kiemtra != null)
                {
                    return false;
                }
                return true;
            }

        }

        string layMaChiTietSP(int masp, string size)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                string machitietsp = (from a in qlmp.SanPham
                                      from b in qlmp.ChiTietSanPham
                                      where a.MaSP == b.MaSP && b.KichThuoc == size && b.MaSP == masp
                                      select b.MaChiTietSP).FirstOrDefault().ToString();
                return machitietsp;
            }

        }

        void themChiTietSP()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                int makh = Convert.ToInt32(Session["MaKhachHang"]);

                string magiohang = (from a in qlmp.GioHang
                                    from b in qlmp.ThongTinTaiKhoan
                                    where a.MaKH == b.MaTaiKhoan && b.MaTaiKhoan == makh
                                    select a.MaGioHang).FirstOrDefault().ToString();


                ChiTietGioHang ct = new ChiTietGioHang();
                ct.MaGioHang = Convert.ToInt32(magiohang);
                ct.MaSP = Convert.ToInt32(layMaChiTietSP(masp, dropdowchonsize.SelectedValue));
                ct.SoLuong = txtsoluong.Text;
                qlmp.ChiTietGioHang.Add(ct);
                qlmp.SaveChanges();
            }
        }




    }
}