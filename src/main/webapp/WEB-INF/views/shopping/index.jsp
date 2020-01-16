<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="common/shopjscss.jsp" %>
<!-- Title  -->
<title>인테파크</title>
</head>
<body>
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix" font="LotteMartHappy">

		<jsp:include page="common/header.jsp" />

		<!-- Product Catagories Area Start -->
		<div class="products-catagories-area clearfix">
			<div class="amado-pro-catagory clearfix">

				<!-- Single Catagory -->
				<c:forEach var="li" items="${list }">
				<div class="single-products-catagory clearfix">
					<a href="moveproduct4.do?goodsnum=${li.goodsnum }"> <img src="/intepark/resources/img/goodthumspic/${li.thumbnail }" alt="">
						<!-- Hover Content -->
						<div class="hover-content">
							<div class="line"></div>
							<p>${li.price } 원</p>
							<h4>${li.goodsname }</h4>
						</div>
					</a>
				</div>
				</c:forEach>

			</div>
		</div>
		<!-- Product Catagories Area End -->
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<jsp:include page="common/footer.jsp" />

	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/intepark/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="/intepark/resources/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="/intepark/resources/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="/intepark/resources/js/plugins.js"></script>
	<!-- Active js -->
	<script src="/intepark/resources/js/active.js"></script>

</body>

</html>