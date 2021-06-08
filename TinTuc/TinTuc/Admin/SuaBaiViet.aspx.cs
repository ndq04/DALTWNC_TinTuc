using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class SuaBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDanhMuc();
                int Idbv =Convert.ToInt32( Request.QueryString["Idbv"]);
                if (Idbv != null)
                {
                    getData(Idbv);
                }
            }
        }

        public void getDanhMuc()
        {
            TinTuc.Models.TinTucEntities db = new Models.TinTucEntities();
            cmbDanhMuc.DataSource = db.Categories.ToList();
            cmbDanhMuc.DataValueField = "Id";
            cmbDanhMuc.DataTextField = "Ten";
            cmbDanhMuc.DataBind();
        }

        public void getData(int Id)
        {
            TinTuc.Models.TinTucEntities db = new Models.TinTucEntities();
            TinTuc.Models.Post obj = db.Post.FirstOrDefault(x => x.Id == Id);
            if (obj == null)
            {
                Response.Redirect("QuanLyBaiViet.aspx");
            }
            else
            {
                txtMaBV.Text = Convert.ToString(Id);
                txtMaBV.Enabled = false;
                cmbDanhMuc.SelectedValue = Convert.ToString(obj.Id_Categories);
                txtTenBV.Text = obj.TenBV;
                txtMoTa.Text = obj.MoTa;
                txtNoiDung.Text = obj.NoiDung;
                txtTacGia.Text = obj.TacGia;
            }
        }
        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                Models.TinTucEntities db = new Models.TinTucEntities();
                int Id = Convert.ToInt32( txtMaBV.Text);
                string tenbv = txtTenBV.Text;
                string mota = txtMoTa.Text;
                string noidung = txtNoiDung.Text;
                string tacgia = txtTacGia.Text;
                Models.Post obj = db.Post.FirstOrDefault(x => x.Id == Id);
                if (obj != null && Id != null && tenbv != null && tenbv != "" && mota != null && mota != "" && noidung != null && noidung != "" && tacgia != null && tacgia != "")
                {
                    obj.Id_Categories =Convert.ToInt32(cmbDanhMuc.SelectedValue);
                    obj.TenBV = txtTenBV.Text;
                    obj.MoTa = txtMoTa.Text;
                    obj.NoiDung = txtNoiDung.Text;
                    obj.TacGia = txtTacGia.Text;
                    obj.NgayDang = DateTime.Now;
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