<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestListView</title>

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
		<img src="${pageContext.request.contextPath }/resources/consProfileImgs/${cons.profilerenameimg}" width="100px" height="100px">
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
	      		<form action="pfOne5.do" method="post" >
	      		<input type="hidden" value="${sessionScope.loginCons.consid}" name="consid">
	      		<input type="submit" value="내 업체 보기" class="form-control btn-primary">
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
		
			<c:if test="${!empty reqlist }">
				<table class="table table-hover">
  					<thead class="thead-light">
   						 <tr><h4 align="center">상담신청 내역</h4></tr>
					     <tr style="text-align:center;">
					     <th>번호</th>
					     <th>상담신청날짜</th>
					     <th>고객이름</th>
					     <th>고객전화번호</th>
					     <th>시공지역</th>
					     <th>시공분야</th>
					     <th>시공예산</th>
					     </tr>
					
					<tbody>
					  <c:forEach items="${ reqlist }" var="reqlist">
					    <tr style="text-align:center;">
					      <th><c:out value="${reqlist.reqnum}" /></th>
					      <th scope="row">${ reqlist.reqdate }</th>
					      <td>${reqlist.reqname }</td>
					   	  <td>${reqlist.reqphone}</td> 
					      <td>${reqlist.reqregion }</td>
					      <td>${reqlist.reqarea }</td>
					      <td>${reqlist.reqbudget }</td>
					   </tr>
					 </c:forEach>        
				  </tbody>

				</thead>
			</table>
		</c:if>	
			
			<c:if test="${empty reqlist }">
	      	<div style="width:100%; padding-top:15px;"><br><br>
	      		 <h3 style="text-align:center;">상담 신청 내역이 없습니다.</h3>
	      	</div>
	    	</c:if>		
			
			
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