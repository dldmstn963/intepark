<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp" %>
<script type="text/javascript">
window.onload=function(){
	var error = '${requestScope.message}';
	if(error != "" && error != null)
	alert(error);
};
function viewUserLogin(){
	var userlog = document.getElementById("user");
	var conslog = document.getElementById("cons");
	conslog.style.display="none";
	userlog.style.display="";
	return false;
}
function viewConsLogin(){
	var userlog = document.getElementById("user");
	var conslog = document.getElementById("cons");
	userlog.style.display="none";
	conslog.style.display="";
	return false;
}
</script>
</head>
<body>
<div style="text-align:center">
<span><a href="main.do"><img src="/intepark/resources/img/favicon.ico" height="150" width="150"></a><br>
</span>
<button onclick="viewUserLogin();">고객 로그인</button>
<button onclick="viewConsLogin();">시공사 로그인</button><br>

<div id="user" style="display:;">
<h2> 고객 로그인 </h2>
<form action="userlogCheck6.do" method="post">
<input style="margin: 5px; width:250px;"type="text" name="userid" placeholder="아이디" ><br>
<input style="margin-bottom : 5px; width:250px;" type="password" name="userpwd" placeholder="비밀번호"><br>
<input type="submit" value="로그인">
</form>
<button>일반 회원가입</button>
<h4>카카오로 로그인</h4>
</div>

<div id="cons" style="display:none;">
<h2> 시공사 로그인 </h2>
<form action="conslogCheck6.do" method="post">
<input style="margin: 5px; width:250px;" type="text" name="consid" placeholder="아이디"><br>
<input style="margin-bottom : 5px; width:250px;" type="password" name="conspwd" placeholder="비밀번호"><br>
<input type="submit" value="로그인">
</form>
<button>시공사 회원가입</button>
</div>
</div>
</body>
</html>