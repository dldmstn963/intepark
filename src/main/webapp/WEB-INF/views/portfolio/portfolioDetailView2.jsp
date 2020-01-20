<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioDetailView2</title>

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
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->

<div class="container">

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
		                <a class="nav-link" data-toggle="tab" href="#aa">소개글</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link active" data-toggle="tab" href="#bb">포트폴리오</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" data-toggle="tab" href="#cc">리뷰</a>
		              </li>
		            </ul>
		            
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
		            <div class="tab-content"><!-- 탭 컨테이너 시작 -->
		            
		            
	<!-- --------------------------------------------------------------소개글 탭 구역 시작---------------------------------------------------------------------- -->
		              <div class="tab-pane fade" id="aa">
		              
		              	<c:if test="${cons.consid eq sessionScope.loginCons.consid }"> 
		              	<form action="writeIntroductionForm5.do" method="post" >
      						<input type="hidden" value="${cons.consid}" name="consid">
      						<button class="btn btn-success btn-sm" style="float:right; margin-top:5px; font:small-caption;">수정하기</button>
      					</form>
      					</c:if>
      					
      					<c:if test="${empty cons.pfintroduction }">
      					<div style="width:100%; padding-top:15px;"><br><br><br>
      					<h3 style="text-align:center;">작성된 소개글이 없습니다.</h3></div>
      					</c:if>
		                <div style="width:100%; padding-top:20px;">${cons.pfintroduction }</div>

		              </div>
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
  
	<!-- ------------------------------------------------------------포트폴리오 탭 구역 시작---------------------------------------------------------------------- -->	              
		              <div class="tab-pane fade show active" id="bb">
		              
		              	<c:if test="${cons.consid eq sessionScope.loginCons.consid }"> 
		              	<form action="writePF_Form5.do" method="post" >
      						<input type="hidden" value="${cons.consid}" name="consid">
      						<button class="btn btn-success btn-sm" style="float:right; margin-top:5px; font:small-caption;">작성하기</button>
      					</form>
      					<br>
      					</c:if>
      					
      					<br>
      					<c:if test="${!empty pfOneList }">	
		              		<div class="row">
		              		
		              		 	<c:forEach items="${pfOneList }" var="pfOneList">
		              			<div class="col-lg-4">
		              			<form action="selectPfOne5.do" method="post" name="hi">
		              			<input type="hidden" value="${pfOneList.consid }" name="consid">
		              			<input type="hidden" value="${pfOneList.pfnum }" name="pfnum">
		              			<img src="${pageContext.request.contextPath }/resources/portfolio_file/${pfOneList.pfrename}" onclick="document.forms['hi'].submit();"class="pf_img" style="width:250px; height:200px;">
		              			</form>
		              			<p style="margin-bottom:0px;">${pfOneList.pftitle }</p>
		              			</div>
		              			</c:forEach>
		              			
		              		</div><!-- row 끝 -->
		              	</c:if>	
		             
		               <c:if test="${empty pfOneList }">
	      						<div style="width:100%; padding-top:15px;"><br><br>
	      						<h3 style="text-align:center;">작성된 포트폴리오가 없습니다.</h3>
	      						</div>
	      				</c:if>
		                
		                
		              </div>
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
			              
	<!-- ----------------------------------------------------------------리뷰 탭 구역 시작------------------------------------------------------------------------- -->	              
		              <div class="tab-pane fade" id="cc">
		              	<br>
		              			
		              	<div class='bigPictureWrapper'><div class='bigPicture'></div>	</div>
		              			
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
					      					<form action="deleteReview5.do" method="post" >
					      					<input type="hidden" value="${review.rvnum}" name="rvnum">
					      					<input type="hidden" value="${review.consid}" name="consid">
					      					<button class="btn btn-success btn-sm" style="font:small-caption;" onclick="return checkDelete();">삭제하기</button>
					      					</form>
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
		              		 
		              		<div class="col-lg-12" style="margin-top:5px; padding-right:50px;"> 
		              		
		              			
		              		<c:forEach items="${ rvFile }" var="rvFile">
	      						<c:if test="${review.rvnum eq rvFile.rvnum}">
	      								<img src=" ${pageContext.request.contextPath }/resources/review_file/${rvFile.rvrename}" style="width: 100px; height: 100px;">
	      						</c:if>
	      					</c:forEach>
	      					
		              		</div><!-- 12 이미지 구역 끝 -->
		              		
		              		 		
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
<script type="text/javascript">

$(document).ready(function (e){
	
	$(document).on("click","img",function(){
		var path = $(this).attr('src')
		showImage(path);
		return false;
	});//end click event
	
	function showImage(fileCallPath){
	    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='"+fileCallPath+"' >")
	    .animate({width:'100%', height: '100%'}, 1000);
	    
	  }//end fileCallPath
	  
	$(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 0);
	    return false;
	  });//end bigWrapperClick event
});


</script>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">
//리뷰삭제시 알러트 메세지
function checkDelete(){
	if(confirm(" 정말로 리뷰를 삭제하시겠습니까?")){
		return true;
		}else{
		return false;	
		}
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