<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/trang-chu">Trang Chủ</a></li>
                    <li class="breadcrumb-item"><a href="#">Nhãn hiệu</a></li>
                    <li class="breadcrumb-item active" aria-current="#">Sub-Brand</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i>Thương hiệu</div>
                <ul class="list-group category_block" id="listNhanHieu">
                    <c:forEach items="${cacNhanHieu}" var="nhanHieu">
                        <li class="list-group-item text-black font-weight-bold" onclick="khiClickNhanHieu(${nhanHieu.id})">${nhanHieu.ten}</li>
                    </c:forEach>
                    <input type="hidden" value="${idCategory}" id="idDanhMuc">
                </ul>
            </div>
            <div class="card bg-light mb-3">
                <div class="card-header text-white text-uppercase">Sản phẩm mới nhất</div>
                <div class="card-body" id="sanPhamMoi">
                    <img class="img-fluid" src="/img/pic1.jpg" />
                    <h5 class="card-title">Jordan</h5>
                    <p class="card-text">Sneaker</p>
                    <p class="bloc_left_price">100$</p>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <div class="row sub-category" id="listSanPham">
                <%--                <c:forEach items="${cacSanPham}" var="sanPham">--%>
                <%--                <div class="col-12 col-md-6 col-lg-4 product">--%>
                <%--                    <div class="card">--%>
                <%--                        <img class="card-img-top" src="${sanPham.pathAnh}" alt="Card image cap">--%>
                <%--                        <div class="card-body">--%>
                <%--                            <h4 class="card-title show_txt"><a href="#" title="View Product">${sanPham.ten}</a></h4>--%>
                <%--                            <p class="card-text show_txt">${sanPham.nhanHieu.ten}</p>--%>
                <%--                            <div class="row price-add-to-card">--%>
                <%--                                <div class="col price">--%>
                <%--                                    <p class="btn btn-danger btn-block">${sanPham.gia} VND</p>--%>
                <%--                                </div>--%>
                <%--                                <div class="col add-to-card">--%>
                <%--                                    <a href="#" class="btn btn-success btn-block">Thêm vào giỏ hàng</a>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                </c:forEach>--%>
            </div>
        </div>

    </div>
    <div class="row justify-content-center">
        <ul class="pagination" id="so-trang">
            <li class="page-item" id="btn-truoc"><a class="page-link">Trước</a></li>

            <li class="page-item" id="btn-sau"><a class="page-link">Sau</a></li>
        </ul>
    </div>
</div>


<script src="/js/web/sanpham.js"></script>
<script src="/js/web/themsanpham.js"></script>