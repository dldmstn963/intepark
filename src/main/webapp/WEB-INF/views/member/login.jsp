<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp"%>
<script type="text/javascript">
	window.onload = function() {
		var error1 = '${error1}';
		var error2 = '${error2}';
		var error3 = '${error3}';
		var error4 = '${error4}';
		var error5 = '${error5}';
		if (error1 != "" && error1 != null)
			alert(error1);
		if (error2 != "" && error2 != null)
			alert(error2);
		if (error3 != "" && error3 != null)
			alert(error3+'\n'+error4+'\n'+error5);
	};
</script>
</head>
<body>
	<div class="container">

		<div style="text-align: center">
			<a href="main.do"><img src="/intepark/resources/img/favicon.ico"
				height="150" width="150"></a><br>
		</div>
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="col">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#aa">고객 로그인</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#bb">시공사 로그인</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="aa">
							<br>
							<form name="f" action="/intepark/login" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-fw"></i></span> <input class="form-control"
										type="text" name="username" placeholder="Id">
								</div>
								<h6></h6>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-key fa-fw"></i></span> <input class="form-control"
										type="password" name="password" placeholder="Password">
								</div>
								<input class="btn"
									style="margin-top: 5px; margin-bottom: 5px; width: 100%;"
									type="submit" value="로그인">
							</form>
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=b85c92c001cadbd03510bbc4f0a84ff5&redirect_uri=http://localhost:8280/intepark/login6.do&response_type=code">
							<img src="/intepark/resources/img/kakaoLogin.png" height="40px" width="100%"/></a>
							<div style="width: 100%;">
							<span style="float:left;">
							<a href="#" onclick="location.href='userenroll6.do'"><font size="2pt" color="gray">고객 회원가입</font></a>
							</span>
							<span style="float: right;">
							<a href="#" style="margin-bottom: 5px; align:right;"
								onclick="location.href='userFindIdPwd.do'"><font size=2pt" color="gray">아이디/비밀번호 찾기</font></a>	
							</span>
							</div>
						</div>
						<!-- 고객로그인 끝 -->
						<div class="tab-pane fade" id="bb">
							<br>
							<form name="f" action="/intepark/login" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-fw"></i></span> <input class="form-control"
										type="text" name="username" placeholder="Id">
								</div>
								<h6></h6>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-key fa-fw"></i></span> <input class="form-control"
										type="password" name="password" placeholder="Password">
								</div>
								<input class="btn"
									style="margin-top: 5px; margin-bottom: 5px; width: 100%;"
									type="submit" value="로그인">
							</form>
							<button class="btn" style="margin-bottom: 5px; width: 100%;"
								onclick="location.href='consenroll6.do'">시공사 회원가입</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>