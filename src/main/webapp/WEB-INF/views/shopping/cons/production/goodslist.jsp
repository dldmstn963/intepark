<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

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
							<h3>상품 목록</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>상품 목록</h2>
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
									<table border="1px solid black">
										<tr>
											<td><input type="checkbox"></td>
											<td>상품 코드</td>
											<td>썸네일</td>
											<td>상품명</td>
											<td>상품 가격</td>
											<td>재고</td>
											<td>기능</td>
										</tr>
										<c:forEach var="li" items="${list }">
											<tr>
												<td><input type="checkbox" id="checkbox"
													name="checkbox" value="${li.goodsnum }"></td>
												<td>${li.goodsnum }</td>
												<td><img src="/intepark/resources/img/goodthumspic/${li.thumbnail }" width="100" height="100"></td>
												<td>${li.goodsname }</td>
												<td>${li.price }</td>
												<td>${li.inventory }</td>
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
									${maxPage } ${currentPage } ${beginPage } ${endPage }
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/shopping/cons/common/jscsspath.jsp"%>
</body>
</html>
