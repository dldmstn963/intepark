<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>인테파크</title>
<%@ include file="common/jscsspath.jsp" %>
<style type="text/css">
.home_banner_area .banner_inner {
    background: url(/intepark/resources/img/banner/banner321.jpg) no-repeat scroll center center;
}
.p_120{
padding-top:0px;
padding-bottom:50px;
}
</style>
<script type="text/javascript">
window.onload=function(){
	var message = '${log}';
	if(message !=null && message !='')
		alert(message);
}
</script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"albumtop4.do",
		type : "get",
		dataType :"json",
		success : function(data){
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values="";
			for(var i in json.list){
				values += "<div class='col-lg-3 col-md-6'><div class='cities_item'>"+
					"<img class='img-fluid' style='width:263px; height:270px;'src='${pageContext.request.contextPath }/resources/albumImgs/"+json.list[i].albumimgroot+"/"+json.list[i].albumrenameimgname+"'alt=''>"+
					"<a class='main_btn2' href='${pageContext.request.contextPath }/albumView.do?anum="+json.list[i].albumnum+"'>View Now</a>"+
					"</div><p>"+json.list[i].userid+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
					"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수:"+json.list[i].albumreadcount+"</p></div>"
			}
			$("#albumtop4").html(values);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : "+jqXHR+", "+textStatus+", "+errorThrown);
		}
	});//아이작스
});//펑션
</script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"auctiontop2.do",
		type : "get",
		dataType :"json",
		success : function(data){
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values="";
			for(var i in json.list){
				values += "<div class='col-lg-3 col-md-6'><div class='cities_item'>"+
					"<img class='img-fluid' style='width:263px; height:270px;'src='${pageContext.request.contextPath }/resources/auctionUpFile/"+json.list[i].rfile+"'alt=''>"+
					"<a class='main_btn2' href='${pageContext.request.contextPath }/auctionDetailView2.do?auc="+json.list[i].auctionno+"'>View Now</a>"+
					"</div></div>"
			} 
			$("#auction2").html(values);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : "+jqXHR+", "+textStatus+", "+errorThrown);
		}
	});//아이작스
});//펑션
</script>
</head>
<body>
        <!--================Header Menu Area =================-->
       	<jsp:include page="common/header.jsp" />
        <!--================Header Menu Area =================-->
        
        <!--================Home Banner Area =================-->
        <section class="home_banner_area">
            <div class="banner_inner d-flex align-items-center">
				<div class="container" style="position:absolute; bottom:500px; left:100px;">
					<div class="banner_content">
						<h4>&nbsp;&nbsp;3D디자인 만들기</h4>
						<h3>인테리어를 3D로 직접 구현해보세요.</h3>
						<a class="main_btn" href="moveTdMake.do">3D 디자인</a>
					</div>
				</div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->
    
        
       
            <!--================Cities Area =================-->
        <section class="cities_area p_120">
        	<div class="container">
        		<div class="main_title">
        			<h2>인테리어 경매 BEST</h2>
        			<p>경매참여 경쟁이 가장 치열한 인테리어 경매를 지금 확인해보세요.</p>
        		</div>
        		<div class="row cities_inner" id="auction2">
        	
        			</div>
        		</div>
        	</div>
        </section>
        <!--================End Cities Area =================-->
        <!--================Cities Area =================-->
        <section class="cities_area p_120">
        	<div class="container">
        		<div class="main_title">
        			<h2>인테리어 BEST</h2>
        			<p>한주동안 가장 많은 조회수의 인테리어를 직접 감상해보세요.</p>
        		</div>
        		<div class="row cities_inner" id="albumtop4">
        		</div>
        	</div>
        </section>
        <!--================End Cities Area =================-->
        
        
        <!--================ start footer Area  =================-->	
        <jsp:include page="common/footer.jsp" />
		<!--================ End footer Area  =================-->
</body>
</html>