using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class QuanLyBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
                getDanhMuc();
            }
        }
        public void getData()
        {
            Models.NewEntities db = new Models.NewEntities();
            List<Models.Post> lst = db.Post.ToList();
            dgvBaiViet.DataSource = lst;
            dgvBaiViet.DataBind();
        }
        public void getDanhMuc()
        {
            TinTuc.Models.NewEntities db = new Models.NewEntities();
            ddlDanhMuc.DataSource = db.Categories.ToList();
            ddlDanhMuc.DataValueField = "Id";
            ddlDanhMuc.DataTextField = "Ten";
            ddlDanhMuc.DataBind();
        }
        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int Id =Convert.ToInt32( e.CommandArgument.ToString());
                Models.NewEntities db = new Models.NewEntities();

                Models.Post obj = db.Post.FirstOrDefault(x => x.Id == Id);
                if (obj != null)
                {
                    db.Post.Remove(obj);
                    db.SaveChanges();
                    getData();
                }
            }
            catch
            {
                pnError.Visible = true;
                lbError.Text = "Vui lòng xóa ảnh bài viết trước !";
            }
        }
        protected void btnLoc_Command(object sender, CommandEventArgs e)
        {
            Models.NewEntities db = new Models.NewEntities();
            dgvBaiViet.DataSource = db.ChiTiet_SelectID(Convert.ToInt32( ddlDanhMuc.SelectedValue));
            dgvBaiViet.DataBind();
        }

        protected void btnAll_Command(object sender, CommandEventArgs e)
        {
            getData();
        }
    }
}