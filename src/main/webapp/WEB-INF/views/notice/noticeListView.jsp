<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 링크 추가 -->
<!-- <link rel="stylesheet" href="/css/bootstrap.css"> -->

 		<!-- ================Header Menu Area ================= -->
       	<jsp:include page="../common/header.jsp" />
        <!--================Header Menu Area =================-->
<title>인테파크</title>
<!-- 부트스트랩 및 제이쿼리 css js 파일 모아놓은 장소 -->
<%@ include file="../common/jscsspath.jsp" %>


<script type="text/javascript">




</script>

<style type="text/css">
	table {
			margin-top : 5px;
			margin-right : 5px;
			margin-bottom : 5px;
			margin-lwft : 5px;
		}
		
			
</style>


</head>
<body>

<br><br><br><br><br><br><br><br><br><br>

<h4 align="center">공지 사항 <%= ((java.util.ArrayList<com.c4.intepark.notice.model.vo.Notice>)request.getAttribute("list")).size() %> 개</h4>
<br>
<div class="container">
    <div class="row"> 
<table class="table table-striped table-hover">

<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>첨부파일</th>
	<th>작성날짜</th>
	<th>조회수</th>
</tr>
<c:forEach items="${ list }" var="n">
<tr>
	<th>${ n.noticeno }</th>
	<c:url var="ndt" value="ndetail2.do">
		<c:param name="n" value="${n.noticeno }" />
	</c:url>
	<td><a href="${ ndt }">${ n.noticetitle }</a></td>
	<td>${ n.writername }</td>
	<td align="center">
		<c:if test="${ !empty n.noticeoriginalfilename and n.noticeoriginalfilename ne 'null' }">
			◎
		</c:if>
		<c:if test="${ empty n.noticeoriginalfilename }">
			&nbsp;
		</c:if>
	</td>
	<td>${ n.noticedate }</td>
	<td>${n.noticecount }</td>
</tr>
</c:forEach>
</table>

<br>

<div ><a href="nlist1.do" class="btn btn-success" style="float:left; margin-left:10px;">목록 이동</a></div> &nbsp;&nbsp;&nbsp;&nbsp;

<!-- 관리자 페이지 시에 추가 -->
<c:if
		test="${!empty sessionScope.loginUser and loginUser.userid eq 'admin' }">
	<!-- 관리자 접속시 글쓰기 추가 -->
		<div style="float:right; margin-right:150px;">
		<button onclick="callFunction();" class="btn btn-primary">새 공지사항 등록</button>
		</div>
</c:if>
<br> 

<div id="pagebox" align="center">
<a href="/intepark/nlist1.do?page=1"> |◁ </a> &nbsp;
<c:if test="${ (beginPage - 10) lt 1 }">
	<a href="/intepark/nlist1.do?page=1">◀◀</a>
</c:if>
<c:if test="${ (beginPage - 10) ge 1 }">
	<a href="/intepark/nlist1.do?page=${ beginPage - 10 }">◀◀</a>
</c:if> &nbsp;
<c:forEach var="p" begin="${beginPage }" end="${endPage }">
	<c:if test="${p eq currentPage }">
		<a href="/intepark/nlist1.do?page=${p }"><font color="red"><b>[${p }]</b></font></a>
	</c:if>
	<c:if test="${p ne currentPage }">
		<a href="/intepark/nlist1.do?page=${p }">${p }</a>
	</c:if>
</c:forEach> &nbsp;

<c:if test="${ (endPage + 10) gt maxPage }">
	<a href="/intepark/nlist1.do?page=${maxPage }">▶▶</a>
</c:if>
<c:if test="${ (endPage + 10) le maxPage }">
	<a href="/intepark/nlist1.do?page=${endPage + 10 }">▶▶</a>	
</c:if> &nbsp;
<a href="/intepark/nlist1.do?page=${maxPage}">▷|</a>


</div>









<br><br><br><br>












        




</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!--================ start footer Area  =================-->	
        <jsp:include page="../common/footer.jsp" />
<!--================ End footer Area  =================-->
</body>
</html>