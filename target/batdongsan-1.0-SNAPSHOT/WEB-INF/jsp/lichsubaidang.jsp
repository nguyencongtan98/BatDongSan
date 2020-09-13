<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Lịch sử đề xuất cho bài đăng của bạn</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <!-- JS tạo nút bấm di chuyển trang start -->
    <script
            src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
            type="text/javascript"></script>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <script type="text/javascript">
        $(function () {
            var pageSize = 4; // Hiển thị 6 sản phẩm trên 1 trang
            showPage = function (page) {
                $(".contentPage").hide();
                $(".contentPage").each(function (n) {
                    if (n >= pageSize * (page - 1) && n < pageSize * page)
                        $(this).show();
                });
            }
            showPage(1);
            ///** Cần truyền giá trị vào đây **///
            var totalRows = 40; // Tổng số sản phẩm hiển thị
            var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
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
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        p {
            margin-bottom: 0;
        }

       .container h3 {
            color: lightseagreen;
        }

    </style>
</head>
<body>

<div class="wrap">


    <jsp:include page="header.jsp"></jsp:include>


    <%--    <section class="site-section pt-5">--%>
    <div class="container">
        <div class="row blog-entries">
            <div class="col-md-12 col-lg-8 main-content">
                <h3 style="color: lightcoral" class="mb-4 ">LỊCH SỬ ĐỀ XUẤT
                    GIÁ CHO BÀI ĐĂNG CỦA BẠN</h3>

                <img width="100%" src="${baiDang.anhEntities.get(0).src}">
                <h3 class="mt-2 ">${baiDang.tieuDe}</h3>

                <div class="row ">
                    <div class="col ml-3 font-weight-bold">

                        <p>Giá bán : ${baiDang.gia}:${baiDang.menhGiaEntity.tenMenhGia}</p>
                        <p>Địa chỉ : ${baiDang.diaChi}</p>
                        <p>Ngày đăng : ${baiDang.ngayDang}</p>
                        <p>Nội dung : ${baiDang.noiDung}</p>

                    </div>
                </div>

                <H3>Thông tin người đề xuất giá mua</H3>
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Họ tên</th>
                        <th scope="col">Địa chỉ</th>
                        <th scope="col">Số điện thoại</th>
                        <th scope="col">Giá đề xuất</th>
                        <th scope="col">Xóa</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listLichSu}" var="listLichSu">
                        <tr>
                            <td>${listLichSu.taiKhoanEntity.hoTen}</td>
                            <td>${listLichSu.taiKhoanEntity.diaChi}</td>
                            <td>${listLichSu.taiKhoanEntity.soDienThoai}</td>
                            <td>${listLichSu.giaDeXuat}</td>
                            <td><a
                                    href="/quanlilichsu/xoa/${listLichSu.id}/${baiDang.id}" onclick="return confirm('Bạn có muốn xóa không');">  <i class="fas fa-trash-alt"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <p hidden>${baiDang.id}</p>
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