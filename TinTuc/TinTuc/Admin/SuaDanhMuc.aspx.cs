using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class SuaDanhMuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int Id =Convert.ToInt32( Request.QueryString["Iddm"]);
                getData(Id);
            }
        }
        public void getData(int Id)
        {
            TinTuc.Models.NewsEntities db = new Models.NewsEntities();
            TinTuc.Models.Categories obj = db.Categories.FirstOrDefault(x => x.Id == Id);
            if (obj == null)
            {
                Response.Redirect("QuanLyDanhMuc.aspx");
            }
            else
            {
                txtMaDM.Text = Convert.ToString(Id);
                txtMaDM.Enabled = false;
                txtTenDM.Text = obj.Ten;
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                Models.NewsEntities db = new Models.NewsEntities();
                int Id =Convert.ToInt32( txtMaDM.Text);
                string tendm = txtTenDM.Text;
                Models.Categories obj = db.Categories.FirstOrDefault(x => x.Id == Id);
                if (obj != null  && tendm != null && tendm != "")
                {
                    obj.Ten = txtTenDM.Text;
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