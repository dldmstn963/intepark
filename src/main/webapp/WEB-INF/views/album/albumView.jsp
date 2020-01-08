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
 a:link { color: gray; text-decoration: none;}
 a:visited { color: gray; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
</style>
<script type="text/javascript">
function deleteReply(replyNo){
	var yn = confirm("정말로 삭제하시겠습니까?");
	if(yn==true)
	window.location.href="albumReplyDelete.do?page="+${page}+"&anum="+${album.albumnum}+"&replyno="+replyNo;
	return false;
}

function viewrreply(rreply,rrInput){
	if(rreply.style.display=="none"){
		rreply.style.display="";
	}else{
		rreply.style.display="none";
		rrInput.value="";
	}
	return false;
}

function updateReply(upreply){
	if(upreply.style.display=="none"){
		upreply.style.display="";
	}else{
		upreply.style.display="none";
	}
	return false;
}

function replySubmit(text){

	var textR = text.value;
	if(textR.length<1||text == null){
		alert("댓글을 작성하시고 등록하셔야 합니다.");
		return false;
	}
	return true;
}
</script>
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
       			<tr><td colspan="3"><c:out value="${album.albumcontents}" /></td></tr>
       		</table>
       		<!-- 댓글시작 -->
       		<div id="breply" style="border: 1px solid rgb(221,221,221); background-color:rgb(240,240,240);">
       			<h4 style="margin:5px"> &nbsp;&nbsp;댓글 ${requestScope.aReplyCount}개</h4>
       				<hr style="border-style:dotted;margin:5px">
       			<c:forEach var="areply" items="${requestScope.aReply}">
       				<div>
       					<c:forEach var="i" begin="1" end="${areply.albumreplygrouplayer }">
       						<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
       					</c:forEach>
       					<c:if test="${areply.albumreplydelete eq 'Y' }">
       					 &nbsp;&nbsp;삭제된 댓글입니다.
       					</c:if>
       					<c:if test="${areply.albumreplydelete eq 'N' }">&nbsp;&nbsp;
       					<c:if test="${areply.albumreplygrouplayer !=0 }">└</c:if>
       					  <p style="display:inline; font-size:15px"><strong><c:out value="${areply.userid}" /></strong></p>&nbsp; 
       					  <p style="display:inline; font-size:10px"><c:out value="${areply.albumreplydate}"/></p>&nbsp;
       					<c:set var="orino" value="${areply.albumreplyoriginalno}"/>
       					<c:if test="${areply.userid eq loginUser.userid}">
       						<a href="#" onclick="updateReply(rupdate${orino});"><i class="fa fa-pencil" aria-hidden="true"></i></a>
       						<a href="#" onclick="deleteReply(${orino});"><i class="fa fa-times" aria-hidden="true"></i></a>
       					</c:if>
						
						<a href="#" onclick="viewrreply(rrspan${orino},rr${orino});"><i class="fa fa-reply fa-rotate-180"></i></a>&nbsp;&nbsp;
						<br>
						<c:forEach var="i" begin="1" end="${areply.albumreplygrouplayer }">
       						<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
       					</c:forEach>
       					<c:if test="${areply.albumreplygrouplayer !=0 }">&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
       					&nbsp;&nbsp;
       					<c:out value="${areply.albumreplycontents }"></c:out>
       				</c:if>
       				</div>
       				<hr style="border-style:dotted;margin:5px">
       				<c:if test="${areply.albumreplydelete eq 'N' }">
       					<form action="albumRReplyWrite.do" method="post" onsubmit="return replySubmit(rr${orino});">
							<input type="hidden" name="albumreplygroupno" value="${areply.albumreplygroupno }">
							<input type="hidden" name="albumreplygrouporder" value="${areply.albumreplygrouporder }">
							<input type="hidden" name="albumreplygrouplayer" value="${areply.albumreplygrouplayer }">
							<input type="hidden" name="albumnum" value="${album.albumnum }">
       						<input type="hidden" name="page" value="${page}">
       						<input type="hidden" name="userid" value="${sessionScope.loginUser.userid}">
       						<div id="rrspan${orino}" style="display:none">
  							&nbsp;&nbsp;<input type="text" id="rr${orino}" style="width:500px;" name="albumreplycontents" placeholder="150자 이하의 댓글만 작성해주세요" maxlength="151">
  							<input type="submit" value="등록">	
  							<hr style="border-style:dotted;margin:5px">
       						</div>
						</form>
						<form action="albumReplyUpdate.do" method="post" onsubmit="return replySubmit(ru${orino});">
							<div id="rupdate${orino}" style="display:none">
       						<input type="hidden" name="albumnum" value="${album.albumnum }">
       						<input type="hidden" name="page" value="${page}">							
							<input type="hidden" name="albumreplyoriginalno" value="${orino}">
  							&nbsp;&nbsp;<input type="text" id="ru${orino}" style="width:500px;" name="albumreplycontents" value="${areply.albumreplycontents }" maxlength="151">
  							<input type="submit" value="등록">	
  							<hr style="border-style:dotted;margin:5px">
       						</div>
						</form>
					</c:if>	
       			</c:forEach>
       			<form action="albumReplyWrite.do" method="post" onsubmit="return replySubmit(oriReply);">
       				<input type="hidden" name="albumnum" value="${album.albumnum }">
       				<input type="hidden" name="page" value="${page}">
       				<input type="hidden" name="userid" value="${sessionScope.loginUser.userid}">
       				&nbsp;&nbsp;<input type="text" name="albumreplycontents" id="oriReply" placeholder="150자 이하의 댓글만 작성해주세요" style="width:500px" maxlength="151">
       				<input type="submit" value="등록">
       			</form>
       		</div>

		</div>
       	</div>
       	<Br>
       	
       	
       	
       	
    <!-- footer -->
        <jsp:include page="../common/footer.jsp" />      	
</body>
</html>