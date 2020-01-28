<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- Search Wrapper Area Start -->
	<div class="search-wrapper section-padding-100">
		<div class="search-close">
			<i class="fa fa-close" aria-hidden="true"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="search-content">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type your keyword...">
							<button type="submit">
								<img src="/intepark/resources/img/core-img/search.png" alt="">
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Search Wrapper Area End -->
	<!-- Mobile Nav (max width 767px)-->
	<div class="mobile-nav">
		<!-- Navbar Brand -->
		<div class="amado-navbar-brand">
			<a href="index.jsp"><img
				src="/intepark/resources/img/core-img/logo.png" alt=""></a>
		</div>
		<!-- Navbar Toggler -->
		<div class="amado-navbar-toggler">
			<span></span><span></span><span></span>
		</div>
	</div>
	<!-- Header Area Start -->
	<header class="header-area clearfix">
		<!-- Close Icon -->
		<div class="nav-close">
			<i class="fa fa-close" aria-hidden="true"></i>
		</div>
		<!-- Logo -->
		<div class="logo">
			<a href="index.jsp"><img
				src="/intepark/resources/img/core-img/logo.png" alt=""></a>
		</div>
		<!-- Amado Nav -->
		<nav class="amado-nav">
			<ul>
				<li><a href="index.jsp">인테파크 홈</a></li>
				<li><a href="moveshop4.do">쇼핑몰 홈</a></li>
				<li><a href="moveshopcategory4.do">카테고리</a></li>
			</ul>
		</nav>
		<!-- Button Group -->
		<div class="amado-btn-group mt-30 mb-100">
			<c:if test="${!empty sessionScope.loginCons }">
			<a href="moveconsshop4.do" class="btn amado-btn mb-15">내 물품 관리</a>
			</c:if>
		</div>
		<!-- Cart Menu -->
		<div class="cart-fav-search mb-100">
			<a href="moveshbasket42.do" class="cart-nav"><img
				src="/intepark/resources/img/core-img/cart.png" alt=""> 장바구니 </a>
			<a href="moveMyOrderList4.do" class="fav-nav"><img
				src="/intepark/resources/img/core-img/favorites.png" alt="">
				나의 쇼핑 정보 </a> 
		</div>
		<!-- Social Button -->
		<div class="social-info d-flex justify-content-between">
			<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a> <a
				href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a> <a
				href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a
				href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
		</div>
	</header>
	<!-- Header Area End -->
</body>
</html>