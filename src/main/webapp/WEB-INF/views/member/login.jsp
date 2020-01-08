<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp"%>
<script type="text/javascript">
	window.onload = function() {
		var error = '${requestScope.message}';
		if (error != "" && error != null)
			alert(error);
	};
	//<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('f75de983ee0c68ebaa09cc06af9b2993');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
      

        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    }

  //]]>
	
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
							<a id="custom-login-btn" href="javascript:loginWithKakao()">
							<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" height="45px" width="100%"/></a>
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