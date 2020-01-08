<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/jscsspath.jsp" %>
</head>
<body>
        <!--================Header Menu Area =================-->
       	<jsp:include page="../common/header.jsp" />
        <!--================Header Menu Area =================-->
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
		              
		              <input type="button" value="수정하기" class="btn btn-success btn-sm" style="float:right; margin-top:5px;">
		              
		              
		                <div style="overflow: auto; width:100%; padding-top:15px;">${cons.pfintroduction }</div>
		                <%-- <textarea class="form-control" rows="15">${cons.pfintroduction }</textarea> --%>

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
        <!--================ start footer Area  =================-->	
        <jsp:include page="../common/footer.jsp" />
		<!--================ End footer Area  =================-->
</body>
</html>