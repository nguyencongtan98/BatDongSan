<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Trang chủ</title>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <!-- JS tạo nút bấm di chuyển trang start -->
    <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <!-- JS tạo nút bấm di chuyển trang end -->
    <script type="text/javascript">
        $(function () {
            var pageSize = 6; // Hiển thị 6 sản phẩm trên 1 trang
            showPage = function (page) {
                $(".contentPage").hide();
                $(".contentPage").each(function (n) {
                    if (n >= pageSize * (page - 1) && n < pageSize * page)
                        $(this).show();
                });
            }
            showPage(1);
            ///** Cần truyền giá trị vào đây **///
            var totalRows = ${total}; // Tổng số sản phẩm hiển thị
            var btnPage = 3; // Số nút bấm hiển thị di chuyển trang
            var iTotalPages = Math.ceil(totalRows / pageSize);

            var obj = $('#pagination').twbsPagination({
                totalPages: iTotalPages,
                visiblePages: btnPage,
                onPageClick: function (event, page) {
                    console.info(page);
                    showPage(page);
                }
            });
            console.info(obj.data());
        });
    </script>
    <style>
        #pagination {
            display: flex;
            display: -webkit-flex; /* Safari 8 */
            flex-wrap: wrap;
            -webkit-flex-wrap: wrap; /* Safari 8 */
            justify-content: center;
            -webkit-justify-content: center;
        }

        .pagination .first a {
            width: 100px;
        }

        .pagination .prev a {
            width: 100px;
        }

        .pagination .next a {
            width: 100px;
        }

        .pagination .last a {
            width: 100px;
        }
    </style>





</head>
<body>


<div class="wrap">
    <p hidden id="thongbao">${thongbao}</p>
    <p hidden id="thongbao2">${thongbao2}</p>
    <jsp:include page="header.jsp"></jsp:include>
    <!-- END header -->


    <!-- END section -->

    <section class="site-section py-sm">
        <div class="container">

            <div class="row">
                <div class="col-md-6">
                    <h2 class="mb-4">Bảng tin</h2>
                </div>
            </div>

            <h2>${thongbao}</h2>
            <div class="row blog-entries">
                <div class="col-md-12 col-lg-8 main-content">
                    <div class="row">
                        <c:forEach var="baiDang" items="${listBaiDang}">
                            <div class="col-md-6 contentPage">
                                <a href="/xemchitiet/${baiDang.id}" class="blog-entry element-animate"
                                   data-animate-effect="fadeIn">
                                    <img width="100%" height="250px" src="${baiDang.anhEntities.get(0).src}"
                                         alt="Image placeholder">
                                    <div class="blog-content-body">
                                        <div class="post-meta">
                                            <h2 style="color: red">${baiDang.tieuDe}</h2>
                                            <span class="author mr-2">Giá: ${baiDang.gia}</span><br>
                                            <span class="mr-2">Ngày đăng: ${baiDang.ngayDang}</span><br>
                                            <span class="mr-2">Địa chỉ:${baiDang.diaChi}, ${baiDang.tinhThanhEntity.tenTinhThanh}</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>

                        <ul id="pagination"></ul>


                    </div>

                </div>

                <!-- END main-content -->

                <jsp:include page="aside2.jsp"></jsp:include>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>

</div>

<!-- loader -->
<%-- <div id="loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#f4b214"/>
    </svg>
</div> --%>


<script src="${pageContext.request.contextPath}/resources/js2/jquery-migrate-3.0.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js2/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js2/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js2/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js2/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js2/jquery.stellar.min.js"></script>


<script src="${pageContext.request.contextPath}/resources/js2/main.js"></script>
</body>
<!-- <script type="text/javascript" language="javascript">
    $(document).ready(function () {
        if ($("#thongbao").text() == 1) {
            alert("Vui lòng đăng nhập");
        }
    });
</script> -->
</html>