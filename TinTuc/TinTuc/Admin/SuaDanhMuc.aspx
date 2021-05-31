<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaDanhMuc.aspx.cs" Inherits="TinTuc.Admin.SuaDanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="card shadow mt-5">
            <div class="card-body mb-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title mt-3 ml-3 mb-5">
                        <h5>Sửa Danh Mục</h5>
                    </div>
                    <div class="ibox-content">
                        <asp:Panel runat="server" ID="pnError" Visible="false">
                            <div class="alert alert-danger">
                                <asp:Label runat="server" ID="lbError"></asp:Label><asp:HyperLink runat="server" ID="hpError" class="alert-link"></asp:HyperLink>.
                            </div>
                        </asp:Panel>

                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Id Danh Mục<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtMaDM" type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tên Danh Mục<span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <asp:TextBox  runat="server" ID="txtTenDM" class="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>  
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                <a class="btn btn-white" runat="server" href="QuanLyDanhMuc.aspx">Quay lại</a>
                                <asp:Button runat="server" ID="btnSua" 
                                    CssClass="btn btn-primary" Text="Lưu lại"
                                    OnClientClick="return valid();"
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
