<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Quản lý tin</title>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- JS tạo nút bấm di chuyển trang start -->
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<!-- JS tạo nút bấm di chuyển trang end -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script type="text/javascript">
	$(function() {
		var pageSize = 3; // Hiển thị 6 sản phẩm trên 1 trang
		showPage = function(page) {
			$(".contentPage").hide();
			$(".contentPage").each(function(n) {
				if (n >= pageSize * (page - 1) && n < pageSize * page)
					$(this).show();
			});
		}
		showPage(1);
		///** Cần truyền giá trị vào đây **///
		var totalRows = 10; // Tổng số sản phẩm hiển thị
		var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
		var iTotalPages = Math.ceil(totalRows / pageSize);

		var obj = $('#pagination').twbsPagination({
			totalPages : iTotalPages,
			visiblePages : btnPage,
			onPageClick : function(event, page) {
				console.info(page);
				showPage(page);
			}
		});
		console.info(obj.data());
	});
</script>
<style>
#pagination {
	display: flex;
	display: -webkit-flex; /* Safari 8 */
	flex-wrap: wrap;
	-webkit-flex-wrap: wrap; /* Safari 8 */
	justify-content: center;
	-webkit-justify-content: center;
}

.pagination .first a {
	width: 100px;
}

.pagination .prev a {
	width: 100px;
}

.pagination .next a {
	width: 100px;
}

.pagination .last a {
	width: 100px;
}
</style>


</head>


<body>
	<div class="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		<section class="site-section py-sm">
			<div class="container">
				<div class="row blog-entries">
					<div class="col-md-12 col-lg-8 main-content">

						<h2 class="mb-4 text-center">QUẢN LÝ BÀI ĐĂNG</h2>

						<c:forEach var="baiDang" items="${listBaiDang}">
							<div class="contentPage"
								style="border: 1px solid grey; padding: 1px; margin: 10px auto; border-radius: 10px">
								<div class="pl-3 pr-3" style="background: #fdd49a">
									<a href="/xemchitiet/${baiDang.id}">${baiDang.tieuDe}</a>
									<div style="float: right;">
										<a href="/quanlytin/xoabaidang/${baiDang.id}" id="delete"
											onclick="return confirm('Bạn có muốn xóa bài đăng này không');"><i
											class="fas fa-trash-alt"></i>Xóa</a>
									</div>

									<div style="float: right; margin-right: 10px">
										<a href="/quanlytin/showquanlytin/${baiDang.id}?param1="${baiDang.id}""><i
											class="fas fa-edit"></i>Sửa</a>
									</div>
									<div style="float: right; margin-right: 10px">
										<a href="/quanlilichsu/lichsubaidang/${baiDang.id}"><i
											class="fas fa-eye"></i>Xem lịch sử</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<img width="100%" height="100%" style="border-radius: 10px"
											src="${baiDang.anhEntities.get(0).src}">
									</div>
									<div class="col-md-10">
										<div>Diện tích: ${baiDang.dienTichSuDung}</div>
										<div>giá: ${baiDang.gia}</div>
										<div>Địa chỉ:${baiDang.diaChi}
											${baiDang.tinhThanhEntity.tenTinhThanh}</div>
										<div>Số điện thoại :
											${baiDang.taiKhoanEntity.soDienThoai}</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<ul id="pagination"></ul>
					</div>

					<!-- END main-content -->

					<jsp:include page="aside2.jsp"></jsp:include>

				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


</body>

</html>


