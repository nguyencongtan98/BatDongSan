<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="addThoiHan" value="/admin/updatethoihan"/>
<c:url var="creThoiHan" value="/admin/addthoihan"/>
<c:url var="addNewList" value="/admin-quanlythoihan/showthoihan"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Cập nhật thời hạn</title>
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
    <script src="${pageContext.request.contextPath}/resources/admin/sweetalert2.min.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/admin/sweetalert2.min.css"/>

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
                        <a href="/admin-quanlythoihan/showthoihan">Quản lý</a>
                    </li>
                    <li class="active">Quản lý thời hạn</li>
                    <li class="active">Cập nhật</li>
                </ul>
                <div style="float: right">
                    <ul class="breadcrumb">
                        <li>
                            <a href="/admin-quanlythoihan/showthoihan">Quay lại</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <c:if test="${not empty message}">
                            <div class="alert alert-${alert}">
                                    ${message}
                            </div>
                        </c:if>
                    </div>
                </div>
                <form class="form-horizontal" role="form" id="formSubmit">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"> Số ngày </label>

                                        <div class="col-sm-9">
                                            <input type="number" cssClass="form-control" id="soNgay" name="soNgay"
                                                   value="${ty.soNgay}" min="1" placeholder="Nhập số ngày"
                                                   autocomplete="off"/>
                                        </div>
                                    </div>
                                    <input type="hidden" id="id" value="${ty.id}" name="id"/>
                                    <br/>
                                    <div class="row">
                                        <div id="showerror" class="col-xs-12" style="color: red">
                                        </div>
                                    </div>
                                    <div class="clearfix form-actions">
                                        <button class="btn btn-info" type="submit"
                                                id="btnAddOrUpdateNew">
                                            <i class="ace-icon fa fa-check bigger-110"></i> Cập nhật
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <jsp:include page="footer-admin-home.jsp"></jsp:include>

            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>

        <script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery-1.11.3.min.js"></script>
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
                var button = $('#btnAddOrUpdateNew');
                //defaul nút cập nhật ko bấm đc
                $(button).attr('disabled', 'disabled');//khóa nút cập nhật
                $("#soNgay").keyup(function () {
                    //ktra số ngày khi có 1-3 kí tự
                    //replace(/^0+/, "") ktra để bỏ tất cả số 0 ở đầu
                    var soNgay = $('#soNgay').val().replace(/^0+/, "");
                    if (soNgay.length >= 1 && soNgay.length <= 3 && soNgay >= 1) {
                        $(button).removeAttr('disabled');//mở
                        $('#showerror').text('');
                    } else {
                        // ktra số ngày khi để trống
                        if ($('#soNgay').val().length <= 0) {
                            $('#showerror').text('Số ngày không được để trống !');
                        }
                        // ktra số ngày khi nhập số bé hơn 0
                        else if (soNgay <= 0) {
                            $('#showerror').text('Số ngày phải lớn hơn 0 !');
                        }
                        //ktra số ngày khi nhập hơn 3 chữ số
                        else if (soNgay.length >= 4) {
                            $('#showerror').text('Vui lòng nhập dưới 4 chữ số !');
                        }
                        $(button).attr('disabled', 'disabled');//khóa nút cập nhật
                    }
                });
            });
        </script>
        <script>
            $('#btnAddOrUpdateNew').click(function (e) {
                e.preventDefault();
                var data = {};
                var formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                swal({
                    title: "Xác nhận cập nhật",
                    text: "Bạn có chắc chắn muốn thêm cập nhật không ?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Xác nhận",
                    cancelButtonText: "Hủy bỏ"
                }).then(
                    function (isConfirm) {
                        if (isConfirm.value) {
                            updateThoiHan(data);
                        } else {
                        }
                    });
            });

            function updateThoiHan(data) {
                $.ajax({
                    url: '${addThoiHan}',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        if (result.id == 0) {
                            $('#showerror').html("Số ngày đã tồn tại !");
                        } else {
                            $('#showerror').html("Cập nhật thời hạn thành công !");
                        }
                    },
                    error: function (error) {
                        window.location.href = "${addNewList}?message=update_failed";
                    }
                });
            }
        </script>
    </div>
</div>
</body>
</html>
