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
        <div class="col-sm-12">
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


<script src="/js/web/timkiem.js"></script>
<script src="/js/web/themsanpham.js"></script>