<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	</div><!-- 4 끝 -->
	

	<div class="col-lg-5"></div>
	
	
	<div class="col-lg-3" style="text-align:right;">
	<div style="display:inline-block;">
		<form action="selectMyReqList5.do" method="post" >
			<c:if test="${!empty sessionScope.loginCons }"><!-- 시공사이면 -->
				<input type="hidden" value="${sessionScope.loginCons.consid}" name="userid">
			</c:if>
			<c:if test="${!empty sessionScope.loginUser }"><!-- 고객이면 -->
				<input type="hidden" value="${sessionScope.loginUser.userid}" name="userid">
			</c:if>
			<button class="btn btn-success btn-sm" style="font:small-caption;">내 상담신청 내역</button>&nbsp;&nbsp;
		</form>	
	</div>
	
	<c:if test="${!empty sessionScope.loginCons }"><!-- 시공사로 로그인 했으면 보이기 -->
		<div style="display:inline-block;">	
			<form action="pfOne5.do" method="post" >
		    	<input type="hidden" value="${sessionScope.loginCons.consid}" name="consid">
				<button class="btn btn-success btn-sm" style="font:small-caption;">내 업체 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</form>
		</div>
	</c:if>
				
	</div><!-- 3 끝 -->
	
	
	</div><!-- row 끝 -->
	<br><br>
	
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	
	
	
	
	
	
	
	
	
	
	
	
    <div class="row" style="min-height:550px;">
    
      <c:forEach items="${ list }" var="ConsVo">
      	<c:if test="${ConsVo.consid ne sessionScope.loginCons.consid}"><!-- 로그인한 시공사 제외하고 출력 -->
      	
      <div class="col-lg-4">
      
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	    
		    <c:forEach items="${ pfPhotoList }" var="pfPhotoList">
		    	<c:if test="${ConsVo.consid eq pfPhotoList.consid && !empty pfPhotoList.pfrename }">
		    <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/portfolio_file/${pfPhotoList.pfrename}" width="300px" height="200px"></div>
		    	</c:if>
		    	<c:if test="${empty pfPhotoList.pfrename && ConsVo.consid eq pfPhotoList.consid}">
		    	<div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/portfolio_Noimage.png" width="300px" height="200px"></div>
		    	</c:if>
		    	
		    </c:forEach>
		    
		    
		    
	     
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
      
      <div class="row">
      <div class="col-lg-9" style="padding-left:40px; padding-top:13px;"><!-- 9 시작 (시공사 프로필사진, 업체명, 분야, 리뷰, 상담신청 버튼) -->
      
	      <c:if test="${empty ConsVo.profilerenameimg}">
	      	<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" class="img-circle" style="float:left; width:100px; height:100px;">
	      </c:if>
	      <c:if test="${!empty ConsVo.profilerenameimg }">
	      	<img src="${pageContext.request.contextPath }/resources/img/woosoo/${ConsVo.profilerenameimg}" class="img-circle" style="float:left; width:100px; height:100px;">
	      </c:if>
	      
	      <div style="display:inline-block; height:80px; margin-left:13px; margin-top:15px;">
	      	<span style="font-size:1.5em;">${ConsVo.companyname}</span><br>
	      	&nbsp;${ConsVo.consarea}&nbsp;&nbsp;&nbsp;
	      			<c:forEach items="${ rv }" var="rv">
	      					<c:if test="${ConsVo.consid eq rv.consid}">
	      							<span><img src="${pageContext.request.contextPath }/resources/img/woosoo/star_img.png" width="17px" height="17px">
	      									<strong>${rv.rvavg }</strong>&nbsp;&nbsp;리뷰&nbsp;${rv.count }
	      							</span>		
	      					</c:if>
	      			</c:forEach>
	      </div>	
	
      </div><!-- 9 끝 (시공사 프로필사진, 업체명, 분야, 리뷰, 상담신청 버튼) -->
      
      <div class="col-lg-3" style="padding-top:13px;">
	      <form action="selectRequestForm5.do" method="post" >
	      <input type="hidden" value="${ConsVo.consid}" name="consid">
	      <input type="submit" value="상담신청" class="btn">
	      </form>
      </div>
      
      </div><!-- row 끝 -->
      
      <div class="col-lg-12" style="margin-top:20px; padding-left:20px; padding-right:50px;"><!-- 시공사 한줄소개 시작 -->
      ${ConsVo.consintroduction} <br>
      </div><!-- 시공사 한줄소개 끝 -->
      
      
      </a>
      
      </div><!-- 정보 구역 끝 -->
      <hr>
      
      </div><!-- col-lg-8 끝 -->
      	</c:if>
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