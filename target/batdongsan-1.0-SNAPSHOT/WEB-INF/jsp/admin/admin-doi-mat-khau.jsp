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
    <title>Thông tin cá nhân</title>
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
                    <li class="active">Thông tin cá nhân</li>
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
                <br/>
                <form class="form-horizontal" role="form" id="formSubmit">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h1 style="text-align: center" >Đổi mật khẩu</h1>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <form>
                                                <input type="password" class="input-lg form-control" name="password" id="password" value="" placeholder="Nhập mật khẩu cũ" autocomplete="off">
                                                <br/>
                                                <input type="password" class="input-lg form-control" name="password1" id="password1" value="" placeholder="Nhập mật khẩu mới" autocomplete="off">
                                                <br/>
                                                <input type="password" class="input-lg form-control" name="password2" id="password2" value="" placeholder="Nhập lại mật khẩu mới" autocomplete="off">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Khớp mật khẩu
                                                    </div>
                                                </div>
                                                <br/>
                                                <input type="button" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Đổi mật khẩu" onclick="warningBeforeDelete()">
                                            </form>
                                        </div><!--/col-sm-6-->
                                    </div><!--/row-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br/>
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
            $("input[type=password]").keyup(function(){
                var ucase = new RegExp("[A-Z]+");
                var lcase = new RegExp("[a-z]+");
                var num = new RegExp("[0-9]+");

                if($("#password1").val().length >= 8){
                    $("#8char").removeClass("glyphicon-remove");
                    $("#8char").addClass("glyphicon-ok");
                    $("#8char").css("color","#00A41E");
                }else{
                    $("#8char").removeClass("glyphicon-ok");
                    $("#8char").addClass("glyphicon-remove");
                    $("#8char").css("color","#FF0004");
                }

                if(ucase.test($("#password1").val())){
                    $("#ucase").removeClass("glyphicon-remove");
                    $("#ucase").addClass("glyphicon-ok");
                    $("#ucase").css("color","#00A41E");
                }else{
                    $("#ucase").removeClass("glyphicon-ok");
                    $("#ucase").addClass("glyphicon-remove");
                    $("#ucase").css("color","#FF0004");
                }

                if(lcase.test($("#password1").val())){
                    $("#lcase").removeClass("glyphicon-remove");
                    $("#lcase").addClass("glyphicon-ok");
                    $("#lcase").css("color","#00A41E");
                }else{
                    $("#lcase").removeClass("glyphicon-ok");
                    $("#lcase").addClass("glyphicon-remove");
                    $("#lcase").css("color","#FF0004");
                }

                if(num.test($("#password1").val())){
                    $("#num").removeClass("glyphicon-remove");
                    $("#num").addClass("glyphicon-ok");
                    $("#num").css("color","#00A41E");
                }else{
                    $("#num").removeClass("glyphicon-ok");
                    $("#num").addClass("glyphicon-remove");
                    $("#num").css("color","#FF0004");
                }

                if($("#password1").val() == $("#password2").val()){
                    $("#pwmatch").removeClass("glyphicon-remove");
                    $("#pwmatch").addClass("glyphicon-ok");
                    $("#pwmatch").css("color","#00A41E");
                }else{
                    $("#pwmatch").removeClass("glyphicon-ok");
                    $("#pwmatch").addClass("glyphicon-remove");
                    $("#pwmatch").css("color","#FF0004");
                }
            });

            function warningBeforeDelete() {
                swal({
                    title: "Xác nhận đổi mật khẩu",
                    text: "Bạn có chắc chắn muốn đổi mật khẩu ?",
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
                            $.each(formData , function(i,v){
                                data[""+v.name+""] = v.value;
                            });
                            doiMatKhau(data);
                        } else {
                        }
                    });
            };


            function doiMatKhau(data){
                $.ajax({
                    url : '${doiMatKhau}',
                    type : 'POST',
                    contentType : 'application/json',
                    data : JSON.stringify(data),
                    dataType : 'json',
                    success : function(result){
                        window.location.href = "${doiMatKhauSuccess}?message=change_password_success";
                    },
                    error : function (error){
                        window.location.href = "${doiMatKhauSuccess}?message=change_password_failed";
                    }
                });
            }
        </script>
    </div>
</div>
</body>
</html>
