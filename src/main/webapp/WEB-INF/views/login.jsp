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
        <h3>Login</h3>
        <br>
        <form method="post" action="signin">
            <div class="mb-3">
                <label class="form-label">Username:</label>
                <input name="username" type="text" class="form-control" value="${param.username}"/>
            </div>
            <div>
                <span style="color:red">${msgLG1}</span>
            </div>
            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input name="password" type="password" class="form-control" value="${param.password}"/>
            </div>
            <div>
                <span style="color:red">${msgLG2}</span>
            </div>
            <div class="mb-3">
                <input type="checkbox" class="form-input-check"/>
                <label class="form-label">Remember me</label>
            </div>
            <div>
                <span style="color:red">${msgLG3}</span>
            </div>
            <br>
            <a href="home">
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </a>
        </form>
        <p class="text-center"><a href="signup">Sign up</a></p>
    </div>
</div>
