
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <style>
        .glyphicon {
            margin-bottom: 10px;
            margin-right: 10px;
        }

        small {
            display: block;
            line-height: 1.428571429;
            color: #999;
        }

        label{
            text-transform: uppercase;
            color: blueviolet;
        }
    </style>
</head>
<body>

<div class="wrap">


    <jsp:include page="header.jsp"></jsp:include>
        <div class="container">
            <div class="row blog-entries">
                <div class="col-md-12 col-lg-8 main-content">
                    <h2 style="color: lightcoral" class="mb-4 text-center">THÔNG TIN CÁ NHÂN</h2>

                    <form action="/quanlitaikhoan/capnhattaikhoan" method="post">
                        <div class="row">
                            <div class="col-md-6"><label>Họ tên</label><input class="form-control" name="hoTen" value="${taiKhoan.hoTen}"
                                                                              placeholder="HO tên"></div>
                            <div  class="col-md-6"><label>Email</label><input readonly class="form-control" name="email" placeholder="Email"
                                                                              value="${taiKhoan.email}"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6"><label>Địa chỉ</label><input class="form-control" name="diaChi" placeholder="Dia chi"
                                                                               value="${taiKhoan.diaChi}"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 "><label>Số điện thoại</label><input class="form-control" name="soDienThoai" placeholder="So dien thoai"
                                                                                      value="${taiKhoan.soDienThoai}"></div>
                        </div>
                        <input hidden class="form-control" name="id" value="${taiKhoan.id}" placeholder="id"><br>
                        <input type="submit" class="bg-success font-weight-bold mb-3" onclick="return confirm('Bạn có muốn cập nhật thông tin không');" value="CẬP NHẬT THÔNG TIN">
                    </form>
                    <h4 hidden style="color: red">${thongbao}</h4>


                </div>

            </div>
        </div>
<%--    </section>--%>

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- END footer -->

</div>


</body>
</html>
