<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Đăng ký</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dangky.css">

    <script>
        $(document).ready(function () {
            //called when key is pressed in textbox
            $("#soDienThoai").keypress(function (e) {
                //if the letter is not digit then display error and don't type anything
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    //display error message
                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
                    return false;
                }
            });
        });
    </script>

</head>

<body>
<div class="wrap">
    <div id="message" hidden>${message}</div>
    <jsp:include page="header.jsp"></jsp:include>
    <%--    <div class="container">--%>
    <section class="login-block">
        <div class="container">
            <div class="row">
                <div class="col-md-4 login-sec">
                    <h2 class="text-center">Đăng ký ngay</h2>
                    <form class="login-form" action="/register/" , method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1" class="text-uppercase">Họ tên</label>
                            <input type="text" name="hoTen" pattern="[A-Za-z ]{4,40}" title="Họ tên phải từ 4 đến 40 ký tự" class="form-control" placeholder="" required>

                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1" class="text-uppercase">Email</label>
                            <input type="email" name="email"  class="form-control" placeholder="" required>

                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1" class="text-uppercase">Số điện thoại</label>
                            <input type="tel" name="soDienThoai" id="soDienThoai" pattern="[0-9]{10}"
                                   class="form-control" title="Vui lòng nhập đúng định dạng số điện thoại" placeholder="" required>

                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1" class="text-uppercase">Địa chỉ</label>
                            <input type="text" name="diaChi" class="form-control" placeholder=""    pattern="[A-Za-z/,0-9 ]{1,40}"  title="Địa chỉ đươc chứa kí tự (,/)" required>

                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1" class="text-uppercase">Mật khẩu</label>
                            <input type="password" name="matKhau" class="form-control" placeholder="" required   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
                               title="Mật khẩu 8 kí tự trở lên, chứa kí tự hoa, số and và kí tự thường ">

                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="text-uppercase">Nhập lại mật khẩu</label>
                            <input type="password" name="matKhau2" class="form-control" placeholder=""   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
                                title="Mật khẩu 8 kí tự trở lên, chứa kí tự hoa, số and và kí tự thường ">
                        </div>

                        <h4 style="color: red">${thongbao}</h4>

                        <div class="form-check">
                            <button style="background: #00a1ff" type="submit" class="btn btn-login float-right ">Đăng ký</button>
                        </div><br><br>

                    </form>
                </div>
                <div class="col-md-8 banner-sec">
                    <div style="margin-top: 60px" id="carouselExampleIndicators" class="carousel slide"
                         data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img width="100%" class="d-block img-fluid"
                                     src="${pageContext.request.contextPath}/resources/images2/banner_3.jpg"
                                     alt="First slide">

                            </div>
                            <div class="carousel-item">
                                <img width="100%" class="d-block img-fluid"
                                     src="${pageContext.request.contextPath}/resources/images2/banner_2.jpg"
                                     alt="First slide">

                            </div>
                            <div class="carousel-item">
                                <img width="100%" class="d-block img-fluid"
                                     src="${pageContext.request.contextPath}/resources/images2/banner_1.png"
                                     alt="First slide">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>


</html>