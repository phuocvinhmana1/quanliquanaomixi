using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adSanPham
{
    public partial class themchitietsp : System.Web.UI.Page
    {
        int masp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            masp = int.Parse(Request.QueryString["MaSP"]);
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                ChiTietSanPham ct = new ChiTietSanPham();
                ct.MaSP = masp;
                ct.KichThuoc = txtkichthuoc.Text;
                ct.SoLuong = int.Parse(txtsoluong.Text);
                qlmp.ChiTietSanPham.Add(ct);
                qlmp.SaveChanges();

                Response.Write("<script>alert('Them thanh cong!');</script>");
            }
        }
    }
}