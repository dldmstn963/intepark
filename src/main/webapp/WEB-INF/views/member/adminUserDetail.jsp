<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp"%>
<style type="text/css">
.modal-body
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="../common/header.jsp" />
	<!--================Header Menu Area =================-->
	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="x_content">
					<h2 align="center">
						<strong>고객 관리</strong>
					</h2>
					<div style="margin: 7px; text-align: right;">
						<c:if test="${inteUser.memberstate eq '정상'}">
							<button data-target="#layerpop" data-toggle="modal"
								data-backdrop="static" class="btn">정지</button>

						&nbsp;
					</c:if>
						<c:if test="${inteUser.memberstate eq '정지'}">
							<button class="btn">정지 해제</button>
						&nbsp;
					</c:if>
						<button data-target="#layerpop2" data-toggle="modal"
								data-backdrop="static" class="btn">정지기록</button>

						&nbsp;
						<button class="btn">목록</button>
					</div>
					<table class="table" style="text-align: center;">
						<tr>
							<th width="150px">아이디</th>
							<td>${requestScope.inteUser.userid}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${inteUser.username}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${inteUser.phone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${inteUser.email}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${inteUser.address}</td>
						</tr>
						<tr>
							<th>가입날짜</th>
							<td>${inteUser.enrolldate}</td>
						</tr>
						<tr>
							<th>현재상태</th>
							<td>${inteUser.memberstate}</td>
						</tr>
						<tr>
							<th>탈퇴날짜</th>
							<td>${inteUser.withdrawdate}</td>
						</tr>
						<tr>
							<th>탈퇴사유</th>
							<td>${inteUser.withdrawcause}</td>
						</tr>
					</table>
				</div>
				<br>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>

	<!-- --------------------------------------------------모달 정지시키기 구역1---------------------------------------- -->
	<div class="modal fade" id="layerpop" style="padding-top: 20px;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
					<!-- header title -->
					<div class="container">
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<h2 style="margin-bottom: 0;">
									<strong>고객 정지</strong>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- body -->
				<div class="modal-body" style="height: 300px;">
					<form action="#">
						<table style="text-align: center; width: 100%;">
							<tr>
								<th><h4>
										<strong>정지 대상(URL,게시판번호)</strong>
									</h4></th>
							</tr>
							<tr>
								<td><textarea rows="2" cols="27"></textarea></td>
							</tr>
							<tr>
								<th><h4><strong>정지 사유</strong></h4></th>
							</tr>
							<tr>
								<td><select style="width:200px;">
										<option>도배</option>
										<option>부적적한 글</option>
										<option>불법 광고</option>
										<option>기타</option>
								</select></td>
							</tr>
							<tr>
								<th><h4><strong>정지 기한</strong></h4></th></tr>
								<tr>
								<td><select style="width:200px;">
										<option>7일</option>
										<option>30일</option>
										<option>200일</option>
										<option>365일</option>
										<option>3년</option>
										<option>5년</option>
										<option>10년</option>
										<option>9999년</option>
								</select></td>
							</tr>
						</table>
					</form>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="width: 100%;">확인</button>
				</div>
			</div>
		</div>
	</div>
<!-- --------------------------------------------------모달 구역1끝---------------------------------------- -->
<!-- --------------------------------------------------모달 정지내역 구역2---------------------------------------- -->
	<div class="modal fade" id="layerpop2" style="padding-top: 20px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
					<!-- header title -->
					<div class="container">
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<h2 style="margin-bottom: 0;">
									<strong>고객 정지내역</strong>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- body -->
				<div class="modal-body" style="height: 300px;">
					<form action="#">
						<table style="text-align: center; width: 100%;">
							<c:forEach var="ustop" items="${userStop}" varStatus="index">
								<tr><th>${index.count}.</th><td>사유 : ${ustop.stopcause}</td>
								<td style="width:300px;">정지 날짜 : ${ustop.stopstartdate}~${ustop.stopfinishdate}</td><td style="width:150px;">정지 기간: ${ustop.stopterm}</td></tr>
							</c:forEach>
						</table>
					</form>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="width: 100%;">확인</button>
				</div>
			</div>
		</div>
	</div>

	<!--================ start footer Area  =================-->
	<jsp:include page="../common/footer.jsp" />
	<!--================ End footer Area  =================-->
</body>
</html>