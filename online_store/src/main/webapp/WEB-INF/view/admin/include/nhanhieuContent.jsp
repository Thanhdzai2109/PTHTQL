<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="https://kit.fontawesome.com/75eef02814.js" crossorigin="anonymous"></script>

<div class="col-md-9 bounce">
    <h3 class="page-header">Quản lý Nhãn hiệu</h3>

    <form id="form_them_nhan_hieu" method="post">
        <div class="form-row">
            <div class="form-group col-md-4">
                <input type="text" class="form-control" id="nhanHieu" placeholder="Nhãn hiệu" name="nhanHieu">
            </div>
        </div>
        <div class="form-group col-md-1">
            <button type="submit" class="btn btn-primary">Thêm Nhãn hiệu</button>
        </div>
    </form>

    <hr/>

    <table class="table table-hover " style="text-align: center;">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Nhãn hiệu</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        </tbody>

    </table>

    <ul class="pagination">
    </ul>
</div>

<script src="/js/admin/nhanhieu.js"></script>
