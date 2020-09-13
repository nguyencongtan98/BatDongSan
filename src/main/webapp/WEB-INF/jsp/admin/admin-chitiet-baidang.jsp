<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="duyetBaiDang" value="/admin/duyetbaidang"/>
<c:url var="quanlybaidang" value="/admin-quanlybaidang/showbaidang"/>
<c:url var="thaobaidang" value="/admin/thaobaidang"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Chi tiết bài đăng</title>
    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/bootstrap.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/bootstrap.min.css"
          rel="stylesheet"/>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css2/owl.carousel.min.css">
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
                    <%-- <c:if test="${listBaiDang.trangThai == 0 && listBaiDang.status == 1}">
                         <li>
                             <i class="ace-icon fa fa-home home-icon"></i>
                             <a href="/admin-quanlybaidang/showbaidang">Quản lý</a>
                         </li>
                     </c:if>--%>
                    <c:if test="${listBaiDang.trangThai == 0 && listBaiDang.status == 1}">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="/admin-quanlybaidang/showbaidangchuaduyet">Quản lý</a>
                        </li>
                    </c:if>
                    <c:if test="${listBaiDang.trangThai == 1 && listBaiDang.status == 1}">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="/admin-quanlybaidang/showbaidangdaduyet">Quản lý</a>
                        </li>
                    </c:if>
                    <c:if test="${listBaiDang.trangThai == 0 && listBaiDang.status == 0}">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="/admin-quanlybaidang/showbaidangkhoa">Quản lý</a>
                        </li>
                    </c:if>
                    <li class="active">Quản lý bài đăng</li>
                    <li class="active">Chi tiết bài đăng</li>
                </ul>
                <c:if test="${listBaiDang.trangThai == 0 && listBaiDang.status == 1}">
                    <div style="float: right">
                        <ul class="breadcrumb">
                            <li>
                                <a href="/admin-quanlybaidang/showbaidangchuaduyet">Quay lại</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${listBaiDang.trangThai == 1 && listBaiDang.status == 1}">
                    <div style="float: right">
                        <ul class="breadcrumb">
                            <li>
                                <a href="/admin-quanlybaidang/showbaidangdaduyet">Quay lại</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${listBaiDang.trangThai == 0 && listBaiDang.status == 0}">
                    <div style="float: right">
                        <ul class="breadcrumb">
                            <li>
                                <a href="/admin-quanlybaidang/showbaidangkhoa">Quay lại</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
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
                    <div>
                        <h2 style="color: red">Thông tin bài đăng</h2>
                    </div>
                    <br/>
                    <div class="form-horizontal">
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="tieuDe"> Tiêu
                                            đề </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control" id="tieuDe"
                                                   name="tieuDe" value="${listBaiDang.tieuDe}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="noiDung"> Nội
                                            dung </label>

                                        <div class="col-sm-9">
                                            <%--<input style="width: 430px" type="text" cssClass="form-control" id="noiDung"
                                                   name="noiDung" value="${listBaiDang.noiDung}" disabled/>--%>
                                            <textarea cols="3" rows="4" style="width: 430px" type="textarea"
                                                      class="form-control" id="noiDung" name="noiDung"
                                                      disabled>${listBaiDang.noiDung}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="ngayDang"> Ngày
                                            đăng </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control"
                                                   id="ngayDang"
                                                   name="ngayDang" value="${listBaiDang.ngayDang}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="gia"> Giá </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control" id="gia"
                                                   name="gia" value="${listBaiDang.gia} vnđ" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="nguoiDang"> Người
                                            đăng </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control"
                                                   id="nguoiDang"
                                                   name="nguoiDang" value="${listBaiDang.taiKhoanEntity.hoTen}"
                                                   disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="email">
                                            Email </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control" id="email"
                                                   name="email" value="${listBaiDang.taiKhoanEntity.email}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="soDienThoai"> Số
                                            điện
                                            thoại </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control"
                                                   id="soDienThoai"
                                                   name="soDienThoai" value="${listBaiDang.taiKhoanEntity.soDienThoai}"
                                                   disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="danhMuc"> Danh
                                            mục </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control" id="danhMuc"
                                                   name="danhMuc" value="${listBaiDang.danhMucEntity.tenDanhMuc}"
                                                   disabled/>
                                        </div>
                                    </div>
                                    <%--<div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="loaiTin"> Loại
                                            tin </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control" id="loaiTin"
                                                   name="loaiTin" value="${listLoaiTin.tenLoaiTin}" disabled/>
                                        </div>
                                    </div>--%>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="thoiHan"> Thời
                                            hạn </label>

                                        <div class="col-sm-9">
                                            <input style="width: 430px" type="text" cssClass="form-control" id="thoiHan"
                                                   name="thoiHan" value="${listBaiDang.thoiHanEntity.soNgay} ngày"
                                                   disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="trangThai"> Trạng
                                            thái </label>

                                        <div class="col-sm-9">
                                            <c:if test="${listBaiDang.trangThai==1}">
                                                <input style="width: 430px" type="text" cssClass="form-control"
                                                       id="trangThai"
                                                       name="trangThai" value="Đã duyệt" disabled/>
                                            </c:if>
                                            <c:if test="${listBaiDang.trangThai==0}">
                                                <input style="width: 430px" type="text" cssClass="form-control"
                                                       id="trangThai"
                                                       name="trangThai" value="Chưa duyệt" disabled/>
                                            </c:if>
                                        </div>
                                    </div>
                                    <c:if test="${listBaiDang.trangThai == 1}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="ngayDuyet"> Ngày
                                                duyệt
                                            </label>

                                            <div class="col-sm-9">
                                                <input style="width: 430px" type="text" cssClass="form-control"
                                                       id="ngayDuyet"
                                                       name="ngayDuyet" value="${listBaiDang.ngayDuyet}" disabled/>
                                            </div>
                                        </div>
                                    </c:if>
                                    <form id="duyetSubmit">
                                        <input type="hidden" id="id" value="${listBaiDang.id}" name="id"/>
                                        <c:if test="${listBaiDang.trangThai == 0 && listBaiDang.status == 1}">
                                            <div class="clearfix form-actions">
                                                <button class="btn btn-info" type="button"
                                                        onclick="warningBeforeDelete()"
                                                        id="btnAddOrUpdateNew">
                                                    <i class="ace-icon fa fa-check bigger-110"></i> Duyệt
                                                </button>
                                            </div>
                                        </c:if>
                                        <c:if test="${listBaiDang.trangThai == 1 && listBaiDang.status == 1}">
                                            <div class="clearfix form-actions">
                                                <button class="btn btn-info" type="button"
                                                        onclick="warningBeforeDelete1()"
                                                        id="btnAddOrUpdateNew1">
                                                    <i class="ace-icon fa fa-check bigger-110"></i> Gỡ bài
                                                </button>
                                            </div>
                                        </c:if>
                                    </form>
                                </div>
                                <div style="height: 400px" class="col-sm-5">
                                    <div style="height:400px" class="row">
                                        <div style="height: 400px" class="col-12">
                                            <img class="d-block w-100 img-fluid" width="100%" height="300px"
                                                 src="${pageContext.request.contextPath}${pageContext.request.contextPath}${listBaiDang.anhEntities.get(0).src}"
                                                 alt="First slide">
                                        </div>
                                    </div>
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
    function warningBeforeDelete() {
        swal({
            title: "Xác nhận duyệt",
            text: "Duyệt bài đăng này ?",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Xác nhận",
            cancelButtonText: "Hủy bỏ"
        }).then(
            function (isConfirm) {
                if (isConfirm.value) {
                    var data = {};
                    var formData = $('#duyetSubmit').serializeArray();//seri : suport get value on field dựa vào cái name trong mỗi field
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    duyetBaiDang(data);
                } else {
                }
            });
    };

    /*$('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();//tránh submit nhầm url
        var data = {};
        var formData = $('#duyetSubmit').serializeArray();//seri : suport get value on field dựa vào cái name trong mỗi field
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        duyetBaiDang(data);
    });*/

    function duyetBaiDang(data) {
        $.ajax({
            url: '${duyetBaiDang}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${quanlybaidang}?message=duyet_success";
            },
            error: function (error) {
                window.location.href = "${quanlybaidang}?message=duyet_failed";
            }
        });
    }

    function warningBeforeDelete1() {
        swal({
            title: "Xác nhận gỡ bài",
            text: "Gỡ bài đăng này ?",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Xác nhận",
            cancelButtonText: "Hủy bỏ"
        }).then(
            function (isConfirm) {
                if (isConfirm.value) {
                    var data = {};
                    var formData = $('#duyetSubmit').serializeArray();//seri : suport get value on field dựa vào cái name trong mỗi field
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    goBaiDang(data);
                } else {
                }
            });
    };

    function goBaiDang(data) {
        $.ajax({
            url: '${thaobaidang}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${quanlybaidang}?message=gobai_success";
            },
            error: function (error) {
                window.location.href = "${quanlybaidang}?message=gobai_failed";
            }
        });
    }
</script>

</body>
</html>
