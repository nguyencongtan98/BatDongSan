<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:url var="capNhatThongTin" value="/admin/capnhatthongtin"/>
<c:url var="capNhatThongTinSuccess" value="/admin-quanlytaikhoan/thongtincanhan"/>

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
                <div>
                    <h2 style="color: red">Thông tin cá nhân</h2>
                </div>
                <br/>
                <form class="form-horizontal" role="form" id="formSubmit" >
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="tenDangNhap"> Tên đăng nhập </label>

                                    <div class="col-sm-9">
                                        <input style="width: 400px" type="text" cssClass="form-control" id="tenDangNhap" name="tenDangNhap" value="${listTaiKhoan.tenDangNhap}" disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="hoTen"> Họ tên </label>

                                    <div class="col-sm-9">
                                        <input style="width: 400px" autocomplete="off" type="text" cssClass="form-control" id="hoTen" name="hoTen" value="${listTaiKhoan.hoTen}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="email"> Email </label>

                                    <div class="col-sm-9">
                                        <input style="width: 400px" type="email" cssClass="form-control" id="email" name="email" value="${listTaiKhoan.email}" disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="diaChi"> Địa chỉ </label>

                                    <div class="col-sm-9">
                                        <input style="width: 400px" type="text" cssClass="form-control" id="diaChi" name="diaChi" value="${listTaiKhoan.diaChi}"required />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="soDienThoai"> Số điện thoại </label>

                                    <div class="col-sm-9">
                                        <input style="width: 400px" type="text" cssClass="form-control" id="soDienThoai" name="soDienThoai" maxlength="10" value="${listTaiKhoan.soDienThoai}" required/>
                                    </div>
                                </div>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"></label>

                                    <div class="col-sm-9" id="showerror" style="color: red">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br/>
                <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit"
                                    id="btnAddOrUpdateNew2">
                                <i class="ace-icon fa fa-unlock bigger-110"></i> Cập nhật
                            </button>
                        </div>
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
                $(document).ready(function () {
                    var button = $('#btnAddOrUpdateNew2');
                    $(button).attr('disabled', 'disabled');
                    $("input[type=text]").keyup(function () {
                        if($.trim($('#hoTen').val().length) >=1 || $.trim($('#diaChi').val().length) >=1 || $.trim($("#soDienThoai").val() >=1)){
                            $(button).removeAttr('disabled');
                        }else {
                            $(button).attr('disabled', 'disabled');
                        }
                    });
                });
            </script>
        <script>
            $('#btnAddOrUpdateNew2').click(function (e) {
                e.preventDefault();
                var data = {};
                var formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data[""+v.name+""] = v.value;
                });
                var hoTen = $('#hoTen').val();
                var diaChi = $('#diaChi').val();
                var sodienthoai = $('#soDienThoai').val();
                var specialChars = "<>@!#$%^&*()_+[]{}?:;|'\"\\,./~`-=";
                var checkSdt = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                var checkSpecialChars = function(string){
                    for(i = 0; i < specialChars.length;i++){
                        if(string.indexOf(specialChars[i]) > -1){
                            return true;
                        }
                    }
                    return false;
                };
                /*if ($.trim(soNgay) == 0) {
                    $('#showerror').text('Số ngày không được nhập 0');
                }*/
                if ($.trim(hoTen) == '' || $.trim(diaChi) == '' || $.trim(sodienthoai) == '') {
                    $('#showerror').text('Bạn cần nhập đầy đủ thông tin !');
                }else if(checkSpecialChars(sodienthoai) == true || $.trim(sodienthoai).length <=9) {
                    $('#showerror').text('Số điện thoại không đúng !');
                }
                else if(checkSdt.test(sodienthoai) == false){
                    $('#showerror').text('Số điện thoại không đúng định dạng!');
                }
                else {
                    swal({
                        title: "Xác nhận cập nhật",
                        text: "Bạn có chắc chắn muốn cập nhật hay không ?",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "Xác nhận",
                        cancelButtonText: "Hủy bỏ"
                    }).then(
                        function (isConfirm) {
                            if (isConfirm.value) {
                                capNhatThongTin(data);
                            }
                            else {
                            }
                        });
                }
            });


            function capNhatThongTin(data){
                $.ajax({
                    url : '${capNhatThongTin}',
                    type : 'PUT',
                    contentType : 'application/json',
                    data : JSON.stringify(data),
                    dataType : 'json',
                    success : function(result){
                        if(result.id==0){
                            $('#showerror').html("Thông tin đã tồn tại !");
                        }
                        else {
                            $('#showerror').html("Cập nhật thông tin thành công !");
                        }
                    },
                    error : function (error){
                        window.location.href = "${capNhatThongTinSuccess}?message=update_failed";
                    }
                });
            }
        </script>
    </div>
</div>
</body>
</html>
