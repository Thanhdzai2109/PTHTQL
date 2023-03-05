<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="/css/login.css" rel="stylesheet" type="text/css" media="all" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- //web font -->
</head>
<body>
<!-- main -->
<div class="main-w3layouts wrapper">
    <h1>Đăng nhập</h1>

    <div class="main-agileinfo">
        <c:if test="${param.loi != null}">
            <div class="alert alert-danger" vaiTro="alert">
                Tên đăng nhập hoặc mật khẩu không đúng!
            </div>
        </c:if>
        <c:if test="${param.dangxuat != null}">
            <div class="alert alert-success" vaiTro="alert">
                Đăng xuất thành công!
            </div>
        </c:if>
        <c:if test="${param.khongthetruycap != null}">
            <div class="alert alert-warning" vaiTro="alert">
                Không thể truy cập trang này!
            </div>
        </c:if>
        <div class="agileits-top">
            <form action="${pageContext.request.contextPath}" method="post">
                <input class="text" type="text" name="tenDangNhap" placeholder="Tên đăng nhập" required="required"/>
                <input class="text email" type="password" name="matKhau" placeholder="mật khẩu" required="required">
                <div class="wthree-text">
                    <label class="anim">
                        <input type="checkbox" class="checkbox" name = "nhomatkhau">
                        <span>Nhớ mật khẩu</span>
                    </label>
                    <div class="clear"> </div>
                </div>
                <input type="submit" value="Đăng nhập">
            </form>
            <p>Đã có tài khoản? <a href="/dang-ky"> Đăng ký!</a></p>
        </div>
    </div>
</div>


</body>
</html>