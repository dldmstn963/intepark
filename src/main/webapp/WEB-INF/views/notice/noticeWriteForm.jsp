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
function moveList(){
	location.href = "/intepark/nlist1.do";
	return false;	//이벤트전달 막기
}



</script>

<style type="text/css">


</style>

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">





</head>





</head>
<body>
<br><br><br><br><br><br><br><br><br><br>

<form action="ninsert4.do" method="post" enctype="multipart/form-data">

<h4 align="center">인테파크 공지사항 등록 </h4>

<table align="center" >
<tr><th>제목</th><td><input type="text" class="form-control" name="noticetitle" size="50" placeholder="제목을 작성해주세요."></td></tr>
<tr><th>작성자</th><td><input type="text"  class="form-control" name="writername" value="${loginUser.username }" readonly="readonly" ></td></tr>
<tr><th>파일첨부</th><td><input type="file" name="file"></td></tr>				   
<tr><th>내용</th><td><textarea  class="form-control" name="noticecontent" rows="5" cols="50" placeholder="내용을 입력해 주세요"></textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="등록하기"> &nbsp;
	<input type="reset" value="초기화"> &nbsp;
	<input type="button" value="목록이동" onclick="moveList();">
</th></tr>


</table>
</form>


























<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!--================ start footer Area  =================-->	
        <jsp:include page="../common/footer.jsp" />
<!--================ End footer Area  =================-->





</body>
</html>

















