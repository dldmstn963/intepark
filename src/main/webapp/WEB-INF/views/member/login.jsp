<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function viewUserLogin(){
	var userlog = document.getElementById("user");
	var conslog = document.getElementById("cons");
	conslog.style.display="none";
	userlog.style.display="";

}
function viewConsLogin(){
	var userlog = document.getElementById("user");
	var conslog = document.getElementById("cons");
	userlog.style.display="none";
	conslog.style.display="";
}
</script>
</head>
<body>
<div>
<a href="main.do"><img src="/intepark/resources/img/favicon.ico"></a><br>
<button onclick="viewUserLogin();">고객 로그인</button>
<button onclick="viewConsLogin();">시공사 로그인</button><br>
</div>
<div id="user" style="display:; align:center">
<h2> 고객 로그인 </h2>
<form action="userlogCheck6.do" method="post">
아이디 : <input type="text" name="userid"><br>
비밀번호 : <input type="password" name="userpwd">
<input type="submit" value="로그인">
</form>
</div>
<div id="cons" style="display:none; align:center">
<h2> 시공사 로그인 </h2>
<form action="conslogCheck6.do" method="post">
아이디 : <input type="text" name="userid"><br>
비밀번호 : <input type="password" name="userpwd">
<input type="submit" value="로그인">
</form>
</div>

</body>
</html>