<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QuanLyDanhMuc.aspx.cs" Inherits="TinTuc.Admin.QuanLyDanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="card shadow mt-5">
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table table-bordered" id="dataTable">
                        <div class="ibox-title mb-4">
                            <a runat="server" href="ThemDanhMuc.aspx" class="btn btn-info">Thêm mới danh mục</a>
                        </div>
                        <asp:Panel runat="server" ID="pnError" Visible="false">
                            <div class="alert alert-danger">
                                <asp:Label runat="server" ID="lbError"></asp:Label><asp:HyperLink runat="server" ID="hpError" class="alert-link"></asp:HyperLink>.
                            </div>
                        </asp:Panel>
                        <asp:GridView runat="server"
                            AutoGenerateColumns="false"
                            ID="dgvDanhMuc"
                            class="table table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID Danh Mục" />
                                <asp:BoundField DataField="Ten" HeaderText="Tên Danh Mục" />
                                <asp:TemplateField>
                                    <HeaderTemplate>Chức năng</HeaderTemplate>
                                    <ItemTemplate>
                                        <a class="btn btn-link mr-3" href='<%# "SuaDanhMuc.aspx?Iddm=" + Eval("Id").ToString()%>'>Sửa</a>
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
