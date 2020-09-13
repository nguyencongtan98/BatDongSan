<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:url var="doiMatKhau" value="/admin/doimatkhau"/>
<c:url var="doiMatKhauSuccess" value="/admin-quanlytaikhoan/doimatkhau"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Đổi mật khẩu</title>
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
                        <a href="/admin">Quản lý</a>
                    </li>
                    <li class="active">Quản lý tài khoản</li>
                    <li class="active">Đổi mật khẩu</li>
                </ul>
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
                    <h2 style="color: red">Đổi mật khẩu</h2>
                </div>
                <br/>
                <form class="form-horizontal" id="formSubmit">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="password"> Mật khẩu hiện
                                        tại</label>

                                    <div class="col-sm-9">
                                        <input style="width: 400px" type="password" cssClass="form-control"
                                               id="password" autocomplete="off"
                                               name="password" value="" placeholder="Nhập mật khẩu hiện tại"/>
                                        <div id="showerror" style="color: red"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="password1"> Mật khẩu
                                        mới</label>

                                    <div class="col-sm-9">
                                        <input style="width: 400px" type="password" cssClass="form-control"
                                               id="password1" autocomplete="off" maxlength="32"
                                               name="password1" value="" placeholder="Nhập mật khẩu mới"/>
                                        <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Mật khẩu tối thiểu 6 kí tự và tối đa 32 kí tự
                                        <div id="showerror1" style="color: red"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="password2"> Nhập lại mật
                                        khẩu mới</label>

                                    <div class="col-sm-9">
                                        <input style="width: 400px" type="password" cssClass="form-control"
                                               id="password2" autocomplete="off" maxlength="32"
                                               name="password2" value="" placeholder="Nhập lại mật khẩu mới"/>
                                        <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Khớp mật khẩu
                                        <div id="showerror2" style="color: red"></div>
                                    </div>
                                </div>
                                <div id="showerror3" style="color: red"></div>
                                <br/>
                                <div class="clearfix form-actions">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button class="btn btn-info" type="button"
                                                id="btnAddOrUpdateNew2">
                                            <i class="ace-icon fa fa-unlock bigger-110"></i>Đổi mật khẩu
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${listTaiKhoan.id}"/>
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
                var button = $('#btnAddOrUpdateNew2');
                $(button).attr('disabled', 'disabled');
                $("input[type=password]").keyup(function () {
                    if ($("#password").val().length >= 1 || $("#password1").val().length >= 1 || $("#password2").val().length >= 1) {
                        $(button).removeAttr('disabled');
                    } else {
                        $(button).attr('disabled', 'disabled');
                    }
                    if ($("#password1").val().length >= 6 && $("#password1").val().length <= 32) {
                        $("#8char").removeClass("glyphicon-remove");
                        $("#8char").addClass("glyphicon-ok");
                        $("#8char").css("color", "#00A41E");
                    } else {
                        $("#8char").removeClass("glyphicon-ok");
                        $("#8char").addClass("glyphicon-remove");
                        $("#8char").css("color", "#FF0004");
                    }
                    if ($("#password1").val() == $("#password2").val()) {
                        $("#pwmatch").removeClass("glyphicon-remove");
                        $("#pwmatch").addClass("glyphicon-ok");
                        $("#pwmatch").css("color", "#00A41E");
                    } else {
                        $("#pwmatch").removeClass("glyphicon-ok");
                        $("#pwmatch").addClass("glyphicon-remove");
                        $("#pwmatch").css("color", "#FF0004");
                    }
                });

                $(button).click(function (e) {
                    e.preventDefault();
                    var data = {};
                    var formData = $('#formSubmit').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    var password = $('#password').val();
                    var password1 = $('#password1').val();
                    var password2 = $('#password2').val();
                    if (password != '' && password1 == '' && password2 == '') {
                        $("#showerror").text("");
                        $("#showerror1").text("Mật khẩu mới không được để trống !");
                        $("#showerror2").text("Nhập lại mật khẩu mới không được để trống !");
                    }
                    else if(password != '' && password1 == '' && password2 != '') {
                        $("#showerror").text("");
                        $("#showerror1").text("Mật khẩu mới không được để trống !");
                        $("#showerror2").text("");
                    }
                    else if(password == '' && password1 != '' && password2 == '') {
                        $("#showerror").text("Mật khẩu hiện tại không được để trống !");
                        $("#showerror1").text("");
                        $("#showerror2").text("Nhập lại mật khẩu mới không được để trống !");
                    }
                    else if(password == '' && password1 != '' && password2 != '') {
                        $("#showerror").text("Mật khẩu hiện tại không được để trống !");
                        $("#showerror1").text("");
                        $("#showerror2").text("");
                    }
                    else if(password == '' && password1 == '' && password2 != '') {
                        $("#showerror").text("Mật khẩu hiện tại không được để trống !");
                        $("#showerror1").text("Mật khẩu mới không được để trống !");
                        $("#showerror2").text("");
                    }
                    else if(password1.length <=5 && password.length <=5 && password2 == ''){
                        $("#showerror").text("Mật khẩu tối thiểu 6 kí tự !");
                        $("#showerror1").text("Mật khẩu tối thiểu 6 kí tự !");
                        $("#showerror2").text("Bạn phải nhập mật khẩu mới !");
                    }
                    else if(password1.length <=5 && password.length <=5 && password2 != ''){
                        $("#showerror").text("Mật khẩu tối thiểu 6 kí tự !");
                        $("#showerror1").text("Mật khẩu tối thiểu 6 kí tự !");
                        $("#showerror2").text("");
                    }
                    else if(password1.length <=5 && password2.length <=5 && password != ''){
                        $("#showerror").text("");
                        $("#showerror1").text("Mật khẩu tối thiểu 6 kí tự !");
                        $("#showerror2").text("Mật khẩu tối thiểu 6 kí tự !");
                    }
                    else if(password.length <=5){
                        $("#showerror").text("Mật khẩu tối thiểu 6 kí tự !");
                        $("#showerror1").text("");
                        $("#showerror2").text("");
                    }
                    else if(password != '' && password1 != '' && password2 == '') {
                        $("#showerror").text("");
                        $("#showerror1").text("");
                        $("#showerror2").text("Nhập lại mật khẩu mới không được để trống !");
                    }
                    else if(password1 != password2){
                        $("#showerror").text("");
                        $("#showerror1").text("Mật khẩu không khớp !");
                        $("#showerror2").text("Mật khẩu không khớp !");
                    }
                    else if(password1 != password2 && password != ''){
                        $("#showerror").text("");
                        $("#showerror1").text("Mật khẩu không khớp !");
                        $("#showerror2").text("Mật khẩu không khớp !");
                    }
                    else {
                        $("#showerror").text("");
                        $("#showerror1").text("");
                        $("#showerror2").text("");
                        doiMatKhau(data);
                    }
                });

                function doiMatKhau(data) {
                    $.ajax({
                        url: '${doiMatKhau}',
                        type: 'PUT',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        dataType: 'json',
                        success: function (result) {
                            if (result.id == 0) {
                                $("#showerror").text("Mật khẩu hiện tại không đúng !");
                            } else if (result.id == 1) {
                                $("#showerror1").text("Mật khẩu mới phải khác mật khẩu cũ !");
                            } else {
                                window.location.href = "${doiMatKhauSuccess}?message=change_password_success";
                            }
                        },
                        error: function (error) {
                            window.location.href = "${doiMatKhauSuccess}?message=change_password_failed";
                        }
                    });
                }
            });
        </script>
    </div>
</div>
</body>
</html>
