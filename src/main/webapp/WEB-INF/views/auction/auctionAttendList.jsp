<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auctionAttendList</title>
    	<style type="text/css">
  html, body {
	width: 100%; height: 100%; 
}

	/* #menu{
	display:none;
	} */

	</style>
<%@ include file="../common/jscsspath.jsp" %>
</head>
<body>
 	<jsp:include page="../common/header.jsp" />
 	<div class="container">
<table class="table table-hover">
  <thead class="thead-light">
    <tr>
    <th colspan="6" style="text-align:center;">견적 참여리스트</th>
    </tr>
    <tr>
      <th>시공사</th>
      <th>제목</th>
      <th>전화번호</th>
       <th>시공가능일</th>
         <th>현재현황</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${ list }" var="a">
    <tr>
      <th scope="row">${ a.consname }</th>
      <td>${a.title }</td>
    <td>${a.phone}</td> 
       <td>${a.possibledate}</td>
        <td>${a.progress }</td>
        
    </tr>
    </c:forEach>        
  </tbody>
</table>
</div>

<div>
<button type="button" onclick="location.href='auctionAttend22.do?auc=${auctionno}' " style="background-color: #ffc107;">회원가입</button>
</div>
 	  <jsp:include page="../common/footer.jsp" />
</body>
</html>