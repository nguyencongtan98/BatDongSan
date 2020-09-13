<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/27/19
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script>
        $(document).ready(function(){


            $("#tieuDe").keyup(function(){
                var test =$(this).val();
                if (test.length > 55) {
                    alert("Vui lòng nhập dưới 56 kí tự");

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

</head>


<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>

        <div class="col-md-10">
            <c:if test="${message==null}">
            <form class="form-horizontal" action="/quanlytin/thembaidang" method="post" enctype="multipart/form-data">
                </c:if>
                <c:if test="${message!=null}">
                <form class="form-horizontal" action="/quanlytin/chinhsuabaidang" method="post" enctype="multipart/form-data">
                    </c:if>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label ">Tỉnh thành</label>
                                <select name="tinhThanhId" href="/" class="form-control" id="sel1">
                                    <c:forEach items="${listTinhThanh}" var="listTinhThanh">
                                        <option value="${listTinhThanh.id}">${listTinhThanh.tenTinhThanh}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label ">Danh muc:</label>
                                <select name="danhMucId" class="form-control" id="sel2">
                                    <c:forEach items="${listDanhMuc}" var="listDanhMuc">
                                        <option value="${listDanhMuc.id}">${listDanhMuc.tenDanhMuc}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label ">Tiêu đề:</label>
                                <input class="form-control" id="tieuDe" name="tieuDe" value="${baiDang.tieuDe}"
                                       required placeholder="Nhập tiêu đề">
                            </div>
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label ">Diện tích:</label>
                                <input class="form-control" id="dienTichDat" name="dienTichDat" value="${baiDang.dienTichDat}"
                                       required placeholder="Nhập diện tích ">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label  ">Tầng lầu:</label>
                                <input class="form-control" id="tangLau" name="tangLau" value="${baiDang.tangLau}"
                                       required placeholder="Số tầng lầu">
                            </div>
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label  ">Phòng ngủ:</label>
                                <input class="form-control" id="phongNgu" name="phongNgu" value="${baiDang.phongNgu}"
                                       required placeholder="Số phòng ngủ">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label  ">Phòng tắm:</label>
                                <input class="form-control" id="phongTam" name="phongTam" value="${baiDang.phongTam}"
                                       required placeholder="Số phòng tắm">
                            </div>
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label  ">Diện tích sử dụng:</label>
                                <input class="form-control" id="dienTichSuDung" name="dienTichSuDung" value="${baiDang.dienTichSuDung}"
                                       required placeholder="Nhập diện tích sử dụng">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label ">Nội dung:</label>
                                    <input class="form-control" name="noiDung" value="${baiDang.noiDung}"
                                           required placeholder="Nhập nội dung">
                            </div>
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label ">Giá:</label>
                                    <input class="form-control" id="gia"  name="gia" value="${baiDang.gia}"
                                           placeholder="Nhập giá bán" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label  ">Mệnh giá:</label>
                                    <select name="menhGiaId" class="form-control" id="sel3">
                                        <c:forEach items="${listMenhGia}" var="listMenhGia">
                                            <option value="${listMenhGia.id}">${listMenhGia.tenMenhGia}</option>
                                        </c:forEach>
                                    </select>
                            </div>
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label ">Thời hạn:</label>
                                    <select name="thoiHanId" class="form-control" id="sel3">
                                        <c:forEach items="${listThoiHan}" var="listThoiHan">
                                            <option value="${listThoiHan.id}">${listThoiHan.soNgay}</option>
                                        </c:forEach>
                                    </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label style="text-align: right" class="control-label  ">Upload:</label>
                                    <input name="fileData" type="file" required class="form-control" multiple="true"/>
                            </div>
                        </div>


                        <input hidden name="ngayDang" value="${baiDang.ngayDang}"/>
                        <div class="form-group">
                            <div class="row">
                                <label style="text-align: right" class="control-label  col-sm-1"></label>

                                <c:if test="${message==null}">
                                    <div class="col-sm-offset-2 col-sm-8">
                                        <button type="submit" class="btn btn-default">Đăng tin</button>
                                    </div>
                                </c:if>
                                <c:if test="${message!=null}">
                                    <div class="col-sm-offset-2 col-sm-8">
                                        <button type="submit" class="btn btn-default">Cập nhật</button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>

<script src="/resources/js/jquery-2.2.3.min.js"></script>
<!-- //jquery -->

<!-- nav smooth scroll -->
<script>
    $(document).ready(function () {
        $(".dropdown").hover(
            function () {
                $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                $(this).toggleClass('open');
            },
            function () {
                $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                $(this).toggleClass('open');
            }
        );
    });
</script>
<!-- //nav smooth scroll -->

<!-- popup modal (for location)-->
<script src="/resources/js/jquery.magnific-popup.js"></script>
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>
<!-- //popup modal (for location)-->

<!-- cart-js -->
<script src="/resources/js/minicart.js"></script>
<script>
    paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

    paypals.minicarts.cart.on('checkout', function (evt) {
        var items = this.items(),
            len = items.length,
            total = 0,
            i;

        // Count the number of each item in the cart
        for (i = 0; i < len; i++) {
            total += items[i].get('quantity');
        }

        if (total < 3) {
            alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
            evt.preventDefault();
        }
    });
</script>
<!-- //cart-js -->

<!-- password-script -->
<script>
    window.onload = function () {
        document.getElementById("password1").onchange = validatePassword;
        document.getElementById("password2").onchange = validatePassword;
    }

    function validatePassword() {
        var pass2 = document.getElementById("password2").value;
        var pass1 = document.getElementById("password1").value;
        if (pass1 != pass2)
            document.getElementById("password2").setCustomValidity("Passwords Don't Match");
        else
            document.getElementById("password2").setCustomValidity('');
        //empty string means no validation error
    }
</script>
<!-- //password-script -->

<!-- scroll seller -->
<script src="/resources/js/scroll.js"></script>
<!-- //scroll seller -->

<!-- smoothscroll -->
<script src="/resources/js/SmoothScroll.min.js"></script>
<!-- //smoothscroll -->

<!-- start-smooth-scrolling -->
<script src="/resources/js/move-top.js"></script>
<script src="/resources/js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();

            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->

<!-- smooth-scrolling-of-move-up -->
<script>
    $(document).ready(function () {
        /*
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        */
        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<!-- //smooth-scrolling-of-move-up -->

<!-- for bootstrap working -->
<script src="/resources/js/bootstrap.js"></script>
</html>
