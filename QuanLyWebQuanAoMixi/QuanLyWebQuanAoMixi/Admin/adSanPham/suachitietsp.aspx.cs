using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adSanPham
{
    public partial class suachitietsp : System.Web.UI.Page
    {
        string machitiet = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["masp"] != null)
            {
                machitiet = Request.QueryString["masp"].ToString();
            }

            if (IsPostBack == false)
            {
                //loadLoaiSanPham();
                loadThongTinSP();
            }
      
        }
        void loadThongTinSP()
        {
            txtkichthuoc.Text = layThongTinCTSP().KichThuoc;
            txtsoluong.Text = layThongTinCTSP().SoLuong.ToString();
        }

        ChiTietSanPham layThongTinCTSP()
        {
            using(QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                int machitietmoi = int.Parse(machitiet);

                ChiTietSanPham sp = qlmp.ChiTietSanPham.Where(d => d.MaChiTietSP == machitietmoi).FirstOrDefault();
                return sp;       
            }
        }


        protected void btnLuu_Click(object sender, EventArgs e)
        {
            using(QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                int machitietmoi = int.Parse(machitiet);
                var ctsp = (from a in qlmp.ChiTietSanPham
                            where a.MaChiTietSP == machitietmoi
                            select a).FirstOrDefault();
                ctsp.KichThuoc = txtkichthuoc.Text;
                ctsp.SoLuong = int.Parse(txtsoluong.Text);
                qlmp.SaveChanges();

                Response.Write("<script>alert('Cap nhat thanh cong!');</script>");

            }

        }
    }
}