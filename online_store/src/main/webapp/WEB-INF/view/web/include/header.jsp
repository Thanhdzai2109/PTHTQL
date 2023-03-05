<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>T-Sneaker</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/slide.css">
    <link rel="stylesheet" href="/css/reset.css">

    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
            rel="stylesheet"
    />
    <script
            type="module"
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
            nomodule
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>
    <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
</head>
<body>



<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/trang-chu">T-Sneaker</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/trang-san-pham">Sản phẩm</a>
                </li>
                <li class="dropdown nav-item">
                    <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="/trang-san-pham">Danh Mục<span class="caret"></span></a>
                    <ul class="dropdown-menu" >
                        <li class="btn dropdown-item font-weight-bold" onclick="khiClickDanhMuc(0)">Tất cả</li>
                        <c:forEach items="${cacDanhMuc}" var="danhMuc">
                        <li class="btn dropdown-item font-weight-bold" onclick="khiClickDanhMuc(${danhMuc.id})">${danhMuc.ten}</li>
                        </c:forEach>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/lien-he">Liên hệ</a>
                </li>
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/dang-nhap">Đăng nhập</a>
                                </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=request.getContextPath()%>/dang-ky">Đăng ký</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=request.getContextPath()%>/thong-tin-tai-khoan">Xin chào : ${nguoiDungHienTai.tenDangNhap}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=request.getContextPath()%>/dang-xuat">Đăng xuất</a>
                                    </li>
                                </c:if>
            </ul>

            <form action="/tim-san-pham" class="form-inline my-2 my-lg-0" id="timKiem">
                <div class="input-group input-group-sm">
                    <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm..." required>
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <a class="btn btn-success btn-sm ml-3" href="/gio-hang">
                        <i class="fa fa-shopping-cart"></i> Giỏ hàng
                        <span class="badge badge-light" id="soChiMucCuaGioHang"></span>
                    </a>
                </c:if>
            </form>
        </div>
    </div>
</nav>

<script src="/js/web/header.js"></script>


