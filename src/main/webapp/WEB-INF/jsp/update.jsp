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
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <%--    <style>--%>

    <%--        html, body {--%>
    <%--            font-family: Arial, Helvetica, sans-serif;--%>
    <%--        }--%>

    <%--        /* define a fixed width for the entire menu */--%>
    <%--        .navigation {--%>
    <%--            width: 100px;--%>
    <%--        }--%>

    <%--        /* reset our lists to remove bullet points and padding */--%>
    <%--        .mainmenu, .submenu {--%>
    <%--            list-style: none;--%>
    <%--            padding: 0;--%>
    <%--            margin: 0;--%>
    <%--        }--%>

    <%--        .mainmenu li {--%>
    <%--            background-color: white;--%>
    <%--            border-bottom: 1px solid lightgray;--%>
    <%--        }--%>


    <%--        /* make ALL links (main and submenu) have padding and background color */--%>
    <%--        .mainmenu a {--%>
    <%--            display: block;--%>
    <%--            text-decoration: none;--%>
    <%--            padding: 10px;--%>
    <%--            color: #000;--%>
    <%--            background-color: linen;--%>
    <%--        }--%>

    <%--        /* add hover behaviour */--%>
    <%--        .mainmenu a:hover {--%>
    <%--            background-color: #C5C5C5;--%>
    <%--        }--%>


    <%--        /* when hovering over a .mainmenu item,--%>
    <%--          display the submenu inside it.--%>
    <%--          we're changing the submenu's max-height from 0 to 200px;--%>
    <%--        */--%>

    <%--        .mainmenu li:hover .submenu {--%>
    <%--            display: block;--%>
    <%--            max-height: 200px;--%>
    <%--        }--%>

    <%--        /*--%>
    <%--          we now overwrite the background-color for .submenu links only.--%>
    <%--          CSS reads down the page, so code at the bottom will overwrite the code at the top.--%>
    <%--        */--%>

    <%--        .submenu a {--%>
    <%--            background-color: #999;--%>
    <%--        }--%>

    <%--        /* hover behaviour for links inside .submenu */--%>
    <%--        .submenu a:hover {--%>
    <%--            background-color: #666;--%>
    <%--        }--%>

    <%--        /* this is the initial state of all submenus.--%>
    <%--          we set it to max-height: 0, and hide the overflowed content.--%>
    <%--        */--%>
    <%--        .submenu {--%>
    <%--            overflow: hidden;--%>
    <%--            max-height: 0;--%>
    <%--            -webkit-transition: all 0.5s ease-out;--%>
    <%--        }--%>

    <%--        .khungform {--%>
    <%--            width: 100%;--%>
    <%--        }--%>

    <%--        form {--%>
    <%--            width: 100%;--%>
    <%--        }--%>

    <%--        #dangki .khungform input {--%>
    <%--            margin-bottom: 20px;--%>
    <%--            border: 1px solid lightgrey;--%>
    <%--            border-radius: 10px;--%>
    <%--            width: 30%;--%>
    <%--            margin-left: 30px;--%>
    <%--        }--%>

    <%--        /*input[type='text']:hover{color:blue}*/--%>
    <%--        input:hover,--%>
    <%--        input:focus {--%>
    <%--            opacity: .7;--%>
    <%--            color: black;--%>
    <%--            border: 1px solid #08c;--%>
    <%--            box-shadow: 0px 1px 0px cyan, inset 0px 3px 6px rgba(0, 0, 0, .25);--%>
    <%--        }--%>

    <%--        #formleft input {--%>
    <%--            margin-right: 5px;--%>
    <%--        }--%>
    <%--    </style>--%>
</head>


<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-10">
        <form class="form-horizontal" action="/quanlytin/chinhsuabaidang/${baiDang.id}" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label col-md-1">Tỉnh thành</label>
                        <div class="col-sm-8">
                            <select name="tinhThanhId" href="/" class="form-control" id="sel1">
                                <c:forEach items="${listTinhThanh}" var="listTinhThanh">
                                    <option value="${listTinhThanh.id}">${listTinhThanh.tenTinhThanh}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Danh muc:</label>
                        <div class="col-sm-8">
                            <select name="danhMucId" class="form-control" id="sel2">
                                <c:forEach items="${listDanhMuc}" var="listDanhMuc">
                                    <option value="${listDanhMuc.id}">${listDanhMuc.tenDanhMuc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Tiêu đề:</label>
                        <div class="col-sm-8">
                            <input class="form-control" name="tieuDe" value="${baiDang.tieuDe}"
                                   placeholder="Nhập tiêu đề">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Diện tích:</label>
                        <div class="col-sm-8">
                            <input class="form-control" name="dienTichDat" value="${baiDang.dienTichDat}"
                                   placeholder="Nhập diện tích ">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Tầng lầu:</label>
                        <div class="col-sm-8">
                            <input class="form-control" name="tangLau" value="${baiDang.tangLau}"
                                   placeholder="Số tầng lầu">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Phòng ngủ:</label>
                        <div class="col-sm-8">
                            <input class="form-control" name="phongNgu" value="${baiDang.phongNgu}"
                                   placeholder="Số phòng ngủ">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Phòng tắm:</label>
                        <div class="col-sm-8">
                            <input class="form-control" name="phongTam" value="${baiDang.phongTam}"
                                   placeholder="Số phòng tắm">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Diện tích sử dụng:</label>
                        <div class="col-sm-8">
                            <input class="form-control" name="dienTichSuDung" value="${baiDang.dienTichSuDung}"
                                   placeholder="Nhập diện tích sử dụng">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1" f>Đơn vị tính:</label>
                        <div class="col-sm-8">
<%--                            <input class="form-control" name="donViTinh" value="${baiDang.donViTinh}" placeholder="m2">--%>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Nội dung:</label>
                        <div class="col-sm-8">
                            <input class="form-control" name="noiDung" value="${baiDang.noiDung}"
                                   placeholder="Nhập nội dung">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Giá:</label>
                        <div class="col-sm-8">
                            <input class="form-control" name="gia" value="${baiDang.gia}" placeholder="Nhập giá bán">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Mệnh giá:</label>
                        <div class="col-sm-8">
                            <select name="menhGiaId" class="form-control" id="sel3">
                                <c:forEach items="${listMenhGia}" var="listMenhGia">
                                    <option value="${listMenhGia.id}">${listMenhGia.tenMenhGia}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Thời hạn:</label>
                        <div class="col-sm-8">
                            <select name="thoiHanId" class="form-control" id="sel3">
                                <c:forEach items="${listThoiHan}" var="listThoiHan">
                                    <option value="${listThoiHan.id}">${listThoiHan.soNgay}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1">Upload:</label>
                        <div class="input-group col-sm-8">
                            <input name="fileData" type="file" class="form-control" multiple="true"/>
                        </div>
                    </div>
                </div>
                <input hidden name="ngayDang" value="${baiDang.ngayDang}"/>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="control-label  col-sm-1"></label>

                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-default">Cập nhật</button>
                    </div>
                </div>
            </form>
    </div>
</div>


</body>
<jsp:include page="footer.jsp"></jsp:include>
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
