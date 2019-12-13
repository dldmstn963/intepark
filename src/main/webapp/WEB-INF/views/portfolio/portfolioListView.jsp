<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioListView.jsp</title>
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
    
      <c:forEach items="${ list }" var="ConsVo">
      
      <div class="col-lg-4">
      
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	    <%-- <c:forEach items="${ list }" var="i"> --%>
	      <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/img-1.jpg" width="300" height="150"></div>
	      <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/img-2.jpg" width="300px" height="150px"></div>
	     <%--  </c:forEach> --%>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	  </div>

      </div><!-- col-lg-4 끝 -->
      
      <div class="col-lg-8">
      
      <div width="100%" height="200px"><!-- 정보 구역 시작 -->
      <c:if test="${empty ConsVo.profilerenameimg}">
      	<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" width="100" height="100">
      </c:if>
      <c:if test="${!empty ConsVo.profilerenameimg }">
      	${ConsVo.profilerenameimg}
      </c:if>
      &nbsp;&nbsp; ${ConsVo.companyname} <br>
      ${ConsVo.consarea} <br>
      ${ConsVo.consintroduction} <br>
      
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