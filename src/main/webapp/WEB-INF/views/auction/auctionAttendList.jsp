<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auctionAttendList</title>
		<!-- Semantic -->
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
	
    function popup(auctionno,consname){
        var url = "auctionAttendPop2.do?auctionno="+auctionno+"&consname="+consname;
        var name = "popup test";
        var option = "width = 810, height = 500, top = 100, left = 200, location = no"
 window.open(url, name, option);
    }
    var chatno;
    
    function invite(data1, data2){
			console.log(data2);
        	$.ajax({
    		url :  "insertChat3.do",
    		type : "post",
    		data : {
				consid : data1,
    			userid : data2
    		},
    		success : function(data){
    			chatno = data;
    			console.log(chatno);    			
    			console.log(data1 + "/" + data2 + "/" + chatno);
    			ws.send("invite/" + data1 + "/" + data2 + "/" + chatno);
    			openwindow(chatno);
    		},
    		error : function(jqXHR, textStatus, errorThrown){
    			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
    		}
    	});


    }	

function openwindow(){
	window.open("chat3.do?chatno="+chatno, "chat", "width=450, height=700");
}

	</script>
<script type="text/javascript">
	setInterval(function(){
		  $(".blinkEle").toggle();
		}, 500);
	</script>

</head>
<body>
 	<jsp:include page="../common/header.jsp" />

 	<div class="container">

<table class="table table-hover">

  <thead class="thead-light">
    <tr>
    <br>
    <h4 align="center">견적 참여리스트</h4>
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
   
    <li><a href = "javascript:invite('${a.consid }', '${sessionScope.loginUser.userid }');">채팅</a></li>

    <li><a href="#">수정</a></li>
    <li><a href="auctionAttendDelete2.do?auctionno=${a.auctionno}&consname=${a.consname}">삭제</a></li>
    </ul>
    </th>
      <td>${a.title }</td>
    <td>${a.phone}</td> 
       <td>${a.possibledate}</td>
         <c:if test="${a.progress eq '대기' }">
         <td class="blinkEle" style="color:red; padding-left:25px;">${a.progress }</td>
         </c:if>
          <c:if test="${a.progress eq '진행' }">
         <td class="blinkEle" style="color:blue; padding-left:25px;">${a.progress }</td>
         </c:if>
        
    </tr>
    </c:forEach>        
  </tbody>
</table>
</div>
<!-- Modal -->
<div class="ui modal">

 <c:forEach items="${ list }" var="b">
 <c:if test="${cons eq b.consid }">
  <i class="close icon"></i>
  <div class="header">
   ${b.auctionno } ${b.consname }
  </div>
  <div class="image content" style="width:800px; height:500px;">
    <div class="ui medium image">
 <!--      <img src="/images/avatar/large/chris.jpg"> -->
    </div>
    <div class="description">
      <div class="ui header">We've auto-chosen a profile image for you.</div>
      <p>We've grabbed the following image from the <a href="https://www.gravatar.com" target="_blank">gravatar</a> image associated with your registered e-mail address.</p>
      <p>Is it okay to use this photo?</p>
    </div>
  </div>
  <div class="actions">
    <div class="ui black deny button">
      Nope
    </div>
  </div>
 </c:if>
  </c:forEach>
  
</div>
<form action="auctionAttend2.do" method="get">
<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right:10px">
	
				<select class="form-control form-control-sm" name="selectoption" id="selectoption">

					<option value="consname">시공사명</option>
					<option value="title">제목</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="searchtext" id="searchtext">

			</div>
<input type="hidden" value="${commonPage.auctionno }" name="auctionno">
			<div>
			<input type="submit" value="검색" class="btn btn-sm btn-primary">

			</div>
		</div>
		</form>
    		<nav aria-label="..." style="text-align: center">
        		 <ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="auctionAttend2.do?page=1&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}&auctionno=${commonPage.auctionno}">|◁</a></li>
						<c:if test="${(commonPage.beginPage-commonPage.pageSize)<= 1}">
							<li class="page-item"><a class="page-link" href="auctionAttend2.do?page=1&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}&auctionno=${commonPage.auctionno}"><i class="fa fa-backward" aria-hidden="true"></i></a></li>
						</c:if>
						<c:if test="${ (commonPage.beginPage-commonPage.pageSize) > 1}">
							<li class="page-item"><a class="page-link" href="auctionAttend2.do?page=${commonPage.beginPage-commonPage.pageSize}&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}&auctionno=${commonPage.auctionno}"><i class="fa fa-backward" aria-hidden="true"></i></a></li>
						</c:if>
						<c:forEach var="p" begin="${commonPage.beginPage }" end="${commonPage.endPage }">
							<c:if test="${p == commonPage.currentPage }">
								<li class="page-item active"><a class="page-link" href="auctionAttend2.do?page=${p}&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}&auctionno=${commonPage.auctionno}">${p}</a></li>
							</c:if >
							<c:if test="${p != commonPage.currentPage }">
								<li class="page-item"><a class="page-link" href="auctionAttend2.do?page=${p }&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}&auctionno=${commonPage.auctionno}"  >${p}</a></li>
							</c:if>
						</c:forEach>
							<c:if test="${(commonPage.endPage+commonPage.pageSize) > commonPage.maxPage }">
								<li class="page-item"><a class="page-link" href="auctionAttend2.do?page=${commonPage.maxPage }&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}&auctionno=${commonPage.auctionno}"><i class="fa fa-forward" aria-hidden="true"></i></a></li>
							</c:if>
							<c:if test="${(commonPage.endPage+commonPage.pageSize) <= commonPage.maxPage }">
								<li class="page-item"><a class="page-link" href="auctionAttend2.do?page=${commonPage.beginPage + commonPage.pageSize}&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}&auctionno=${commonPage.auctionno}"><i class="fa fa-forward" aria-hidden="true"></i></a></li>
							</c:if>
								<li class="page-item"><a class="page-link" href="auctionAttend2.do?page=${commonPage.maxPage }&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}&auctionno=${commonPage.auctionno}">▷|</a></li>
					</ul>
				</nav>
<div style="text-align: center;">
<input type="button" value="이전화면" onclick="javascript:history.back()" style="background-color: #ffc107;" class="btn">&nbsp;&nbsp;
<c:if test="${!empty sessionScope.loginCons }">
<button type="button" onclick="location.href='auctionAttend22.do?auc=${commonPage.auctionno}'" style="background-color: #ffc107;" class="btn">경매참가</button>
</c:if>
</div>


 	  <jsp:include page="../common/footer.jsp" />
</body>
</html>