<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="https://kit.fontawesome.com/75eef02814.js" crossorigin="anonymous"></script>

<div class="col-md-9 bounce">
    <h3 class="page-header">Quản lý Danh mục</h3>

    <select class="form-control" style="width: 30%;" id="trangThai">
        <option value="chuahoanthanh">Chưa hoàn thành</option>
        <option value="hoanthanh">Hoàn thành</option>
    </select>

    <hr/>

    <table class="table table-hover " style="text-align: center;">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Người nhận</th>
            <th>Đơn giá</th>
            <th>Trạng thái</th>
            <th>Ngày đặt</th>
            <th>Ngày nhận</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        </tbody>

    </table>

    <ul class="pagination">
    </ul>
</div>

<script src="/js/admin/donhang.js"></script>
