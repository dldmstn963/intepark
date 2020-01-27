<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp"%>
<link rel="stylesheet" type="text/css" href="/intepark/resources/Semantic/semantic.min.css">
<script src="/intepark/resources/Semantic/semantic.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/swiper.min.css">
<link rel="stylesheet" href="/intepark/resources/lightbox/colorbox.css">
<script src="/intepark/resources/lightbox/jquery.colorbox.js"></script>
<script type="text/javascript">
function erchk() {
	$("#frm").submit();
}
</script>
<style type="text/css">
.swiper-container {
      width: 100%;
      height: 100%;
    
    }
     .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
<div class="container">
     <div class="col-lg-4" style="width:500px; height:300px; position: absolute;">
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	     <%--  <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/img-1.jpg" class="img-circle" width="300px" height="200px"></div> --%>
	     <c:if test="${rfile[0] eq 'null' }">
	     <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/portfolio_Noimage.png" class="img-circle" width="300px" height="200px"></div>
	     </c:if>
	     <c:if test="${rfile[0] ne 'null' }">
        <div class="swiper-slide"><a class="light" href="/intepark/resources/auctionUpFile/${rfile[0] }"><img src="/intepark/resources/auctionUpFile/${rfile[0] }" class="img-circle" width="400px" height="300px"></a></div>
        <c:if test="${not empty rfile[1] }">
        <div class="swiper-slide"><a class="light" href="/intepark/resources/auctionUpFile/${rfile[1] }"><img src="/intepark/resources/auctionUpFile/${rfile[1] }" class="img-circle"  width="400px" height="300px"></a></div>
           	<c:if test="${not empty rfile[2] }">
       <div class="swiper-slide"><a class="light" href="/intepark/resources/auctionUpFile/${rfile[2] }"><img src="/intepark/resources/auctionUpFile/${rfile[2] }" class="img-circle"  width="400px" height="300px"></a></div>
        </c:if>
        </c:if>
        </c:if>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	  </div>
      </div><!-- col-lg-4 끝 -->      
  <table class="table" style="width:600px; margin-left:600px;">
    <tbody>
      <tr>
  <th style="width: 174px;">제목 : </th>
        <td>${auction.title }</td>
      </tr>
      <tr>
       <th>인테리어 분류 : </th>
        <td>${auction.interiorsection }</td>
      </tr>
      <tr>
       <th>공사시작일 : </th>
        <td>${auction.startday }</td>
      </tr>
      <tr>
       <th>이름 : </th>
        <td>${auction.name }</td>

      </tr>
      <tr>
       <th>휴대전화번호 : </th>
        <td>${auction.phone }</td>
      </tr>
      <tr>
       <th>이메일 : </th>
        <td>${auction.email }</td>
      </tr>
      <tr>
       <th>희망금액 : </th>
        <td>${auction.price }</td>
      </tr>
      <tr>
       <th>주소 : </th>
        <td>${auction.address }</td>
      </tr>
  <%--     <tr>
       <th>첨부사진 : </th>
  	<c:if test="${rfile[0] ne 'null' }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[0] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px" onclick="doImgPop('/intepark/resources/auctionUpFile/${rfile[0] }')"></td>
        <c:if test="${not empty rfile[1] }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[1] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px" onclick="doImgPop('/intepark/resources/auctionUpFile/${rfile[1] }')"></td>
           	<c:if test="${not empty rfile[2] }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[2] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px" onclick="doImgPop('/intepark/resources/auctionUpFile/${rfile[2] }')"></td>
        </c:if>
        </c:if>
        </c:if>
         	
      

     
      </tr> --%>
      <tr>
       <th>기타 상세정보 : </th>
        <td>${auction.etc }</td>
      </tr>
    </tbody>
  </table>
</div>
<div style="text-align: center;">
<form method="post" action="auctionAttend2.do" id="frm">
<input type="hidden" name="auctionno" value="${auction.auctionno }">
<input type="button" value="이전화면" onclick="javascript:history.back()" style="background-color: #ffc107;" class="btn">
&nbsp; &nbsp;&nbsp; &nbsp;
<c:if test="${not empty auction.userid}">
<input type="button" value="경매참여/목록보기" onclick="erchk()" style="background-color: #ffc107;" class="btn">
</c:if>
</form>
</div>
<script src="${pageContext.request.contextPath }/resources/js/swiper.min.js"></script>
<script type="text/javascript">
<!-- Initialize Swiper -->
  var swiper = new Swiper('.swiper-container', {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
</script>
<script type="text/javascript">
$(document).ready(function(){

	$( '.light' ).colorbox();

	});
</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>