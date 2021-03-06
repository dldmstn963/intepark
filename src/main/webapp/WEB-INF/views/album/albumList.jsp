<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp" %>
<style type="text/css">
.feature_item {
		width:315px;
		padding: 20px 20px 20px 20px;
}
.feature_item h4{
		font-size:22px;
		margin-bottom:0px;
}
</style>
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
				<select style="height:30px;"name="selectoption">
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
        					<p style="display:inline-block;align:left;">&nbsp;&nbsp;&nbsp;&nbsp;NO : <c:out value="${alist.albumnum }"/>
        					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        					조회수 : <c:out value="${alist.albumreadcount }"/></p>
        						<a href="albumView.do?anum=${alist.albumnum }&page=${commonPage.currentPage}">
        						<img style="align:center; margin-left:15px; margin-bottom:10px; height:250px; width:250px;"
        						src="${pageContext.request.contextPath }/resources/albumImgs/${alist.albumimgroot}/${alist.albumrenameimgname}">
        						<h4 align="center"><c:out value="${alist.albumtitle}" /></h4></a>
        						<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${alist.albumdate}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						&nbsp;&nbsp;&nbsp;&nbsp;
        						작성자 : <c:out value="${alist.userid}" /></p>
        					</div>
        				</div>
        			</c:forEach>
        		</div>
        	</div><br><br>

        		
      
     
   
        		<nav aria-label="..." style="text-align: center">
        		 <ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="albumlist6.do?page=1&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}">|◁</a></li>
						<c:if test="${(commonPage.beginPage-commonPage.pageSize)<= 1}">
							<li class="page-item"><a class="page-link" href="albumlist6.do?page=1&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}"><i class="fa fa-backward" aria-hidden="true"></i></a></li>
						</c:if>
						<c:if test="${ (commonPage.beginPage-commonPage.pageSize) > 1}">
							<li class="page-item"><a class="page-link" href="albumlist6.do?page=${commonPage.beginPage-commonPage.pageSize}&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}"><i class="fa fa-backward" aria-hidden="true"></i></a></li>
						</c:if>
						<c:forEach var="p" begin="${commonPage.beginPage }" end="${commonPage.endPage }">
							<c:if test="${p == commonPage.currentPage }">
								<li class="page-item active"><a class="page-link" href="albumlist6.do?page=${p}&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}">${p}</a></li>
							</c:if >
							<c:if test="${p != commonPage.currentPage }">
								<li class="page-item"><a class="page-link" href="albumlist6.do?page=${p }&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}"  >${p}</a></li>
							</c:if>
						</c:forEach>
							<c:if test="${(commonPage.endPage+commonPage.pageSize) > commonPage.maxPage }">
								<li class="page-item"><a class="page-link" href="albumlist6.do?page=${commonPage.maxPage }&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}"><i class="fa fa-forward" aria-hidden="true"></i></a></li>
							</c:if>
							<c:if test="${(commonPage.endPage+commonPage.pageSize) <= commonPage.maxPage }">
								<li class="page-item"><a class="page-link" href="albumlist6.do?page=${commonPage.beginPage + commonPage.pageSize}&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}"><i class="fa fa-forward" aria-hidden="true"></i></a></li>
							</c:if>
								<li class="page-item"><a class="page-link" href="albumlist6.do?page=${commonPage.maxPage }&selectoption=${commonPage.selectoption}&searchtext=${commonPage.searchtext}">▷|</a></li>
					</ul>
				</nav>
				<c:if test="${!empty sessionScope.loginUser and (sessionScope.loginUser.userid ne 'admin')}">
				<div style="margin-right:100px;"align="right"> <button class="btn" onclick="albumWrite();">작성하기</button></div>
				</c:if>
				<br>
        </section>
        <!-- footer -->
                <jsp:include page="../common/footer.jsp" />
</body>
</html>