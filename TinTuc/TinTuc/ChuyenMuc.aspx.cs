using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc
{
    public partial class ChuyenMuc : System.Web.UI.Page
    {
        Models.TinTucEntities db = new Models.TinTucEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int Iddm = Convert.ToInt32(Request.QueryString["Iddm"]);

            rpCategory.DataSource = db.DanhMuc_ByIdCategories(Iddm);
            rpCategory.DataBind();

            rpPost.DataSource = db.BaiViet_ByIdCategories(Iddm);
            rpPost.DataBind();
        }
        public string getAnhDaiDien(int Idbv)
        {
            Models.TinTucEntities db = new Models.TinTucEntities();
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
    }
}