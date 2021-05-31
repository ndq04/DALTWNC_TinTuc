<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ChiTietBaiViet.aspx.cs" Inherits="TinTuc.Admin.ChiTietBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="card shadow mt-5">
            <div class="card-body mb-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title mt-3 ml-3 mb-5">
                        <h5>Cập Nhật Chi Tiết Bài Viết</h5>
                    </div>
                    <div class="ibox-content">
                        <asp:Panel runat="server" ID="pnError" Visible="false">
                            <div class="alert alert-danger">
                                <asp:Label runat="server" ID="lbError"></asp:Label><asp:HyperLink runat="server" ID="hpError" class="alert-link"></asp:HyperLink>.
                            </div>
                        </asp:Panel>

                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Mã Bài Viết<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtMa   BV" type="text" class="form-control" />
                                    <span class="help-block m-b-none">Ví dụ: BV01</span>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tên Bài Viết</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtTenBV" type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Mô Tả</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtMoTa" TextMode="MultiLine"  type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Nội Dung</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtNoiDung" TextMode="MultiLine"  type="text"  class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tác Giả</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtTacGia" type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Danh Mục<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <asp:DropDownList class="form-control" runat="server" ID="cmbDanhMuc">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <a class="btn btn-white" runat="server" href="QuanLyBaiViet.aspx">Quay lại</a>
                                <asp:Button runat="server" ID="btnSua" CssClass="btn btn-primary" 
                                    Text="Lưu lại" 
                                    OnClick="btnSua_Click"
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
    <script>
        function valid() {
            if (confirm("Bạn muốn lưu?")) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
