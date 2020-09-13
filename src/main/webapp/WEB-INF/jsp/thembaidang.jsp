<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/03/19
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Thêm bài đăng</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


    <script>
        $(document).ready(function () {
            $("#tieuDe").keyup(function () {
                var test = $(this).val();
                if (test.length > 100) {
                    alert("Vui lòng nhập tiêu đề dưới 100 kí tự");
                }
            });
        });
        
        $(document).ready(function () {
            $("#noiDung").keyup(function () {
                var test = $(this).val();
                if (test.length > 200) {
                    alert("Vui lòng nhập nội dung dưới 200 kí tự");
                }
            });
        });
        
        $(document).ready(function () {
            //called when key is pressed in textbox
            $("#tangLau").keypress(function (e) {
                //if the letter is not digit then display error and don't type anything
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    //display error message
                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
                    return false;
                }
            });
        });
        $(document).ready(function () {
            //called when key is pressed in textbox
            $("#phongTam").keypress(function (e) {
                //if the letter is not digit then display error and don't type anything
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    //display error message
                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
                    return false;
                }
            });
        });

        $(document).ready(function () {
            //called when key is pressed in textbox
            $("#phongNgu").keypress(function (e) {
                //if the letter is not digit then display error and don't type anything
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    //display error message
                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
                    return false;
                }
            });
        });
        $(document).ready(function () {
            //called when key is pressed in textbox
            $("#dienTichDat").keypress(function (e) {
                //if the letter is not digit then display error and don't type anything
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    //display error message
                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
                    return false;
                }
            });
        });
        $(document).ready(function () {
            //called when key is pressed in textbox
            $("#dienTichSuDung").keypress(function (e) {
                //if the letter is not digit then display error and don't type anything
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    //display error message
                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
                    return false;
                }
            });
        });
        $(document).ready(function () {
            //called when key is pressed in textbox
            $("#gia").keypress(function (e) {
                //if the letter is not digit then display error and don't type anything
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    //display error message
                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
                    return false;
                }
            });
        });
    </script>

    <style>
    .container h2 a{
        color: lightcoral;
    }
        label{
            color: blue;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
<div class="wrap">
    <jsp:include page="header.jsp"></jsp:include>
<%--    <section class="site-section py-sm">--%>
        <div class="container">
            <div class="row blog-entries">
                <div class="col-md-12 col-lg-8 main-content">
                    <div class="row">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-9 ">
                            <h2  class=""><a href="ĐĂNG TIN BẤT ĐỘNG SẢN">ĐĂNG TIN BẤT ĐỘNG SẢN</a></h2>
                        </div>
                    </div>

<h3 style="color: red">${thongbao2}</h3>
                    <c:if test="${message==null}">
                        <form  action="/quanlytin/thembaidang" method="post" enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Tỉnh thành</label>
                                </div>
                                <div class="col-md-9">
                                    <select name="tinhThanhId" href="/" class="form-control" id="sel1">
                                        <c:forEach items="${listTinhThanh}" var="listTinhThanh">
                                            <option value="${listTinhThanh.id}">${listTinhThanh.tenTinhThanh}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                             <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Địa chỉ</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="text" name="diaChi" id="diaChi" value="${baiDang.diaChi}"
                                           class="form-control " required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Danh mục</label>
                                </div>
                                <div class="col-md-9">
                                    <select name="danhMucId" class="form-control" id="sel2">
                                        <c:forEach items="${listDanhMuc}" var="listDanhMuc">
                                            <option value="${listDanhMuc.id}">${listDanhMuc.tenDanhMuc}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Tiêu đề</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="text" name="tieuDe" id="tieuDe" value="${baiDang.tieuDe}"
                                           class="form-control " required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Nội dung</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="text" name="noiDung" id="noiDung" value="${baiDang.noiDung}"
                                           class="form-control " required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Giá</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="number" name="gia" id="gia" value="${baiDang.gia}"
                                           class="form-control " required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Diện tích đất</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="number" name="dienTichDat"
                                           value="${baiDang.dienTichDat}"
                                           class="form-control " >
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Diện tích sử dụng</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="number" name="dienTichSuDung" id="dienTichSuDung"
                                           value="${baiDang.dienTichSuDung}" class="form-control ">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Số phòng ngủ</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="number" name="phongNgu" id="phongNgu" value="${baiDang.phongNgu}"
                                           class="form-control ">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Số phòng tắm</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="number" name="phongTam" id="phongTam" value="${baiDang.phongTam}"
                                           class="form-control ">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Số tầng lầu</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="number" name="tangLau" id="tangLau" value="${baiDang.tangLau}"
                                           class="form-control ">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Mệnh giá</label>
                                </div>
                                <div class="col-md-9">
                                    <select name="menhGiaId" class="form-control" id="sel3">
                                        <c:forEach items="${listMenhGia}" var="listMenhGia">
                                            <option value="${listMenhGia.id}">${listMenhGia.tenMenhGia}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Thời hạn</label>
                                </div>
                                <div class="col-md-9">
                                    <select name="thoiHanId" class="form-control" id="sel3">
                                        <c:forEach items="${listThoiHan}" var="listThoiHan">
                                            <option value="${listThoiHan.id}">${listThoiHan.soNgay}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label for="email">Chọn ảnh</label>
                                </div>
                                <div class="col-md-9">
                                    <input name="fileData" type="file" class="form-control" multiple="true"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-9 text-right">
                                    <input type="submit" value="ĐĂNG BÀI" class="btn btn-primary bg-success font-weight-bold">
                                </div>

                            </div>
                        </form>
                    </c:if>

                </div>

                <!-- END main-content -->

                <jsp:include page="aside2.jsp"></jsp:include>

            </div>
        </div>
<%--    </section>--%>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
