<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:url var="lockTaiKhoan" value="/admin/khoataikhoanadmin"/>
<c:url var="lockTaiKhoanAdmin" value="/admin/khoataikhoanadmin"/>
<c:url var="unlockTaiKhoan" value="/admin/motaikhoanadmin"/>
<c:url var="unlockTaiKhoanSuccess" value="/admin-quanlytaikhoan/showtaikhoanlockadmin"/>
<c:url var="unlockTaiKhoanFailed" value="/admin-quanlytaikhoan/showtaikhoanlockuser"/>
<c:url var="creThoiHan" value="/admin/addthoihan"/>
<c:url var="addNewList" value="/admin-quanlytaikhoan/showtaikhoanadmin"/>
<c:url var="addNewList1" value="/admin-quanlytaikhoan/showtaikhoanuser"/>
<c:url var="undeleteAdmin" value="/admin/khoiphuctaikhoan"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Cập nhật tài khoản</title>
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
                    <c:if test="${listTaiKhoan.status == 1 && listTaiKhoan.trangThai == 1}">
                        <li>
                            <a href="/admin-quanlytaikhoan/showtaikhoanadmin">Quản lý</a>
                        </li>
                    </c:if>
                    <c:if test="${listTaiKhoan.status == 0 && listTaiKhoan.trangThai == 0}">
                        <li>
                            <a href="/admin-quanlytaikhoan/showtaikhoandelete">Quản lý</a>
                        </li>
                    </c:if>
                    <c:if test="${listTaiKhoan.status == 1 && listTaiKhoan.trangThai == 0}">
                        <li>
                            <a href="/admin-quanlytaikhoan/showtaikhoanlockadmin">Quản lý</a>
                        </li>
                    </c:if>
                    <li class="active">Quản lý tài khoản</li>
                    <li class="active">Thông tin chi tiết</li>
                </ul>
                <c:if test="${listTaiKhoan.status == 1 && listTaiKhoan.trangThai == 1}">
                    <div style="float: right">
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-backward"></i>
                                <a href="/admin-quanlytaikhoan/showtaikhoanadmin">Quay lại</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${listTaiKhoan.status == 0 && listTaiKhoan.trangThai == 0}">
                    <div style="float: right">
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-backward"></i>
                                <a href="/admin-quanlytaikhoan/showtaikhoandelete">Quay lại</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${listTaiKhoan.status == 1 && listTaiKhoan.trangThai == 0}">
                    <div style="float: right">
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-backward"></i>
                                <a href="/admin-quanlytaikhoan/showtaikhoanlockadmin">Quay lại</a>
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
                </div>
                <div>
                    <h2 style="color: red">Thông tin quản trị viên</h2>
                </div>
                <br/>
                <form class="form-horizontal" role="form" id="formSubmit">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="tenDangNhap"> Tên
                                            đăng nhập </label>

                                        <div class="col-sm-9">
                                            <input style="width: 400px" type="text" cssClass="form-control"
                                                   id="tenDangNhap" name="tenDangNhap"
                                                   value="${listTaiKhoan.tenDangNhap}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="hoTen"> Họ
                                            tên </label>

                                        <div class="col-sm-9">
                                            <input style="width: 400px" type="text" cssClass="form-control" id="hoTen"
                                                   name="hoTen" value="${listTaiKhoan.hoTen}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="email">
                                            Email </label>

                                        <div class="col-sm-9">
                                            <input style="width: 400px" type="text" cssClass="form-control" id="email"
                                                   name="email" value="${listTaiKhoan.email}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="diaChi"> Địa
                                            chỉ </label>

                                        <div class="col-sm-9">
                                            <input style="width: 400px" type="text" cssClass="form-control" id="diaChi"
                                                   name="diaChi" value="${listTaiKhoan.diaChi}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="soDienThoai"> Số
                                            điện thoại </label>

                                        <div class="col-sm-9">
                                            <input style="width: 400px" type="text" cssClass="form-control"
                                                   id="soDienThoai" name="soDienThoai"
                                                   value="${listTaiKhoan.soDienThoai}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="quyen"> Vai
                                            trò </label>

                                        <div class="col-sm-9">
                                            <input style="width: 400px" type="text" cssClass="form-control"
                                                   id="quyen" name="quyen" value="Quản trị viên" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="trangThai"> Trạng
                                            thái </label>
                                        <div class="col-sm-9">
                                            <c:if test="${listTaiKhoan.trangThai == 1 && listTaiKhoan.status == 1}">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="trangThai" name="trangThai" value="Đang hoạt động" disabled/>
                                            </c:if>
                                            <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 1}">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="trangThai" name="trangThai" value="Tạm ngưng hoạt động"
                                                       disabled/>
                                            </c:if>
                                            <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 0}">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="trangThai" name="trangThai" value="Ngưng hoạt động"
                                                       disabled/>
                                            </c:if>
                                        </div>
                                    </div>
                                    <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 1}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="tinhTrang"> Tình
                                                trạng </label>
                                            <div class="col-sm-9">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="tinhTrang" name="tinhTrang"
                                                       value="Khóa ${listTaiKhoan.thoiHanKhoaEntity.soNgayKhoa} ngày"
                                                       disabled/>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 0}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="tinhTrang1">
                                                Tình trạng </label>
                                            <div class="col-sm-9">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="tinhTrang1" name="tinhTrang1" value="Đã xóa" disabled/>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 1}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="ngayKhoa"> Ngày
                                                khóa </label>
                                            <div class="col-sm-9">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="ngayKhoa" name="ngayKhoa" value="${listTaiKhoan.ngayKhoa}"
                                                       disabled/>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 1}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="nguoiKhoa">
                                                Người khóa </label>
                                            <div class="col-sm-9">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="nguoiKhoa" name="nguoiKhoa" value="${listTaiKhoan.nguoiKhoa}"
                                                       disabled/>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 0}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="nguoiXoa"> Người
                                                xóa </label>
                                            <div class="col-sm-9">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="nguoiXoa" name="nguoiXoa" value="${listTaiKhoan.nguoiXoa}"
                                                       disabled/>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 0}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="ngayXoa"> Ngày
                                                xóa </label>
                                            <div class="col-sm-9">
                                                <input style="width: 400px" type="text" cssClass="form-control"
                                                       id="ngayXoa" name="ngayXoa" value="${listTaiKhoan.ngayXoa}"
                                                       disabled/>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="clearfix form-actions">
                        <c:if test="${listTaiKhoan.trangThai == 1}">
                            <div class="col-md-offset-3 col-md-9">
                                <label for="thoiHanKhoaEntity" style="color: red">
                                    Chọn số ngày khóa</label>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                <select id="thoiHanKhoaEntity" name="thoiHanKhoaEntity">
                                    <c:forEach var="item" items="${listThoiHanKhoa}">
                                        <option value="${item.id}">${item.soNgayKhoa}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </c:if>
                        <br/>
                        <br/>
                        <br/>
                        <c:if test="${listTaiKhoan.trangThai == 1 && listTaiKhoan.status == 1}">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="button" onclick="warningBeforeDelete()"
                                        id="btnAddOrUpdateNew">
                                    <i class="ace-icon fa fa-lock bigger-110"></i> Khóa tài khoản
                                </button>
                            </div>
                        </c:if>
                        <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 1}">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="button" onclick="warningBeforeDelete1()"
                                        id="btnAddOrUpdateNew1">
                                    <i class="ace-icon fa fa-unlock bigger-110"></i> Mở khóa
                                </button>
                            </div>
                        </c:if>
                        <c:if test="${listTaiKhoan.trangThai == 0 && listTaiKhoan.status == 0}">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="button" onclick="warningBeforeDelete2()"
                                        id="btnAddOrUpdateNew2">
                                    <i class="ace-icon fa fa-unlock bigger-110"></i> Hoàn tác
                                </button>
                            </div>
                        </c:if>
                    </div>
                    <input type="hidden" name="id" value="${listTaiKhoan.id}"/>
                </form>

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
                function warningBeforeDelete() {
                    swal({
                        title: "Xác nhận khóa",
                        text: "Bạn có chắc chắn muốn khóa tài khoản này không ?",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "Xác nhận",
                        cancelButtonText: "Hủy bỏ"
                    }).then(
                        function (isConfirm) {
                            if (isConfirm.value) {
                                var data = {};
                                var formData = $('#formSubmit').serializeArray();//seri : suport get value on field dựa vào cái name trong mỗi field
                                $.each(formData, function (i, v) {
                                    data["" + v.name + ""] = v.value;
                                });
                                khoaTaiKhoan(data);
                            } else {
                            }
                        });
                };


                function khoaTaiKhoan(data) {
                    $.ajax({
                        url: '${lockTaiKhoan}',
                        type: 'PUT',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        dataType: 'json',
                        success: function (result) {
                            window.location.href = "${addNewList}?message=lock_success";
                        },
                        error: function (error) {
                            window.location.href = "${addNewList}?message=lock_failed";
                        }
                    });
                }

                function warningBeforeDelete1() {
                    swal({
                        title: "Xác nhận mở",
                        text: "Bạn muốn mở tài khoản này ?",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "Xác nhận",
                        cancelButtonText: "Hủy bỏ"
                    }).then(
                        function (isConfirm) {
                            if (isConfirm.value) {
                                var data = {};
                                var formData = $('#formSubmit').serializeArray();//seri : suport get value on field dựa vào cái name trong mỗi field
                                $.each(formData, function (i, v) {
                                    data["" + v.name + ""] = v.value;
                                });
                                moTaiKhoan(data);
                            } else {
                            }
                        });
                };


                function moTaiKhoan(data) {
                    $.ajax({
                        url: '${unlockTaiKhoan}',
                        type: 'PUT',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        dataType: 'json',
                        success: function (result) {
                            window.location.href = "${unlockTaiKhoanSuccess}?&message=unlock_success";
                        },
                        error: function (error) {
                            window.location.href = "${unlockTaiKhoanFailed}?message=unlock_failed";
                        }
                    });
                }

                function warningBeforeDelete2() {
                    swal({
                        title: "Xác nhận hoàn tác",
                        text: "Bạn có chắc chắn muốn khôi phục tài khoản này ?",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "Xác nhận",
                        cancelButtonText: "Hủy bỏ"
                    }).then(
                        function (isConfirm) {
                            if (isConfirm.value) {
                                var data = {};
                                var formData = $('#formSubmit').serializeArray();//seri : suport get value on field dựa vào cái name trong mỗi field
                                $.each(formData, function (i, v) {
                                    data["" + v.name + ""] = v.value;
                                });
                                khoiphucTaiKhoan(data);
                            } else {
                            }
                        });
                };


                function khoiphucTaiKhoan(data) {
                    $.ajax({
                        url: '${undeleteAdmin}',
                        type: 'PUT',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        dataType: 'json',
                        success: function (result) {
                            window.location.href = "${addNewList}?message=undelete_success";
                        },
                        error: function (error) {
                            window.location.href = "${addNewList}?message=undelete_failed";
                        }
                    });
                }
            </script>
        </div>
    </div>
</body>
</html>
