<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/21/19
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>

<style type="text/css">
a:hover>.baidanggiacao h6 {
	color: green;
}

.loaitin ul li a:hover {
	color: red;
}
</style>

</head>
<body>
	<div class="col-md-12 col-lg-4 sidebar pl-4">
		<div class="sidebar-box search-form-wrap">
			<form action="/timkiem/" class="search-form">
				<div class="form-group">
					<span class="icon fa fa-search"></span> <input type="text"
						class="form-control" id="s" name="searchInput"
						placeholder="Tìm kiếm">
				</div>
			</form>
		</div>
		<div class="sidebar-box">
			<h3 STYLE="color: lightcoral" class="heading">BẤT ĐỘNG SẢN GIÁ
				RẺ</h3>
			<div class="post-entry-sidebar">
				<a href="/xemchitiet/${listBaiDangGiaCao.get(0).id}">
					<div class=" row pb-3">
						<div class="col-5">
							<img src="${listBaiDangGiaCao.get(0).anhEntities.get(0).src}"
								alt="Image placeholder" width="100%" height="100px">
						</div>
						<div class="baidanggiacao col-7 ">
							<h6 style="color: lightcoral">${listBaiDangGiaCao.get(0).tieuDe}</h6>
							<span class="mr-2">${listBaiDangGiaCao.get(0).ngayDang}</span><br>
							<span class="mr-2">${listBaiDangGiaCao.get(0).diaChi}</span>
						</div>
					</div>
				</a> <a href="/xemchitiet/${listBaiDangGiaCao.get(1).id}">
					<div class=" row pb-3">
						<div class="col-5">
							<img src="${listBaiDangGiaCao.get(1).anhEntities.get(0).src}"
								alt="Image placeholder" width="100%" height="100px">
						</div>
						<div class="baidanggiacao col-7 ">
							<h6 style="color: lightcoral">${listBaiDangGiaCao.get(1).tieuDe}</h6>
							<span class="mr-2">${listBaiDangGiaCao.get(1).ngayDang}</span><br>
							<span class="mr-2">${listBaiDangGiaCao.get(1).diaChi}</span>
						</div>
					</div>
				</a> <a href="/xemchitiet/${listBaiDangGiaCao.get(2).id}">
					<div class=" row pb-3">
						<div class="col-5">
							<img src="${listBaiDangGiaCao.get(2).anhEntities.get(0).src}"
								alt="Image placeholder" width="100%" height="100px">
						</div>
						<div class="baidanggiacao col-7 ">
							<h6 style="color: lightcoral">${listBaiDangGiaCao.get(2).tieuDe}</h6>
							<span class="mr-2">${listBaiDangGiaCao.get(2).ngayDang}</span><br>
							<span class="mr-2">${listBaiDangGiaCao.get(2).diaChi}</span>
						</div>
					</div>
				</a>

				<%-- <ul>
                <li style="border-bottom: 1px solid gray">
                    <a href="/xemchitiet/${listBaiDangGiaCao.get(0).id}">
                        <img src="${listBaiDangGiaCao.get(0).anhEntities.get(0).src}" alt="Image placeholder" class="mr-4">
                        <div class="text">
                            <h4>${listBaiDangGiaCao.get(0).tieuDe}</h4>
                            <div class="post-meta">
                                <p class="mr-2">${listBaiDangGiaCao.get(0).ngayDang}</p>
                                 <p class="mr-2">${listBaiDangGiaCao.get(0).diaChi}</p>
                            </div>
                        </div>
                    </a>
                </li>
                <li style="border-bottom: 1px solid gray">
                    <a href="/xemchitiet/${listBaiDangGiaCao.get(1).id}">
                        <img src="${listBaiDangGiaCao.get(1).anhEntities.get(0).src}" alt="Image placeholder" class="mr-4">
                        <div class="text">
                            <h4>${listBaiDangGiaCao.get(1).tieuDe}</h4>
                            <div class="post-meta">
                                <span class="mr-2">${listBaiDangGiaCao.get(1).ngayDang}</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li style="border-bottom: 1px solid gray">
                    <a href="/xemchitiet/${listBaiDangGiaCao.get(2).id}">
                        <img src="${listBaiDangGiaCao.get(2).anhEntities.get(0).src}" alt="Image placeholder" class="mr-4">
                        <div class="text">
                            <h4>${listBaiDangGiaCao.get(2).tieuDe}</h4>
                            <div class="post-meta">
                                <span class="mr-2">${listBaiDangGiaCao.get(2).ngayDang}</span>
                            </div>
                        </div>
                    </a>
                </li>
            </ul> --%>
			</div>
		</div>
		<!-- END sidebar-box -->

		<div class="sidebar-box loaitin">
			<h3 class="heading">Loại tin</h3>
			<ul class="categories">
				<c:forEach var="loaiTin" items="${listLoaiTin}">

					<li><a href="/timkiem/timbaidangtheoloaitin/${loaiTin.id}">${loaiTin.tenLoaiTin}
					</a></li>
				</c:forEach>
			</ul>
		</div>
		<!-- END sidebar-box -->

		<div class="sidebar-box">
			<h3 class="heading">Danh mục</h3>
			<ul class="tags">
				<c:forEach var="danhMuc" items="${listDanhMuc}">
					<li><a href="/timkiem/timbaidangtheodanhmuc/${danhMuc.id}">${danhMuc.tenDanhMuc}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>
