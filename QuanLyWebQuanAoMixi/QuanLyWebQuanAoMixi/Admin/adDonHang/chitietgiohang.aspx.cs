using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adDonHang
{
    public partial class chitietgiohang : System.Web.UI.Page
    {
        string magiohang = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["MaGioHang"] != null)
            {
                magiohang = Request.QueryString["MaGioHang"].ToString();
                loadGridview();
            }

        }

        void loadGridview()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {

                int magiohangmoi = int.Parse(magiohang);

                var listgiohang = (from gh in qlmp.GioHang
                                   from ctgh in qlmp.ChiTietGioHang
                                   from ctsp in qlmp.ChiTietSanPham
                                   from sp in qlmp.SanPham
                                   where gh.MaGioHang == ctgh.MaGioHang && sp.MaSP == ctsp.MaSP && ctgh.MaSP == ctsp.MaChiTietSP && ctgh.MaGioHang == magiohangmoi
                                   select new
                                   {
                                       ctsp.MaChiTietSP,
                                       sp.TenSP,
                                       ctsp.KichThuoc,                                
                                       sp.GiaBan,
                                       ctgh.SoLuong
                                   }
                                       ).ToList();
                gridviewctgiohang.DataSource = listgiohang;
                gridviewctgiohang.DataBind();
            }
        }
    }
}