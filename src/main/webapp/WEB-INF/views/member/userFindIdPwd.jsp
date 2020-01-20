<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp"%>
<script type="text/javascript">
window.onload = function() {
	var message = '${message}';

	if (message != "" && message != null)
		alert(message);
}	
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
				<H2 align="center">이메일로 계정 찾기</H2>
				<div class="col">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#aa">고객 아이디 찾기</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#bb">고객 비밀번호 찾기</a></li>
					</ul>
					<!--아이디 찾기 -->
					<div class="tab-content">
						<div class="tab-pane fade show active" id="aa">
							<br>
							<form action="findUserId.do" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-fw"></i></span> <input class="form-control"
										type="text" name="username" placeholder="이름을 작성해주세요.">
								</div>
								<h6></h6>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope-o fa-fw"></i></span> <input
										class="form-control" type="email" name="useremail"
										placeholder="이메일을 작성해주세요.">
								</div>
								<input class="btn"
									style="margin-top: 5px; margin-bottom: 5px; width: 100%;"
									type="submit" value="조회">
							</form>
						</div>

						<!-- 고객로그인 끝 -->
						<div class="tab-pane fade" id="bb">
							<br>
							<form action="findPwd.do" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-fw"></i></span> <input class="form-control"
										type="text" name="logid" placeholder="아이디를 작성해주세요.">
								</div>
								<h6></h6>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope-o fa-fw"></i></span> <input
										class="form-control" type="email" name="email"
										placeholder="이메일을 작성해주세요.">
								</div>
								<input class="btn"
									style="margin-top: 5px; margin-bottom: 5px; width: 100%;"
									type="submit" value="조회">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>