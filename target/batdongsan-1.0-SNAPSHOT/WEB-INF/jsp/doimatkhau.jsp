<%@ page import="com.batdongsan.util.SecurityUtils"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>Đổi mật khẩu</title>


<style>
label {
	color: blueviolet;
}

.container h2 {
	color: lightcoral;
}
</style>
</head>
<body>

	<div class="wrap">
		<p hidden id="thongbao">${thongbao}</p>

		<jsp:include page="header.jsp"></jsp:include>
		<!-- END header -->


		<!-- END section -->

		<%--    <section class="site-section py-sm">--%>
		<div class="container">
			<div class="row blog-entries">
				<div class="col-md-12 col-lg-8 main-content">
					<h2 class="text-center">ĐỔI MẬT KHẨU</h2>


					
					
					
					<form class="login-form" action="/login/doimatkhahu" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="text-uppercase">Mật khẩu cũ</label> <input
								type="password" name="matKhau" class="form-control"
								placeholder="Nhập mật khẩu cũ" required>
<c:if test="${param['thongbao2']}">
						<p style="color: red">Mật khẩu cũ không đúng</p>
					</c:if>
						</div>
						<div class="form-group">
							<label class="text-uppercase">Mật khẩu mới</label> <input
								type="password" name="matKhauMoi1" class="form-control"
								placeholder="Nhập mật khẩu mới" required
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
								title="Mật khẩu 8 kí tự trở lên, chứa kí tự hoa, số and và kí tự thường ">
						</div>
						<c:if test="${param['thongbao1']}">
						<p style="color: red">Mật khẩu mới không trùng khớp</p>
					</c:if>
						<div class="form-group">
							<label class="text-uppercase">Nhập lại Mật khẩu mới</label> <input
								type="password" name="matKhauMoi2" class="form-control"
								placeholder="Nhập lại mất khẩu mới" required
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
								title="Mật khẩu 8 kí tự trở lên, chứa kí tự hoa, số and và kí tự thường ">
						</div>


						<div class="form-check">
							<button type="submit" onclick="return checkMatKhau();"
								class="btn btn-login float-right bg-success font-weight-bold mb-3">ĐỔI
								MẬT KHẨU</button>
						</div>
						<br>
					</form>
				</div>

			</div>
		</div>
		<script type="text/javascript">
			function checkMatKhau() {
				if ($('matKhauMoi1').val() != $('matKhauMoi12').val()) {
					alert("Mật khẩu mới không trung khớp");
					return false;
				}
				confirm('Bạn có muốn đổi mật khẩu không');
			}
		</script>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>
