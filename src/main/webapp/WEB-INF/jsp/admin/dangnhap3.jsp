<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
<div class="d-flex justify-content-center h-100">
    <div class="card">
        <div class="card-header">
            <h3>Sign In</h3>
            <div class="d-flex justify-content-end social_icon">
                <span><i class="fab fa-facebook-square"></i></span> <span><i
                    class="fab fa-google-plus-square"></i></span> <span><i
                    class="fab fa-twitter-square"></i></span>
            </div>
        </div>
        <div class="card-body">
            <form action='<c:url value ="/j_spring_security_check" />'
                  id="formLogin" method="post">
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" class="form-control" placeholder="name"
                           name="username">
                </div>

                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" class="form-control" placeholder="password"
                           name="password">
                </div>
                <c:if test="${param.incorrectAccount != null}">
                    <div class="alert alert-danger"> UserName or password iscorrect</div>
                </c:if>
                <c:if test="${param.accessDenied != null}">
                    <div class="alert alert-danger"> Not permission</div>
                </c:if>
                <input type="hidden" value="login" id="action" name="action" />
                <button type="submit" class="btn float-right login_btn">Đăng
                    nhập</button>
            </form>
        </div>
        <div class="card-footer">
            <div class="d-flex justify-content-center links">
                <a href="#">Sign Up</a>
            </div>
            <div class="d-flex justify-content-center">
                <a href="#">Forgot your password?</a>
            </div>
            <div class="d-flex justify-content-center">
                <a href="<c:url value="#" /> ">Back main page</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>