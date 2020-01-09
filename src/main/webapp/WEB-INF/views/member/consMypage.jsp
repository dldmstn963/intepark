<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp"%>
</head>
<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="../common/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="col">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#aa">로그인정보</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#bb">개인정보수정</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#cc">비밀번호변경</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane fade show active" id="aa">
							<!-- 로그인정보 -->
							<br>
							<div class="x_content">
								<table class="table" style="text-align: center;">
									<tr>
										<th width="150px">이름</th>
										<td>${sessionScope.loginCons.consname}</td>
									</tr>
									<tr>
										<th>휴대폰번호</th>
										<td>${sessionScope.loginCons.phone}</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${sessionScope.loginCons.email}</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>${sessionScope.loginCons.address}</td>
									</tr>
									<tr>
										<th>상호명</th>
										<td>${sessionScope.loginCons.companyname}</td>
									</tr>
									<tr>
										<th>시공분야</th>
										<td>${sessionScope.loginCons.consarea}</td>
									</tr>
									<tr>
										<th>A/S기간</th>
										<td>${sessionScope.loginCons.asdate}</td>
									</tr>																		
									<tr>
										<th>경력</th>
										<td>${sessionScope.loginCons.career}</td>
									</tr>
									<tr>
										<th>업체소개</th>
										<td>${sessionScope.loginCons.consintroduction}</td>
									</tr>
									<tr>
										<th>프로필 사진</th>
										<td>${sessionScope.loginCons.address}</td>
									</tr>
									<tr>
										<th>사업자 등록증</th>
										<td>${sessionScope.loginCons.address}</td>
									</tr>																											
								</table>
							</div>
						</div>
						<!--로그인정보끝 -->
						<div class="tab-pane fade" id="bb">
							<!-- 개인정보수정 -->
							<br>
							<form action="insertUser6.do" id="userForm" method="post"
								onsubmit="return enrollCheck();">
								<table style="margin-left: 100px;">
									<tr style="height: 50px;">
										<th>이름* :</th>
										<td><input type="text" name="username"
											value="${sessionScope.loginUser.username}"
											class="form-control has-feedback-left" id="userName"
											maxlength="5" onkeyup="nameCheck(this);" required></td>
									</tr>
									<tr>
										<td colspan="3" id="nameCheck"></td>
									</tr>
									<tr style="height: 50px;">
										<th>휴대폰번호* :</th>
										<td><input type="tel" name="phone"
											value="${sessionScope.loginUser.phone}"
											class="form-control has-feedback-left" id="userPhone"
											onkeydown="telCheck(event,this)" maxlength="13" required></td>
									</tr>
									<tr>
										<td colspan="3" id="telcheck"></td>
									</tr>
									<tr style="height: 50px;">
										<th>이메일* :</th>
										<td><input type="email"
											value="${sessionScope.loginUser.email}"
											class="form-control has-feedback-left" id="uemail"
											name="email" onkeyup="eCheck(this)" required></td>
										<td>&nbsp;&nbsp;<input type="button"
											class="btn btn-primary" onclick="dcheckEmail()"
											value="이메일 중복체크"></td>
									</tr>
									<tr>
										<td colspan="3" id="emailcheck"></td>
									</tr>
									<tr>
										<th>주소 :</th>
										<th><input type="button"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text"
											class="form-control has-feedback-left" id="sample6_postcode"
											placeholder="우편번호" name="address1" readonly></td>
										<td><input type="text"
											class="form-control has-feedback-left" id="sample6_address"
											placeholder="주소" name="address2" readonly></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="text"
											class="form-control has-feedback-left"
											id="sample6_detailAddress" placeholder="상세주소" name="address3"></td>
										<td><input type="text"
											class="form-control has-feedback-left"
											id="sample6_extraAddress" placeholder="참고항목" name="address4"
											readonly></td>
									</tr>
									<tr>
										<td></td>
										<td style="text-align: center;"><input type="submit"
											class="btn btn-success" value="수정 완료"></td>
										<td></td>
									</tr>
								</table>
							</form>
						</div>
						<!-- 개인정보수정끝 -->
						<div class="tab-pane fade" id="cc">
							<br>
							<form action="insertUser6.do" id="userForm" method="post"
								onsubmit="return enrollCheck();">
								<table style="margin-left: 100px;">
									<tr style="height: 40px;">
										<th>사용중인 비밀번호* :</th>
										<td><input type="password"
											class="form-control has-feedback-left" id="userPwd"
											name="userpwd" onkeyup="pwdCheck(this)" maxlength="15"
											id="pwd" required></td>
									</tr>
									<tr>
										<td colspan="3" id="opwdcheck"></td>
									</tr>
									<tr style="height: 40px;">
										<th>변경 할 비밀번호* :</th>
										<td><input type="password"
											class="form-control has-feedback-left" id="userPwd"
											name="userpwd" onkeyup="pwdCheck(this)" maxlength="15"
											id="pwd" required></td>
									</tr>
									<tr>
										<td colspan="3" id="cpwdcheck"></td>
									</tr>
									<tr style="height: 40px;">
										<th>변경 할 비밀번호 확인* :</th>
										<td><input type="password"
											class="form-control has-feedback-left" id="userPwd2"
											onkeyup="pwd2dCheck(userPwd,this)" maxlength="15" required></td>
									</tr>
									<tr>
										<td colspan="3" id="cpwdcheck2"></td>
									</tr>
									<tr>
										<td></td>
										<td style="text-align: center;"><input type="submit"
											class="btn btn-success" value="변경 완료">&nbsp;&nbsp;</td>
										<td></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<!-- tab-content  -->
				</div>
				<!--col -->
			</div>
			<!-- col8 -->
			<div class="col-lg-2"></div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>