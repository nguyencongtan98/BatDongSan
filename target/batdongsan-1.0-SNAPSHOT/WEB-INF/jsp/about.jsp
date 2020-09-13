<%@ page import="com.batdongsan.util.SecurityUtils" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <title>Chi tiết bài đăng</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link
            href="https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700|Inconsolata:400,700"
            rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css2/bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css2/animate.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css2/owl.carousel.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/fonts2/ionicons/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/fonts2/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/fonts2/flaticon/font/flaticon.css">

    <!-- Theme Style -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css2/style.css">
    <style>
        .container .main-content h3 {
            color: lightseagreen;
        }
        .container p {
            padding: 0;
            margin-bottom: 0;
        }


    </style>
</head>
<body>
<div class="wrap">
    <jsp:include page="header.jsp"></jsp:include>
    
    <section class="site-section pt-2">
        <div class="container">
            <div class="row blog-entries">
                <div class="col-md-12 col-lg-8 main-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row mb-5 ">
                                <div style="height: 400px; width: 100%" class="col">
                                    <h2 style="text-transform: uppercase; color: lightcoral"
                                        class="mb-4">${baiDang.tieuDe}</h2>
                                    <img width="100%" height="100%"
                                         src="${baiDang.anhEntities.get(0).src}"
                                         alt="Image placeholder">
                                </div>
                            </div>
                            <div class="row pt-5">
                                <div class="col ">
                                    <h3>Thông tin bài đăng</h3>
                                </div>
                                <div class="col text-right">
                                    <security:authorize access="isAuthenticated()">
                                        <a class="btn btn-secondary" href="/quanlidautin/themdautin/${baiDang.id}" type="button">Đánh dấu
                                            bài đăng</a>
                                    </security:authorize>
                                    <security:authorize access="isAnonymous()">
                                        <a class="btn btn-secondary" href="/login" type="button">Đánh dấu bài đăng</a>
                                    </security:authorize>
                                </div>
                            </div>

                            <div class="row ">
                                <div class="col ml-3 font-weight-bold">

                                    <p>Giá bán : ${baiDang.gia}:${baiDang.menhGiaEntity.tenMenhGia}</p>
                                    <p>Địa chỉ : ${baiDang.diaChi}</p>
                                    <p>Ngày đăng : ${baiDang.ngayDang}</p>
                                    <p>Nội dung : ${baiDang.noiDung}</p>

                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-8">
                                    <h3>Thông tin người đăng bán</h3>
                                    <div class="row">
                                        <div class="col ml-3 font-weight-bold">
                                            <p>Họ tên : ${baiDang.taiKhoanEntity.hoTen}</p>
                                            <p>Địa chỉ : ${baiDang.taiKhoanEntity.diaChi}</p>
                                            <p>Số điện thoại : ${baiDang.taiKhoanEntity.soDienThoai}</p>
                                            
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <form action="/quanlilichsu/" method="post">
                                                <input hidden name="baiDangId" value="${baiDang.id}">
                                                <div class="form-group">
                                                    <label for="email"><h3>Nhập giá đề xuất:</h3></label> <input
                                                        name="gia" type="number" class="form-control"
                                                        placeholder="Nhập giá" id="giaDeXuat">
                                                </div>

                                                <security:authorize access="isAuthenticated()">
                                                    <button type="submit" onclick="return checkGia();" class="btn btn-primary text-right">Đề
                                                        xuất giá
                                                    </button>
                                                </security:authorize>
                                                <security:authorize access="isAnonymous()">
                                                    <a href="/login" class="btn btn-primary text-right">Đề
                                                        xuất giá</a>
                                                </security:authorize>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <h3>List giá đề xuất</h3>
                                    <table class="table table-bordered table-sm">
                                        <thead>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listLichSu}" var="lichsu">
                                            <tr>
                                                <td>${lichsu.giaDeXuat}
                                                        ${lichsu.baiDangEntity.menhGiaEntity.tenMenhGia}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <script type="text/javascript">
                function checkGia() {
					if($('#giaDeXuat').val() <0 ){
						alert("Giá phải > 0");
						return false;
					}
				}
                </script>

                <!-- END main-content -->

                <jsp:include page="aside2.jsp"></jsp:include>

                <!-- END sidebar -->

            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- END footer -->

</div>

<!-- loader -->
<%-- <div id="loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
                stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none"
                stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/>
    </svg>
</div> --%>

<%-- <script
        src="${pageContext.request.contextPath}/resources/js2/jquery-3.2.1.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js2/jquery-migrate-3.0.0.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js2/popper.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js2/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js2/owl.carousel.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js2/jquery.waypoints.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js2/jquery.stellar.min.js"></script>


<script src="${pageContext.request.contextPath}/resources/js2/main.js"></script> --%>
</body>
</html>