<%@ page language="java" contentType="text/html; charset=UTF-8"
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
아 짜증 짜증 아아아아아아아아아아아아악!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
${cons.consid }
${cons.companyname }
${cons.consarea }

<c:if test="${empty cons.profilerenameimg}">
<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" width="100px" height="100px">
</c:if>
<c:if test="${!empty cons.profilerenameimg }">
<img src="${pageContext.request.contextPath }/resources/img/woosoo/${cons.profilerenameimg}" width="100px" height="100px">
</c:if>



</body>
</html>