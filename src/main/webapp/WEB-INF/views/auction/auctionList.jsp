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

	/* #menu{
	display:none;
	} */

	</style>
	<script type="text/javascript">
	function doDisplay(menu){
	   var con = document.getElementById(menu);
		console.log(con);
	    if(con.style.display=='none'){
	        con.style.display = 'block';
	    }else{
	        con.style.display = 'none';
	    }
	}
	</script>
	
</head>
<body>
   	<jsp:include page="../common/header.jsp" />
   	<div>
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
    <td><a href="javascript:doDisplay('menu${a.auctionno }');">${a.title}</a>
    <ul id="menu${a.auctionno }" style="display:none;">
    <li><a href="auctionDetailView2.do?auc=${a.auctionno }">상세보기</a></li>
    <li><a href="#">수정</a></li>
    <li><a href="#">삭제</a></li>
    </ul>
    </td> 
       <td>${a.address }</td>
        <td>${a.startday }</td>
         <td>${a.progress }</td>
    </tr>
    </c:forEach>        
  </tbody>
</table>
</div>
</div>
   	<div>
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
     <td><a href="javascript:doDisplay('menu${b.auctionno }');">${b.title}</a>
    <ul id="menu${b.auctionno }" style="display:none;">
    <li><a href="auctionDetailView2.do?nonauc=${b.auctionno }">상세보기</a></li>
    <li><a href="#">수정</a></li>
    <li><a href="#">삭제</a></li>
    </ul>
    </td> 
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