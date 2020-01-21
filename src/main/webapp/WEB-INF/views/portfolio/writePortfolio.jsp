<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writePortfolio</title>

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
		<form action="conslist5.do" method="post" onsubmit="return warning();">
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
	      		<form action="selectRequestList5.do" method="post" onsubmit="return warning2();">
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
		                <a class="nav-link" data-toggle="tab" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link active" data-toggle="tab" href="#bb">포트폴리오</a>
		              </li>
		              <!-- <li class="nav-item">
		                <a class="nav-link" data-toggle="tab" href="#cc">리뷰</a>
		              </li> -->
		            </ul>
		            
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
		            <div class="tab-content"><!-- 탭 컨테이너 시작 -->
		            
		            
	<!-- --------------------------------------------------------------소개글 탭 구역 시작---------------------------------------------------------------------- -->
		              <!-- <div class="tab-pane fade show active" id="aa">

		              </div> -->
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
  
	<!-- ------------------------------------------------------------포트폴리오 탭 구역 시작---------------------------------------------------------------------- -->	              
		              <div class="tab-pane fade show active" id="bb">
		              
		              
		              <!-- <form action="insertPF5.do" method="post" id="frm" name="frm" enctype="multipart/form-data"> -->
      						<input type="hidden" value="${cons.consid}" name="consid">
      						<button onclick="submitContents(this);" class="btn btn-success btn-sm" style="float:right; margin-top:5px; font:small-caption;">저장하기</button>
      						
      						<br>
      						<div class="row">
      						<div class="col-lg-5">
      						<h4 style="color:black;">&nbsp;포토폴리오 작성하기 (최대 10장)</h4>
      						</div><!-- 5 끝 -->
      						
      						<div class="col-lg-7">
      						<input type="text" name="pftitle" class="form-control" placeholder="포트폴리오 제목 (20자 이하)" >
      						</div><!-- 7 끝 -->
      						</div><!-- row 끝 -->
      						
      						<br>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
      						<div style="border:2px solid lightgray; border-radius: 5px; min-height:430px; padding:10px;">
      						 								
      								<div id="fileDiv"> 
			
      								<p>
	      								<input type="file" id="file" name="file_0">
	      								<input type="text" name="pfcoment" class="form-control" placeholder="포토 설명 (50자 이하) (선택사항 입니다.)" > 
	      								<a href="#this" class="btn" id="delete" name="delete">삭제</a>
	      							</p> 
	      							
      								</div> 
      								<br/><br/> 
      								<a href="#this" class="btn" id="addFile">파일 추가</a> 
      								<a href="#this" class="btn" id="write">작성하기</a> 
      								<a href="#this" class="btn" id="list">목록으로</a> 
      				

      							
      							
      							
      							
      						</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->      						

		                <!-- </form> -->
		              
		              
		              
		              </div>
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
			              
	<!-- ----------------------------------------------------------------리뷰 탭 구역 시작------------------------------------------------------------------------- -->	              
		              <!-- <div class="tab-pane fade" id="cc">
		                	작성구역          
		              </div> -->
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	            
		            
 
		            </div><!-- 탭 컨테이너 끝 -->
		            		            
		        </div><!-- 메인 col 끝 -->
		      </div><!-- 메인 row 끝 -->
		    </div><!-- 메인 컨테이너 끝 -->
		</div><!-- div 9 끝 -->
		
	</div><!-- row 끝 -->
</div><!-- 컨테이너 끝 -->

<script type="text/javascript"> 


var gfv_count = 1; 
var pfcoment_count = 1; 

$(document).ready(function(){ 
	$("#list").on("click", function(e){ //목록으로 버튼 
		e.preventDefault(); 
		fn_openBoardList(); 
		}); 
	$("#write").on("click", function(e){ //작성하기 버튼 
		e.preventDefault(); 
		fn_insertBoard(); 
		}); 
	$("#addFile").on("click", function(e){ //파일 추가 버튼 
		e.preventDefault(); 
		fn_addFile(); 
		}); 
	$("a[name='delete']").on("click", function(e){ //삭제 버튼 
		e.preventDefault(); 
		fn_deleteFile($(this)); 
		}); 
	}); 

function fn_openBoardList(){ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />"); 
	comSubmit.submit(); 
	} 
	function fn_insertBoard(){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/sample/insertBoard.do' />"); 
		comSubmit.submit(); 
		} 
	function fn_addFile(){ 
		var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><input type='text' name='pfcoment" +(pfcoment_count++)+"' class='form-control' placeholder='포토 설명 (50자 이하) (선택사항 입니다.)' ><a href='#this' class='btn' name='delete'>삭제</a></p>"; 
		$("#fileDiv").append(str); 
		$("a[name='delete']").on("click", function(e){ //삭제 버튼 
			e.preventDefault(); 
			fn_deleteFile($(this)); 
			}); 
		} 
	function fn_deleteFile(obj){ 
		obj.parent().remove(); 
		} 

</script>










<script type="text/javascript">

function warning(){
	if(confirm(" 저장하기를 버튼을 누르지 않으면 \n 변경된 내용이 저장되지 않습니다. \n 이대로 작성페이지를 나가시겠습니까?")){
		return true;
		}else{
		return false;	
			}
}
function warning2(){
	if(confirm(" 저장하기를 버튼을 누르지 않으면 \n 변경된 내용이 저장되지 않습니다. \n 이대로 작성페이지를 나가시겠습니까?")){
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