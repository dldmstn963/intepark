<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/jscsspath.jsp"%>
<script type="text/javascript">
window.onload=function(){
	var searchmstate = '${commonPage.memberstate}';
	var selectm = document.getElementById('smemberstate');

 	for(var i=0; i<selectm.options.length; i++){
 		if(selectm.options[i].value==searchmstate){
			selectm.options[i].selected =true;
			return false;
			}
		} 
}

function serchDetail(){
	var searchD=document.getElementById("serarchD");
	if(searchD.style.display=="none")
			searchD.style.display="";
		else
			searchD.style.display="none";
		
}
</script>
</head>

<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="../common/header.jsp" />
	<!--================Header Menu Area =================-->
	<div class="container">
		<h2 align="center">
			<strong>시공사 관리</strong>
		</h2>
		<div style="margin-bottom: 3px; text-align: right;">
			<button onclick="serchDetail();">상세검색</button>
		</div>
		<form action="consList6.do" onsubmit="return checkSearch();">
			<table class="table table-hover">
				<thead class="thead-light">
					<tr style="text-align: center;">
						<th>아이디</th>
						<th>상호명</th>
						<th>주소</th>
						<th>시공분야</th>
						<th>경력</th>
						<th>현재상태</th>
						<th>상세보기&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr id="serarchD" style="display: none; text-align: center;">
						<th>아이디 : <input type="text" name="consid" value="${commonPage.consid}" style="width: 100px"></th>
						<th>상호명 : <input type="text" name="companyname" value="${commonPage.companyname}" style="width: 100px"></th>
						<th>주소 : <input type="text" name="address" value="${commonPage.address}" style="width: 100px"></th>
						<th>시공분야 : <input type="text" name="consarea" value="${commonPage.consarea}" style="width: 100px"></th>
						<th colspan="2">현재상태 : <select id="smemberstate" name="memberstate">
								<option value="">전체</option>
								<option value="대기">가입 대기</option>
								<option value="정상">정상</option>
								<option value="정지">정지</option>
								<option value="탈퇴">탈퇴</option>
						</select>
						</th>
						<th><input type="submit" value="검색"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="clist" items="${consAllList}">
						<tr style="text-align: center;">
							<td>${clist.consid}</td>
							<td>${clist.companyname }</td>
							<td>${clist.address}</td>
							<td>${clist.consarea}</td>
							<td>${clist.career}</td>
							<td>${clist.memberstate}</td>
							<td><a href="consDetailView.do?consid=${clist.consid}">view</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>

	<nav aria-label="..." style="text-align: center">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link"
				href="consList6.do?page=1&consid=${commonPage.consid}&companyname=${commonPage.companyname}&address=${commonPage.address}&consarea=${commonPage.consarea}&memberstate=${commonPage.memberstate}">|◁</a></li>
			<c:if test="${(commonPage.beginPage-commonPage.pageSize)<= 1}">
				<li class="page-item"><a class="page-link"
					href="consList6.do?page=1&consid=${commonPage.consid}&companyname=${commonPage.companyname}&address=${commonPage.address}&consarea=${commonPage.consarea}&memberstate=${commonPage.memberstate}"><i
						class="fa fa-backward" aria-hidden="true"></i></a></li>
			</c:if>
			<c:if test="${ (commonPage.beginPage-commonPage.pageSize) > 1}">
				<li class="page-item"><a class="page-link"
					href="consList6.do?page=${commonPage.beginPage-commonPage.pageSize}&consid=${commonPage.consid}&companyname=${commonPage.companyname}&address=${commonPage.address}&consarea=${commonPage.consarea}&memberstate=${commonPage.memberstate}"><i
						class="fa fa-backward" aria-hidden="true"></i></a></li>
			</c:if>
			<c:forEach var="p" begin="${commonPage.beginPage }"
				end="${commonPage.endPage }">
				<c:if test="${p == commonPage.currentPage }">
					<li class="page-item active"><a class="page-link"
						href="consList6.do?page=${p}&consid=${commonPage.consid}&companyname=${commonPage.companyname}&address=${commonPage.address}&consarea=${commonPage.consarea}&memberstate=${commonPage.memberstate}">${p}</a></li>
				</c:if>
				<c:if test="${p != commonPage.currentPage }">
					<li class="page-item"><a class="page-link"
						href="consList6.do?page=${p }&consid=${commonPage.consid}&companyname=${commonPage.companyname}&address=${commonPage.address}&consarea=${commonPage.consarea}&memberstate=${commonPage.memberstate}">${p}</a></li>
				</c:if>
			</c:forEach>
			<c:if
				test="${(commonPage.endPage+commonPage.pageSize) > commonPage.maxPage }">
				<li class="page-item"><a class="page-link"
					href="consList6.do?page=${commonPage.maxPage}&consid=${commonPage.consid}&companyname=${commonPage.companyname}&address=${commonPage.address}&consarea=${commonPage.consarea}&memberstate=${commonPage.memberstate}"><i
						class="fa fa-forward" aria-hidden="true"></i></a></li>
			</c:if>
			<c:if
				test="${(commonPage.endPage+commonPage.pageSize) <= commonPage.maxPage }">
				<li class="page-item"><a class="page-link"
					href="consList6.do?page=${commonPage.beginPage + commonPage.pageSize}&consid=${commonPage.consid}&companyname=${commonPage.companyname}&address=${commonPage.address}&consarea=${commonPage.consarea}&memberstate=${commonPage.memberstate}"><i
						class="fa fa-forward" aria-hidden="true"></i></a></li>
			</c:if>
			<li class="page-item"><a class="page-link"
				href="consList6.do?page=${commonPage.maxPage }&consid=${commonPage.consid}&companyname=${commonPage.companyname}&address=${commonPage.address}&consarea=${commonPage.consarea}&memberstate=${commonPage.memberstate}">▷|</a></li>
		</ul>
	</nav>
	<!--================ start footer Area  =================-->
	<jsp:include page="../common/footer.jsp" />
	<!--================ End footer Area  =================-->
</body>
</html>