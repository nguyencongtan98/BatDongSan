<%@ page import="com.batdongsan.util.SecurityUtils"%><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/23/19
  Time: 8:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>fsdfsdfsdfds</title>
<meta charset="utf-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<%--    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>--%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700|Inconsolata:400,700"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/owl.carousel.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts2/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts2/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts2/flaticon/font/flaticon.css">

<!-- Theme Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/style.css">
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">

<style>
 header ul li a{
	color: red;
}
</style>
</head>
<body>


	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 100%">

				<div class="login">
					<form class="login-form" action="/login/" method="post">
						<div class="input-group input-group-lg">
							<div class="input-group-addon">
								<span class="fa fa-lg fa-envelope" />
							</div>
							<input type="email" name="email" class="form-control"
								id="user-name" placeholder="Email" required tabindex="1" />
						</div>
						<div class="input-group input-group-lg">
							<div class="input-group-addon">
								<span class="fa fa-lg fa-key" />
							</div>
							<input type="password" name="matKhau" class="form-control"
								id="password" placeholder="Password" required tabindex="2" />
						</div>
						<br>
						<div class="form-group">
							<div class="col-sm-10">
								<div class="g-recaptcha"
									data-sitekey="6LcYRA0UAAAAAE8M0z0qjO21bvvuYHXhTuRsPOwy"></div>
							</div>
						</div>
						<input type="submit" id="login" class="btn btn-primary fa-lg"
							value="Sign in" tabindex="3" />
						<div class="login-bar">
							<input type="checkbox" id="stay-signed-in" tabindex="4" /><label
								for="stay-signed-in">Keep me signed in</label> <a href="#"
								class="pull-right">Forgotten your password?</a>
						</div>
					</form>
				</div>
			</div>

			<!-- Modal footer -->

		</div>
	</div>

	<div class="modal" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 100%">

				<div class="login">
					<form class="login-form" action="/register//" method="post">
						<div class="input-group input-group-lg">
							<div class="input-group-addon">
								<span class="fa fa-lg fa-envelope" />
							</div>
							<input type="text" name="hoTen" class="form-control"
								id="user-name" placeholder="Họ tên" required tabindex="1" />
						</div>
						<div class="input-group input-group-lg">
							<div class="input-group-addon">
								<span class="fa fa-lg fa-envelope" />
							</div>
							<input type="email" name="email" class="form-control"
								id="user-name" placeholder="Email" required tabindex="1" />
						</div>
						<div class="input-group input-group-lg">
							<div class="input-group-addon">
								<span class="fa fa-lg fa-envelope" />
							</div>
							<input type="tel" name="soDienThoai" class="form-control"
								id="user-name" placeholder="Số điện thoại" required tabindex="1" />
						</div>
						<div class="input-group input-group-lg">
							<div class="input-group-addon">
								<span class="fa fa-lg fa-envelope" />
							</div>
							<input type="text" name="diaChi" class="form-control"
								id="user-name" placeholder="Địa chỉ" required tabindex="1" />
						</div>
						<div class="input-group input-group-lg">
							<div class="input-group-addon">
								<span class="fa fa-lg fa-key" />
							</div>
							<input type="password" name="matKhau" class="form-control"
								id="password" placeholder="Mật khẩu" required tabindex="2" />
						</div>
						<div class="input-group input-group-lg">
							<div class="input-group-addon">
								<span class="fa fa-lg fa-key" />
							</div>
							<input type="password" name="matKhau2" class="form-control"
								id="matKhau2" placeholder="Nhập lại mật khẩu" required
								tabindex="2" />
						</div>
						<br> <input type="submit" id="login"
							class="btn btn-primary fa-lg" value="Đăng ký" tabindex="3" />
					</form>
				</div>
			</div>

			<!-- Modal footer -->

		</div>
	</div>


	<header role="banner">
		<div class="top-bar bg-info">
			<div class="container">
				<div style="color: white" class="row">
					<div class="col-9 social">
						<a style="color: white; font-weight: bold" href="/">TÌM KIẾM
							BẤT ĐỘNG SẢN</a>
					</div>
					<div class="col-3 search-top">
						<form action="/timkiem/" class="search-top-form">
							<span class="icon fa fa-search"></span> <input type="text" id="s"
								name="searchInput" placeholder="Tìm kiếm">
						</form>
					</div>
				</div>
			</div>
		</div>

		<nav class="navbar navbar-expand-md  navbar-light bg-light ">
			<div class="container">

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarMenu" aria-controls="navbarMenu"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse font-weight-bold "
					id="navbarMenu">
					<ul class="navbar-nav mx-auto ">
						<li class="nav-item"><a class="nav-link active " href="/">Trang
								chủ</a></li>
						<c:forEach var="listLoaiTin" items="${listLoaiTin}">
							<li class="nav-item dropdown "><a
								class="nav-link dropdown-toggle" href="category.html"
								id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">${listLoaiTin.tenLoaiTin}</a>

								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<c:forEach var="listDanhMuc" items="${listDanhMuc}">
										<c:if test="${listDanhMuc.loaiTinEntity.id == listLoaiTin.id}">
											<a class="dropdown-item"
												href="/timkiem/timbaidangtheodanhmuc/${listDanhMuc.id}">${listDanhMuc.tenDanhMuc}</a>
										</c:if>
									</c:forEach>
								</div></li>
						</c:forEach>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle overflow-auto"
							href="category.html" id="dropdown05" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Tỉnh Thành</a>

							<div class="dropdown-menu scrollable-menu" role="menu"
								aria-labelledby="dropdown05">
								<c:forEach var="listTinhThanh" items="${listTinhThanh}">
									<a class="dropdown-item"
										href="/timkiem/theotinhthanh/${listTinhThanh.id}">${listTinhThanh.tenTinhThanh}</a>
								</c:forEach>
							</div></li>
						<security:authorize access="isAuthenticated()">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="category.html"
								id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Cá nhân</a>

								<div class="dropdown-menu" aria-labelledby="dropdown05">
									<a class="dropdown-item" href="/quanlitaikhoan/thongtincanhan">Thông
										tin cá nhân</a> <a class="dropdown-item"
										href="/quanlytin/chinhsuabaidang">Quản lý bài đăng</a> <a
										class="dropdown-item" href="/quanlidautin/">Dấu tin</a> <a
										class="dropdown-item" href="/login/doimatkhahu">Đổi mật
										khẩu</a> <a class="dropdown-item" href="/quanlilichsu/giadexuat">Lịch
										sử giá đề xuất</a> <a class="dropdown-item" href="/dang-xuat">Đăng
										xuất</a>
								</div></li>
							<li class="nav-item"><a class="nav-link" href="/quanlytin/">Đăng
									tin ngay</a></li>
							<!-- <li class="nav-item"><a class="nav-link" href="/map">Map</a></li> -->
						</security:authorize>

						<security:authorize access="isAnonymous()">
							<li class="nav-item"><a class="nav-link" href="/login">Đăng
									tin ngay</a></li>
							<li class="nav-item"><a class="nav-link"
								<%--data-toggle="modal" data-target="#myModal2"--%> href="/register">Đăng
									ký</a></li>
							<li class="nav-item"><a class="nav-link" href="/login"<%--data-toggle="modal" data-target="#myModal"--%>>Đăng
									nhập</a></li>
							<%-- <li class="nav-item"><a class="nav-link" href="/map"data-toggle="modal" data-target="#myModal">Map</a></li> --%>
						</security:authorize>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="site-section pt-3 pb-3">
		<div class="container">
			<div class="row">
				<div style="text-transform: uppercase;" class="col-md-12 ">
					<div class="owl-carousel owl-theme home-slider">
						<div>
							<h2><a href="/xemchitiet/${listBaiDangGiaCao.get(0).id}">${listBaiDangGiaCao.get(0).tieuDe}</a></h2>
							<a href="/xemchitiet/${listBaiDangGiaCao.get(0).id}"
								class="a-block d-flex align-items-center height-lg"
								style="background-image: url('${listBaiDangGiaCao.get(0).anhEntities.get(0).src}'); ">
							</a>
						</div>
						<div>
							<h2><a href="/xemchitiet/${listBaiDangGiaCao.get(0).id}">${listBaiDangGiaCao.get(1).tieuDe}</a></h2>
							<a href="/xemchitiet/${listBaiDangGiaCao.get(1).id}"
								class="a-block d-flex align-items-center height-lg"
								style="background-image: url('${listBaiDangGiaCao.get(1).anhEntities.get(0).src}'); ">
							</a>
						</div>
						<div>
							<h2><a href="/xemchitiet/${listBaiDangGiaCao.get(0).id}">${listBaiDangGiaCao.get(2).tieuDe}</a></h2>
							<a href="/xemchitiet/${listBaiDangGiaCao.get(2).id}"
								class="a-block d-flex align-items-center height-lg"
								style="background-image: url('${listBaiDangGiaCao.get(2).anhEntities.get(0).src}'); ">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
