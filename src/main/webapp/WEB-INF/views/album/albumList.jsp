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

      <section class="feature_area"><br>
      <h1 align="center"> 인테리어 사진첩 </h1><br>
      
        	<div class="container">
        	
        		<div class="row feature_inner">
        			<div class="col-lg-4 col-md-6">
        				<div class="feature_item">
        				<img style="align:center; margin-left:15px; " alt="" src="${pageContext.request.contextPath }/resources/img/blog/c1.jpg" height="250">
        					<h4>Expert Technicians</h4>
        					<p>Usage of the Internet is becoming more common due to rapid advancement of technology and power.</p>
        				</div>
        			</div>
        		</div>
        		
        	</div>
        </section>
</body>
</html>