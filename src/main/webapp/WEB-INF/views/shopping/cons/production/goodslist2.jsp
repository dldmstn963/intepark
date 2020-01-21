<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
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
							<h3>상품 목록</h3>
							<a href="ddfdf.do">ddd</a>
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
								<br>
									<table id="foo-table" class="table table-bordered">
		<thead>
			<tr>
				<th><input type="checkbox" id="allCheck"></th>
				<th>상품 코드</th>
				<th>썸네일</th>
				<th>상품명</th>
				<th>상품 가격</th>
				<th>재고</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
		<script>
										function dellist(){
											var result = confirm('정말 삭제하시겠습니까?');
											if(result){
											var lists = [];
											  $("#checkbox:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
											   lists.push($(this).val());
											  });
											 var list = lists.join(","); 
											$.ajax({
												url:"deleteGoodscheck4.do",
												type : "post",
												data : {
													lists : list
												},
												success : function(data){
													location.reload();
													$("#alertbox").html(data);
												}
											})
											return false;
										}}
										</script>
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
			</tr>
			</c:forEach></tbody></table>
															<input type="button" value="삭제" onclick="return dellist();">
									<div style="display:none;" id="alertbox"></div>
									
									
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
    <script type="text/javascript">
										$(function(){ 
											$("#allCheck").click(function(){ 
												if($("#allCheck").prop("checked")) {
												$("input[type=checkbox]").prop("checked",true); 
												} else { 
												$("input[type=checkbox]").prop("checked",false); } 
												}) 
											})
											</script>
    <!-- Bootstrap -->
   <script src="/intepark/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="/intepark/resources/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/intepark/resources/vendors/nprogress/nprogress.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="/intepark/resources/build/js/custom.min.js"></script>
    
    <link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script>
	$(document).ready( function () {
	    $('#foo-table').DataTable();
	} );
</script>
</body>
</html>
