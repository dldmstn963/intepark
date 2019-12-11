<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioListView.jsp</title>
 <style type="text/css">
  html, body {
   width: 100%; height: 100%; 
} 
</style>
<%@ include file="../common/jscsspath.jsp" %>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div style="height:70%; width:100%;">
<!-- --------------------------------------------------------------------- -->

<div class="container">
    <div class="row">
      <div class="col-lg-12">
      
      <c:forEach items="${ list }" var="pfList">
      ${pfList.companyname} <br>
      ${pfList.consarea} <br>
      <c:if test="${empty pfList.profilerenameimg}">
      	<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" width="100" height="100"><br>
      </c:if>
      <c:if test="${!empty pfList.profilerenameimg }">
      	${pfList.profilerenameimg} <br>
      </c:if>
      ${pfList.consintroduction} <br>
      ${pfList.pfphotonum }<br>
      <hr>
      </c:forEach>
     
      
      </div>
      </div><!-- row 끝 -->
</div><!-- container 끝 -->




<!-- --------------------------------------------------------------------- -->
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>