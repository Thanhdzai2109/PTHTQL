<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="https://kit.fontawesome.com/75eef02814.js" crossorigin="anonymous"></script>


<div class="col-md-9 bounce">
    <h3 class="page-header">Quản lý sản phẩm</h3>
    <form id="form_them_san_pham" method="post" enctype="multipart/form-data">
        <div class="form-row">
            <div class="form-group col-md-4">
                <input type="text" class="form-control" id="tenSanPham" placeholder="Tên sản phẩm" name="ten" required>
            </div>
            <div class="form-group col-md-5">
                <input type="text" class="form-control" id="gioiTinh" placeholder="Giới tính" name="gioiTinh" required>
            </div>
            <div class="form-group col-md-2">
                <label for="mauSac">Màu sắc:</label>
                <select id="mauSac" class="form-control" name="mauSac">
                    <option selected>Trắng</option>
                    <option>Đen</option>
                    <option>Xanh</option>
                    <option>Phối màu</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <input type="number" class="form-control" id="soLuong" placeholder="Số lượng" name="soLuong" min="1" max="200" required>
            </div>
            <div class="form-group col-md-5">
                <input type="number" class="form-control" id="gia" placeholder="Giá" name="gia" step="200000" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-9">
                <textarea class="form-control" id="moTa" placeholder="Mô tả" name="moTa" rows="2"></textarea>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label for="hinhAnh">Hình ảnh</label>
            <input type="file" id="hinhAnh" name="anh" required>
        </div>
        <div class="form-row">

            <div class="form-group col-md-4">
                <label for="nhanHieu">Nhãn hiệu:</label>
                <select id="nhanHieu" class="form-control" name="nhanHieu">
                    <c:forEach items="${cacNhanHieu}" var="nhanHieu">
                    <option selected value="${nhanHieu.id}">${nhanHieu.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-5">
                <label for="danhMuc">Danh Mục:</label>
                <select id="danhMuc" class="form-control" name="danhMuc">
                    <c:forEach items="${cacDanhMuc}" var="danhMuc">
                        <option selected value="${danhMuc.id}">${danhMuc.ten}</option>
                    </c:forEach>
                </select>
            </div>

        </div>

        <div class="form-group col-md-1">
            <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
        </div>

    </form>
    <hr>

    <table class="table table-hover" style="text-align: center;">
        <thead>
        <tr>
            <th>Hình ảnh</th>
            <th>Tên</th>
            <th>Danh Mục</th>
            <th>Nhãn hiệu</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th> </th>
        </tr>

        </thead>
        <tbody>
<%--            <tr>--%>
<%--                <td><img src="/img/shoes.jpg" alt="" class="img-fluid" style="height: 50px; width: auto;"></td>--%>
<%--                <td>Giay</td>--%>
<%--                <td>Giay the thao</td>--%>
<%--                <td>adidas</td>--%>
<%--                <td>100$</td>--%>
<%--                <td>25</td>--%>
<%--            </tr>--%>
        </tbody>

    </table>
</div>

<%--</div>--%>
<script src="/js/admin/sanpham.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>


