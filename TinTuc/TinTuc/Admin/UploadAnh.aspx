<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="UploadAnh.aspx.cs" Inherits="TinTuc.Admin.UploadAnh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row mt-4 ml-4">
            <div class="ibox-title">
                <a runat="server" href="QuanLyBaiViet.aspx" class="btn btn-info">Quay lại</a>
            </div>
        </div>
        <div class="row mt-4 ml-4">
            <div class="col-lg-7">
                <div class="ibox float-e-margins">
                    <div class="ibox-title mb-4">
                        <h5>Ảnh đại diện</h5>
                    </div>
                    <div class="ibox-content">
                        <asp:GridView AutoGenerateColumns="false" runat="server" ID="dgvMedia" CssClass="table table-responsive table-bordered table-hover">
                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="Id" />
                                <asp:TemplateField>
                                    <HeaderTemplate>Ảnh</HeaderTemplate>
                                    <ItemTemplate>
                                        <img height="120px" src='<%# "../Uploads/AnhBaiViet/" + Eval("Url").ToString() %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Chức năng
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="btnXoa"
                                            CssClass="text-danger"
                                            OnClientClick="return check();"
                                            OnCommand="btnXoa_Command"
                                            CommandArgument='<%# Eval("Id") %>'><i class="fa fa-trash"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title mb-3">
                        <h5>Cập nhật thông tin</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Id Bài Viết</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" Enabled="false" ID="txtIdBV" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Upload file</label>
                                <div class="col-lg-9">
                                    <asp:FileUpload runat="server" ID="fuImg" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <asp:Button runat="server" ID="btnUpload" class="btn btn-sm btn-primary" type="submit" Text="Upload"
                                        OnClick="btnUpload_Click" />
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
     <script>
         function check() {
             if (confirm("Bạn thực sự muốn xóa? Thao tác này sẽ không khôi phục lại được!") == true) {
                 return true;
             }
             return false;
         }
    </script>
</asp:Content>