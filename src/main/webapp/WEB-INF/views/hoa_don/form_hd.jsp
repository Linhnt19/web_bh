<%@ include file="../header.jsp" %>
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
            <h4>Hoa don</h4>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th>ID HD</th>
                <th>Ten NV</th>
                <th>Tên KH</th>
                <th>Ngay mua</th>
                <th>Trang thai</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hd" items="${hd}">
                <tr>
                    <td>${hd.id}</td>
                    <td>${hd.nhanVien.ten}</td>
                    <td>${hd.khachHang.ten}</td>
                    <td>${hd.ngayMuaHang}</td>
                    <td>${hd.trangThai == null ? "Da huy" : (hd.trangThai ? "Da thanh toan" : "Chua thanh toan")}</td>
                    <td><a href="/assignment/hoa-don/${hd.id}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="25" fill="currentColor"
                             class="bi bi-0-circle-fill" viewBox="0 0 16 16">
                            <path d="M8 4.951c-1.008 0-1.629 1.09-1.629 2.895v.31c0 1.81.627 2.895 1.629 2.895s1.623-1.09 1.623-2.895v-.31c0-1.8-.621-2.895-1.623-2.895"/>
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-8.012 4.158c1.858 0 2.96-1.582 2.96-3.99V7.84c0-2.426-1.079-3.996-2.936-3.996-1.864 0-2.965 1.588-2.965 3.996v.328c0 2.42 1.09 3.99 2.941 3.99"/>
                        </svg>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="imfomation2">
            <h4>Hoa don chi tiet </h4>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th>STT</th>
                <th>ID HD</th>
                <th>Ma SPCT</th>
                <th>Ten</th>
                <th>Mau sac</th>
                <th>Kich thuoc</th>
                <th>So luong</th>
                <th>Don gia</th>
                <th>Trang thai</th>
                <%--                <th>Thanh tien</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hdct" items="${hdct}" varStatus="stt">
                <tr>
                    <td>${stt.count}</td>
                    <td>${hdct.hoaDon.id}</td>
                    <td>${hdct.spChiTiet.maSPCT}</td>
                    <td>${hdct.spChiTiet.sanPham.tenSP}</td>
                    <td>${hdct.spChiTiet.mauSac.ten}</td>
                    <td>${hdct.spChiTiet.kichThuoc.ten}</td>
                    <td>${hdct.soLuong}</td>
                    <td>${hdct.donGia}</td>
                    <td>${hdct.trangThai == null ? "Da huy" : (hdct.trangThai ? "Da thanh toan" : "Chua thanh toan")}</td>
                        <%--                    <td></td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>