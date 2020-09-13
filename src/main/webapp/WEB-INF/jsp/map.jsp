<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bản đồ</title>
    <style>
        ul li {
            display: inline-table;
        }
    </style>

</head>

<body>

<div class="wrap">


    <jsp:include page="header.jsp"></jsp:include>



        <div class="container" >
            <div class="row blog-entries" >
                <div class="col-md-12 col-lg-12 main-content pb-4">
                       	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.569364477703!2d108.21401701522383!3d16.035917588901516!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219ec834d83cd%3A0xf47f4a3144767a0c!2zMTI1IFBoYW4gxJDEg25nIEzGsHUsIEhvw6AgQ8aw4budbmcgTmFtLCBI4bqjaSBDaMOidSwgxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1589116211115!5m2!1svi!2s" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                 
                </div>

            </div>
        </div>
<%--    </section>--%>

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- END footer -->

</div>

</body>

</html>
