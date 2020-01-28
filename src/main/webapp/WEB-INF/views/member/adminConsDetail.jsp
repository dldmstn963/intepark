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
function sochange(sltag,intag){
	if(sltag.value=="기타"){
		intag.style.display="";
		intag.setAttribute("required",true);
	}else{
		intag.style.display="none";
	intag.removeAttribute("required");
	}
	return false;
}

function adConsList(){
	location.href='${pageContext.request.contextPath }/admin/consList6.do';
	return false;
}

function consApproval(){
	var consid= '${cons.consid}';
	if(confirm("정말 승인하시겠습니까?"))
		location.href='${pageContext.request.contextPath }/admin/consApproval6.do?consid='+consid;
	return false;
}
function consRefuse(){
	var consid= '${cons.consid}';
	if(confirm("정말 거부하시겠습니까? \n거부 시 시공사가 다시 가입을 해야지만 승인 하실 수 있습니다."))
		location.href='${pageContext.request.contextPath }/admin/consRefuse6.do?consid='+consid;
	return false;
}
</script>
</head>
<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="../common/header.jsp" />
	<!--================Header Menu Area =================-->
	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="x_content">
					<h2 align="center">
						<strong>시공사 관리</strong>
					</h2>
					<div style="margin: 7px; text-align: right;">
					<c:if test="${cons.memberstate ne '대기' }">
						<c:if test="${cons.memberstate eq '정상'}">
							<button data-target="#layerpop" data-toggle="modal"
								data-backdrop="static" class="btn">정지</button>
						&nbsp;
					</c:if>
						<c:if test="${cons.memberstate eq '정지'}">
								<button data-target="#layerpop2" data-toggle="modal"
								data-backdrop="static" class="btn">정지해제</button>
						&nbsp;
					</c:if>
						<button data-target="#layerpop3" data-toggle="modal"
								data-backdrop="static" class="btn">정지기록</button>
						&nbsp;
					</c:if>
					<c:if test="${cons.memberstate eq '대기' }">
						<button class="btn" onclick="consApproval();">승인</button>&nbsp;
						<button class="btn" onclick="consRefuse();">거부</button>&nbsp;						
					</c:if>
						<button class="btn" onclick="adConsList();">목록</button>
					</div>
					<table class="table" style="text-align: center;">
						<tr>
							<th width="150px">아이디</th>
							<td>${cons.consid}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${cons.consname}</td>
						</tr>
						<tr>
							<th>포인트</th>
							<td>${cons.restpoint}</td>
						</tr>
						<tr>
							<th>가입날짜</th>
							<td>${cons.enrolldate}</td>
						</tr>						
						<tr>
							<th>전화번호</th>
							<td>${cons.phone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${cons.consemail}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${cons.address}</td>
						</tr>
						<tr>
							<th>상호명</th>
							<td>${cons.companyname}</td>
						</tr>
						<tr>
							<th>시공분야</th>
							<td>${cons.consarea}</td>
						</tr>
						<tr>
							<th>A/S기간</th>
							<td>${cons.asdate}</td>
						</tr>
						<tr>
							<th>경력</th>
							<td>${cons.career}</td>
						</tr>
						<tr>
							<th>한줄소개글</th>
							<td>${cons.consintroduction}</td>
						</tr>																								
						<tr>
							<th>현재상태</th>
							<td>${cons.memberstate}</td>
						</tr>
						<tr>
							<th>탈퇴날짜</th>
							<td>${cons.withdrawdate}</td>
						</tr>
						<tr>
							<th>탈퇴사유</th>
							<td>${cons.withdrawcause}</td>
						</tr>
					</table>
				</div>
				<br>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>

	<!-- --------------------------------------------------모달 정지시키기 구역1---------------------------------------- -->
	<div class="modal fade" id="layerpop" style="padding-top: 20px;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
					<!-- header title -->
					<div class="container">
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<h2 style="margin-bottom: 0;">
									<strong>시공사 정지</strong>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- body -->
				<form action="${pageContext.request.contextPath }/admin/memberLetStop.do" method="post">
				<div class="modal-body" style="height: 300px;">
						<input type="hidden" name="logid" value="${requestScope.cons.consid}">
						<input type="hidden" name="memberCheck" value="cons">
						<table style="text-align: center; width: 100%;">
							<tr>
								<th><h4>
										<strong>정지 위치(게시판,댓글번호 등)</strong>
									</h4></th>
							</tr>
							<tr>
								<td><textarea rows="2" cols="27" name="stoptarget" required></textarea></td>
							</tr>
							<tr>
								<th><h4><strong>정지 사유</strong></h4></th>
							</tr>
							<tr>
								<td><select name="stopcause" style="width:200px;" onchange="sochange(this,etc)">
										<option value="글 도배">글 도배</option>
										<option value="부적절한 글">부적절한 글</option>
										<option value="불법 광고">불법 광고</option>
										<option value="기타">기타</option>
								</select></td>
							</tr>
							<tr><td><input type="text" id="etc" name="etc" placeholder="기타 사유를 적어주세요" maxlength="33" style="display:none; width:200px; margin:10px;">
							</td></tr>
							<tr>
								<th><h4><strong>정지 기한</strong></h4></th></tr>
								<tr>
								<td><input type="number" name="sdate" min="1" max="100" value="1" style="height:22px; width:95px;">&nbsp;&nbsp;
								<select name="dmy" style="height:22px; width:95px;">
										<option value="day">일</option>
										<option value="month">개월</option>
										<option value="year">년</option>
								</select></td>
							</tr>
						</table>
						</div>
					<div class="modal-footer">	
					<input type="submit" 
						style="width: 50%;" value="확인">&nbsp;
						</form>
					<button type="button" data-dismiss="modal"
						style="display:inline-block; width: 50%;">취소</button>
					</div>		
					
				<!-- Footer -->

			</div>
		</div>
	</div>
<!-- --------------------------------------------------모달 구역1끝---------------------------------------- -->
<!-- --------------------------------------------------모달 정지해제 구역2---------------------------------------- -->
	<div class="modal fade" id="layerpop2" style="padding-top: 20px;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
					<!-- header title -->
					<div class="container">
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<h2 style="margin-bottom: 0;">
									<strong>정지 해제</strong>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- body -->
				<form action="${pageContext.request.contextPath }/admin/memberStopRemove.do" method="post">
				<div class="modal-body" style="height: 300px;">
						<input type="hidden" name="logid" value="${requestScope.cons.consid}">
						<input type="hidden" name="memberCheck" value="cons">
						<table style="text-align: center; width: 100%;">
							<tr>
								<th><h4>
										<strong>정지 해제 사유</strong>
									</h4></th>
							</tr>
							<tr>
								<td><textarea rows="2" cols="27" name="stopremove" required></textarea></td>
							</tr>
							</table>
						</div>
					<div class="modal-footer">	
					<input type="submit" 
						style="width: 50%;" value="확인">&nbsp;
						</form>
					<button type="button" data-dismiss="modal"
						style="display:inline-block; width: 50%;">취소</button>
					</div>		
					
				<!-- Footer -->

			</div>
		</div>
	</div>
<!-- --------------------------------------------------모달 구역2끝---------------------------------------- -->

<!-- --------------------------------------------------모달 정지내역 구역2---------------------------------------- -->
	<div class="modal fade" id="layerpop3" style="padding-top: 20px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
					<!-- header title -->
					<div class="container">
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<h2 style="margin-bottom: 0;">
									<strong>시공사 정지내역</strong>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- body -->
				<div class="modal-body" style="height: 300px;">
						<table style="text-align: center; width: 100%;">
							<tr><th>번호</th><th>정지 위치</th><th>정지 사유</th><th>정지 날짜</th><th>정지 기간</th><th>정지 해제 사유</th></tr>
							<c:forEach var="ustop" items="${consStop}" varStatus="index">
								<tr><td>${index.count}.</td><td>${ustop.stoptarget }</td><td>${ustop.stopcause}</td>
								<td>${ustop.stopstartdate}~${ustop.stopfinishdate}</td>
								<td>${ustop.stopterm}</td>
								<td><c:if test="${!empty ustop.stopremove}">${ustop.stopremove}</c:if>
								</td>
								</tr>
							</c:forEach>
						</table>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="width: 100%;">확인</button>
				</div>
			</div>
		</div>
	</div>

	<!--================ start footer Area  =================-->
	<jsp:include page="../common/footer.jsp" />
	<!--================ End footer Area  =================-->
</body>
</html>