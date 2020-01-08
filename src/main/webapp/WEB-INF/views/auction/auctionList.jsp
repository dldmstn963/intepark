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
	function doDisplay2(pass){
		 var con = document.getElementById(pass);
		    if(con.style.display=='none'){
		    	con.style.display = 'block';
		    }else{
		    	con.style.display = 'none';
		    }
		}

    function passCheck(password,passno){
  		var con = document.getElementById(passno).value;
  		console.log(passno);
    	console.log(password);
    	console.log(con);
    	if(password == con){
    	   var yn = confirm("정말로 삭제하시겠습니까?");
       	   if(yn==true){
       		document.getElementById('frm').submit();
           	   }
       	   return false;
  	  }
    	if(password != con){
     	  alert("비밀번호가 틀렸습니다.");
     	 document.getElementById(passno).focus();
     	  return false;
     }
   }
/* 	
	$(function(){
		$('.content').click(function(){
			var id = $('#pass3').val();
			alert(id);
			});
	
		}); */

	</script>
	
</head>
<body>
   	<jsp:include page="../common/header.jsp" />
   	<div>
<div class="container">
<table class="table table-hover">
  <thead class="thead-light">
    <tr>
   <h4 align="center">회원경매</h4>
    </tr>
    <tr>
      <th style="width:100px">경매번호</th>
      <th style="width:100px">분류</th>
      <th style="width:300px">제목</th>
       <th style="width:300px">지역</th>
        <th style="width:100px">시공일자</th>
         <th style="width:100px">현재현황</th>
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
    <c:if test="${a.userid eq sessionScope.loginUser.userid }">
    <li><a href="#">수정</a></li>
    <li><a href="auctionDelete2.do?auc=${a.auctionno }">삭제</a></li>
    </c:if>
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
  <h4 align="center">비회원경매</h4>
    </tr>
    <tr>
      <th style="width:100px">경매번호</th>
      <th style="width:100px">분류</th>
      <th style="width:300px">제목</th>
       <th style="width:300px">지역</th>
        <th style="width:100px">시공일자</th>
         <th style="width:100px">현재현황</th>
    </tr>
  </thead>
<!--  <th colspan="6" style="text-align:center;"> -->
  <tbody>
  <c:forEach items="${ list2 }" var="b">
    <tr>
      <th scope="row">${ b.auctionno }</th>
      <td>${b.interiorsection }</td>
     <td><a href="javascript:doDisplay('menu${b.auctionno }');">${b.title}</a>
    <ul id="menu${b.auctionno }" style="display:none;">
    <li><a href="auctionDetailView2.do?nonauc=${b.auctionno }">상세보기</a></li>
    <li><a href="#">수정</a></li>
    <li><a href = "javascript:doDisplay2('pass${b.auctionno }');">삭제</a><br>
    <div id="pass${b.auctionno }" style="display:none; position: absolute;" >
    <form action="nonAuctionDelete2.do" method="post" id="frm">
    비밀번호 : <input type="password" id="passs${b.auctionno}"> &nbsp; <input type="button" value="확인" class="content" onclick="passCheck('${b.password}','passs${b.auctionno}');">
    <input type="hidden" value="${b.auctionno}" name="nonauc">
    </form></div></li>
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