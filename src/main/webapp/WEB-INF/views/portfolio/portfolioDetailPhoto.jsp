<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioDetailPhoto</title>

<style type="text/css">
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url("${pageContext.request.contextPath }/resources/img/woosoo/starAvg.img.png") 0 -16px repeat-x;    
    					/*별 그림이 안뜨면 url 주소를 한번 방문해 주세요 (http://i.imgur.com/YsyS5y8.png) */
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


.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top:0%;
	width:100%;
	height:100%;
	background-color: gray; 
	z-index: 100;
	background:rgba(255,255,255,0.5);
}
.bigPicture {
	position: relative;
	display:flex;
	justify-content: center;
	align-items: center;
}
.bigPicture img {
	width:600px;
}


.pf_img{
	border-radius: 5px;
	margin-bottom:7px;
}

</style>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/swiper.min.css">

<style type="text/css">
  <!-- Demo styles -->
  	/* html, body {
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
      width: 80%;
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
      padding-bottom:60px;
    }
   
.coment{
	width:100%;
	position:absolute;
	top:430px;
}    
</style>
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->

<div class="container">
<br>
	<div class="row">
	
	<div class="col-lg-9"></div><!-- 9 끝 -->
	
	<div class="col-lg-3" style="text-align:right;">
	<div style="display:inline-block;">
		<form action="conslist5.do" method="post" >
			<button class="btn btn-success btn-sm" style="font:small-caption;">목록으로</button>&nbsp;&nbsp;
		</form>	
	</div>
					
	</div><!-- 3 끝 -->
	
	</div><!-- row 끝 -->
	
	
	
	<div class="row" style="min-height:600px;">
		
		<div class="col-lg-3">
		
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
		
			<span class="star-prototype">${rv.rvavg }</span>&nbsp; <c:if test="${rv.count != 0 }">${rv.count }개&nbsp;</c:if>
			
				<c:if test="${rv.count != 0 && cons.consid ne sessionScope.loginCons.consid}"><!-- 별점이 있으면서 해당시공사가 아닐경우 -->
						<a href="<c:url value='/selectReviewForm5.do?consid=${cons.consid }'/>" style="color:black;">
							<h6 style="color:#01A9DB; display:inline"><strong>리뷰쓰기</strong></h6></a>
				</c:if>
			
				<c:if test="${rv.count == 0 && cons.consid ne sessionScope.loginCons.consid}"><!-- 별점이 없으면서 해당시공사가 아닐경우 -->
						<a href="<c:url value='/selectReviewForm5.do?consid=${cons.consid }'/>" style="color:black;">
							<h6 style="color:#01A9DB; display:inline"><strong>첫리뷰쓰기</strong></h6></a>
				</c:if>
		</div>
		
		<c:if test="${cons.consid eq sessionScope.loginCons.consid }"><!-- 해당 시공사 로그인시 -->
			<div class='col-lg-12' style="margin-top:7px;">
				<div class="form-group">
	      		<form action="selectRequestList5.do" method="post" >
	      		<input type="hidden" value="${cons.consid}" name="consid">
	      		<input type="submit" value="상담신청 내역조회" class="form-control btn-primary">
	      		</form>
	      		</div>
			</div>
		</c:if>
		
		<c:if test="${cons.consid ne sessionScope.loginCons.consid }"><!-- 해당 시공사가 아닐경우 -->
			<div class='col-lg-12' style="margin-top:7px;">
				<div class="form-group">
	      		<form action="selectRequestForm5.do" method="post" >
	      		<input type="hidden" value="${cons.consid}" name="consid">
	      		<input type="submit" value="상담신청" class="form-control btn-primary">
	      		</form>
	      		</div>
			</div>
		</c:if>
		
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
		                <a class="nav-link" data-toggle="tab" onclick="so('${consid}');">소개글</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link active" data-toggle="tab" href="#bb">포트폴리오</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" data-toggle="tab" onclick="re('${consid}');">리뷰</a>
		              </li>
		            </ul>
		            
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
		            <div class="tab-content"><!-- 탭 컨테이너 시작 -->
		            
		            
	<!-- --------------------------------------------------------------소개글 탭 구역 시작---------------------------------------------------------------------- -->
		              <%-- <div class="tab-pane fade" id="aa">
		              </div> --%>
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
  
	<!-- ------------------------------------------------------------포트폴리오 탭 구역 시작---------------------------------------------------------------------- -->	              
		              <div class="tab-pane fade show active" id="bb">
      					<br>
      					
      					<!-- Swiper -->
					  <div class="swiper-container">
					    <div class="swiper-wrapper">
					    		    
						    <c:forEach items="${ pfOne }" var="pfOne">
						    <div class="swiper-slide">
						    <img src="${pageContext.request.contextPath }/resources/portfolio_file/${pfOne.pfrename}" width="80%" height="420px" title="${pfOne.pfcoment}">
						    <div class="coment">
						    ${pfOne.pfcoment}
						    </div>
						    </div>
						    </c:forEach>

					    </div>
					    <!-- Add Pagination -->
					    <div class="swiper-pagination" style="bottom: 80px;"></div>
					    <!-- Add Arrows -->
					    <div class="swiper-button-next" style="margin-right:30px;"></div>
					    <div class="swiper-button-prev" style="margin-left:30px;"></div>
					  </div>
					  
					  <div class="row">
					  <div class="col-lg-4"></div>
					  
					  <div class="col-lg-7" style="padding-left:70px;">
					  <c:if test="${cons.consid eq sessionScope.loginCons.consid }"> 
					  <div style="display:inline-block;">
      						<input type="hidden" value="${cons.consid}" name="consid">
      						<button class="btn btn-success btn-sm" style="font:small-caption;" onclick="location.href='updatePFView5.do?consid=${cons.consid}&pfnum=${pfnum}'">수정하기</button>
					  </div>
					  <div style="display:inline-block;">
      						<input type="hidden" value="${cons.consid}" name="consid">
      						<input type="hidden" value="${pfnum}" name="pfnum">
      						<button class="btn btn-danger btn-sm" style="font:small-caption;" onclick="pfdelete('${cons.consid}','${pfnum}');">삭제하기</button>
      				  </div>
      				  </c:if>
      				  </div><!-- 7 끝 -->
      				  
      				  <div class="col-lg-1">
      						<button class="btn btn-success btn-sm" style="font:small-caption;" onclick="pfclose('${cons.consid}');">닫기</button>
      				  </div><!-- 1 끝 -->
      				  </div><!-- row 끝 -->
		                
		              </div><!-- bb탭구역 끝 -->
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
			              
	<!-- ----------------------------------------------------------------리뷰 탭 구역 시작------------------------------------------------------------------------- -->	              
		              <%-- <div class="tab-pane fade" id="cc">
		              </div> --%>
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	            
		            
 
		            </div><!-- 탭 컨테이너 끝 -->
		            		            
		        </div><!-- 메인 col 끝 -->
		      </div><!-- 메인 row 끝 -->
		    </div><!-- 메인 컨테이너 끝 -->
		</div><!-- div 9 끝 -->
		
	</div><!-- row 끝 -->
</div><!-- 컨테이너 끝 -->

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
<script type="text/javascript">
//소개글 클릭시
function so(consid){
	location.href = "pfOne5.do?consid="+consid;
}

//리뷰 클릭시
function re(consid){
	location.href = "pfOne5.do?consid="+consid+"&message="+'review';
}

//포트폴리오 삭제시 알러트 메세지
function pfdelete(consid, pfnum){
	if(!confirm(" 포트폴리오를 정말로 삭제하시겠습니까?"))
		return false;	
	location.href = "deletePfOne5.do?consid="+consid+"&pfnum="+pfnum;
}

//포트폴리오 닫기시
function pfclose(consid){	
	location.href = "pfOne5.do?consid="+consid+"&message="+'portfolio';
}




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