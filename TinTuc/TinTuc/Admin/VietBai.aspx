<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="VietBai.aspx.cs" Inherits="TinTuc.Admin.VietBai" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="card shadow mt-5 ml-3 mr-3">
            <div class="card-body mb-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title mt-3 ml-5 mb-5">
                        <h5>Bài Viết Chờ Đăng</h5>
                    </div>
                    <div class="ibox-content ml-5">
                        <asp:Panel runat="server" ID="pnError" Visible="false">
                            <div class="alert alert-danger">
                                <asp:Label runat="server" ID="lbError"></asp:Label><asp:HyperLink runat="server" ID="hpError" class="alert-link"></asp:HyperLink>.
                            </div>
                        </asp:Panel>

                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Danh Mục<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <asp:DropDownList class="form-control" runat="server" ID="ddlDanhMuc">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tên Bài Viết<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtTenBV" type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Mô Tả<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtMoTa" TextMode="MultiLine"  type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Nội Dung<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <CKEditor:CKEditorControl ID="txtNoiDung" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tác Giả<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtTacGia" type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                <a class="btn btn-white" runat="server" href="QuanLyBaiViet.aspx">Quay lại</a>
                                <asp:Button runat="server" ID="btnThemMoi" 
                                    CssClass="btn btn-primary" Text="Thêm mới"
                                    OnClientClick="return valid();"
                                    OnClick="btnThemMoi_Click"
                                />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="../ckeditor/ckeditor.js"></script>
    <script>
        function valid() {
            if (confirm("Bạn muốn lưu?")) {
                return true;
            }
            return false;
        }
    </script>
    <script>
        CKEDITOR.replace('txtNoiDung', {
            filebrowserBrowserUrl: '/ckfinder/ckfinder.html',
            filebrowserImageBrowserUrl: '/ckfinder/ckfinder.html?type=Images',
            filebrowserFlashBrowserUrl: '/ckfinder/ckfinder.html?type=Flash',
            filebrowserUploadUrl: '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',
            filebrowserImageUploadUrl: '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',
            filebrowserFlashUploadUrl: '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash',
            filebrowserWindowWidth: '1000',
            filebrowserWindowHeight: '700',
        });
    </script>
</asp:Content>
