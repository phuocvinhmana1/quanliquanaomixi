using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi
{
    public partial class UserMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["tt"] == "logout")
            {
                Session["KH"] = null;
                Session["MaKhachHang"] = null;
            }

            if (Session["KH"] != null)
            {
                lbltaikhoan.Text = "<li class='nav-item'><a class='nav-link' href='/User/taikhoan.aspx?tt=logout'>Đăng xuất</a></li>";
                lbldangnhap.Text = "Xin chào, " + Session["KH"].ToString();

            }
            else
            {
                lbltaikhoan.Text = "<li class='nav-item'><a class='nav-link' href='/User/taikhoan.aspx?tt=login'>Tài khoản</a></li>";
            }
        }
    }
}