<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="TinTuc.TrangChu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang Chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="page-wrapper">
        <div class="blog-top clearfix">
            <h4 class="pull-left">All News</h4>
        </div>
        <!-- end blog-top -->

        <div class="blog-list clearfix">
            <asp:Repeater runat="server" ID="rpPost">
                <ItemTemplate>
                    <div class="blog-box row mb-3">
                        <div class="col-md-4">
                            <div class="post-media">
                                <a href="ChiTiet.aspx?Idbv=<%# Eval("Id") %>&Iddm=<%# Eval("Id") %>" title="">
                                    <img src='<%# "Uploads/AnhBaiViet/" + getAnhDaiDien(Convert.ToInt32(Eval("Id"))) %>' alt="Post Name" class="img-fluid" style="height: 150px" />
                                    <div class="hovereffect"></div>
                                </a>
                            </div> 
                            <!-- end media -->
                        </div>
                        <!-- end col -->

                        <div class="blog-meta big-meta col-md-8">
                            <h4><a href="ChiTiet.aspx?Idbv=<%# Eval("Id") %>&Iddm=<%# Eval("Id") %>" title=""><%# Eval("TenBV").ToString() %></a></h4>
                            <p><%# Eval("MoTa").ToString() %></p>
                            <small class="firstsmall"><a class="bg-orange" ><%# Eval("Categories.Ten").ToString() %></a></small>
                            <small><a ><%# Eval("NgayDang") %></a></small>
                            <small><a ><%# Eval("TacGia").ToString() %></a></small>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!-- end meta -->
            <!-- end blog-box -->
        </div>
        <!-- end blog-list -->
    </div>
    <!-- end page-wrapper -->

    <div class="row">
        <div class="col-md-12">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-start">
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- end col -->
    </div>
    <!-- end row -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
