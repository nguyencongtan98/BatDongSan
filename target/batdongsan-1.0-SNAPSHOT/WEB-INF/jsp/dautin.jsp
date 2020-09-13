<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dấu tin</title>
    <style>
        ul li {
            display: inline-table;
        }
    </style>

</head>

<body>

<div class="wrap">


    <jsp:include page="header.jsp"></jsp:include>


<%--    <section class="site-section pt-5" >--%>
        <div class="container" >
            <div class="row blog-entries" >
                <div class="col-md-12 col-lg-8 main-content">
                    <h2 style="color: lightcoral" class="mb-4 text-center">DẤU TIN</h2>
                    <c:forEach var="listDauTin" items="${listDauTin}">
                        <div style="clear: both; width: 100%; border: 1px solid gray; margin-bottom: 10px; padding: 2px;" class="khungbaidang">
                            <div class="tieudebaidang pl-3 pr-3" style="background: lightskyblue; color: red"><a
                                    href="/xemchitiet/${listDauTin.id}">${listDauTin.baiDangEntity.tieuDe}</a>
                                <a style="float: right; margin-left: 10px" onclick="return confirm('Bạn có muốn xóa dấu tin này không');"
                                   href="/quanlidautin/xoadautinh/${listDauTin.id}">Xóa dấu tin</a>
                            </div>

                            <img style="width: 100px; height: 70px;float: left; margin-right: 10px"
                                 src="${listDauTin.baiDangEntity.anhEntities.get(0).src}">
                           Thăng bình, Quảng Nam<br>
                           ${listDauTin.baiDangEntity.ngayDang}
                        </div>
                    </c:forEach>

                    <div class="row">
                        <div class="col-md-12 text-center">
                            <nav aria-label="Page navigation" class="text-center">
                                <ul class="pagination">
                                    <li class="page-item  active"><a class="page-link" href="#">&lt;</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>


                </div>

                <!-- END main-content -->

                <jsp:include page="aside2.jsp"></jsp:include>
                <!-- END sidebar -->

            </div>
        </div>
<%--    </section>--%>

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- END footer -->

</div>
<%--<jsp:include page="header2.jsp"></jsp:include>
<div class="container">

    <div class="row">
        <div class="col-md-3">
            <jsp:include page="aside.jsp"></jsp:include>
        </div>
        <div class="col-md-9">
            <c:forEach var="listDauTin" items="${listDauTin}">
                <div style="clear: both; width: 100%; border: 1px solid gray; margin-bottom: 10px" class="khungbaidang">
                    <div class="tieudebaidang" style="background: lightgoldenrodyellow; color: red"><a
                            href="/xemchitiet/${listDauTin.id}">${listDauTin.baiDangEntity.tieuDe}</a>
                        <a style="float: right; margin-left: 10px"
                           href="/quanlidautin/xoadautinh/${listDauTin.id}">Xóa</a>
                    </div>

                    <img style="width: 100px; height: 70px;float: left; margin-right: 10px"
                         src="${listDauTin.baiDangEntity.anhEntities.get(0).src}">
                    <p>Thăng bình, Quảng Nam</p>
                    <p>${listDauTin.baiDangEntity.ngayDang}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<jsp:include page="footer2.jsp"></jsp:include>--%>
</body>

</html>
