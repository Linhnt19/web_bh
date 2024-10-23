<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .imfomation2 {
        height: 50px;
        text-align: center;
        padding-top: 20px;


    }
</style>
<div class="container">
    <div class="row">
        <div class="imfomation2">
            <h4>Chi Tiết Sản Phẩm</h4>
        </div>
        <form action="/assignment/update-spct" method="post">
            <div class="mb-3">
                <label class="form-label">Id:</label>
                <input type="number" class="form-control" value="${spct.id}"  name="id" required/>
            </div>
            <div class="mb-3">
                <label class="form-label">Mã chi tiết sản phẩm:</label>
                <input type="text" class="form-control" value="${spct.maSPCT}" name="maSPCT" required/>
            </div>
            <div class="mb-3">
                <label class="form-label">Chọn sản phẩm:</label>
                <select name="sanPham" class="form-select" required>
                    <c:forEach var="sanPham" items="${sanPhamList}">
                        <option value="${sanPham.id}" ${sanPham.id==spct.sanPham.id?"selected":""}>${sanPham.tenSP}</option>
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
                                <option value="${kichThuoc.id}" ${kichThuoc.id==spct.kichThuoc.id?"selected":""}>${kichThuoc.ten}</option>
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
                                <option value="${mauSac.id}" ${mauSac.id==spct.mauSac.id?"selected":""}>${mauSac.ten}</option>
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
                <input type="text" class="form-control" name="hinhAnh"value="${spct.hinhAnh}" required/>
            </div>
            <div class="mb-3">
                <label class="form-label">Số lượng:</label>
                <input type="number" class="form-control" value="${spct.soLuong}" name="soLuong" required/>
            </div>
            <div class="mb-3">
                <label class="form-label">Đơn giá:</label>
                <input type="number" class="form-control" value="${spct.donGia}" name="donGia" step="0.01" required/>
            </div>
            <div class="mb-3">
                <label class="form-label">Trạng thái:</label>
                <input type="checkbox" name="trangThai"${spct.trangThai?"checked":""}  value="true"/>
            </div>
            <div class="d-grid">
                <button type="submit" style="width: 200px" class="btn btn-primary">Sua chi tiết sản phẩm</button>
            </div>
        </form>
    </div>
</div>
