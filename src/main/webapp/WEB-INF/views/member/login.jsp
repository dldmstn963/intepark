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
		var error = '${requestScope.message}';
		if (error != "" && error != null)
			alert(error);
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
							<form action="userlogCheck6.do" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-fw"></i></span> <input class="form-control"
										type="text" name="userid" placeholder="Id">
								</div>
								<h6></h6>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-key fa-fw"></i></span> <input class="form-control"
										type="password" name="userpwd" placeholder="Password">
								</div>
								<input class="btn"
									style="margin-top: 5px; margin-bottom: 5px; width: 100%;"
									type="submit" value="로그인">
							</form>
							<button class="btn" style="margin-bottom: 5px; width: 100%;"
								onclick="location.href='userenroll6.do'">일반 회원가입</button>
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=b85c92c001cadbd03510bbc4f0a84ff5&redirect_uri=http://localhost:8280/intepark/login6.do&response_type=code">
							<img src="/intepark/resources/img/kakaoLogin.png" height="40px" width="100%"/></a>
						</div>
						<!-- 고객로그인 끝 -->
						<div class="tab-pane fade" id="bb">
							<br>
							<form action="conslogCheck6.do" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-fw"></i></span> <input class="form-control"
										type="text" name="consid" placeholder="Id">
								</div>
								<h6></h6>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-key fa-fw"></i></span> <input class="form-control"
										type="password" name="conspwd" placeholder="Password">
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