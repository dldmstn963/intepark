<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp" %>
<script type="text/javascript">

function albumWrite(){
	location.href="albumWrite6.do";
	return false;
};

</script>
</head>
<body>
        <!--================Header Menu Area =================-->
       	<jsp:include page="../common/header.jsp" />

      <section class="feature_area"><br>
      	<h1 align="center"> 인테리어 사진첩 </h1>
    	<div style="margin-right: 100px;"align="right">
			<form action="albumlist6.do" method="get">
				<select name="selectoption">
					<option value="title">제목</option>
					<option value="uname">작성자</option>
				</select>
				<input type="text" name="searchtext">
				<input type="submit" value="찾기">&nbsp;
			</form>
		</div><br>
        	<div class="container">
        		<div class="row feature_inner">
          	 		<c:forEach var="alist" items="${albumList}">
        				<div class="col-lg-4 col-md-6">
        					<div class="feature_item">
        						<img style="align:center; margin-left:15px; height:250px; width:250px;" alt="" src="${pageContext.request.contextPath }/resources/img/banner/banner.jpg">
        						<h4><c:out value="${alist.albumtitle}" /></h4>
        						<p><c:out value="${alist.albumdate}"></c:out></p>
        					</div>
        				</div>
        			</c:forEach>
        		</div>
        	</div><br><br>
        		<div align="center">
					<a href="albumlist6.do?page=1&selectoption=${selectoption}&searchtext=${searchtext}">|◁</a>&nbsp;
						<c:if test="${(commonPage.beginPage-commonPage.pageSize)<= 1}">
							<a href="albumlist6.do?page=1&selectoption=${selectoption}&searchtext=${searchtext}">◀◀</a>
						</c:if>
						<c:if test="${ (commonPage.beginPage-commonPage.pageSize) > 1}">
							<a href="albumlist6.do?page=${commonPage.beginPage-commonPage.pageSize}&selectoption=${selectoption}&searchtext=${searchtext}">◀◀</a>
						</c:if>&nbsp;
						<c:forEach var="p" begin="${commonPage.beginPage }" end="${commonPage.endPage }">
							<c:if test="${p == commonPage.currentPage }">
								<a href="albumlist6.do?page=${p}&selectoption=${selectoption}&searchtext=${searchtext}"><font color="red"><b>${p}</b></font></a>
							</c:if >
							<c:if test="${p != commonPage.currentPage }">
								<a href="albumlist6.do?page=${p }&selectoption=${selectoption}&searchtext=${searchtext}">${p }</a>
							</c:if>
						</c:forEach>&nbsp;
							<c:if test="${(commonPage.endPage+commonPage.pageSize) > commonPage.maxPage }">
								<a href="albumlist6.do?page=${commonPage.maxPage }&selectoption=${selectoption}&searchtext=${searchtext}">▶▶</a>
							</c:if>
							<c:if test="${(commonPage.endPage+commonPage.pageSize) <= commonPage.maxPage }">
								<a href="albumlist6.do?page=${commonPage.beginPage + commonPage.pageSize}&selectoption=${selectoption}&searchtext=${searchtext}">▶▶</a>
							</c:if>&nbsp; 
								<a href="albumlist6.do?page=${commonPage.maxPage }&selectoption=${selectoption}&searchtext=${searchtext}">▷|</a>
				</div>
				<div style="margin-right:100px;"align="right"> <button onclick="albumWrite();">작성하기</button></div><br>
        </section>
        <!-- footer -->
                <jsp:include page="../common/footer.jsp" />
</body>
</html>