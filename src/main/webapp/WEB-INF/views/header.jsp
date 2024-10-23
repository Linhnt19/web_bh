<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<div class="container">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary p-0">
            <div class="navbar-nav">
                <a class='nav-item nav-link' href="/assignment/home">Home</a>
            </div>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown no-arrow">
                    <c:if test="${not empty sessionScope.idNV}">
                        <a class="nav-link active" href="/assignment/logout">
                            Log out
                        </a>
                    </c:if>
                    <c:if test="${empty sessionScope.idNV}">
                        <a class="nav-link active" href="/assignment/login">
                            Log in
                        </a>
                    </c:if>
                </li>
            </ul>
        </nav>
    </div>
    <div class="row" style="margin-top: 2px">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/assignment/ban-hang">Ban hang</a>
                    </li>
                    <c:if test="${not empty sessionScope.check}">
                        <li class="nav-item">
                            <a class="nav-link" href="/assignment/hoa-don">Hoa don</a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="/assignment/khach-hang">Khach hang</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#1" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Tai khoan
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Thong tin</a></li>
                            <li><a class="dropdown-item" href="#">-------</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="logout">Dang xuat</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex" role="search" action="/assignment/home/tim-kiem" method="post">
                    <input class="form-control me-2" type="search" placeholder="Enter keyword to search"
                           aria-label="Search" name="keyword">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>

</div>
