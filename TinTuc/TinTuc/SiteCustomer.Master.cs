﻿using System;
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
            Models.NewEntities db = new Models.NewEntities();

            rpPost.DataSource = db.DanhMuc_SelectAll();
            rpPost.DataBind();

            rpNew.DataSource = db.ChiTiet_SelectNew();
            rpNew.DataBind();
        }
        public string getAnhDaiDien(int IdBV)
        {
            Models.NewEntities db = new Models.NewEntities();
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