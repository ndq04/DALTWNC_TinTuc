<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="TinTuc.ChiTiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="page-wrapper">
        <div class="blog-title-area">
            <asp:Repeater ID="rpCategory" runat="server">
                <ItemTemplate>
                    <ol class="breadcrumb hidden-xs-down">
                        <li class="breadcrumb-item"><a href="TrangChu.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a><%# Eval("Ten") %></a></li>
                    </ol>
                    <span class="color-orange"><a><%# Eval("Ten") %></a></span>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Repeater ID="rpChiTiet" runat="server">
                <ItemTemplate>
                    <h3><%# Eval("TenBV") %></h3>

                    <div class="blog-meta big-meta">
                        <small><a><%# Eval("NgayDang") %></a></small>
                        <small><a>by <%# Eval("TacGia") %></a></small>
                    </div>
                    <!-- end meta -->

                    <div>
                        <h5><%# Eval("MoTa") %></h5>
                    </div>

                    <div class="single-post-media">
                        <img src='<%# "Uploads/AnhBaiViet/" + getAnhDaiDien(Convert.ToInt32(Eval("Id"))) %>' style="width: 720px"/>
                    </div>
                    <!-- end media -->

                    <div class="blog-content">
                        <%# Eval("NoiDung") %>
                    </div>
                    <!-- end content -->
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="blog-title-area">
            <div class="tag-cloud-single">
                <span>Tags</span>
                <asp:Repeater runat="server" ID="rpTag">
                    <ItemTemplate>
                        <small><a href="ChuyenMuc.aspx?Iddm=<%# Eval("Id") %>"" title=""><%# Eval("Ten") %></a></small>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- end meta -->
        </div>
        <!-- end title -->

        <div class="row">
            <div class="col-lg-12">
                <div class="banner-img">
                    <a href="https://www.thegioididong.com/flashsale">
                        <img src="Uploads/giang-sinh-800-170-800x170.png" alt="" class="img-fluid" /></a>
                </div>
                <!-- end banner-img -->
                <!-- end banner -->
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->

        <hr class="invis1"/>

        <div class="custombox clearfix">
            <h4 class="small-title">Tin Cùng Chuyên Mục</h4>
            <div class="row">
                <asp:Repeater runat="server" ID="rpRandom">
                    <ItemTemplate>
                        <div class="col-lg-4">
                            <div class="blog-box">
                                <div class="post-media">
                                    <a href="ChiTiet.aspx?Idbv=<%# Eval("Id") %>&Iddm=<%# Eval("Id") %>" title="">
                                        <img src='<%# "Uploads/AnhBaiViet/" + getAnhDaiDien(Convert.ToInt32(Eval("Id"))) %>' alt="" style="height: 150px">
                                        <div class="hovereffect">
                                            <span class=""></span>
                                        </div>
                                        <!-- end hover -->
                                    </a>
                                </div>
                                <!-- end media -->
                                <div class="blog-meta">
                                    <h4><a href="ChiTiet.aspx?Idbv=<%# Eval("Id") %>&Iddm=<%# Eval("Id") %>" title=""><%# Eval("TenBV") %></a></h4>
                                    <small><a  title=""></a></small>
                                    <small><a  title=""><%# Eval("NgayDang") %></a></small>
                                </div>
                                <!-- end meta -->
                            </div>
                            <!-- end blog-box -->
                        </div>
                        <!-- end col -->
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- end row -->
        </div>

        <hr class="invis1"/>

        <div class="custombox clearfix">
            <h4 class="small-title">Tất Cả Bình Luận</h4>
            <div class="row">
                <div class="col-lg-12">
                    <div class="comments-list">
                        <asp:Repeater ID="rpComment" runat="server">
                            <ItemTemplate>
                                <div class="media">
                                    <a class="media-left" href="#">
                                        <img src="Uploads/Images/user.jpg" alt="" class="rounded-circle" />
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading user_name"><%# Eval("ButDanh") %><small>/ <%# Eval("NgayViet") %></small></h4>
                                        <p><%# Eval("NoiDung") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end custom-box -->

        <hr class="invis1" />

        <div class="custombox clearfix">
            <h4 class="small-title">Bình Luận</h4>
            <asp:Panel runat="server" ID="pnError" Visible="false">
                <div class="alert alert-danger">
                    <asp:Label runat="server" ID="lbError"></asp:Label><asp:HyperLink runat="server" ID="hpError" class="alert-link"></asp:HyperLink>.
                </div>
            </asp:Panel>
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-wrapper">
                        <asp:TextBox runat="server" ID="txtButDanh" type="text" class="form-control" placeholder="Họ Tên"/>
                        <asp:TextBox runat="server" ID="txtNoiDung" TextMode="MultiLine" class="form-control" placeholder="Nội Dung Bình Luận"/>
                        <asp:Button runat="server" ID="btnBinhLuan"
                            CssClass="btn btn-primary" Text="Bình Luận"
                            OnClick="btnBinhLuan_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- end custom-box -->
    </div>
    <!-- end page-wrapper -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
