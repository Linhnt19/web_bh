<%@ include file="../header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .imfomation2 {
        height: 50px;
        text-align: center;
        padding-top: 20px;


    }
</style>
<script>
    function validateForm(event) {
        const idHoaDon = document.getElementById("idHoaDon").value;

        if (!idHoaDon) {
            alert("Vui lòng chon hóa đơn.");
            // Dừng submit form
            event.preventDefault();
        }
    }
    function validateForm1(event) {
        const idHoaDon = document.getElementById("idHoaDon1").value;

        if (!idHoaDon) {
            alert("Vui lòng chon hóa đơn.");
            // Dừng submit form
            event.preventDefault();
        }
    }
    function validateForm2(event) {
        const idHoaDon = document.getElementById("idHoaDon2").value;

        if (!idHoaDon) {
            alert("Vui lòng chon hóa đơn.");
            // Dừng submit form
            event.preventDefault();
        }
    }
    function tinhTienThua() {
        // Lấy giá trị của tổng tiền và tiền khách đưa
        var tongTien = parseFloat(document.getElementById("tongTien").value);
        var tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value);

        // Tính tiền thừa
        var tienThua = tienKhachDua - tongTien;

        // Cập nhật giá trị tiền thừa trong ô input
        document.getElementById("tienThua").value = tienThua >= 0 ? tienThua.toFixed(1) : "0";
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-md-9">
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
                <c:forEach var="hd" items="${hd}" varStatus="stt">
                    <tr>
                        <td>${hd.id}</td>
                        <td>${hd.nhanVien.ten}</td>
                        <td>${hd.khachHang.ten}</td>
                        <td>${hd.ngayMuaHang}</td>
                        <td>${hd.trangThai ? "Da thanh toan" : "Chua thanh toan"}</td>
                        <td><a href="/assignment/ban-hang/hoa-don/${hd.id}">
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
            <div class="imfomation2">
                <h4>Gio hang </h4>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>ID HD</th>
                    <th>Ma SPCT</th>
                    <th>Ten SPCT</th>
                    <th>Don gia</th>
                    <th>So luong mua</th>
                    <th colspan="2"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="hdct" items="${hdct}" varStatus="stt">
                    <tr>
                        <td>${stt.count}</td>
                        <td>${hdct.hoaDon.id}</td>
                        <td>${hdct.spChiTiet.maSPCT}</td>
                        <td>${hdct.spChiTiet.sanPham.tenSP}</td>
                        <td>${hdct.donGia}</td>
                        <form action="/assignment/ban-hang/doi-so-luong" method="post">
                        <td><input style="width: 90px" type="number" name="soLuongMua" value="${hdct.soLuong}" min="1" max="${hdct.spChiTiet.soLuong}"></td>
                        <td>
                            <input type="hidden" name="idSPCT" value="${hdct.spChiTiet.id}">
                            <input type="hidden"  name="idHoaDon" value="${idAn}">
                            <button type="submit">Sua</button>
                        </td>
                        </form>
                        <form action="/assignment/ban-hang/tra-hang" method="post">
                            <td>
                                <input type="hidden" name="idSPCT" value="${hdct.spChiTiet.id}">
                                <input type="hidden"  name="idHoaDon" value="${idAn}">
                                <button type="submit">Xoa</button>
                            </td>
                        </form>

                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>

        <div class="col-md-3" style="border: 1px solid; border-radius: 10px;margin-top:10px;height: 500px ">
            <div class="imfomation2">
                <h4>Thong tin hoa don</h4>
            </div>
            <form method="POST" action="/assignment/ban-hang/tao-hoa-don">
                <br>
                <div class="mb-3">
                    <label class="form-label">Id NV:</label>
                    <input name="nhanVien" type="text" value="${idNV}"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Khach hang:</label>
                    <select name="khachHang" required>
                        <c:forEach var="ds" items="${ds}">
                            <option value="${ds.id}">${ds.ten}</option>
                        </c:forEach>
                    </select>
                </div>
                <input type="hidden" name="ngayMuaHang" value="${dateNow}">
                <input type="hidden" name="trangThai" value="false">
                <%--                tinh toan tien--%>

                <div class="mb-3">
                    <label class="form-label">Tổng tiền:</label>
                    <input id="tongTien" name="tongTien" type="number" value="${tongTien}" readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Tiền khách đưa:</label>
                    <input id="tienKhachDua" name="tienKhachDua" type="number" step="0.1" oninput="tinhTienThua()"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Tiền thừa:</label>
                    <input id="tienThua" name="tienThua" type="text"  readonly/>
                </div>

                <div class="row">
                    <div style="display: flex;justify-content: center">
                        <button type="submit" style="width: 150px">Tao Hoa Don</button>
                    </div>
                </div>
            </form>

            <div class="row" style="margin-top: 10px">
                <div class="col-md-6">
                    <form action="/assignment/ban-hang/thanh-toan" method="post" onsubmit="validateForm1(event)">
                        <input type="hidden" id="idHoaDon1" name="hoaDon" value="${idAn}">
<%--                        <input type="hidden" id="tienKhachTra" name="tienKhachTra" value="${idAn}">--%>
                            <button type="submit">Thanh toan</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <form action="/assignment/ban-hang/huy-hoa-don" method="post" onsubmit="validateForm2(event)">
                        <input type="hidden" id="idHoaDon2" name="hoaDon" value="${idAn}">
                            <button>Huy Hoa Don</button>

                    </form>
                </div>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="imfomation2">
            <h4>Danh sách chi tiết sản phẩm</h4>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Mã SPCT</th>
                <th>Tên SP</th>
                <th>Kích thước</th>
                <th>Màu sắc</th>
                <th>SL ton</th>
                <th>Đơn giá</th>
                <th>SL mua</th>
                <th>Them vao GH</th>
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
                    <td>${spChiTiet.soLuong}</td>
                    <td>${spChiTiet.donGia}</td>
                    <form method="POST" action="/assignment/ban-hang/them-san-pham" onsubmit="validateForm(event)">
                        <td>
                            <input style="width: 45px" type="number" name="soLuong" value="1" min="1"
                                   max="${spChiTiet.soLuong}">
                            <input type="hidden" name="spChiTiet" value="${spChiTiet.id}">
                            <input type="hidden" name="trangThai" value="false">
                            <input type="hidden" name="donGia" value="${spChiTiet.donGia}">
                            <input type="hidden" id="idHoaDon" name="hoaDon" value="${idAn}">
                        </td>
                        <td>
                            <button type="submit">Add</button>
                        </td>
                    </form>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>


