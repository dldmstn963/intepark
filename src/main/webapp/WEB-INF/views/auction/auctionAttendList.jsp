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
	
    function popup(auctionno,consname){
    	console.log(auctionno);
    	console.log(consname);
        var url = "auctionAttendPop2.do?auctionno="+auctionno+"&consname="+consname;
        var name = "popup test";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
 window.open(url, name, option);
    }
	
	</script>
	
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
      <th scope="row"><a href="javascript:doDisplay('menu${a.consname }');">${ a.consname }</a>
        <ul id="menu${a.consname }" style="display:none;">
    <li><a href = "javascript:popup('${a.auctionno }','${a.consname }');" target = "_self">상세보기</a></li>
    <li>채팅</li>
    <li><a href="#">수정</a></li>
    <li>삭제</li>
    </ul>
    </th>
      <td>${a.title }</td>
    <td>${a.phone}</td> 
       <td>${a.possibledate}</td>
        <td>${a.progress }</td>
        
    </tr>
    </c:forEach>        
  </tbody>
</table>
</div>

<div style="text-align: center;">
<button type="button" onclick="location.href='auctionAttend22.do?auc=${auctionno}' " style="background-color: #ffc107;">경매참가</button>
</div>
 	  <jsp:include page="../common/footer.jsp" />
</body>
</html>