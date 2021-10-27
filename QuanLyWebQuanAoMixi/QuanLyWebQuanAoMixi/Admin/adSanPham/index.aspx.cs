using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adSanPham
{
    public partial class index : System.Web.UI.Page
    {
        QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadGridView();
            //loadDanhMuc();
        }

        void loadDanhMuc()
        {
           //using(QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
           //{
           //    GridView1.DataSource = (from a in qlmp.LoaiSanPham
           //                   select a.TenLoaiSP).ToList();

            
           //    GridView1.DataBind();
               
           //}
        }

        void loadGridView()
        {


            gridviewgiohang.DataSource = (from a in qlmp.SanPham
                                    from b in qlmp.LoaiSanPham
                                    where a.MaLoai == b.MaLoaiSP
                                    select new
                                    {
                                        a.MaSP,
                                        a.TenSP,
                                        b.TenLoaiSP,
                                        a.SoLuong,
                                        a.ThuongHieu,
                                        a.XuatXu,
                                        a.NgayThem,
                                        a.MoTa,
                                        a.GioiTinh,
                                        a.GiaBan,
                                        a.GhiChu,
                                        a.HinhAnh

                                    }).ToList();
            gridviewgiohang.DataBind();

        }

        protected void btntimkiem_Click(object sender, EventArgs e)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {

                gridviewgiohang.DataSource = (from a in qlmp.SanPham
                                        from b in qlmp.LoaiSanPham
                                        where a.MaLoai == b.MaLoaiSP && a.TenSP.Contains(txttimkiem.Text)
                                        select new
                                        {
                                            a.MaSP,
                                            a.TenSP,
                                            b.TenLoaiSP,
                                            a.SoLuong,
                                            a.ThuongHieu,
                                            a.XuatXu,
                                            a.NgayThem,
                                            a.MoTa,
                                            a.GioiTinh,
                                            a.GiaBan,
                                            a.GhiChu,
                                            a.HinhAnh

                                        }).ToList();
                gridviewgiohang.DataBind();

            }
        }

        protected void txttimkiem_TextChanged(object sender, EventArgs e)
        {
            if (txttimkiem.Text == "")
            {
                loadGridView();
            }
        }
    }
}