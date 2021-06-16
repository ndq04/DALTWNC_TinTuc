using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class QuanLyBinhLuan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getBaiViet();
                getData();
            }
        }
        public void getData()
        {
            Models.NewsEntities db = new Models.NewsEntities();
            dgvBinhLuan.DataSource = db.BinhLuan_ByIdPost(Convert.ToInt32(ddlBaiViet.SelectedValue));
            dgvBinhLuan.DataBind();
        }
        public void getBaiViet()
        {
            TinTuc.Models.NewsEntities db = new Models.NewsEntities();
            ddlBaiViet.DataSource = db.Post.ToList();
            ddlBaiViet.DataValueField = "Id";
            ddlBaiViet.DataTextField = "TenBV";
            ddlBaiViet.DataBind();
        }

        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int ID_Comment = Convert.ToInt32(e.CommandArgument);
                Models.NewsEntities db = new Models.NewsEntities();

                Models.Comment obj = db.Comment.FirstOrDefault(x => x.Id == ID_Comment);
                if (obj != null)
                {
                    db.Comment.Remove(obj);
                    db.SaveChanges();
                    getData();
                }
            }
            catch
            {
                pnError.Visible = true;
                lbError.Text = "Không thể xóa bình luận này. Vui Lòng Kiểm Tra Lại !";
            }
        }
        protected void btnLocPost_Command(object sender, CommandEventArgs e)
        {
            Models.NewsEntities db = new Models.NewsEntities();
            dgvBinhLuan.DataSource = db.BinhLuan_ByIdPost(Convert.ToInt32(ddlBaiViet.SelectedValue));
            dgvBinhLuan.DataBind();
        }
    }
}