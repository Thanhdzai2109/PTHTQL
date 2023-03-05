<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/profile.css">

<div class="container">
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
                    <div class="row mt-5 align-items-center">
                        <div class="col-md-3 text-center mb-5">
                            <div class="avatar avatar-xl">
                                <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="..." class="avatar-img rounded-circle" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="row align-items-center">
                                <div class="col-md-7">
                                    <h4 class="mb-1">Brown, Asher</h4>
                                    <p class="small mb-3"><span class="badge badge-dark">New York, USA</span></p>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-md-7">
                                    <p class="text-muted">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit nisl ullamcorper, rutrum metus in, congue lectus. In hac habitasse platea dictumst. Cras urna quam, malesuada vitae risus at,
                                        pretium blandit sapien.
                                    </p>
                                </div>
                                <div class="col">
                                    <p class="small mb-0 text-muted">Nec Urna Suscipit Ltd</p>
                                    <p class="small mb-0 text-muted">P.O. Box 464, 5975 Eget Avenue</p>
                                    <p class="small mb-0 text-muted">(537) 315-1481</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-4" />
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tenDangNhap">Tên đăng nhập</label>
                            <input type="text" id="tenDangNhap" class="form-control" value="${nguoiDungHienTai.tenDangNhap}" readonly/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="hoTen">Họ và tên</label>
                            <input type="text" id="hoTen" class="form-control" value="${nguoiDungHienTai.hoTen}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" value="${nguoiDungHienTai.email}" />
                    </div>
                    <div class="form-group">
                        <label for="diaChi">Địa chỉ</label>
                        <input type="text" class="form-control" id="diaChi" value="${nguoiDungHienTai.diaChi}" />
                    </div>
                    <hr class="my-4" />
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="matKhauMoi">Mật khẩu mới</label>
                                <input type="password" class="form-control" id="matKhauMoi" />
                            </div>
                            <div class="form-group">
                                <label for="matKhauXacNhan">Nhập lại mật khẩu</label>
                                <input type="password" class="form-control" id="matKhauXacNhan" />
                                <label for="matKhauXacNhan" id="warn-cf-pass" style="color: #A11515FF"></label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <p class="mb-2">Yêu cầu mật khẩu</p>
                            <p class="small text-muted mb-2">To create a new password, you have to meet all of the following requirements:</p>
                            <ul class="small text-muted pl-4 mb-0">
                                <li>Ít nhất 3 ký tự</li>
                                <li>Không được giống với mật khẩu cũ</li>
                            </ul>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">lưu thay đổi</button>
                </form>
            </div>
        </div>
    </div>

</div>

<script src="/js/web/thongtin.js"></script>
<script src="/js/web/sanpham.js"></script>
