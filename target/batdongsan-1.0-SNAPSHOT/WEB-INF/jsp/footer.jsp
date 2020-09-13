<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/26/19
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<!-- Site footer -->
<footer class="site-footer p-5">
    <div class="container p-0">
        <div class="row">
            <div class="col-md-4">
                <h3>Thông tin</h3>
                <p class="mb-4">
                    <img src="${pageContext.request.contextPath}/resources/images2/banner_3.jpg" alt="Image placeholder" class="img-fluid">
                </p>

            </div>
            <div class="col-md-6 ml-auto">
                <div class="row">
                    <div class="col-md-7">
                        <h3>Bất động sản giá rẻ</h3>
                        <div class="post-entry-sidebar">
                            <ul>
                                <li>
                                    <a href="/xemchitiet/${listBaiDangGiaRe.get(0).id}">
                                        <img src="${listBaiDangGiaRe.get(0).anhEntities.get(0).src}" alt="Image placeholder" class="mr-4">
                                        <div class="text">
                                            <h4>${listBaiDangGiaRe.get(0).tieuDe}</h4>
                                            <div class="post-meta">
                                                <span class="mr-2">${listBaiDangGiaRe.get(0).ngayDang}</span> &bullet;
                                                <span class="ml-2">${listBaiDangGiaRe.get(0).gia}: ${listBaiDangGiaRe.get(0).menhGiaEntity.tenMenhGia}</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="/xemchitiet/${listBaiDangGiaRe.get(1).id}">
                                        <img src="${listBaiDangGiaRe.get(1).anhEntities.get(0).src}" alt="Image placeholder" class="mr-4">
                                        <div class="text">
                                            <h4>${listBaiDangGiaRe.get(1).tieuDe}</h4>
                                            <div class="post-meta">
                                                <span class="mr-2">${listBaiDangGiaRe.get(1).ngayDang}</span> &bullet;
                                                <span class="ml-2">${listBaiDangGiaRe.get(1).gia}: ${listBaiDangGiaRe.get(0).menhGiaEntity.tenMenhGia}</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="/xemchitiet/${listBaiDangGiaRe.get(2).id}">
                                        <img src="${listBaiDangGiaRe.get(2).anhEntities.get(0).src}" alt="Image placeholder" class="mr-4">
                                        <div class="text">
                                            <h4>${listBaiDangGiaRe.get(2).tieuDe}</h4>
                                            <div class="post-meta">
                                                <span class="mr-2">${listBaiDangGiaRe.get(2).ngayDang}</span> &bullet;
                                                <span class="ml-2">${listBaiDangGiaRe.get(2).gia}: ${listBaiDangGiaRe.get(0).menhGiaEntity.tenMenhGia}</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-1"></div>

                    <div class="col-md-4">

                        <div class="mb-5">
                            <ul class="list-unstyled footer-social">
                                <li><a href="#"><span class="fa fa-twitter"></span> Twitter</a></li>
                                <li><a href="#"><span class="fa fa-facebook"></span> Facebook</a></li>
                                <li><a href="#"><span class="fa fa-instagram"></span> Instagram</a></li>
                                <li><a href="#"><span class="fa fa-vimeo"></span> Vimeo</a></li>
                                <li><a href="#"><span class="fa fa-youtube-play"></span> Youtube</a></li>
                                <li><a href="#"><span class="fa fa-snapchat"></span> Snapshot</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div class="row">
            <div class="col-md-12 text-center">
                <p class="small">
                    Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
                    Copyright &copy; <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> Template<i class="fa fa-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Tân Nguyễn</a>
                    Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
                </p>
            </div>
        </div> -->
    </div>
</footer>

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

</body>
</html>
