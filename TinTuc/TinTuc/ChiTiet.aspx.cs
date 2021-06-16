using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc
{
    public partial class ChiTiet : System.Web.UI.Page
    {
        Models.NewsEntities db = new Models.NewsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int Idbv =Convert.ToInt32(Request.QueryString["Idbv"]);
            int Iddm = Convert.ToInt32(Request.QueryString["Iddm"]);

            rpCategory.DataSource = db.DanhMuc_ByIdCategories(Iddm);
            rpCategory.DataBind();

            rpChiTiet.DataSource = db.BaiViet_ByIdPost(Idbv);
            rpChiTiet.DataBind();

            rpRandom.DataSource = db.BaiViet_ByIdCategories(Iddm);
            rpRandom.DataBind();

            rpTag.DataSource = db.DanhMuc_SelectAll();
            rpTag.DataBind();

            rpComment.DataSource = db.BinhLuan_SelectByID(Idbv);
            rpComment.DataBind();
        }
        public string getAnhDaiDien(int Idbv)
        {
            Models.NewsEntities db = new Models.NewsEntities();
            Models.Media obj = db.Media.FirstOrDefault(x => x.Id_Post == Idbv);
            if (obj == null)
            {
                return "";
            }
            else
            {
                return obj.Url;
            }
        }
        protected void btnBinhLuan_Click(object sender, EventArgs e)
        {
            string ten = txtButDanh.Text;
            string noidung = txtNoiDung.Text;
            if (ten != null && ten != "" && noidung != null && noidung != "")
            {
                Models.Comment obj = new Models.Comment();
                obj.ButDanh = txtButDanh.Text;
                obj.NoiDung = txtNoiDung.Text;
                obj.Id_Post =Convert.ToInt32(Request.QueryString["Idbv"]);
                obj.NgayViet = DateTime.Now;
                db.Comment.Add(obj);
                db.SaveChanges();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                pnError.Visible = true;
                lbError.Text = "Vui lòng nhập đầy đủ thông tin!";
            }
        }
    }
}