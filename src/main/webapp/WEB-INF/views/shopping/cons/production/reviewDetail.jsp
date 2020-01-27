 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link
	href="/intepark/resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="/intepark/resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="/intepark/resources/vendors/nprogress/nprogress.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/intepark/resources/build/css/custom.min.css"
	rel="stylesheet">
<title>인테파크</title>

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<%@ include file="/WEB-INF/views/shopping/cons/common/header.jsp"%>

			<!-- top navigation -->
			<%@ include file="/WEB-INF/views/shopping/cons/common/topheader.jsp"%>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>리뷰 상세 조회</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>리뷰 상세 조회</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">

									<table align="center" class="table table-bordered" >
										<tr>
											<td width="100">작성자</td>
											<td>${review.userid }</td>
											<td width="100">상품 번호</td>
											<td>${review.goodsnum }</td>
										</tr>
										<tr>
											<td>리뷰 제목</td>
											<td>${review.reviewtitle }</td>
												<td>리뷰 날짜</td>
											<td>${review.reviewdate }</td>
										</tr>
										
										<tr>
											<td>리뷰 내용</td>
											<td colspan="3" height="200">${review.reviewcn }</td>
										</tr>
										
									</table>
									<c:forEach var="li" items="${list }">
										<img
											src="/intepark/resources/img/goodsreviewpic/${li.refile }"
											width="300px;">
									</c:forEach>
									<br>
									<br>
									<p align="center">
                         <button class="btn btn-info" onclick="location.href='moveconsReviewList4.do'">목록</button>
								</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="/intepark/resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="/intepark/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="/intepark/resources/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="/intepark/resources/vendors/nprogress/nprogress.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="/intepark/resources/build/js/custom.min.js"></script>
</body>
</html>
