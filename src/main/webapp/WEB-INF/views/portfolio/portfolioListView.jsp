<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioListView</title>
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->
	
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/swiper.min.css">

<style type="text/css">
  <!-- Demo styles -->
   /*  html, body {
      position: relative;
      height: 100%;
    } */
    /* body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    } */
    .swiper-container {
      width: 100%;
      height: 100%;
      margin-left: auto;
      margin-right: auto;
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
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->

<div class="container">

	<div class="row">
	<div class="col-lg-4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  
	  	<button type="submit" class="btn">지역</button>
		&nbsp;&nbsp;
	<button>시공유형이야</button>
	</div>
	<div class="col-lg-5"></div>
	<div class="col-lg-3" style="text-align:right;">
	<button>내 상담신청 내역</button>&nbsp;&nbsp;
	<button>내 업체 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	</div><!-- row 끝 -->
	
	<br><br>
	
    <div class="row">
    
      <c:forEach items="${ list }" var="ConsVo">
      
      <div class="col-lg-4">
      
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	    <%-- <c:forEach items="${ list }" var="i"> --%>
	      <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/img-1.jpg" class="img-circle" width="300px" height="200px"></div>
	      <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/img-2.jpg" class="img-circle" width="300px" height="200px"></div>
	     <%--  </c:forEach> --%>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	  </div>

      </div><!-- col-lg-4 끝 -->
      
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->      
            
      <div class="col-lg-8">
      
      <div style="width:100%; height:200px;"><!-- 정보 구역 시작 -->
      <a href="<c:url value='/pfOne5.do?consid=${ConsVo.consid }'/>" style="color:black;">
      
      <div class='row'>
      
      <div class='col-lg-2' ><!-- 시공사 프로필사진 시작 -->
	      <c:if test="${empty ConsVo.profilerenameimg}">
	      	<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" class="img-circle" width="100px" height="100px">
	      </c:if>
	      <c:if test="${!empty ConsVo.profilerenameimg }">
	      	<img src="${pageContext.request.contextPath }/resources/img/woosoo/${ConsVo.profilerenameimg}" class="img-circle" width="100px" height="100px">
	      </c:if>
      </div><!-- 시공사 프로필사진 끝 -->
      
      <div class='col-lg-8' style="margin-top:20px; padding-left:0;"><!-- 시공사 업체명, 분야 시작 -->
      <span style="font-size:1.5em;">${ConsVo.companyname}</span><br>
      ${ConsVo.consarea} <br>
      </div><!-- 시공사 업체명, 분야 끝 -->
      
      <div class='col-lg-2' style="margin-top:15px;">
      <form action="selectRequestForm5.do" method="post" >
      <input type="hidden" value="${ConsVo.consid}" name="consid">
      <input type="submit" value="상담신청" class="btn">
      </form>
      </div>
      
      </div><!-- row 끝 -->
      
      <div class='row'>
      
      <div class='col-lg-1' ></div>
      <div class='col-lg-10' style="margin-top:20px;"><!-- 시공사 한줄소개 시작 -->
      ${ConsVo.consintroduction} <br>
      </div><!-- 시공사 한줄소개 끝 -->
      <div class='col-lg-1' ></div>
      
      </div><!-- row 끝 -->
      
      </a>
      </div><!-- 정보 구역 끝 -->
      <hr>
      
      </div><!-- col-lg-8 끝 -->
      
      </c:forEach>
      
      </div><!-- row 끝 -->
</div><!-- container 끝 -->





<!-- ------------------------------------------------------------------------------------------------------ -->
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
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>