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
							<h3>문의 상세 조회</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>문의 상세 조회</h2>
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
											<td width="100">문의 번호</td>
											<td>${inquiry.inquirynum }</td>
											<td width="100">문의 타입</td>
											<td><c:if test="${inquiry.inquirytype == 1}">
상품
</c:if> <c:if test="${inquiry.inquirytype == 2}">
배송
</c:if> <c:if test="${inquiry.inquirytype == 3}">
기타
</c:if></td>
										</tr>
										<tr>
											<td>작성자</td>
											<td>${inquiry.userid }</td>
											<td>상품 번호</td>
											<td>${inquiry.goodsnum }</td>
										</tr>
										<tr>
											<td>문의 제목</td>
											<td>${inquiry.inquirytitle }</td>
												<td>문의 날짜</td>
											<td>${inquiry.inquirydate }</td>
										</tr>
										
										<tr>
											<td>문의 내용</td>
											<td colspan="3" height="200">${inquiry.inquirycn }</td>
										</tr>
										
									</table>
									<c:forEach var="li" items="${list }">
										<img
											src="/intepark/resources/img/goodsinquirypic/${li.refile }"
											width="300px;">
									</c:forEach>
									<table align="center" class="table table-bordered">
									<tr><td width="100">답변 내용</td><td height="200">${answer.answercn }</td></tr>
									</table>

<form action="goodsAnswerInsert4.do" method="post">
<br>
<br>
<div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="textarea"> 답변 내용
                        </label>
                        <div class="col-md-6 col-sm-6">
                          <textarea id="textarea" name="answercn" class="form-control">${answer.answercn }</textarea>
                        </div>
                      </div>
                      <input type="hidden" name="consid" value="${sessionScope.loginCons.consid}">
                      <input type="hidden" name="inquirynum" value="${inquiry.inquirynum}">
                        <button id="submit" type="submit" class="btn btn-success">등록</button>
                        <button  type="button" class="btn btn-success" onclick="updateGoodsInquiryAnswer();">수정</button>
</form>
                        <br>
                        <p align="center">
                        <button class="btn btn-info" onclick="location.href='moveconsInquiryList4.do'">목록</button>
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
<script type="text/javascript">
function updateGoodsInquiryAnswer() {
	$.ajax({
		url:"updateGoodsInquiryAnswer4.do",
		type : "post",
		data : {
			cn : $("#textarea").val(),
			inquirynum : ${inquiry.inquirynum}
		},
		success : function(data){
			location.reload();
			$("#alertbox").html(data);
		}
	})
}
</script>
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
