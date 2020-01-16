<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/jscsspath.jsp"%>
<script type="text/javascript">
function serchDetail(){
	var searchD=document.getElementById("serarchD");
	if(searchD.style.display=="none")
			searchD.style.display="";
		else
			searchD.style.display="none";
		
}

function checkSearch(){
	var sdate=document.getElementById("sdate").value;
	var edate=document.getElementById("edate").value;
	if(sdate == "" && edate != ""){
		alert("검색 시작 날짜를 입력해주세요");
		return false;
	}

	if(sdate != "" && edate == ""){
		alert("검색 끝 날짜를 입력해주세요");
		return false;
	}

	return true;
}
</script>
</head>

<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="../common/header.jsp" />
	<!--================Header Menu Area =================-->
	<div class="container">
		<h2 align="center">
			<strong>고객 관리</strong>
		</h2>
		<div style="margin-bottom: 3px; text-align: right;">
			<button onclick="serchDetail();">상세검색</button>
		</div>
		<form action="userList6.do" onsubmit="return checkSearch();">
			<table class="table table-hover">
				<thead class="thead-light">
					<tr style="text-align: center;">
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입날짜</th>
						<th>현재상태</th>
						<th>상세보기&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr id="serarchD" style="display: none; text-align: center;">
						<th>아이디 : <input type="text" name="userid" style="width: 100px"></th>
						<th>이름 : <input type="text" name="username" style="width: 100px"></th>
						<th>검색 시작 날짜 : <input type="date" id="sdate" name="startdate"></th>
						<th>검색 끝 날짜 : <input type="date" id="edate" name="enddate"></th>
						<th colspan="2">현재상태 : <select name="memberstate">
								<option value="">전체</option>
								<option value="정상">정상</option>
								<option value="정지">정지</option>
								<option value="탈퇴">탈퇴</option>
						</select>
						</th>
						<th><input type="submit" value="검색"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ulist" items="${uesrAllList}">
						<tr style="text-align: center;">
							<td>${ulist.userid}</td>
							<td>${ulist.username }</td>
							<td>${ulist.phone }</td>
							<td>${ulist.email }</td>
							<td>${ulist.enrolldate}</td>
							<td>${ulist.memberstate}</td>
							<td><a href="userDetailView.do?userid=${ulist.userid}">view</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>

	<nav aria-label="..." style="text-align: center">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link"
				href="userlist6.do?page=1&userid=${commonPage.userid}&username=${commonPage.username}&startdate=${commonPage.startdate}&enddate=${commonPage.enddate}&memberstate=${commonPage.memberstate}">|◁</a></li>
			<c:if test="${(commonPage.beginPage-commonPage.pageSize)<= 1}">
				<li class="page-item"><a class="page-link"
					href="userlist6.do?page=1&userid=${commonPage.userid}&username=${commonPage.username}&startdate=${commonPage.startdate}&enddate=${commonPage.enddate}&memberstate=${commonPage.memberstate}"><i
						class="fa fa-backward" aria-hidden="true"></i></a></li>
			</c:if>
			<c:if test="${ (commonPage.beginPage-commonPage.pageSize) > 1}">
				<li class="page-item"><a class="page-link"
					href="userlist6.do?page=${commonPage.beginPage-commonPage.pageSize}&userid=${commonPage.userid}&username=${commonPage.username}&startdate=${commonPage.startdate}&enddate=${commonPage.enddate}&memberstate=${commonPage.memberstate}"><i
						class="fa fa-backward" aria-hidden="true"></i></a></li>
			</c:if>
			<c:forEach var="p" begin="${commonPage.beginPage }"
				end="${commonPage.endPage }">
				<c:if test="${p == commonPage.currentPage }">
					<li class="page-item active"><a class="page-link"
						href="userlist6.do?page=${p}&userid=${commonPage.userid}&username=${commonPage.username}&startdate=${commonPage.startdate}&enddate=${commonPage.enddate}&memberstate=${commonPage.memberstate}">${p}</a></li>
				</c:if>
				<c:if test="${p != commonPage.currentPage }">
					<li class="page-item"><a class="page-link"
						href="userlist6.do?page=${p }&userid=${commonPage.userid}&username=${commonPage.username}&startdate=${commonPage.startdate}&enddate=${commonPage.enddate}&memberstate=${commonPage.memberstate}">${p}</a></li>
				</c:if>
			</c:forEach>
			<c:if
				test="${(commonPage.endPage+commonPage.pageSize) > commonPage.maxPage }">
				<li class="page-item"><a class="page-link"
					href="userlist6.do?page=${commonPage.maxPage}&userid=${commonPage.userid}&username=${commonPage.username}&startdate=${commonPage.startdate}&enddate=${commonPage.enddate}&memberstate=${commonPage.memberstate}"><i
						class="fa fa-forward" aria-hidden="true"></i></a></li>
			</c:if>
			<c:if
				test="${(commonPage.endPage+commonPage.pageSize) <= commonPage.maxPage }">
				<li class="page-item"><a class="page-link"
					href="userlist6.do?page=${commonPage.beginPage + commonPage.pageSize}&userid=${commonPage.userid}&username=${commonPage.username}&startdate=${commonPage.startdate}&enddate=${commonPage.enddate}&memberstate=${commonPage.memberstate}"><i
						class="fa fa-forward" aria-hidden="true"></i></a></li>
			</c:if>
			<li class="page-item"><a class="page-link"
				href="userlist6.do?page=${commonPage.maxPage }&userid=${commonPage.userid}&username=${commonPage.username}&startdate=${commonPage.startdate}&enddate=${commonPage.enddate}&memberstate=${commonPage.memberstate}">▷|</a></li>
		</ul>
	</nav>
	<!--================ start footer Area  =================-->
	<jsp:include page="../common/footer.jsp" />
	<!--================ End footer Area  =================-->
</body>
</html>