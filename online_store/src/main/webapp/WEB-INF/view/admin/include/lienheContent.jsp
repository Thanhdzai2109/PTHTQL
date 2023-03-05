<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="/css/lienhe.css">
<script src="https://kit.fontawesome.com/75eef02814.js" crossorigin="anonymous"></script>

<div class="col-md-9 bounce">
    <h3 class="page-header">Quản lý Danh mục</h3>
    <table class="table table-hover " style="text-align: center;">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Lời nhắn</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        </tbody>

    </table>

    <ul class="pagination">
    </ul>
</div>

<div class="modal1" id="myModal">
    <div class="modal__overlay"></div>

    <div class="modal__body">
        <div class="modal__inner">

            <div class="card">
                <div class="card-header bg-primary text-white row_head">
                    <i class="fa fa-envelope"></i>Trả lời liên hệ.
                    <div class="btn" id="close">x</div>
                </div>
                <div class="card-body" style="width: 500px">
                    <form id="formLienHe" >
                        <div class="form-group">
                            <label for="traLoi">Trả lời</label>
                            <textarea class="form-control" id="traLoi" rows="5" required style="font-size: 25px"></textarea>
                        </div>
                        <div class="mx-auto bg-success">
                            <button type="submit" class="btn btn-primary text-left" style="float: right;">Gửi</button></div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="/js/admin/lienhe.js"></script>
