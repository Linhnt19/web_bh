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
            <h4>THÔNG TIN KHÁCH HÀNG </h4>
        </div>
        <form method="POST" action="/assignment/khach-hang/update">
            <div class="mb-3">
                <label class="form-label">Id:</label>
                <input name="id" type="text" class="form-control" value="${kh.id}" readonly/>
            </div>
            <div class="mb-3">
                <label class="form-label">Name:</label>
                <input name="ten" type="text" class="form-control" value="${kh.ten} ${param.ten}"/>
            </div>
            <span style="color:red">${msgSU2}</span>
            <div class="mb-3">
                <label class="form-label">Code:</label>
                <input name="maKH" type="text" class="form-control" value="${kh.maKH} ${param.maKH}"/>
            </div>
            <span style="color:red">${msgSU3}</span>
            <div class="mb-3">
                <label class="form-label">Number phone:</label>
                <input name="sdt" type="text" class="form-control" value="${kh.sdt} ${param.sdt}"/>
            </div>
            <span style="color:red">${msgSU4}</span>
            <div class="mb-3">
                <label class="form-label">Role:</label>
                <br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1"
                           value="true" ${kh.trangThai?"checked":""} >
                    <label class="form-check-label" for="inlineRadio1">Vip</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2"
                           value="false" ${!kh.trangThai?"checked":""}>
                    <label class="form-check-label" for="inlineRadio2">Normal</label>
                </div>
            </div>
            <span style="color:red">${msgSU5}</span>
            <span style="color:red">${msgSU6}</span>
            <br>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>
</div>