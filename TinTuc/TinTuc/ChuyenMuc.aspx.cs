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
        Models.NewEntities db = new Models.NewEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int Iddm = Convert.ToInt32(Request.QueryString["Iddm"]);

            rpCategory.DataSource = db.DanhMuc_SelectID(Iddm);
            rpCategory.DataBind();

            rpPost.DataSource = db.ChiTiet_SelectID(Iddm);
            rpPost.DataBind();
        }
        public string getAnhDaiDien(int Idbv)
        {
            Models.NewEntities db = new Models.NewEntities();
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