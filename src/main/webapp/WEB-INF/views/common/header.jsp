<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테파크</title>
</head>
<body>

	<header class="header_area">
		<div class="main_menu">
		<!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 -->
			<c:if test="${empty sessionScope.loginCons and empty sessionScope.loginUser }">
				<div align="right" style="position: absolute; z-index: 1; top: 10px; right: 10px;">
					<a href="login6.do"><b style="color: blue;">로그인/회원가입</b></a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620" style="margin: 300">
						<!--  Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="index.jsp"><img
							src="/intepark/resources/img/logo.png" alt=""></a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset"
							id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item"><a class="nav-link" href="temple4.do">템플릿 페이지<!--3D디자인 리스트--></a></li>
								<li class="nav-item"><a class="nav-link" href="auctionList.do">견적 리스트</a></li>
								<li class="nav-item"><a class="nav-link" href="properties.jsp">시공사 리스트</a></li>
								<li class="nav-item"><a class="nav-link" href="agents.jsp">인테리어 게시판</a></li>
								<li class="nav-item"><a class="nav-link" href="moveshop4.do">쇼핑몰</a></li>
								<li class="nav-item"><a class="nav-link" href="single-blog.jsp">고객센터</a></li>
			</c:if>
			
			<!-- 고객 접속시 --><!-- 고객 접속시 --><!-- 고객 접속시 --><!-- 고객 접속시 --><!-- 고객 접속시 -->
			<c:if test="${!empty sessionScope.loginUser and loginUser.userid ne 'admin'}">
				<div align="right" style="position: absolute; z-index: 1; top: 10px; right: 10px;">
					<a href="logout.do"><b style="color: blue;">로그아웃</b></a>
				</div>	
					<nav class="navbar navbar-expand-lg navbar-light">
						<div class="container box_1620" style="margin: 300">
							<!--  Brand and toggle get grouped for better mobile display -->
							<a class="navbar-brand logo_h" href="index.jsp"><img
								src="/intepark/resources/img/logo.png" alt=""></a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse offset"
								id="navbarSupportedContent">
								<ul class="nav navbar-nav menu_nav ml-auto">
									<li class="nav-item"><a class="nav-link" href="index.jsp">3D디자인 리스트</a></li>
									<li class="nav-item"><a class="nav-link" href="auctionList.do">견적 리스트</a></li>
									<li class="nav-item"><a class="nav-link" href="properties.jsp">시공사 리스트</a></li>
									<li class="nav-item"><a class="nav-link" href="agents.jsp">인테리어 게시판</a></li>
									<li class="nav-item"><a class="nav-link" href="moveshop4.do">쇼핑몰</a></li>
									<li class="nav-item"><a class="nav-link" href="single-blog.jsp">고객센터</a></li>
									<li class="nav-item"><a class="nav-link" href="elements.jsp">마이페이지</a></li>
			</c:if>
			<!-- 시공사 접속시 --><!-- 시공사 접속시 --><!-- 시공사 접속시 --><!-- 시공사 접속시 --><!-- 시공사 접속시 --><!-- 시공사 접속시 -->
			<c:if test="${!empty sessionScope.loginCons }">
				<div align="right" style="position: absolute; z-index: 1; top: 10px; right: 10px;">
					<a href="logout.do"><b style="color: blue;">로그아웃</b></a>
				</div>	
					<nav class="navbar navbar-expand-lg navbar-light">
						<div class="container box_1620" style="margin: 300">
							<!--  Brand and toggle get grouped for better mobile display -->
							<a class="navbar-brand logo_h" href="index.jsp"><img
								src="/intepark/resources/img/logo.png" alt=""></a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse offset"
								id="navbarSupportedContent">
								<ul class="nav navbar-nav menu_nav ml-auto">

									<li class="nav-item"><a class="nav-link" href="index.jsp">견적리스트</a></li>
									<li class="nav-item"><a class="nav-link" href="index.jsp">내 입찰내역</a></li>
									<li class="nav-item"><a class="nav-link" href="index.jsp">업체리스트</a></li>
									<li class="nav-item"><a class="nav-link" href="moveshop4.do">쇼핑몰 관리</a></li>
									<li class="nav-item"><a class="nav-link" href="calendar3.do">일정관리</a></li>
									<li class="nav-item"><a class="nav-link" href="index.jsp">고객센터</a></li>
									<li class="nav-item"><a class="nav-link" href="index.jsp">마이페이지</a></li>

			</c:if>

			<c:if
				test="${!empty sessionScope.loginUser and loginUser.userid eq 'admin'}">
				<!-- 관리자 접속시 -->
				<div align="right" style="position: absolute; z-index: 1; top: 10px; right: 10px;">
					<a href="logout.do"><b style="color: blue;">로그아웃</b></a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620" style="margin: 300">
						<!--  Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="index.jsp"><img
							src="/intepark/resources/img/logo.png" alt=""></a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset"
							id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item"><a class="nav-link" href="index.jsp">관리자</a></li>
								<li class="nav-item"><a class="nav-link" href="index.jsp">관리자</a></li>
								<li class="nav-item"><a class="nav-link" href="index.jsp">관리자</a></li>
								<li class="nav-item"><a class="nav-link" href="index.jsp">관리자</a></li>
								<li class="nav-item"><a class="nav-link" href="index.jsp">관리자</a></li>
			</c:if>
			</ul>
		</div>
		</div>
		</nav>
		</div>
	</header>
</body>
</html>