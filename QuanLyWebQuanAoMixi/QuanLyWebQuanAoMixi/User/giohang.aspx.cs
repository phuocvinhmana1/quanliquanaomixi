using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.User
{
    public partial class giohang : System.Web.UI.Page
    {
        string matk = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["MaKhachHang"] != null)
            {
                matk = Session["MaKhachHang"].ToString();
                loadGridView();
                tinhTienGioHang();
            }
            else
            {
                lblkiemtradn.Text = "Giỏ hàng đang trống, hãy đăng nhập để sử dụng chức năng này!";
            }
        }

        void tinhTienGioHang()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                int magiohang = Convert.ToInt32(layMaGioHang(Convert.ToInt32(matk)));

                var listgiohang = (from gh in qlmp.GioHang
                                   from ctgh in qlmp.ChiTietGioHang
                                   from ctsp in qlmp.ChiTietSanPham
                                   from sp in qlmp.SanPham
                                   where gh.MaGioHang == ctgh.MaGioHang && sp.MaSP == ctsp.MaSP && ctgh.MaSP == ctsp.MaChiTietSP && ctgh.MaGioHang == magiohang
                                   select new
                                   {
                                       ctsp.MaChiTietSP,
                                       sp.TenSP,
                                       ctsp.KichThuoc,
                                       sp.HinhAnh,
                                       sp.GiaBan,
                                       ctgh.SoLuong
                                   }
                                       ).ToList();
                decimal tongtien = 0;
                for (int i = 0; i < listgiohang.Count; i++)
                {
                    tongtien = tongtien + decimal.Parse(listgiohang[i].GiaBan)*decimal.Parse((listgiohang[i].SoLuong));
                }


                capNhatGioHang(tongtien);


                lbltonghoadon.Text = "<div class='ml-auto font-weight-bold'>$ "+tongtien.ToString()+" </div>";
                lblgiamgia.Text = "<div class='ml-auto font-weight-bold'>$ 0 </div>";
                lblmagiamgia.Text = "<div class='ml-auto font-weight-bold'>$ 0 </div>";
                lblvat.Text = " <div class=ml-auto font-weight-bold'>$ 0 </div>";
                lblphivanchuyen.Text = "<div class='ml-auto font-weight-bold'>Free </div>";
                lbltongthanhtoan.Text = "<div class='ml-auto h5'>$ "+tongtien.ToString()+" </div>";

            }
        }

        void capNhatGioHang(decimal tongtien)
        {
            using(QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                int magiohang = Convert.ToInt32(layMaGioHang(Convert.ToInt32(matk)));
                var giohang = qlmp.GioHang.Where(d=>d.MaGioHang == magiohang).FirstOrDefault();
                giohang.TongTien = tongtien;
                qlmp.SaveChanges();

            }
        }


        void loadGridView()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {

                int magiohang = Convert.ToInt32(layMaGioHang(Convert.ToInt32(matk)));

                var listgiohang = (from gh in qlmp.GioHang
                                   from ctgh in qlmp.ChiTietGioHang
                                   from ctsp in qlmp.ChiTietSanPham
                                   from sp in qlmp.SanPham
                                   where gh.MaGioHang == ctgh.MaGioHang && sp.MaSP == ctsp.MaSP && ctgh.MaSP == ctsp.MaChiTietSP && ctgh.MaGioHang == magiohang
                                   select new
                                   {
                                       ctsp.MaChiTietSP,
                                       sp.TenSP,
                                       ctsp.KichThuoc,
                                       sp.HinhAnh,
                                       sp.GiaBan,
                                       ctgh.SoLuong
                                   }
                                       ).ToList();
                gridviewgiohang.DataSource = listgiohang;
                gridviewgiohang.DataBind();
            }
        }

        string layMaGioHang(int makh)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                string magiohang = (from a in qlmp.GioHang
                                    from b in qlmp.ThongTinTaiKhoan
                                    where a.MaKH == b.MaTaiKhoan && b.MaTaiKhoan == makh
                                    select a.MaGioHang
                                        ).FirstOrDefault().ToString();
                return magiohang;
            }

        }


        protected void gridviewgiohang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoasp")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gridviewgiohang.Rows[rowIndex];
                int masp = int.Parse(row.Cells[0].Text);
                xoaSanPhamGioHang(masp);



            }
        }

        void xoaSanPhamGioHang(int masp)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var sp = qlmp.ChiTietGioHang.Where(d => d.MaSP == masp).FirstOrDefault();
                qlmp.ChiTietGioHang.Remove(sp);
                qlmp.SaveChanges();
                loadGridView();
                Response.Write("<script>alert('Xóa thành công!');</script>");
            }

        }

        protected void btndathang_Click(object sender, EventArgs e)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                int magiohang = Convert.ToInt32(layMaGioHang(Convert.ToInt32(matk)));
                var giohang = qlmp.GioHang.Where(d => d.MaGioHang == magiohang).FirstOrDefault();
                giohang.TrangThai = "Đã đặt hàng";
                qlmp.SaveChanges();

                Response.Write("<script>alert('Yêu cầu đặt hàng đã được gửi!');</script>");

            }

        }
    }
}