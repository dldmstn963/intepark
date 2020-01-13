<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auctionList</title>
<script type="text/javascript">
//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "auctionList2.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize,page1,range1,rangeSize1,searchType,keyword,searchType1,keyword1) {
		var url = "auctionList2.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&page1=" + page1;
		url = url + "&range1=" + range1;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		url = url + "&searchType1=" + searchType1;
		url = url + "&keyword1=" + keyword1;
		location.href = url;	
	}
	function fn_pagination1(page, range, rangeSize,page1,range1,rangeSize1,searchType,keyword,searchType1,keyword1) {
		var url = "auctionList2.do";
		url = url + "?page=" + page1;
		url = url + "&range=" + range1;
		url = url + "&page1=" + page;
		url = url + "&range1=" + range;
		url = url + "&searchType=" + searchType1;
		url = url + "&keyword=" + keyword1;
		url = url + "&searchType1=" + searchType;
		url = url + "&keyword1=" + keyword;
		location.href = url;	
	}
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "auctionList2.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
        <%@ include file="../common/jscsspath.jsp" %>
        <!-- 조회 -->
        <script type="text/javascript">
    	$(document).on('click', '#btnSearch', function(e){
    			e.preventDefault();
    			var url = "auctionList2.do";
    			url = url + "?searchType=" + $('#searchType').val();
    			url = url + "&keyword=" + $('#keyword').val();
    			url = url + "&searchType1=" + $('#searchType1').val();
    			url = url + "&keyword1=" + $('#keyword1').val();
    			location.href = url;
    			console.log(url);
    		});	
        </script>	
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
  <c:forEach items="${ list }" var="a" varStatus="status">
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
  <!-- pagination{s} -->

	<div id="paginationBox">

		<ul class="pagination">

			<c:if test="${pagination.prev}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>

			</c:if>

				

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">

				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}','${pagination1.page}', '${pagination1.range}', '${pagination1.rangeSize}','${pagination.searchType}', '${pagination.keyword}','${pagination1.searchType}', '${pagination1.keyword}')"> ${idx} </a></li>

			</c:forEach>

				

			<c:if test="${pagination.next}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', 

'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>

			</c:if>
		</ul>

	</div>

	<!-- pagination{e} -->
</table>
</div>
		<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType" id="searchType">

					<option value="title">제목</option>
					<option value="address">주소</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

			</div>

		</div>

		<!-- search{e} -->
</div>
<hr>
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
  <c:forEach items="${ list1 }" var="b">
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
  <!-- pagination{s} -->
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination1.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination1.page}', '${pagination1.range}', '${pagination1.rangeSize}')">Previous</a></li>
			</c:if>
			<c:forEach begin="${pagination1.startPage}" end="${pagination1.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination1.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination1('${idx}', '${pagination1.range}', '${pagination1.rangeSize}','${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${pagination1.searchType}', '${pagination1.keyword}','${pagination.searchType}', '${pagination.keyword}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pagination1.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination1.page}', 
'${pagination1.range}', '${pagination1.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->
</table>
</div>
<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType1" id="searchType1">

					<option value="title">제목</option>
					<option value="address">주소</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="keyword1" id="keyword1">

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

			</div>

		</div>

		<!-- search{e} -->
</div>

	
	
  <jsp:include page="../common/footer.jsp" />
</body>
</html>
