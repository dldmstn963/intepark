<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auctionList</title>
        <%@ include file="../common/jscsspath.jsp" %>
        	
     	<style type="text/css">
  html, body {
	width: 100%; height: 100%; 
}
	</style>
</head>
<body>
   	<jsp:include page="../common/header.jsp" />
   	<div style="height: 50%; width: 100%">
<div class="container">
<table class="table table-hover">
  <thead class="thead-light">
    <tr>
    <th colspan="6" style="text-align:center;">회원경매</th>
    </tr>
    <tr>
      <th>경매번호</th>
      <th>분류</th>
      <th>제목</th>
       <th>지역</th>
        <th>시공일자</th>
         <th>현재현황</th>
    </tr>
  </thead>

  <tbody>
  <c:forEach items="${ list }" var="a">
    <tr>
      <th scope="row">${ a.auctionno }</th>
      <td>${a.interiorsection }</td>
    <td><a href="#">${a.title }</a></td>
       <td>${a.address }</td>
        <td>${a.startday }</td>
         <td>${a.progress }</td>
    </tr>
    </c:forEach>        
  </tbody>
</table>
</div>
</div>
   	<div style="height: 50%; width: 100%">
<div class="container">
<table class="table table-hover">
  <thead class="thead-light">
    <tr>
   <th colspan="6" style="text-align:center;">비회원경매</th>
    </tr>
    <tr>
      <th>경매번호</th>
      <th>분류</th>
      <th>제목</th>
       <th>지역</th>
        <th>시공일자</th>
         <th>현재현황</th>
    </tr>
  </thead>

  <tbody>
  <c:forEach items="${ list2 }" var="b">
    <tr>
      <th scope="row">${ b.auctionno }</th>
      <td>${b.interiorsection }</td>
    <td><a href="#">${b.title }</a></td>
       <td>${b.address }</td>
        <td>${b.startday }</td>
         <td>${b.progress }</td>
    </tr>
    </c:forEach>        
  </tbody>
</table>
</div>
</div>
  <jsp:include page="../common/footer.jsp" />
</body>
</html>