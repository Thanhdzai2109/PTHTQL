<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="/css/lienhe.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />

<div class="container">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header bg-primary text-white"><i class="fa fa-envelope"></i> Liên hệ với chúng tôi.
                    </div>
                    <div class="card-body">
                        <form id="formLienHe">
                            <div class="form-group">
                                <label for="name">Tên</label>
                                <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Nhập tên" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Nhập email" required>
                                <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không chia sẻ email của bạn cho bất kỳ ai.</small>
                            </div>
                            <div class="form-group">
                                <label for="message">Lời nhắn</label>
                                <textarea class="form-control" id="message" rows="6" required></textarea>
                            </div>
                            <div class="mx-auto">
                                <button type="submit" class="btn btn-primary text-right">Gửi</button></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-4">
                <div class="card bg-light mb-3">
                    <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-home"></i> Địa chỉ</div>
                    <div class="card-body">
                        <p>3 rue des Champs Elysées</p>
                        <p>75008 PARIS</p>
                        <p>France</p>
                        <p>Email : email@example.com</p>
                        <p>Tel. +33 12 56 11 51 84</p>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/web/lienhe.js"></script>
<script src="/js/web/sanpham.js"></script>