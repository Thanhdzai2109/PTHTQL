<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="/css/chitietsanpham.css">
<% DecimalFormat formatter = new DecimalFormat("###,###,###");
    pageContext.setAttribute("formatter",formatter);
%>
<div class="container">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title" style="font-size: 40px">${sanPham.ten}</h3>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6">
                    <div class="white-box text-center"><img src="${sanPham.pathAnh}" class="img-responsive"></div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-6">
                    <h4 class="box-title mt-5">Mô tả</h4>
                    <p>${sanPham.moTa}</p>
                    <h2 class="mt-5" style="color: #b36800">

                        ${formatter.format(sanPham.gia)}VND<small class="text-success">(36%off)</small>
                    </h2>
                    <button class="btn btn-dark btn-rounded mr-1" data-toggle="tooltip" title="" data-original-title="Add to cart" onclick="themSanPham(${sanPham.id})">
                        <i class="fa fa-shopping-cart" style="width: 60px; font-size: 30px; height: auto"></i>
                    </button>
<%--                    <button class="btn btn-primary btn-rounded">Mua ngay</button>--%>
                    <h3 class="box-title mt-5">Điểm nổi bật chính</h3>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-check text-success"></i>Cấu trúc chắc chắn</li>
                        <li><i class="fa fa-check text-success"></i>Được thiết kế để mang lại cảm giác em ái nhất</li>
                        <li><i class="fa fa-check text-success"></i>Vẻ ngoài hào nhoáng tô điểm thêm sự sang chảnh của bạn
                        </li>
                    </ul>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h3 class="box-title mt-5">Thông tin chung</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-product">
                            <tbody>
                            <tr>
                                <td width="390">Nhãn hiệu</td>
                                <td>${sanPham.nhanHieu.ten}</td>
                            </tr>
                            <tr>
                                <td>Kiểu dáng</td>
                                <td>${sanPham.danhMuc.ten}</td>
                            </tr>
                            <tr>
                                <td>Màu sắc</td>
                                <td>${sanPham.mauSac}</td>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td>${sanPham.gioiTinh}</td>
                            </tr>
                            <tr>
                                <td>Số lượng</td>
                                <td>${sanPham.soLuong}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/web/themsanpham.js"></script>
<script src="/js/web/sanpham.js"></script>