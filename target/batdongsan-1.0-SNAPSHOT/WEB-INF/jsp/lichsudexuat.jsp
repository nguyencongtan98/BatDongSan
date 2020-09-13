<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/10/19
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lịch sử đề xuất</title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body>

<div class="wrap">


    <jsp:include page="header.jsp"></jsp:include>


    <%--    <section class="site-section pt-5">--%>
    <div class="container">
        <div class="row blog-entries">
            <div class="col-md-12 col-lg-8 main-content">
                <h2 style="color: lightcoral" class="mb-4 text-center">LỊCH SỬ ĐỀ XUẤT GIÁ CÁ NHÂN</h2>

                <table class="table table-bordered wrap">
                    <thead class="thead-light">
                    <tr class="text-center bg-info">
                        <th scope="col">Ảnh</th>
                        <th scope="col">Tiêu đề</th>
                        <th scope="col">Giá gốc</th>
                        <th scope="col">Giá đề xuất</th>
                        <th scope="col">Xóa</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listLichSu}" var="listLichSu">
                        <tr>
                            <td><img width="70px" height="50px"
                                     src="${listLichSu.baiDangEntity.anhEntities.get(0).src}"></td>
                            <td><a href="/xemchitiet/${listLichSu.id}">${listLichSu.baiDangEntity.tieuDe}</a></td>
                            <td>${listLichSu.baiDangEntity.gia} ${listLichSu.baiDangEntity.menhGiaEntity.tenMenhGia}</td>
                            <td>${listLichSu.giaDeXuat} ${listLichSu.baiDangEntity.menhGiaEntity.tenMenhGia}</td>
                            <td><a href="/quanlilichsu/xoa/${listLichSu.id}" onclick="return confirm('Bạn có muốn xóa không');"><i class="fas fa-trash-alt"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
</body>

</html>
