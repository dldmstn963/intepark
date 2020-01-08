<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioDetailView</title>

<style type="text/css">
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}
.span1{
	border-radius: 70px; 
	background-color:#F2F2F2; 
	text-align:center; 
	padding-left:5px;
	padding-right:5px;
	padding-top:2px;
	padding-bottom:2px;
	
}

</style>

<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->

<div class="container">
	<div class="row">
		
		<div class="col-lg-3" style="height:650px;">
		
		<div class="col-lg-12" style="margin-left:10px; margin-top:100px;"><!-- 프로필 이미지 -->
		<c:if test="${empty cons.profilerenameimg}">
		<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" width="100px" height="100px">
		</c:if>
		<c:if test="${!empty cons.profilerenameimg }">
		<img src="${pageContext.request.contextPath }/resources/img/woosoo/${cons.profilerenameimg}" width="100px" height="100px">
		</c:if>
		</div>
		
		<div class="col-lg-12" style="margin-top:15px;"><h3>${cons.companyname }</h3></div><!-- 업체명 -->
		<div class="col-lg-12">${cons.consarea }</div><!-- 업체시공분야 -->
		
		<div class="col-lg-12" style="margin-top:3px;">
			<c:if test="${rv.count != 0}"><!-- 별점이 있을때 -->
					<span class="star-prototype">${rv.rvavg }</span>&nbsp; ${rv.count }개&nbsp;
							<a href="<c:url value='/selectReviewForm5.do?consid=${cons.consid }'/>" style="color:black;">
									<h6 style="color:#01A9DB; display:inline"><strong>리뷰쓰기</strong></h6></a>
			</c:if>
			
			<c:if test="${rv.count == 0}"><!-- 별점이 없을때 -->
				<span class="star-prototype">${rv.rvavg }</span>&nbsp;
							<a href="<c:url value='/selectReviewForm5.do?consid=${cons.consid }'/>" style="color:black;">
									<h6 style="color:#01A9DB; display:inline"><strong>첫리뷰쓰기</strong></h6></a>
			</c:if>
		</div>
		
		<div class='col-lg-12' style="margin-top:7px;">
			<div class="form-group">
      		<form action="selectRequestForm5.do" method="post" >
      		<input type="hidden" value="${cons.consid}" name="consid">
      		<input type="submit" value="상담신청" class="form-control btn-primary">
      		</form>
      		</div>
		</div><!-- 상담신청 버튼 div 12 끝 -->
		
		<div class="col-lg-12"><strong>주소</strong>&nbsp;&nbsp;&nbsp;${cons.address }</div>
		<div class="col-lg-12"><strong>경력</strong>&nbsp;&nbsp;&nbsp;${cons.career }</div>
		<div class="col-lg-12"><strong>&nbsp;A/S</strong>&nbsp;&nbsp;&nbsp;${cons.asdate }</div>
		
		
		</div><!-- div 3 끝 -->
		
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->		
		
		<div class="col-lg-9">
			<div class="container">
		      <div class="row">
		        <div class="col">
		        
		            <ul class="nav nav-tabs">
		              <li class="nav-item">
		                <a class="nav-link active" data-toggle="tab" href="#aa">소개글</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" data-toggle="tab" href="#bb">포트폴리오</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" data-toggle="tab" href="#cc">리뷰</a>
		              </li>
		            </ul>
		            
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
		            <div class="tab-content"><!-- 탭 컨테이너 시작 -->
		            
		            
	<!-- --------------------------------------------------------------소개글 탭 구역 시작---------------------------------------------------------------------- -->
		              <div class="tab-pane fade show active" id="aa">
		              
		              	<c:if test="${cons.consid eq sessionScope.loginCons.consid }"> 
		              	<form action="writeIntroductionForm5.do" method="post" >
      						<input type="hidden" value="${cons.consid}" name="consid">
      						<button class="btn btn-success btn-sm" style="float:right; margin-top:5px; font:small-caption;">수정하기</button>
      					</form>
      					</c:if>
      					
      					<c:if test="${empty cons.pfintroduction }">
      					<div style="width:100%; padding-top:15px;"><br><br><h3 style="text-align:center;">작성된 소개글이 없습니다.</h3></div>
      					</c:if>
		                <br><div style="width:100%; padding-top:15px;">${cons.pfintroduction }</div>

		              </div>
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
  
	<!-- ------------------------------------------------------------포트폴리오 탭 구역 시작---------------------------------------------------------------------- -->	              
		              <div class="tab-pane fade" id="bb">
		              <br>
		                <div class="container">
		              		<div class="row"> 
		              			<div class="col-lg-12">safsdafsaf</div>
		              			<div class="col-lg-12">safsdafsaf</div>
		              			<div class="col-lg-12">safsdafsaf</div>
		              		 		<hr>
		              		 </div>
		                	</div>
		               
		                
		                
		              </div>
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
			              
	<!-- ----------------------------------------------------------------리뷰 탭 구역 시작------------------------------------------------------------------------- -->	              
		              <div class="tab-pane fade" id="cc">
		              	<br>
		              			
		              			
		              	<c:forEach items="${review }" var="review">
		              		<div style="width:100%;">
		              		 		
		              		 <div class="row">
								<div class="col-lg-8" style="margin-bottom:10px; padding-left:30px;">
									<img src="${pageContext.request.contextPath }/resources/img/woosoo/reviewUser_img.png" style="float:left; width:60px; height:60px;">
									<div style="display:inline-block; margin-left:10px; margin-top:8px;">
										<h4 style="color:black;">${review.userid }</h4>
										<strong>평점 [ </strong><span class="star-prototype">${review.rvavg }</span><strong> ]</strong>&nbsp;&nbsp;작성일 : ${review.rvdate }
									</div>
								</div><!-- 8 끝 -->
									
								<div class="col-lg-4" style="padding-top:5px;">
									<c:if test="${review.userid eq sessionScope.loginCons.consid || review.userid eq sessionScope.loginUser.userid}">
									    <div style="display:inline-block;">
								            <!-- <form action="#" method="post" > -->
						      				<input type="hidden" value="${cons.consid}" name="consid">
						      				<button class="btn btn-success btn-sm" style="font:small-caption;">수정하기</button>&nbsp;
						      				<!-- </form> -->
					      				</div>
					      				<div style="display:inline-block;">
					      					<!-- <form action="#" method="post" > -->
					      					<input type="hidden" value="${cons.consid}" name="consid">
					      					<button class="btn btn-success btn-sm" style="font:small-caption;">삭제하기</button>
					      					<!-- </form> -->
					      				</div>
					      			</c:if>
								</div><!-- 4 끝 -->
							</div><!-- row 끝 -->
									
		              		<div class="col-lg-12">
		              		 	<span class="span1"><strong>${review.rvperiod } 작업</strong></span>&nbsp;
		              		 	<span class="span1"><strong>${review.rvregion }</strong></span>&nbsp;
		              		 	<span class="span1"><strong>${review.rvbuildingtype }</strong></span>&nbsp;
		              		 	<span class="span1"><strong>${review.rvarea }</strong></span>&nbsp;
		              		 	<span class="span1"><strong>${review.rvspacious }</strong></span>&nbsp;
		              		 	<span class="span1"><strong>${review.rvprice2 }</strong></span>
		              		</div>
		              		 		
		              		<div class="col-lg-12" style="margin-top:5px;">
		              		 	<strong>친절도</strong>&nbsp;<span class="star-prototype">${review.rvkind }</span>&nbsp;&nbsp;
		              		 	<strong>가격</strong>&nbsp;<span class="star-prototype">${review.rvprice }</span>&nbsp;&nbsp;
		              		 	<strong>퀄리티</strong>&nbsp;<span class="star-prototype">${review.rvquality }</span>&nbsp;&nbsp;
		              		 	<strong>전문성</strong>&nbsp;<span class="star-prototype">${review.rvprofessional }</span>&nbsp;&nbsp;
		              		 	<strong>책임감</strong>&nbsp;<span class="star-prototype">${review.rvresponsible }</span>
		              		</div>
		              		 		
		              		<div class="col-lg-12" style="margin-top:5px; padding-right:50px;">
		              		 	<pre style="white-space: pre-wrap; font-family:sans-serif;">${review.rvcritique }</pre>
		              		 </div>
		              		 		
		              		 <hr size="3">
		              		</div>
		              	</c:forEach>
		              	
			              	<c:if test="${rv.count == 0 }">
	      						<div style="width:100%; padding-top:15px;"><br><br>
	      						<h3 style="text-align:center;">아직 리뷰가 없습니다.  첫 번째 리뷰를 작성해 주세요!</h3>
	      						</div>
	      					</c:if>
      							
		              </div>
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	            
		            
 
		            </div><!-- 탭 컨테이너 끝 -->
		            		            
		        </div><!-- 메인 col 끝 -->
		      </div><!-- 메인 row 끝 -->
		    </div><!-- 메인 컨테이너 끝 -->
		</div><!-- div 9 끝 -->
		
	</div><!-- row 끝 -->
</div><!-- 컨테이너 끝 -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">

$.fn.generateStars = function() {
	return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};

	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
	
</script>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>