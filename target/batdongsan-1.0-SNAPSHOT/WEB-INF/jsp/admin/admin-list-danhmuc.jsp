<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="searchThoiHan" value=""/>
<c:url var="deleteDanhMuc" value="/admin/xoadanhmuc"/>
<c:url var="deleteURL" value="/admin-quanlydanhmuc/showdanhmuc"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Quản lý danh mục</title>

    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/admin/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/admin/assets/css/fonts.googleapis.com.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/ace.min.css"
          class="ace-main-stylesheet" id="main-ace-style"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/ace-part2.min.css"
          class="ace-main-stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/ace-ie.min.css"/>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/js/ace-extra.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/js/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/js/respond.min.js"></script>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css"/>--%>
    <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
    <!-- JS tạo nút bấm di chuyển trang start -->
    <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <!-- JS tạo nút bấm di chuyển trang end -->
    <%--Sweetalert--%>
    <script src="${pageContext.request.contextPath}/resources/admin/sweetalert2.min.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/admin/sweetalert2.min.css"/>
    <script type="text/javascript">
        $(function () {
            var pageSize = 5; // Hiển thị số sản phẩm trên 1 trang
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
    <style>
        #pagination {
            display: flex;
            display: -webkit-flex; /* Safari 8 */
            flex-wrap: wrap;
            -webkit-flex-wrap: wrap; /* Safari 8 */
            /*justify-content: center;
            -webkit-justify-content: center;*/
        }
    </style>

</head>

<body class="no-skin">
<jsp:include page="header-admin-home.jsp"></jsp:include>


<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <jsp:include page="menu-admin-home.jsp"></jsp:include>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="/admin-quanlydanhmuc/showdanhmuc">Quản lý</a>
                    </li>
                    <li class="active">Quản lý danh mục</li>
                </ul><!-- /.breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form action="/admin-quanlydanhmuc/showdanhmuc" class="form-search" id="formSearch" method="get">
								<span class="input-icon">
									<input style="width: 300px" type="text" placeholder="Search ..."
                                           class="nav-search-input"
                                           id="btnSearch" autocomplete="off" name="searchInput" value="" required/>
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                    </form>
                </div><!-- /.nav-search -->
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <c:if test="${not empty message}">
                            <div class="alert alert-${alert}">
                                    ${message}
                            </div>
                        </c:if>
                        <div class="widget-box table-filter">
                            <div class="table-btn-controls">
                                <div class="pull-right tableTools-container">
                                    <div class="dt-buttons btn-overlap btn-group">
                                        <a flag="info"
                                           class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                           data-toggle="tooltip"
                                           title='Thêm danh mục' href='/admin-quanlydanhmuc/themdanhmuc'>
                                            <span>
                                                <i class="fa fa-plus-circle bigger-110 purple"></i>
                                            </span>
                                        </a>
                                        <button id="btnDelete" type="button"
                                                class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title='Xóa thời hạn'>
                                            <span>
                                                <i class="fa fa-trash-o bigger-110 pink"></i>
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>Tên danh mục</th>
                                            <th>Thao tác</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${listDanhMuc}">
                                            <tr class="contentPage">
                                                <td style="width: 3%"><input type="checkbox" id="checkbox_${item.id}"
                                                                             value="${item.id}"/></td>
                                                <td>${item.tenDanhMuc }</td>
                                                <td><a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                       title="Cập nhật danh mục"
                                                       href="/admin-quanlydanhmuc/capnhatdanhmuc?id=${item.id}">
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div id="showerror" style="color:red"></div>
                                    <ul class="pagination" id="pagination"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="footer-admin-home.jsp"></jsp:include>

            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>
    </div>
</div>
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/resources/admin/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery-ui.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.sparkline.index.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/ace.min.js"></script>

<script>
    $(document).ready(function () {
        var button = $('#btnDelete');
        $(button).attr('disabled', 'disabled');
        $("input[type=checkbox]").on("click", function () {
            var n = $("input:checked").length;
            if (n == 0) {
                $(button).attr('disabled', 'disabled');
            } else {
                $(button).removeAttr('disabled');
            }
        });
    });
</script>
<script>
    $('#btnDelete').click(function (e) {
        e.preventDefault();
        var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        swal({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn muốn xóa không ?",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Xác nhận",
            cancelButtonText: "Hủy bỏ"
        }).then(
            function (isConfirm) {
                if (isConfirm.value) {
                    deleteNew(ids);
                } else {
                }
            });
    });

    function deleteNew(data) {
        $.ajax({
            url: '${deleteDanhMuc}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${deleteURL}?message=delete_success";
            },
            error: function (error) {
                window.location.href = "${deleteURL}?message=delete_failed";
            }
        });
    }
</script>
</body>
</html>
