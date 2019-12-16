<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 링크 추가 -->
<link rel="stylesheet" href="/css/bootstrap.css">

 		<!-- ================Header Menu Area ================= -->
       	<jsp:include page="../common/header.jsp" />
        <!--================Header Menu Area =================-->
<title>인테파크</title>
<%@ include file="../common/jscsspath.jsp" %>


<script type="text/javascript">
	/* 검색기능 */
	$(function(){
		showDiv();

		$("input[name=item]").on("change", function(){
				showDiv();
			});
		});

	function showDiv(){
		if($("input[name=item]").eq(0).is(":checked")){
			$("#titlediv").css("display", "block");
			$("#writerdiv").css("display", "none");
			}
		
		if($("input[name=item]").eq(1).is(":checked")){
			$("#titlediv").css("display", "none");
			$("#writerdiv").css("display", "block");
			}
		
		}



</script>

<style type="text/css">
	table {
			margin-top : 5px;
			margin-right : 5px;
			margin-bottom : 5px;
			margin-lwft : 5px;
		}
		
			
</style>


</head>
<body>

<br><br><br><br><br><br><br><br><br><br>

<h4 align="center">공지 사항 <%= ((java.util.ArrayList<com.c4.intepark.notice.model.vo.Notice>)request.getAttribute("list")).size() %> 개</h4>
<br>
<div class="container">
    <div class="row"> 
<table class="table table-striped table-hover">

<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>첨부파일</th>
	<th>작성날짜</th>
	<th>조회수</th>
</tr>
<c:forEach items="${ list }" var="n">
<tr>
	<th>${ n.noticeno }</th>
	<c:url var="ndt" value="/ndetail">
		<c:param name="no" value="${n.noticeno }" />
	</c:url>
	<td><a href="${ ndt }">${ n.noticetitle }</a></td>
	<td>${ n.writername }</td>
	<td align="center">
		<c:if test="${ !empty n.noticeoriginalfilename and n.noticeoriginalfilename ne 'null' }">
			◎
		</c:if>
		<c:if test="${ empty n.noticeoriginalfilename }">
			&nbsp;
		</c:if>
	</td>
	<td>${ n.noticedate } </td>
	<td>${n.noticecount }</td>
</tr>
</c:forEach>
</table>

<br>

<div ><a href="nlist.do" class="btn btn-success" style="float:left; margin-left:10px;">목록 이동</a></div> &nbsp;&nbsp;&nbsp;&nbsp;

<!-- 관리자 페이지 시에 추가 -->
<c:if
		test="${!empty sessionScope.loginUser and loginUser.userid eq 'admin' }">
	<!-- 관리자 접속시 글쓰기 추가 -->
		<div style="float:right; margin-right:150px;">
		<button onclick="callFunction();" class="btn btn-primary">새 공지사항 등록</button>
		</div>
</c:if>
<br> 



<br><br><br><br>

<div>
<form name="form1" method="post" action="list.do">

    <select name="search_option">
        <option value="user_id"
<c:if test="${map.search_option == 'user_id'}">selected</c:if>
   >작성자</option>

        <option value="title" 
<c:if test="${map.search_option == 'title'}">selected</c:if>
        >제목</option>

        <option value="content" 
<c:if test="${map.search_option == 'content'}">selected</c:if>
        >내용</option>

        <option value="all" 
<c:if test="${map.search_option == 'all'}">selected</c:if>
        >작성자+내용+제목</option>

    </select>
    <input name="keyword" value="${map.keyword}">
    <input type="submit" value="검색">
</form>
</div>











        




</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!--================ start footer Area  =================-->	
        <jsp:include page="../common/footer.jsp" />
<!--================ End footer Area  =================-->
</body>
</html>