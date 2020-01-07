<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
    <link href="/intepark/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/intepark/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/intepark/resources/vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/intepark/resources/build/css/custom.min.css" rel="stylesheet">
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
							<h3>주문 목록</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>주문 목록</h2>
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
								<form action="consgoodssearch4.do" align="center">
								제품명 검색 : <input type="text" name="goodsname"> &nbsp; <input type="submit" value="검색">
								</form>
								<br>
									<table border="1px solid black" align="center">
										<tr>
											<td><input type="checkbox"></td>
											<td>주문 일</td>
											<td>주문 코드</td>
											<td>주문자 명</td>
											<td>주문 금액</td>
											<td>주문 수량</td>
											<td>주문 상태</td>
											<td>기능</td>
										</tr>
										<c:forEach var="li" items="${list }">
											<tr>
												<td><input type="checkbox" id="checkbox"
													name="checkbox" value="${li.goodsnum }"></td>
												<td>${li.orderdate }</td>
												<td>${li.ordernum }</td>
												<td>${li.userid }</td>
												<td>${li.orderprice }</td>
												<td>${li.orderquantity }</td>
												<td></td>
													<c:url var="moveupdategoods" value="moveupdategoods4.do">
													<c:param name="goodsnum" value="${li.goodsnum}"/>
													</c:url>
												<td><input type="button" value="수정" onclick="location='${moveupdategoods}'"> 
													<input type="button" value="삭제" onclick="return delete${li.goodsnum}();"> 
													<script type="text/javascript">
														function delete${li.goodsnum}() {
															var result = confirm('정말 삭제하시겠습니까?');
															if (result) {
																		$.ajax({
																			url : "goodsdelete4.do",
																			type : "post",
																			data : {
																				goodsnum : ${li.goodsnum}
																			},
																			success : function(data){
																				location.reload();
																				$("#alertbox").html(data);
																			}
																		})
																return false;
															}
														}
													</script></td>
											<tr>
										</c:forEach>
									</table>
									<div style="display:none;" id="alertbox"></div>
									
									<div id="pagebox" align="center">
									<a href="movegoodslist4.do?page=1">|◁</a>
									&nbsp;
									
									<c:if test="${ (beginPage-10) < 1}">
									<a href="movegoodslist4.do?page=1">◀◀</a>
									</c:if>
									<c:if test="${ (beginPage-10) > 1}">
									<a href="movegoodslist4.do?page=${beginPage-10 }">◀◀</a>
									</c:if>
									&nbsp;
									
									<c:forEach var="p" begin="${beginPage }" end="${endPage }">
									<c:if test="${p == currentPage }">
									<a href="movegoodslist4.do?page=${p }"><font color="red"><b>${p }</b></font></a>
									</c:if >
									<c:if test="${p != currentPage }">
									<a href="movegoodslist4.do?page=${p }">${p }</a>
									</c:if>
									</c:forEach>
									&nbsp;
									<c:if test="${(endPage+10) > maxPage }">
									<a href="movegoodslist4.do?page=${maxPage }">▶▶</a>
									</c:if>
									<c:if test="${(endPage+10) < maxPage }">
									<a href="movegoodslist4.do?page=${endPage + 10 }">▶▶</a>
									</c:if>
									&nbsp; 
									
									<a href="movegoodslist4.do?page=${maxPage }">▷|</a>
									</div>
									
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
   <script src="/intepark/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="/intepark/resources/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/intepark/resources/vendors/nprogress/nprogress.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="/intepark/resources/build/js/custom.min.js"></script>
</body>
</html>
