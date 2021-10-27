using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adSanPham
{
    public partial class chitietsp : System.Web.UI.Page
    {
        int masp = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            masp = int.Parse(Request.QueryString["MaSP"]);
            loadChiTietSP();
            lblthemspLink.Text = @"
                                  <a href='/Admin/adSanPham/themchitietsp.aspx?MaSP="+masp+@"'>Thêm chi tiết sản phẩm</a>
                                 ";
        }



        void loadChiTietSP()
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                GridView2.DataSource = (from a in qlmp.SanPham
                                        from b in qlmp.ChiTietSanPham
                                        where a.MaSP == b.MaSP && b.MaSP == masp
                                        select new 
                                        {
                                            b.MaChiTietSP,
                                            a.TenSP,
                                            b.KichThuoc,
                                            b.SoLuong
                                        }).ToList();
                GridView2.DataBind();

            }
        }

        protected void btntimkiem_Click(object sender, EventArgs e)
        {

        }

        protected void txttimkiem_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoactsp")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[rowIndex];
                int masp = int.Parse(row.Cells[0].Text);
                xoaChiTietSP(masp);
            }
        }

        void xoaChiTietSP(int masp)
        {
            using(QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var ctsp = qlmp.ChiTietSanPham.Where(d=>d.MaChiTietSP == masp).FirstOrDefault();
                qlmp.ChiTietSanPham.Remove(ctsp);
                qlmp.SaveChanges();
                loadChiTietSP();

            }
        }
    }
}