using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class ThemDanhMuc : System.Web.UI.Page
    {
        Models.NewsEntities db = new Models.NewsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                string Tendm = txtTenDM.Text;
                if (Tendm != null && Tendm != "")
                {
                        Models.Categories obj = new Models.Categories();
                        obj.Ten = txtTenDM.Text;
                        db.Categories.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("QuanLyDanhMuc.aspx");

                }
                else
                {
                    pnError.Visible = true;
                    lbError.Text = "Các trường không được để trống!";
                }
            }
            catch
            {
                pnError.Visible = true;
                lbError.Text = "Lỗi, không lưu lại được !";
            }
        }
    }
}