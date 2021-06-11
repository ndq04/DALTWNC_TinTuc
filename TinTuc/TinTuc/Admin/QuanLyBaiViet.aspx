<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QuanLyBaiViet.aspx.cs" Inherits="TinTuc.Admin.QuanLyBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row mt-4 mb-4">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-8">
                        <asp:DropDownList class="form-control" runat="server" ID="ddlDanhMuc">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-5">
                                <asp:Button runat="server" ID="btnLoc"
                                CssClass="btn btn-success" Text="Lọc Theo Danh Mục"
                                OnCommand="btnLoc_Command" />
                            </div>
                            <div class="col-lg-7">
                                <asp:Button runat="server" ID="btnAll"
                                CssClass="btn btn-secondary" Text="Tất cả"
                                OnCommand="btnAll_Command" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card shadow"">
            <div class="card-body">
                <div class="ibox-title mb-4">
                    <a runat="server" href="VietBai.aspx" class="btn btn-info">Thêm mới</a>
                </div>
                <asp:Panel runat="server" ID="pnError" Visible="false">
                    <div class="alert alert-danger">
                        <asp:Label runat="server" ID="lbError"></asp:Label><asp:HyperLink runat="server" ID="hpError" class="alert-link"></asp:HyperLink>.
                    </div>
                </asp:Panel>
                <asp:GridView runat="server"
                    AutoGenerateColumns="false"
                    ID="dgvBaiViet"
                    class="table table-bordered table-hover">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID Bài Viết" />
                        <asp:BoundField DataField="TenBV" HeaderText="Tên Bài Viết" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" />
                        <asp:BoundField DataField="TacGia" HeaderText="Tác Giả" />
                        <asp:BoundField ControlStyle-Width="100px" DataField="NgayDang" HeaderText="Ngày Đăng" />
                        <asp:TemplateField>
                            <HeaderTemplate>Chức năng</HeaderTemplate>
                            <ItemTemplate>
                                <div style="display:flex;align-items:center;">
                                    <div style="margin: 0 5px">
                                        <a class="btn btn-warning" href='<%# "SuaBaiViet.aspx?Idbv=" + Eval("Id").ToString()%>'>Sửa</a>
                                    </div>
                                    <div style="margin: 0 5px">
                                        <a class="btn btn-primary" href='<%# "UploadAnh.aspx?Idbv=" + Eval("Id").ToString()%>'>Ảnh</a>
                                    </div>
                                    <div>
                                        <asp:LinkButton runat="server" ID="btnXoa"
                                        CssClass="text-danger"
                                        OnClientClick="return check();"
                                        OnCommand="btnXoa_Command"
                                        CommandArgument='<%# Eval("Id") %>'><i class="fa fa-trash" style="font-size:2rem"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        function check() {
            if (confirm("Bạn thực sự muốn xóa? Thao tác này sẽ không khôi phục lại được!") == true) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
