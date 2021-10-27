using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adLoaiSanPham
{
    public partial class themloaisp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                LoaiSanPham loai = new LoaiSanPham();
                loai.TenLoaiSP = txttenloai.Text;
                qlmp.LoaiSanPham.Add(loai);
                qlmp.SaveChanges();

                Response.Write("<script>alert('Them thanh cong!');</script>");
            }
        }
    }
}