using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class UploadAnh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int Idbv = Convert.ToInt32(Request.QueryString["Idbv"]);
                getData(Idbv);
                txtIdBV.Text =Convert.ToString(Idbv);
            }
        }
        public void getData(int Idbv)
        {
            Models.NewsEntities db = new Models.NewsEntities();
            dgvMedia.DataSource = db.Media.Where(x => x.Id_Post == Idbv).ToList();
            dgvMedia.DataBind();
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuImg.HasFile == true)
            {
                // Bước 1: Tải file về server
                // Sinh tên file
                string filename = txtIdBV.Text + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                string[] arr = fuImg.FileName.Split('.');
                string file_ext = arr[arr.Length - 1];
                filename += '.' + file_ext;
                string folder = Server.MapPath("~/Uploads/AnhBaiViet/");
                fuImg.SaveAs(folder + filename);

                // Bước 2: Thêm dữ liệu vào Database
                Models.NewsEntities db = new Models.NewsEntities();
                Models.Media obj = new Models.Media();
                obj.Id_Post =Convert.ToInt32(txtIdBV.Text);
                obj.Url = filename;
                db.Media.Add(obj);
                db.SaveChanges();

                getData(Convert.ToInt32(txtIdBV.Text));
            }
        }
        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            int Id = Convert.ToInt32(e.CommandArgument);
            Models.NewsEntities db = new Models.NewsEntities();
            Models.Media obj = db.Media.FirstOrDefault(x => x.Id == Id);
            if (obj != null)
            {
                db.Media.Remove(obj);
                db.SaveChanges();
                getData(Convert.ToInt32(txtIdBV.Text));
            }
        }
    }
}