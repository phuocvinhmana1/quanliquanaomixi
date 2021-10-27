using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adSanPham
{
    public partial class suasanpham : System.Web.UI.Page
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

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            byte[] bytes;

            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var sp = (from a in qlmp.SanPham
                          where a.MaSP == masp
                          select a).SingleOrDefault();


                if (fileUpLoad.HasFile)
                {

                    fileUpLoad.SaveAs(MapPath("HinhAnh/AnhSanPham/") + fileUpLoad.FileName);
                    sp.HinhAnh = fileUpLoad.FileName;

                    sp.TenSP = txttensp.Text;
                    sp.MaLoai = layMaLoaiSanPham(cbbloaisp.SelectedValue);
                    sp.SoLuong = txtsoluong.Text;
                    sp.ThuongHieu = txtthuonghieu.Text;
                    sp.XuatXu = txtxuatxu.Text;
             
                    sp.MoTa = txtmota.Text;
                    sp.GioiTinh = cbbgioitinh.SelectedValue;
                    sp.GiaBan = txtgiaban.Text;
                    sp.GhiChu = txtghichu.Text;
                    qlmp.SaveChanges();

                }
                else
                {
                    sp.TenSP = txttensp.Text;
                    sp.MaLoai = layMaLoaiSanPham(cbbloaisp.SelectedValue);
                    sp.SoLuong = txtsoluong.Text;
                    sp.ThuongHieu = txtthuonghieu.Text;
                    sp.XuatXu = txtxuatxu.Text;

                    sp.MoTa = txtmota.Text;
                    sp.GioiTinh = cbbgioitinh.SelectedValue;
                    sp.GiaBan = txtgiaban.Text;
                    sp.GhiChu = txtghichu.Text;
                    qlmp.SaveChanges();
                }

                Response.Write("<script>alert('Sua san pham thanh cong!');</script>");



            }

            if (!IsPostBack)
            {
                //loaisp = int.Parse(Request.QueryString["LoaiSP"]);
                lblkt.Text = "khong phai postback";

            }
            else
            {
                lblkt.Text = "la postback";
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
            txtngaytao.Text = layThongTinSP().NgayThem.ToString();
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
    }
}