<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMyReqListView</title>
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
	<br><br>
<!-- ----------------------------------------------상단 컨테이너 끝------------------------------------------------------------------------------------------------------------------------------- -->	



    <div class="row" style="min-height:550px;">
    	<div class="col-lg-1"></div><!-- col-lg-1 끝 -->
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->      
      	<div class="col-lg-10">
      	
      		<c:if test="${!empty reqlist}">
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
	
      	
      	</div><!-- col-lg-10 끝 -->
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->     	
      	<div class="col-lg-1"></div><!-- col-lg-1 끝 -->

	</div><!-- row 끝 -->
	
</div><!-- container 끝 -->
		
		






<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>