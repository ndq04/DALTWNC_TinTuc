using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc
{
    public partial class SiteCustomer : System.Web.UI.MasterPage
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
            Models.NewsEntities db = new Models.NewsEntities();

            rpPost.DataSource = db.DanhMuc_SelectAll();
            rpPost.DataBind();

            rpNew.DataSource = db.BaiViet_5New();
            rpNew.DataBind();
        }
        public string getAnhDaiDien(int IdBV)
        {
            Models.NewsEntities db = new Models.NewsEntities();
            Models.Media obj = db.Media.FirstOrDefault(x => x.Id_Post == IdBV);
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