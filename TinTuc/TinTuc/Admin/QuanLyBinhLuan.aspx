﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QuanLyBinhLuan.aspx.cs" Inherits="TinTuc.Admin.QuanLyBinhLuan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row mt-4 mb-4">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-8">
                        <asp:DropDownList class="form-control" runat="server" ID="ddlBaiViet">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-5">
                                <asp:Button runat="server" ID="btnLoc"
                                CssClass="btn btn-success" Text="Lọc Theo Bài Viết"
                                OnCommand="btnLocPost_Command" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card shadow mt-5">
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table table-bordered" id="dataTable">
                        <asp:Panel runat="server" ID="pnError" Visible="false">
                            <div class="alert alert-danger">
                                <asp:Label runat="server" ID="lbError"></asp:Label><asp:HyperLink runat="server" ID="hpError" class="alert-link"></asp:HyperLink>
                            </div>
                        </asp:Panel>
                        <asp:GridView runat="server"
                            AutoGenerateColumns="false"
                            ID="dgvBinhLuan"
                            class="table table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID Bình Luận" /> 
                                <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" />
                                <asp:BoundField DataField="NgayViet" HeaderText="Ngày Viết" />
                                <asp:BoundField DataField="ButDanh" HeaderText="Bút Danh" />
                                <asp:TemplateField>
                                    <HeaderTemplate>Chức năng</HeaderTemplate>
                                    <ItemTemplate>
                                        <%--<a class="btn btn-link mr-3" href='<%# "SuaDanhMuc.aspx?Madm=" + Eval("MaDM").ToString()%>'>Sửa</a>--%>
                                        <asp:LinkButton runat="server" ID="btnXoa"
                                            CssClass="text-danger"
                                            OnClientClick="return check();"
                                            OnCommand="btnXoa_Command"
                                            CommandArgument='<%# Eval("Id") %>'><i class="fa fa-trash"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                         <asp:Panel runat="server" ID="pnEmpty" Visible="false">
                            <div class="alert alert-danger">
                                <asp:Label runat="server" ID="lbEmpty"></asp:Label><asp:HyperLink runat="server" ID="HyperLink1" class="alert-link"></asp:HyperLink>
                            </div>
                        </asp:Panel>
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
