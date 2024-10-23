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
        <div class="col-md-4">
            <div class="imfomation2">
                <h4>THÔNG TIN KHÁCH HÀNG </h4>
            </div>
            <form method="POST" action="/assignment/khach-hang">
                <div class="mb-3">
                    <label class="form-label">Name:</label>
                    <input name="ten" type="text" class="form-control" value="${param.ten}"/>
                </div>
                <span style="color:red">${msgSU2}</span>
                <div class="mb-3">
                    <label class="form-label">Code:</label>
                    <input name="maKH" type="text" class="form-control" value="${param.maKH}"/>
                </div>
                <span style="color:red">${msgSU3}</span>
                <div class="mb-3">
                    <label class="form-label">Number phone:</label>
                    <input name="sdt" type="text" class="form-control" value="${param.sdt}"/>
                </div>
                <span style="color:red">${msgSU4}</span>
                <div class="mb-3">
                    <label class="form-label">Role:</label>
                    <br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1"
                               value="true" ${param.trangThai?"checked":""}>
                        <label class="form-check-label" for="inlineRadio1">Vip</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2"
                               value="false" ${!param.trangThai?"checked":""}>
                        <label class="form-check-label" for="inlineRadio2">Normal</label>
                    </div>
                </div>
                <span style="color:red">${msgSU5}</span>
                <span style="color:red">${msgSU6}</span>
                <br>
                <a href="add">
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </a>
            </form>
        </div>


        <div class="col-md-8">
            <div class="imfomation2">
                <h4>DANH SÁCH KHÁCH HÀNG</h4>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Code</th>
                    <th scope="col">Number phone</th>
                    <th scope="col">Role</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ds}" var="kh">
                    <tr>
                        <th scope="row">${kh.id}</th>
                        <td>${kh.ten}</td>
                        <td>${kh.maKH}</td>
                        <td>${kh.sdt}</td>
                        <td>${kh.trangThai?"Vip":"Normal"}</td>
                        <td>
                            <a href="khach-hang/update/${kh.id}">
                                <button type="button" class="btn btn-warning">Update</button>
                            </a>

                            <a href="khach-hang/delete?id=${kh.id}">
                                <button type="button" class="btn btn-danger">Delete</button>
                            </a>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>