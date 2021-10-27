using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adDonHang
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadgridview();
        }

        void loadgridview()
        {
            using(QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                gridviewdonhang.DataSource =
                    (
                         from a in qlmp.GioHang
                         from c in qlmp.ThongTinTaiKhoan
                         where a.MaKH == c.MaTaiKhoan
                         select new 
                         {
                             a.MaGioHang,
                             c.HoTen,
                             c.SDT,
                             c.DiaChi,
                             a.NgayMua,
                             a.TrangThai,
                             a.TongTien
                         }
                    ).ToList();

                gridviewdonhang.DataBind();

            }

        }
    }
}