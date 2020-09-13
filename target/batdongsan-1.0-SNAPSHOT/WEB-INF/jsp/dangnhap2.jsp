<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>

<head>
<title>Đăng nhập</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dangky.css">

<script type="text/javascript">
	function Captcha() {
		var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
				'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
				'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
				'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5',
				'6', '7', '8', '9');
		var i;
		for (i = 0; i < 4; i++) {
			var a = alpha[Math.floor(Math.random() * alpha.length)];
			var b = alpha[Math.floor(Math.random() * alpha.length)];
			var c = alpha[Math.floor(Math.random() * alpha.length)];
			var d = alpha[Math.floor(Math.random() * alpha.length)];
		}
		var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d ;
		document.getElementById("mainCaptcha").innerHTML = code
		document.getElementById("mainCaptcha").value = code
	}
	function ValidCaptcha() {
		var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
		var string2 = removeSpaces(document.getElementById('txtInput').value);
		if (string1 == string2) {
			return true;
		} else {
			$("#txtInput").val("");
			alert("Vui long xac thuc lai");
			return false;
		}
	}
	function removeSpaces(string) {
		return string.split(' ').join('');
	}
	
	$( document ).ready(function() {
		Captcha();
	});
</script>

<style type="text/css">
</style>

</head>

<body onload="myFunction();">


	<div class="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		<%--<div class="container">--%>
		<section class="login-block">
			<div class="container">
				<div class="row">
					<div class="col-md-4 login-sec">
						<h2 class="text-center">Đăng nhập</h2>
						<form class="login-form"
							action='<c:url value="/j_spring_security_check"/> '  method="post" ">
							<div class="form-group">
								<label for="exampleInputEmail1" class="text-uppercase">Email</label>
								<input type="email" name="username" class="form-control "
									placeholder="Nhập email" id="exampleInputEmail1" required>

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="text-uppercase">Mật
									khẩu</label> <input type="password" name="password"
									class="form-control" placeholder="Mật khẩu"
									id="exampleInputPassword1" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
                               title="Mật khẩu 8 kí tự trở lên, chứa kí tự hoa, số and và kí tự thường ">
							</div>

							<div class="capt mb-2">
								<h2 style="float: left" type="text" id="mainCaptcha" class="mr-4"></h2>
								<p >
									<button  class="pl-3 pr-3" type="button" id="refresh" onclick="Captcha();">Làm mới</button>
								</p>
								<input type="text" placeholder="Nhập mã capcha" id="txtInput" onchange="ValidCaptcha();" required="required" title="Vui long xac thuc cap cha"/> 
							</div>

							<c:if test="${param.incorrectAccount != null}">
								<div class="alert alert-danger">Tên đăng nhập hoặc mật
									khẩu không đúng</div>
							</c:if>
							<c:if test="${param.accessDenied != null}">
								<div class="alert alert-danger">Bạn không thể truy cập vào</div>
							</c:if>

							<div class="form-check">
								<button style="background: #00a1ff" type="submit"
									class="btn btn-login float-right">Đăng nhập</button>
							</div>

						</form>
						<div class="copy-text">
							<a data-toggle="modal" data-target="#exampleModal"
								data-whatever="@mdo" href="#">Quên mật khẩu</a>
						</div>
						<h4 style="color: red">${thongbao}</h4>
						<h4 style="color: red">${thongbao2}</h4>
						<h4 style="color: red">${message}</h4>
					</div>
					<br>


					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Quên mật
										khẩu</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="/login/quenmatkhau" , method="post">
										<div class="form-group">
											<label for="recipient-name" class="col-form-label">Email</label>
											<input type="email" name="email" class="form-control"
												id="recipient-name" placeholder="Nhập email">
										</div>
										<button type="submit" class="btn btn-primary">Lấy lại mật
											khẩu</button>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>

								</div>
							</div>
						</div>
					</div>
					<div class="col-md-8 banner-sec">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active">
									<img width="100%" height="400px" class="d-block img-fluid"
										src="${pageContext.request.contextPath}/resources/images2/banner_3.jpg">

								</div>
								<div class="carousel-item">
									<img width="100%" height="400px" class="d-block img-fluid"
										src="${pageContext.request.contextPath}/resources/images2/banner_2.jpg"
										alt="First slide">

								</div>
								<div class="carousel-item">
									<img width="100%" height="400px" class="d-block img-fluid"
										src="${pageContext.request.contextPath}/resources/images2/banner_1.png"
										alt="First slide">

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>

</html>

