<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioDetailView</title>
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->

<div class="container">
	<div class="row">
		
		
		<div class="col-lg-3" style="margin-top:100px;">
		
		<div class="col-lg-12" style="margin-left:10px;">
		<c:if test="${empty cons.profilerenameimg}">
		<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" width="100px" height="100px">
		</c:if>
		<c:if test="${!empty cons.profilerenameimg }">
		<img src="${pageContext.request.contextPath }/resources/img/woosoo/${cons.profilerenameimg}" width="100px" height="100px">
		</c:if>
		</div><!-- 프로필 이미지 div 12 끝 -->
		
		<div class="col-lg-12" style="margin-top:15px;"><h3>${cons.companyname }</h3></div>
		<div class="col-lg-12">${cons.consarea }</div>
		
		
		<div class='col-lg-12' style="margin-top:15px;">
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
		            
		            
		            <div class="tab-content">
		              <div class="tab-pane fade show active" id="aa"><!-- 소개글 탭 구역 시작 -->
		              
		              <input type="button" value="수정하기" class="btn btn-success btn-sm">
		              
		              <button type="button" class="btn btn-success btn-xs">저장하기</button>
		              
		                <div style="overflow: auto; width:100%;">${cons.pfintroduction }</div>
		                
		                
		                
		                
		                
		                
		              </div><!-- 소개글 탭 구역 끝 -->
		              
		              
		              
		              
		              
		              
		              
		              
		              
		              
		              
		              
		              
		              <div class="tab-pane fade" id="bb">
		                <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
		              </div>
		              <div class="tab-pane fade" id="cc">
		                <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
		              </div>
		            </div>
		            
		            
		            
		            
		        </div><!-- 메인 col 끝 -->
		      </div><!-- 메인 row 끝 -->
		    </div><!-- 메인 컨테이너 끝 -->
		    
		</div><!-- div 9 끝 -->
		
		
		
		
	</div><!-- row 끝 -->
</div><!-- 컨테이너 끝 -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
<jsp:include page="../common/footer.jsp" />
</body>
</html> --%>