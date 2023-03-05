<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%--<link rel="stylesheet" href="/css/profile.css">--%>


<div class="container col-md-9">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-10 col-xl-8 mx-auto">
            <h2 class="h3 mb-4 page-title">Cài đặt</h2>
            <div class="my-4">
                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">Thông tin người dùng</a>
                    </li>
                </ul>
                <form id="profile-form" method="post">
                    <hr class="my-4" />
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <label for="tenDangNhap">Tên đăng nhập</label>
                            <input type="text" id="tenDangNhap" class="form-control" value="${nguoiDungHienTai.tenDangNhap}" readonly/>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="hoTen">Họ và tên</label>
                            <input type="text" id="hoTen" class="form-control" value="${nguoiDungHienTai.hoTen}" />
                        </div>
                    </div>
                    <div class="form-group col-md-9">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" value="${nguoiDungHienTai.email}" />
                    </div>
                    <div class="form-group col-md-9">
                        <label for="diaChi">Địa chỉ</label>
                        <input type="text" class="form-control" id="diaChi" value="${nguoiDungHienTai.diaChi}" />
                    </div>
                    <hr class="my-4" />
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="matKhauMoi">Mật Khẩu mới</label>
                                <input type="password" class="form-control" id="matKhauMoi" />
                            </div>
                            <div class="form-group">
                                <label for="matKhauXacNhan">Nhập lại mật khẩu</label>
                                <input type="password" class="form-control" id="matKhauXacNhan" />
                                <label for="matKhauXacNhan" id="warn-cf-pass" style="color: #A11515FF"></label>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                </form>
            </div>
        </div>
    </div>

</div>

<script src="/js/web/thongtin.js"></script>
