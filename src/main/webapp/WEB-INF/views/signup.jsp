<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .bg-login {
        position: relative;
        width: 100%;
        min-height: auto;
        background-position: right 0px top 0px;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
        -o-background-size: cover;
    }

    .login-form {
        border: 1px solid #DDD;
        border-radius: 4px;
        max-width: 400px;
        padding: 20px;
        margin-top: 100px;
        margin-left: auto;
        margin-right: auto;
    }

</style>

<div class="bg-login">
    <div class="login-form">
        <h3>Sign up</h3>
        <br>
        <form method="POST" action="signup">
            <div class="mb-3">
                <label class="form-label">Name:</label>
                <input name="ten" type="text" class="form-control" value="${param.ten}"/>
            </div>
            <span style="color:red">${msgSU2}</span>
            <div class="mb-3">
                <label class="form-label">Code:</label>
                <input name="maNV" type="text" class="form-control" value="${param.ma}"/>
            </div>
            <span style="color:red">${msgSU3}</span>
            <div class="mb-3">
                <label class="form-label">Username:</label>
                <input name="tenDangNhap" type="text" class="form-control" value="${param.tenDangNhap}"/>
            </div>
            <span style="color:red">${msgSU4}</span>
            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input name="matKhau" type="password" class="form-control" value="${param.matKhau}"/>
            </div>
            <span style="color:red">${msgSU5}</span>
            <div class="mb-3">
                <label class="form-label">Role:</label>
                <br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1"
                           value="true" ${param.trangThai?"checked":""}>
                    <label class="form-check-label" for="inlineRadio1">Quan ly</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2"
                           value="false" ${!param.trangThai?"checked":""}>
                    <label class="form-check-label" for="inlineRadio2">Nhan vien</label>
                </div>
            </div>
            <span style="color:red">${msgSU6}</span>
            <span style="color:red">${msgSU7}</span>
            <br>
            <a href="signin">
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Sign up</button>
                </div>
            </a>
        </form>
        <p class="text-center"><a href="signin">Sign in</a></p>
    </div>
</div>
