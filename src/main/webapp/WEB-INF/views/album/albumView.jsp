<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp" %>

</head>
<body>
 <!--================Header Menu Area =================-->
       	<jsp:include page="../common/header.jsp" />
       	<div class="container">
       	<div class="x_content">
       		<table class="table">
       			<tr><th>사진첩 <c:out value="${album.albumnum}" /></th>
       				<th style="text-align:center"><c:out value="${album.albumtitle}" /></th>
       				<th style="width:400px; text-align:right"><c:out value="${album.userid}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				<c:out value="${album.albumdate}" /></th>
       			</tr>
       			<tr><td colspan="3"><c:out value="${album.albumcontext }" /></td></tr>
       		</table>
		</div>
       	</div>
       	
       	
       	
       	
       	
    <!-- footer -->
        <jsp:include page="../common/footer.jsp" />      	
</body>
</html>