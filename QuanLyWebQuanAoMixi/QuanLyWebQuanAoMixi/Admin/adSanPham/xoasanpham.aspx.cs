using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adSanPham
{
    public partial class xoasanpham : System.Web.UI.Page
    {
        int masp = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            masp = int.Parse(Request.QueryString["MaSP"]);
            if (IsPostBack == false)
            {
                loadLoaiSanPham();
                loadThongTinSP();
            }
        }

        void loadLoaiSanPham()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                cbbloaisp.DataSource = (from a in qlmp.LoaiSanPham
                                        select a.TenLoaiSP).ToList();
                cbbloaisp.DataBind();
            }
        }


        public SanPham layThongTinSP()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                return qlmp.SanPham.Where(d => d.MaSP == masp).FirstOrDefault();
            }
        }

        void loadThongTinSP()
        {
            txtmasp.Text = layThongTinSP().MaSP.ToString();
            txttensp.Text = layThongTinSP().TenSP;
            int maloai = Convert.ToInt32(layThongTinSP().MaLoai);
            cbbloaisp.SelectedValue = layTenSanPham(maloai);
            txtsoluong.Text = layThongTinSP().SoLuong;
            txtthuonghieu.Text = layThongTinSP().ThuongHieu;
            txtxuatxu.Text = layThongTinSP().XuatXu;
            txtngaythem.Text = layThongTinSP().NgayThem.ToString();
            txtmota.Text = layThongTinSP().MoTa;
            cbbgioitinh.Text = layThongTinSP().GioiTinh;
            txtgiaban.Text = layThongTinSP().GiaBan;


        }


        string layTenSanPham(int maloai)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                return (from a in qlmp.LoaiSanPham
                        where a.MaLoaiSP == maloai
                        select a.TenLoaiSP).FirstOrDefault();
            }
        }

        int layMaLoaiSanPham(string tenloai)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                return (from a in qlmp.LoaiSanPham
                        where a.TenLoaiSP == tenloai
                        select a.MaLoaiSP).FirstOrDefault();
            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {


            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var sp = qlmp.SanPham.Where(d => d.MaSP == masp).First();
                qlmp.SanPham.Remove(sp);
                qlmp.SaveChanges();

            }
        }
    }
}