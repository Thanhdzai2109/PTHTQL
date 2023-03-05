<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="container-fluid">
    <div class="col-md-3">

        <div id="sidebar">
            <div class="container-fluid tmargin">
                <div class="input-group">
                </div>
            </div>

            <ul class="nav navbar-nav side-bar">

                <li class="side-bar tmargin">
                    <a href="<c:url value='/admin/don-hang' />">
                        <span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>Đơn hàng</a>
                </li>

                <li class="side-bar">
                    <a href='<c:url value="/admin/san-pham"/>' >
                        <span class="glyphicon glyphicon-folder-open">&nbsp;</span>Sản phẩm</a>
                </li>

                <li class="side-bar">
                    <a href='<c:url value="/admin/danh-muc"/>'>
                        <span class="glyphicon glyphicon-tasks">&nbsp;</span>Danh mục</a>
                </li>

                <li class="side-bar">
                    <a href='<c:url value="/admin/nhan-hieu"/>' >
                        <span class="glyphicon glyphicon-flag">&nbsp;</span>Nhãn hiệu</a>
                </li>

                <li class="side-bar main-menu">
                    <a href="<c:url value='/admin/quan-ly-tai-khoan' />">
                        <span class="glyphicon glyphicon-th-list">&nbsp;</span>Tài khoản</a>
                </li>
                <li class="side-bar main-menu">
                    <a href="<c:url value='/admin/lien-he' />">
                        <span class="glyphicon glyphicon-th-list">&nbsp;</span>Liên hệ</a>
                </li>
                <li class="side-bar">
                    <a href="<c:url value='/admin/thong-tin-tai-khoan' />">
                        <span class="glyphicon glyphicon-user">&nbsp;</span>Thông tin tài khoản</a>
                </li>
                <li class="side-bar">
                    <a href="<c:url value='/admin/thong-ke' />">
                        <span class="glyphicon glyphicon-signal">&nbsp;</span>Thống kê đơn hàng</a>
                </li>
            </ul>
        </div>
    </div>

    <script src="<c:url value='/js/quantri.js'/>" ></script>
