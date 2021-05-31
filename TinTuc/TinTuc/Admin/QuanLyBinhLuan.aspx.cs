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
                getData();
            }
        }
        public void getData()
        {
            Models.NewEntities db = new Models.NewEntities();
            List<Models.Comment> lst = db.Comment.ToList();
            dgvBinhLuan.DataSource = lst;
            dgvBinhLuan.DataBind();
        }

        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int ID_Comment = Convert.ToInt32(e.CommandArgument);
                Models.NewEntities db = new Models.NewEntities();

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
    }
}