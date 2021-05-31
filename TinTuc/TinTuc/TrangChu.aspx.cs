using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc
{
    public partial class TrangChu : System.Web.UI.Page
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
            rpPost.DataSource = db.Post.Take(30).ToList();
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