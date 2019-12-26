<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 링크 추가 -->
<link rel="stylesheet" href="/css/bootstrap.css">

 		<!-- ================Header Menu Area ================= -->
       	<jsp:include page="../common/header.jsp" />
        <!--================Header Menu Area =================-->

<title>인테파크</title>
<%@ include file="../common/jscsspath.jsp" %>

<script type="text/javascript">


</script>

<style type="text/css">


</style>

</head>




<body>
<br><br><br><br><br><br><br><br><br><br>
<h2 align="center">${ n.noticeno }번 공지사항 게시글 상세보기</h2>
<br>
<br> 
<div class="container">
    <div class="row">
 <table class="table table-striped table-hover">
 <tr><th>제목</th><td>${ n.noticetitle }</td></tr>
<tr><th>작성자</th><td>${ n.writername }</td></tr>
<tr><th>작성날짜</th><td>${ n.noticedate }</td></tr>
<tr><th>조회수</th><td>${ n.noticecount }</td></tr>
<tr><th>내용</th><td>${ n.noticecontent }</td></tr>
<tr><th>첨부파일</th>
   <td>
   <c:if test="${ !empty n.noticeoriginalfilename }">  
   	<c:url var="bfdn" value="/bfdown">
   		<c:param name="ofile" value="${ n.noticeoriginalfilename }" />
   		<c:param name="rfile" value="${ n.noticerenamefilename }" />
   	</c:url> 
   	
   	<a href="${ bfdn }">${ board.boardOriginalFileName }</a>
   </c:if>
   <c:if test="${ empty board.boardOriginalFileName }">
   	첨부파일 없음
   </c:if>
   </td>
</tr>
<tr>
<th colspan="2">
	<c:url var="nl" value="/nlist1.do">
		<c:param name="page" value="${ currentPage }" />
	</c:url>
	<a href="${ nl }">목록이동</a> &nbsp;
	
</th>

</tr>




 </table>





















</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!--================ start footer Area  =================-->	
        <jsp:include page="../common/footer.jsp" />
<!--================ End footer Area  =================-->



</body>
</html>

















