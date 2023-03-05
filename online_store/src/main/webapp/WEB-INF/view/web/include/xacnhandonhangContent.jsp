<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<% DecimalFormat formatter = new DecimalFormat("###,###,###");
    pageContext.setAttribute("formatter",formatter);
%>

<div class="container mt-5 mb-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="text-left logo p-2 px-5">
                    <img src="https://i.imgur.com/2zDU056.png" width="50">
                </div>
                <div class="invoice p-5">
                    <h5>Bạn đã xác nhận đơn hàng!</h5>
                    <c:if test="${nguoiDungHienTai.hoTen != null}">
                        <span class="font-weight-bold d-block mt-4">Xin chào, ${nguoiDungHienTai.hoTen}</span>
                    </c:if>
                    <c:if test="${nguoiDungHienTai.hoTen == null}">
                        <span class="font-weight-bold d-block mt-4">Xin chào, ${nguoiDungHienTai.tenDangNhap}</span>
                    </c:if>
                    <span>Đơn hàng của bạn đã được xác nhận và sẽ được giao trong vài ngày tới!</span>
                    <div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
                        <table class="table table-borderless">
                            <tbody>
                            <tr>
                                <td>
                                    <div class="py-2">

                                        <span class="d-block text-muted">Ngày đặt</span>
                                        <span>${donHang.ngayDat}</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="py-2">
                                        <span class="d-block text-muted">Mã đơn</span>
                                        <span>MT12332345</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="py-2">
                                        <span class="d-block text-muted">Thanh toán</span>
                                        <span><img src="https://img.icons8.com/color/48/000000/mastercard.png"
                                                   width="20"/></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="py-2">
                                        <span class="d-block text-muted">Địa chỉ nhận hàng</span>
                                        <span>${nguoiDungHienTai.diaChi}</span>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="product border-bottom table-responsive">
                        <table class="table table-borderless">
                            <tbody>
                            <c:forEach items="${chiTiets}" var="chiTiet">
                                <tr>
                                    <td width="20%">
                                        <img src="${chiTiet.sanPham.pathAnh}" width="90">
                                    </td>
                                    <td width="60%">
                                        <span class="font-weight-bold">${chiTiet.sanPham.ten}</span>
                                        <div class="product-qty">
                                            <span class="d-block">Số lượng: ${chiTiet.soLuong}</span>
                                            <span>Màu sắc: ${chiTiet.sanPham.mauSac}</span>
                                        </div>
                                    </td>
                                    <td width="20%">
                                        <div class="text-right">
                                            <span class="font-weight-bold">${formatter.format(chiTiet.donGia)}đ</span>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="row d-flex justify-content-end">
                        <div class="col-md-5">
                            <table class="table table-borderless">
                                <tbody class="totals">
                                <tr>
                                    <td>
                                        <div class="text-left">

                                            <span class="text-muted">Miễn phí vận chuyển</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-right">
                                            <span>30,000đ</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="border-top border-bottom">
                                    <td>
                                        <div class="text-left">

                                            <span class="font-weight-bold">Đơn giá</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-right">
                                            <span class="font-weight-bold">${formatter.format(donHang.tongGia)}đ</span>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <p>Chúng tôi sẽ gửi email xác nhận đã giao hàng!</p>
                    <p class="font-weight-bold mb-0">Cảm ơn đã tin tưởng và mua sắm!</p>
                    <span>Nike Team</span>
                </div>
                <div class="d-flex justify-content-between footer p-3">
                    <span>Need Help? visit our <a href="#"> help center</a></span>
                    <span>${donHang.ngayDat}</span>
                </div>
            </div>
        </div>
    </div>
</div>