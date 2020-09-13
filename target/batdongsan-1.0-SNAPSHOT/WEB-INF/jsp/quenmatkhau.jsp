<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/29/19
  Time: 2:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Quên mật khẩu</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="col-6" style="margin: 0 auto">
			<h2 style="text-align: center">Quên mật khẩu</h2>
			<br>
			<form class="form-horizontal" action="/login/quenmatkhau2"
				method="post">

				<div class="form-group">
					<label class="control-label col-sm-12">Mật khẩu mới:</label>
					<div class="col-sm-12">
						<input type="password" class="form-control" name="matKhau"
							placeholder="Nhập mật khẩu mới" required="required"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
							title="Mật khẩu 8 kí tự trở lên, chứa kí tự hoa, số and và kí tự thường ">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-12">Nhập lại mật khẩu
						mới:</label>
					<div class="col-sm-12">
						<input type="password" class="form-control" name="matKhau2"
							placeholder="Nhập lại mật khẩu mới" required="required"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
							title="Mật khẩu 8 kí tự trở lên, chứa kí tự hoa, số and và kí tự thường ">
					</div>
				</div>
				<div hidden class="form-group">
					<label class="control-label col-sm-2">Mật khẩu mới:</label>
					<div class="col-sm-10">
						<input class="form-control" name="id"
							placeholder="Nhập mật khẩu mới" 
							value="${id}">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button style="background-color: #00c4da" type="submit"
							class="btn btn-default">Đổi mật khẩu</button>
					</div>
				</div>
			</form>

			<h3 style="color: red">${thongbao}</h3>
		</div>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
