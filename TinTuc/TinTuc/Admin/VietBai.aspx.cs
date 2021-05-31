using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class VietBai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDanhMuc();
            }
        }
        public void getDanhMuc()
        {
            TinTuc.Models.NewEntities db = new Models.NewEntities();
            ddlDanhMuc.DataSource = db.Categories.ToList();
            ddlDanhMuc.DataValueField = "Id";
            ddlDanhMuc.DataTextField = "Ten";
            ddlDanhMuc.DataBind();
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                // Kiểm tra mã có tồn tại chưa?
                Models.NewEntities db = new Models.NewEntities();
                string tenbv = txtTenBV.Text;
                string mota = txtMoTa.Text;
                string noidung = txtNoiDung.Text;
                string tacgia = txtTacGia.Text;
                if (tenbv != "" && mota != null && mota != "" && noidung != null && noidung != "" && tacgia != null && tacgia != "")
                {
                        Models.Post obj = new Models.Post();
                        obj.TenBV = txtTenBV.Text;
                        obj.MoTa = txtMoTa.Text;
                        obj.NoiDung = txtNoiDung.Text;
                        obj.TacGia = txtTacGia.Text;
                        obj.NgayDang = DateTime.Now;
                        obj.Id_Categories =Convert.ToInt32( ddlDanhMuc.SelectedValue);
                        db.Post.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("QuanLyBaiViet.aspx");
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