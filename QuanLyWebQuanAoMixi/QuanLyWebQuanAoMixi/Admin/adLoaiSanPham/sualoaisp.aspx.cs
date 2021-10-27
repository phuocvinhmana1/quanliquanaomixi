using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adLoaiSanPham
{
    public partial class sualoaisp : System.Web.UI.Page
    {
        string maloai = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["maloaisp"] != null)
            {
                maloai = Request.QueryString["maloaisp"];
              
            }
            if (IsPostBack == false)
            {
                //loadLoaiSanPham();
                loadTenLoai();
            }

        }

        void loadTenLoai()
        {
            int maloaimoi = int.Parse(maloai);

            using(QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                LoaiSanPham loaisp = qlmp.LoaiSanPham.Where(d=>d.MaLoaiSP == maloaimoi).FirstOrDefault();
                txttenloai.Text = loaisp.TenLoaiSP;
            }
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            int maloaimoi = int.Parse(maloai);

            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var loaisp = (from a in qlmp.LoaiSanPham
                              where a.MaLoaiSP == maloaimoi
                              select a).FirstOrDefault();

                loaisp.TenLoaiSP = txttenloai.Text;
                qlmp.SaveChanges();
                Response.Write("<script>alert('Cap nhat thanh cong!');</script>");
            }
        }
    }
}