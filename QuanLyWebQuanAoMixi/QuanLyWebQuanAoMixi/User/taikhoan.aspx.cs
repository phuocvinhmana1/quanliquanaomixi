using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btndangky_Click1(object sender, EventArgs e)
        {
            using (QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {

                var checktk = qlmp.ThongTinTaiKhoan.Where(d => d.TenDangNhap == txttendangnhapdk.Text).FirstOrDefault();
                if (checktk != null)
                {
                    Response.Write("<script>alert('Tên đăng nhập đã có người sử dụng!');</script>");
                }

                else
                {

                    ThongTinTaiKhoan tk = new ThongTinTaiKhoan();
                    tk.TenDangNhap = txttendangnhapdk.Text;
                    tk.MatKhau = txtmatkhaudk.Text;
                    tk.LoaiTK = "Khách hàng";
                    tk.HoTen = txthoten.Text;
                    tk.SDT = txtsdt.Text;
                    tk.Email = txtemail.Text;
                    tk.DiaChi = txtdiachi.Text;
                    qlmp.ThongTinTaiKhoan.Add(tk);
                    qlmp.SaveChanges();
                    cleartextbox();

                    Response.Write("<script>alert('Đăng ký thành công!');</script>");
                }

            }
        }

        void cleartextbox()
        {
            txttendangnhap.Text = "";
            txtmatkhau.Text = "";
            txttendangnhapdk.Text = "";
            txtmatkhaudk.Text = "";
            txthoten.Text = "";
            txtsdt.Text = "";
            txtemail.Text = "";
            txtdiachi.Text = "";
        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            using(QuanLyQuanAoEntities qlmp = new QuanLyQuanAoEntities())
            {
                var tk = qlmp.ThongTinTaiKhoan.Where(d => d.TenDangNhap == txttendangnhap.Text && d.MatKhau == txtmatkhau.Text).FirstOrDefault();
                if (tk != null)
                {
                    if (tk.LoaiTK == "Khách hàng")
                    {
                        Session["KH"] = tk.HoTen;
                        Session["MaKhachHang"] = tk.MaTaiKhoan;
                        Response.Redirect("/User/trangchu.aspx");
                    }
                    else
                    {
                        Response.Redirect("/Admin/TrangChu.aspx");
 
                    }
                   
                }
                else
                {
                    Response.Write("<script>alert('Đăng nhập thất bại!');</script>");
                }

            }
        }
            
        }
    
}