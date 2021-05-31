using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class QuanLyDanhMuc : System.Web.UI.Page
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
            List<Models.Categories> lst = db.Categories.ToList();
            dgvDanhMuc.DataSource = lst;
            dgvDanhMuc.DataBind();
        }

        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int Id =Convert.ToInt32(e.CommandArgument.ToString());
                Models.NewEntities db = new Models.NewEntities();

                Models.Categories obj = db.Categories.FirstOrDefault(x => x.Id == Id);
                if (obj != null)
                {
                    db.Categories.Remove(obj);
                    db.SaveChanges();
                    getData();
                }
            }
            catch
            {
                pnError.Visible = true;
                lbError.Text = "Không thể xóa danh mục này. Vui Lòng Kiểm Tra Lại !";
            }
        }
    }
}