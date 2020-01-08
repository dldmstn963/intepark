<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/jscsspath.jsp"%>

</head>

<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="../common/header.jsp" />
	<!--================Header Menu Area =================-->   
		<div class="container">
		<h3 align="center">전체 고객 관리</h3>
			<table class="table table-hover">
				<thead class="thead-light">
					<tr style="text-align:center;">
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입날짜</th>
						<th>상세보기</th>
					</tr>
				</thead>

				<tbody>
				
				</tbody>
			</table>
		</div>
		<!--================ start footer Area  =================-->
		<jsp:include page="../common/footer.jsp" />
		<!--================ End footer Area  =================-->
</body>
</html>