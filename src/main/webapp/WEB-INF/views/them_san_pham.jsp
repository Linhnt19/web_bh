<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .imfomation2 {
        height: 50px;
        text-align: center;
        padding-top: 20px;


    }
</style>
<html>
<head>
    <title>Thêm Sản Phẩm và Chi Tiết Sản Phẩm</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <div class="imfomation2">
                <h4>Thêm Sản Phẩm</h4>
            </div>
            <form action="/assignment/them-san-pham" method="post">
                <div class="mb-3">
                    <label class="form-label">Mã sản phẩm:</label>
                    <input type="text" class="form-control" name="maSP" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Tên sản phẩm:</label>
                    <input type="text" class="form-control" name="tenSP" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Trạng thái:</label>
                    <input type="checkbox" name="trangThai" value="true"/>
                </div>
                <div class="d-grid">
                    <button type="submit" style="width: 150px" class="btn btn-primary">Thêm sản phẩm</button>
                </div>
            </form>
            <div class="imfomation2">
                <h4>Danh sách sản phẩm</h4>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sanPham" items="${sanPhamList}">
                    <tr>
                        <td>${sanPham.id}</td>
                        <td>${sanPham.maSP}</td>
                        <td>${sanPham.tenSP}</td>
                        <td>${sanPham.trangThai ? "Kích hoạt" : "Không kích hoạt"}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-7">
            <div class="imfomation2">
                <h4>Thêm Chi Tiết Sản Phẩm</h4>
            </div>
            <form action="/assignment/them-sp-chi-tiet" method="post">
                <div class="mb-3">
                    <label class="form-label">Mã chi tiết sản phẩm:</label>
                    <input type="text" class="form-control" name="maSPCT" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Chọn sản phẩm:</label>
                    <select name="sanPham" class="form-select" required>
                        <c:forEach var="sanPham" items="${sanPhamList}">
                            <option value="${sanPham.id}">${sanPham.tenSP}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <div class="row">
                        <div class="col-md-11">
                            <label class="form-label">Kích thước:</label>
                            <%--    <input type="number" name="idKichThuoc" required /><br/>--%>
                            <select name="kichThuoc" class="form-select" required>
                                <c:forEach var="kichThuoc" items="${kichThuocList}">
                                    <option value="${kichThuoc.id}">${kichThuoc.ten}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <a href="/assignment/them-kich-thuoc">
                                <svg xmlns="http://www.w3.org/2000/svg" style="margin-top: 42px" width="35" height="35"
                                     fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                          d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="row">
                        <div class="col-md-11">
                            <label class="form-label">Màu sắc:</label>
                            <%--    <input type="number" name="idMauSac" required /><br/>--%>
                            <select name="mauSac" class="form-select" required>
                                <c:forEach var="mauSac" items="${mauSacList}">
                                    <option value="${mauSac.id}">${mauSac.ten}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <a href="/assignment/them-mau-sac">
                                <svg xmlns="http://www.w3.org/2000/svg" style="margin-top: 42px" width="35" height="35"
                                     fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                          d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Hình ảnh:</label>
                    <input type="text" class="form-control" name="hinhAnh" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số lượng:</label>
                    <input type="number" class="form-control" name="soLuong" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Đơn giá:</label>
                    <input type="number" class="form-control" name="donGia" step="0.01" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Trạng thái:</label>
                    <input type="checkbox" name="trangThai" value="true"/>
                </div>
                <div class="d-grid">
                    <button type="submit" style="width: 200px" class="btn btn-primary">Thêm chi tiết sản phẩm</button>
                </div>
            </form>
            <div class="imfomation2">
                <h4>Danh sách chi tiết sản phẩm</h4>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã</th>
                    <th>Tên sản phẩm</th>
                    <th>Kích thước</th>
                    <th>Màu sắc</th>
                    <th>Hình ảnh</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="spChiTiet" items="${spChiTietList}">
                    <tr>
                        <td>${spChiTiet.id}</td>
                        <td>${spChiTiet.maSPCT}</td>
                        <td>${spChiTiet.sanPham.tenSP}</td>
                        <td>${spChiTiet.kichThuoc.ten}</td>
                        <td>${spChiTiet.mauSac.ten}</td>
                        <td><img src="${spChiTiet.hinhAnh}"  width="50" height="50"/></td>
                        <td>${spChiTiet.soLuong}</td>
                        <td>${spChiTiet.donGia}</td>
                        <td>${spChiTiet.trangThai ? "Kích hoạt" : "Không kích hoạt"}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
