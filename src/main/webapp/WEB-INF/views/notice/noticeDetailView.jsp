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
<%@ include file="../common/jscsspath.jsp" %>

<script type="text/javascript">
/* 수정 스크립트 */
function callFunction(){
	location.href="nupdatemoveview6.do?no=${notice.noticeno}&page=${currentPage}";
}

/* 삭제 스크립트 */
 function deleteFunction(){
		location.href="ndelete8.do?no=${notice.noticeno}";
		
	 }





</script>

<style type="text/css">


</style>

</head>




<body>
<br><br><br><br><br><br><br><br><br><br>
<h2 align="center">${ notice.noticeno }번 공지사항 게시글 상세보기</h2>
<br>
<br> 
<div class="container">
    <div class="row">
 <table class="table table-hover">
 <tr><th>제목</th><td>${ notice.noticetitle }</td></tr>
<tr><th>작성자</th><td>${ notice.writername }</td></tr>
<tr><th>작성날짜</th><td>${ notice.noticedate }</td></tr>
<tr><th>조회수</th><td>${ notice.noticecount }</td></tr>
<tr><th>첨부파일</th>
   <td>
   <c:if test="${ !empty notice.noticeoriginalfilename }">  
   	<c:url var="nfdn" value="nfiledown5.do">
   		<c:param name="ofile" value="${ notice.noticeoriginalfilename }" />
   		<c:param name="rfile" value="${ notice.noticerenamefilename }" />
   	</c:url> 
   	
   	<a href="${ nfdn }">${ notice.noticeoriginalfilename }</a>
   </c:if>
   <c:if test="${ empty notice.noticeoriginalfilename }">
   	첨부파일 없음
   </c:if>
   </td>
</tr>
<tr><th>내용</th><td>${ notice.noticecontent }</td></tr>
<tr>
<th colspan="2">
	<c:url var="nl" value="nlist1.do">
		<c:param name="page" value="${ currentPage }" />
	</c:url>
	<a href="${ nl }">목록이동</a> &nbsp;
	
	<!-- 관리자 페이지 시에 추가 -->
<c:if
		test="${!empty sessionScope.loginUser and loginUser.userid eq 'admin' }">
	<!-- 관리자 접속시 글쓰기 추가 -->
		<div style="float:right; margin-right:150px;">
		<button onclick="callFunction();" class="btn btn-primary">수정</button>
		<button onclick="deleteFunction();" class="btn btn-primary">삭제</button>
		</div>
</c:if>
	
	
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

















