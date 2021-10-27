using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adSanPham
{
    public partial class themsanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            loadLoaiSanPham();
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

        int layLoaiSanPham(string tenloai)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                return (from a in qlmp.LoaiSanPham
                        where a.TenLoaiSP == tenloai
                        select a.MaLoaiSP).FirstOrDefault();
            }
        }


        protected void btnthem_Click(object sender, EventArgs e)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {

                fileUpLoad.SaveAs(Server.MapPath("/HinhAnh/AnhSanPham/") + fileUpLoad.FileName);
                string tenfile = "/HinhAnh/AnhSanPham/" + fileUpLoad.FileName;

                SanPham sp = new SanPham();
                sp.TenSP = txttensp.Text;
                sp.MaLoai = layLoaiSanPham(cbbloaisp.SelectedValue);
                sp.SoLuong = txtsoluong.Text;
                sp.ThuongHieu = txtthuonghieu.Text;
                sp.XuatXu = txtxuatxu.Text;
                sp.NgayThem = DateTime.Now;
                sp.MoTa = txtmota.Text;
                sp.MauSac = txtmausac.Text;
                sp.KichThuoc = txtkichthuoc.Text;
                sp.GioiTinh = cbbgioitinh.SelectedValue;
                sp.GiaBan = txtgiaban.Text;
                sp.GhiChu = txtghichu.Text;

                sp.HinhAnh = tenfile;

                qlmp.SanPham.Add(sp);
                qlmp.SaveChanges();

                Response.Write("<script>alert('Them san pham thanh cong!');</script>");


            }


        }
    }
}