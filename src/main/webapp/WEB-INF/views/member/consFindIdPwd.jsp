<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp"%>
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
							data-toggle="tab" href="#aa">시공사 아이디 찾기</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#bb">시공사 비밀번호 찾기</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane fade show active" id="aa">
							<br>
							<form action="findUserId.do" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-fw"></i></span> <input class="form-control"
										type="text" name="username" placeholder="UserName">
								</div>
								<h6></h6>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope-o fa-fw"></i></span> <input
										class="form-control" type="email" name="email"
										placeholder="Email">
								</div>
								<input class="btn"
									style="margin-top: 5px; margin-bottom: 5px; width: 100%;"
									type="submit" value="조회">
							</form>
						</div>

						<!-- 고객로그인 끝 -->
						<div class="tab-pane fade" id="bb">
							<br>
							<form action="findUserPwd.do" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-fw"></i></span> <input class="form-control"
										type="text" name="userid" placeholder="UserId">
								</div>
								<h6></h6>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope-o fa-fw"></i></span> <input
										class="form-control" type="email" name="email"
										placeholder="Email">
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