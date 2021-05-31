<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TinTuc.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Page Title - SB Admin</title>
        <link href="Template/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
</head>
<body class="bg-primary">
    <form id="form1" runat="server">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">Đăng Nhập</h3>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="txtTaiKhoan">Tên Đăng Nhập</label>
                                            <asp:TextBox runat="server" ID="txtTaiKhoan" TextMode="SingleLine" class="form-control py-4" placeholder="Username" required="" />
                                        </div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="txtMatKhau">Mật Khẩu</label>
                                            <asp:TextBox runat="server" ID="txtMatKhau" TextMode="password" class="form-control py-4" placeholder="Password" required="" />
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <asp:Label runat="server" ID="lbError" CssClass="text-danger"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <a class="small" href="#">Quên Mật Khẩu</a>
                                            <asp:Button runat="server"
                                                class="btn btn-primary"
                                                Text="Đăng Nhập"
                                                ID="btnLogin"
                                                OnClick="btnLogin_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer text-center">
                                    <div class="small"><a href="#">Chưa Có Tài Khoản ? Tạo Ngay !</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="Template/js/scripts.js"></script>
    </form>
</body>
</html>
