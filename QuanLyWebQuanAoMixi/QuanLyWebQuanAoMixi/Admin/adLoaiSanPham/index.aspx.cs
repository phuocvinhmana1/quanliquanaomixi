using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebQuanAoMixi.Admin.adLoaiSanPham
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
                gridviewloaisp.DataSource = (from a in qlmp.LoaiSanPham
                                             select a).ToList();
                gridviewloaisp.DataBind();

            }
        }
    }
}