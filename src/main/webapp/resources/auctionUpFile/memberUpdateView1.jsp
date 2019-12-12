<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- <%@ page import="member.model.vo.Member" %>    
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String[] hobbies = loginMember.getHobby().split(",");
	String[] check = new String[9];
	
	for(String value : hobbies){
		switch(value){
		case "game": check[0] = "checked";  break;
		case "climb": check[1] = "checked";  break;
		case "reading": check[2] = "checked";  break;
		case "music": check[3] = "checked";  break;
		case "sport": check[4] = "checked";  break;
		case "movie": check[5] = "checked";  break;
		case "cook": check[6] = "checked";  break;
		case "travle": check[7] = "checked";  break;
		case "etc": check[8] = "checked";  break;
		}
	}
%>  --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
<h1 align="center"><%-- <%= loginMember.getUserName() %> --%>
${ sessionScope.loginMember.userName } 님 가입정보 수정페이지</h1>
<br>
<form action="/first/mup" method="post">
<%-- <table align="center" width="600" cellspacing="0" cellpadding="5" border="1">
<tr><th>이 름 *</th><td><input type="text" name="username" id="username" value="<%= loginMember.getUserName() %>"></td></tr>
<tr><th>아이디 *</th><td><input type="text" name="userid" id="userid" readonly value="<%= loginMember.getUserId() %>"> &nbsp; 
<button onclick="return checkId();">중복체크</button></td></tr>
<tr><th>암 호 *</th><td><input type="password" name="userpwd" id="userpwd"  value="<%= loginMember.getUserPwd() %>"></td></tr>
<tr><th>암호확인 *</th><td><input type="password" id="userpwd2"></td></tr>
<tr><th>성 별 *</th>
<td>
<%  if(loginMember.getGender().equals("M") == true){ %>
	<input type="radio" name="gender" value="M" checked> 남자 &nbsp; 
	<input type="radio" name="gender" value="F"> 여자 
<% }else{ %>
	<input type="radio" name="gender" value="M"> 남자 &nbsp; 
	<input type="radio" name="gender" value="F" checked> 여자
<% } %>
</td></tr>
<tr><th>나 이 *</th><td><input type="number" name="age" min="19" max="150"  value="<%= loginMember.getAge() %>"></td></tr>
<tr><th>전화번호</th><td><input type="tel" name="phone"  value="<%= loginMember.getPhone() %>"></td></tr>
<tr><th>이메일</th><td><input type="email" name="email" value="<%= loginMember.getEmail() %>"></td></tr>
<tr><th>취 미</th>
<td>
	<table width="300">
	<tr><td><input type="checkbox" name="hobby" value="game" <%= check[0] %>> 게임하기</td>
	   <td><input type="checkbox" name="hobby" value="climb" <%= check[1] %>> 등산</td>
	   <td><input type="checkbox" name="hobby" value="reading" <%= check[2] %>> 독서</td></tr>
	<tr><td><input type="checkbox" name="hobby" value="music" <%= check[3] %>> 음악듣기</td>
	   <td><input type="checkbox" name="hobby" value="sport" <%= check[4] %>> 운동</td>
	   <td><input type="checkbox" name="hobby" value="movie" <%= check[5] %>> 영화보기</td></tr>
	<tr><td><input type="checkbox" name="hobby" value="cook" <%= check[6] %>> 요리하기</td>
	   <td><input type="checkbox" name="hobby" value="travle" <%= check[7] %>> 여행</td>
	   <td><input type="checkbox" name="hobby" value="etc" <%= check[8] %>> 기타</td></tr>
	</table>
</td></tr>
<tr><th>하고 싶은 말</th><td><textarea name="etc" cols="60" rows="5"><%= loginMember.getEtc() %></textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="수정하기"> &nbsp; 
	<input type="reset" value="작성취소"> &nbsp;
	<a href="javascript:history.go(-1);">이전 페이지로 이동</a>
</th></tr>
</table> --%>
<table align="center" width="600" cellspacing="0" cellpadding="5" border="1">
<tr><th>이 름 *</th><td><input type="text" name="username" id="username" value="${ loginMember.userName }"></td></tr>
<tr><th>아이디 *</th><td><input type="text" name="userid" id="userid" readonly value="${ loginMember.userId }"> &nbsp; 
<button onclick="return checkId();">중복체크</button></td></tr>
<tr><th>암 호 *</th><td><input type="password" name="userpwd" id="userpwd"  value="${ loginMember.userPwd }"></td></tr>
<tr><th>암호확인 *</th><td><input type="password" id="userpwd2"></td></tr>
<tr><th>성 별 *</th>
<td>
<c:if test="${ sessionScope.loginMember.gender eq 'M' }">
	<input type="radio" name="gender" value="M" checked> 남자 &nbsp; 
	<input type="radio" name="gender" value="F"> 여자 
</c:if>
<c:if test="${ sessionScope.loginMember.gender eq 'F' }">
	<input type="radio" name="gender" value="M"> 남자 &nbsp; 
	<input type="radio" name="gender" value="F" checked> 여자
</c:if>
</td></tr>
<tr><th>나 이 *</th><td><input type="number" name="age" min="19" max="150"  value="${ loginMember.age }"></td></tr>
<tr><th>전화번호</th><td><input type="tel" name="phone"  value="${ loginMember.phone }"></td></tr>
<tr><th>이메일</th><td><input type="email" name="email" value="${ loginMember.email }"></td></tr>
<tr><th>취 미</th>
<td>
	<c:forTokens var="hobby" items="${ loginMember.hobby }" delims=",">
		<c:if test="${ hobby eq 'game' }"><c:set var="check0" value="checked" /></c:if>
		<c:if test="${ hobby eq 'climb' }"><c:set var="check1" value="checked" /></c:if>
		<c:if test="${ hobby eq 'reading' }"><c:set var="check2" value="checked" /></c:if>
		<c:if test="${ hobby eq 'music' }"><c:set var="check3" value="checked" /></c:if>
		<c:if test="${ hobby eq 'sport' }"><c:set var="check4" value="checked" /></c:if>
		<c:if test="${ hobby eq 'movie' }"><c:set var="check5" value="checked" /></c:if>
		<c:if test="${ hobby eq 'cook' }"><c:set var="check6" value="checked" /></c:if>
		<c:if test="${ hobby eq 'travle' }"><c:set var="check7" value="checked" /></c:if>
		<c:if test="${ hobby eq 'etc' }"><c:set var="check8" value="checked" /></c:if>
	</c:forTokens>
	<table width="300">
	<tr><td><input type="checkbox" name="hobby" value="game" ${ check0 }> 게임하기</td>
	   <td><input type="checkbox" name="hobby" value="climb" ${ check1 }> 등산</td>
	   <td><input type="checkbox" name="hobby" value="reading" ${ check2 }> 독서</td></tr>
	<tr><td><input type="checkbox" name="hobby" value="music" ${ check3 }> 음악듣기</td>
	   <td><input type="checkbox" name="hobby" value="sport" ${ check4 }> 운동</td>
	   <td><input type="checkbox" name="hobby" value="movie" ${ check5 }> 영화보기</td></tr>
	<tr><td><input type="checkbox" name="hobby" value="cook" ${ check6 }> 요리하기</td>
	   <td><input type="checkbox" name="hobby" value="travle" ${ check7 }> 여행</td>
	   <td><input type="checkbox" name="hobby" value="etc" ${ check8 }> 기타</td></tr>
	</table>
</td></tr>
<tr><th>하고 싶은 말</th><td><textarea name="etc" cols="60" rows="5">${ loginMember.etc }</textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="수정하기"> &nbsp; 
	<input type="reset" value="작성취소"> &nbsp;
	<a href="javascript:history.go(-1);">이전 페이지로 이동</a>
</th></tr>
</table>
</form>
</body>
</html>