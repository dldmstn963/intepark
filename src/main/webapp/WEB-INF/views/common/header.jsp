<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테파크</title>
<link rel="stylesheet" href="/intepark/resources/css/font.css">
<style type="text/css">
.header_area{
	background:#FFFFFF;
	position:fixed;
}
</style>


<script>
var ws;
var text;
var user;
var cons;
var chatno;

if(ws == undefined && sessionStorage){
	ws = new WebSocket("ws://localhost:8333/intepark/echo.do");
}
/* 서버로 메세지 보낼때 */
ws.onopen = function(){

	};

/* 서버로부터 받은 메세지 보내주기 */
ws.onmessage = function(message){
	console.log(message.data);
	var cut = message.data.split("/");
	if(cut[0] == "check"){
		for(var i=1; i < cut.length; i++){
			var id = "#"+cut[i];
			console.log(id);
			$(id).bind("click", false);
			$(id).attr("title", "상대가 접속중이 아닙니다.");
		}
	}else{
		console.log("성공" + message.data + "님이 상담신청하셨습니다.");
		console.log(message.data);
		var msg = message.data.split("/");
		cons = msg[0];
		user = msg[1];
		chatno = msg[2];	
		test(user,cons,chatno);
	}
	
	};

/* 서버 닫힐때 */
ws.onclose = function(event){

	};

function chatopen(chatno){
	window.open("chat3.do?chatno="+chatno, "chat"+chatno , "width=450, height=700");
}

function test(user){
	console.log("작동확인");
	
	text = "<div>"+user+"님이 상담신청 하셨습니다. <br> 수락하시겠습니까?<br>" +
		"<button class='select' onclick='accept(" + chatno + ");chatopen(" + chatno + ")'>확인</button>" +
		"&nbsp;&nbsp;<button class='select' onclick='refuse(" + chatno + ")'>취소</button></div>" +
		"<input type='hidden' id='"+chatno+"' value='"+chatno+"'>";
	$("#alarm").html($("#alarm").html() + text);
	alarm();
}

function alarm(){
	var size = $("#alarm").children().length;
	console.log(size);
	if(size > 1){
		$("#alarm").children("span").remove();
		console.log(1);
	}else{
		$("#alarm").html("<span>현재 메세지가 없습니다.</span>");
		console.log(2);
	}
}

function accept(data){
	ws.send("accept/" + $("#cons").val() + "/" + data);
	return data;
}

function refuse(data){
	ws.send("refuse/" + $("#cons").val() + "/" + data);
	return data;
}

	$(function(){
	$(document).on("click", ".select", function(){
		$(this).closest("div").remove();
		console.log("성공");
		alarm();
		
		return false;		
	});

	/* $(document).on("click", "#accept", function(){
		ws.send("accept/" + $("#cons").val() + "/" + chatno);
	});
	$(document).on("click", "#refuse", function(){
		ws.send("refuse/" + $("#cons").val() + "/" + chatno);
	});	 */
});


</script>



</head>
<body>

	<header class="header_area">
		<div class="main_menu">
		<!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 --><!-- 미접속 -->
			<c:if test="${empty sessionScope.loginCons and empty sessionScope.loginUser }">
				<div align="right" style="position: absolute; z-index: 1; top: 10px; right: 10px;">
					<a href="login6.do"><b style="color: blue;">로그인/회원가입</b></a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620" style="margin: 300">
						<!--  Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="${pageContext.request.contextPath }/main.do"><img
							src="/intepark/resources/img/logo.png" alt=""></a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset"
							id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item"><a class="nav-link" href="moveTdMake.do">3D디자인 만들기</a></li>
								       <li class="nav-item submenu dropdown">
                           <a class="nav-link" href="auctionList2.do" role="button" aria-haspopup="true">견적리스트</a> <!-- data-toggle="dropdown" 메뉴네비게이션 클릭안되게 막기 -->
                           <ul class="dropdown-menu" style="margin:-30px -30px -30px -10px;">
                              <li class="nav-item"><a class="nav-link" href="nonAuction2.do">경매신청</a></li>
                              <li class="nav-item"><a class="nav-link" href="auctionList2.do">전체 견적리스트</a></li>
                           </ul>
                        </li> 
								<li class="nav-item"><a class="nav-link" href="conslist5.do">시공사 리스트</a></li>
								<li class="nav-item"><a class="nav-link" href="albumlist6.do">인테리어 게시판</a></li>
								<li class="nav-item"><a class="nav-link" href="moveshop4.do">쇼핑몰</a></li>
								<li class="nav-item"><a class="nav-link" href="nlist1.do">공지사항</a></li>
			</c:if>
			
			<!-- 고객 접속시 --><!-- 고객 접속시 --><!-- 고객 접속시 --><!-- 고객 접속시 --><!-- 고객 접속시 -->
			<c:if test="${!empty sessionScope.loginUser and loginUser.userid ne 'admin'}">			
				<div align="right" style="position: absolute; z-index: 1; top: 10px; right: 10px;">
					<a href="${pageContext.request.contextPath }/logout"><b style="color: blue;">로그아웃</b></a>
				</div>	
					<nav class="navbar navbar-expand-lg navbar-light">
						<div class="container box_1620" style="margin: 300">
							<!--  Brand and toggle get grouped for better mobile display -->
							<a class="navbar-brand logo_h" href="${pageContext.request.contextPath }/main.do"><img
								src="/intepark/resources/img/logo.png" alt=""></a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse offset"
								id="navbarSupportedContent">
								<ul class="nav navbar-nav menu_nav ml-auto">
									<li class="nav-item"><a class="nav-link" href="moveTdMake.do">3D디자인 만들기</a></li>
										      <li class="nav-item submenu dropdown">
                           <a class="nav-link" href="auctionList2.do" role="button" aria-haspopup="true">견적리스트</a> <!-- data-toggle="dropdown" 메뉴네비게이션 클릭안되게 막기 -->
                           <ul class="dropdown-menu" style="margin:-30px -30px -30px -10px;">
                              <li class="nav-item"><a class="nav-link" href="auction2.do">경매신청</a></li>
                              <li class="nav-item"><a class="nav-link" href="auctionList2.do">전체 견적리스트</a></li>
                           </ul>
                        </li> 
									<li class="nav-item"><a class="nav-link" href="conslist5.do">시공사 리스트</a></li>
									<li class="nav-item"><a class="nav-link" href="albumlist6.do">인테리어 게시판</a></li>
									<li class="nav-item"><a class="nav-link" href="moveshop4.do">쇼핑몰</a></li>
									<li class="nav-item"><a class="nav-link" href="nlist1.do">공지사항</a></li>
									<li class="nav-item"><a class="nav-link" href="userMypage.do">마이페이지</a></li>
			</c:if>
			<!-- 시공사 접속시 --><!-- 시공사 접속시 --><!-- 시공사 접속시 --><!-- 시공사 접속시 --><!-- 시공사 접속시 --><!-- 시공사 접속시 -->
			<c:if test="${!empty sessionScope.loginCons }">
				<input type="hidden" id="cons" value="${sessionScope.loginCons.consid }">
				<div align="right" style="position: absolute; z-index: 1; top: 10px; right: 10px;">

					
					<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4">
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">						
<!--========================================================================================== -->

<!--========================================================================================== -->
<!--알림 아이콘 -->
						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span id="jong" class="badge badge-danger badge-counter">${sessionScope.loginCons.consid }</span>
						</a> 
						<!-- Dropdown - Alerts -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
								<h6 style="display:inline-block;"class="dropdown-header">알림</h6> <a href="${pageContext.request.contextPath }/logout"><b style="color: blue;">로그아웃</b></a>
								
								<!-- <div id="aa">
								</div> -->
								
									<div id="alarm" style="width:240px;">									
									<span>현재 메세지가 없습니다.</span>
									</div>
							</div>
						</li>
<!--알림 아이콘 끝-->
					</ul>

				</nav>


				</div>	
					<nav class="navbar navbar-expand-lg navbar-light">
						<div class="container box_1620" style="margin: 300">
							<!--  Brand and toggle get grouped for better mobile display -->
							<a class="navbar-brand logo_h" href="${pageContext.request.contextPath }/main.do"><img
								src="/intepark/resources/img/logo.png" alt=""></a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse offset"
								id="navbarSupportedContent">
								<ul class="nav navbar-nav menu_nav ml-auto">

							
                        <li class="nav-item"><a class="nav-link" href="auctionList2.do">전체 견적리스트</a></li>
									<li class="nav-item"><a class="nav-link" href="MyAuctionAttendList2.do?consid=${loginCons.consid }">내 입찰내역</a></li>
									<li class="nav-item"><a class="nav-link" href="conslist5.do">시공사 리스트</a></li>
									<li class="nav-item"><a class="nav-link" href="moveshop4.do">쇼핑몰</a></li>
									<li class="nav-item"><a class="nav-link" href="calendar3.do">일정관리</a></li>
									<li class="nav-item"><a class="nav-link" href="nlist1.do">공지사항</a></li>
									<li class="nav-item"><a class="nav-link" href="consMypage.do">마이페이지</a></li>

			</c:if>

			<c:if
				test="${!empty sessionScope.loginUser and loginUser.userid eq 'admin'}">
				<!-- 관리자 접속시 -->
				<div align="right" style="position: absolute; z-index: 1; top: 10px; right: 10px;">
					<a href="${pageContext.request.contextPath }/logout"><b style="color: blue;">로그아웃</b></a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620" style="margin: 300">
						<!--  Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="${pageContext.request.contextPath }/main.do"><img
							src="/intepark/resources/img/logo.png" alt=""></a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset"
							id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/albumlist6.do">인테리어 게시판관리</a></li>								
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/admin/userList6.do">고객 관리</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/admin/consList6.do">시공사 관리</a></li>
								<li class="nav-item"><a class="nav-link" href="nlist1.do">공지사항</a></li>
			</c:if>
			</ul>
		</div>
		</div>
		</nav>
		</div>
	</header>
</body>
</html>