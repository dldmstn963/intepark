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

function movelist(){
	location.href = "nlist1.do?page=${currentPage}";
	return false;
}



</script>

<style type="text/css">


</style>

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">



</head>
<body>
<br><br><br><br><br><br><br><br><br><br>

<h4 align="center">${ notice.noticeno }번 공지사항 게시글 수정페이지</h4>
<br>
<br> 


<form action="nupdate7.do" method="post" enctype="multipart/form-data" >
<input type="hidden" name="page" value=" ${ currentPage }">
<input type="hidden" name="noticeno" value="${ notice.noticeno }">

<table align="center">

<tr><th>제목</th><td><input type="text" class="form-control" name="noticetitle" size="50"  value="${notice.noticetitle }"></td></tr>
<tr><th>작성자</th><td><input type="text"  class="form-control" name="writername" value="${loginUser.username }" readonly="readonly" ></td></tr>
<tr><th>파일첨부</th><td><input type="file" name="file" value="${notice.noticeoriginalfilename }"></td>

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
<tr><th>내용</th><td><textarea name="noticecontent" class="form-control" rows="5" cols="50" >${ notice.noticecontent }</textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="수정하기"> &nbsp;
	<input type="reset" value="초기화"> &nbsp;
	<input type="button" value="이전 페이지로" onclick="history.go(-1); return false;">
</th></tr>

</table>
</form>




























<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!--================ start footer Area  =================-->	
        <jsp:include page="../common/footer.jsp" />
<!--================ End footer Area  =================-->








</body>
</html>




























