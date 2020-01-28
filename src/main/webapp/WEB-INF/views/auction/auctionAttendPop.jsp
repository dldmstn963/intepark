<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuctionAttendPop</title>
<%@ include file="../common/jscsspath.jsp" %>
<link rel="stylesheet" type="text/css" href="/intepark/resources/Semantic/semantic.min.css">
<script src="/intepark/resources/Semantic/semantic.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/swiper.min.css">
<link rel="stylesheet" href="https://cdn.pannellum.org/2.3/pannellum.css"/>
 <script type="text/javascript" src="https://cdn.pannellum.org/2.3/pannellum.js"></script>
<script type="text/javascript">
$(function(){
	$('.ui.modal')
	  .modal('show')
	;
});
</script>

<script type="text/javascript">
function erchk(){
    var form = document.frm;
    
    form.submit();
    window.opener.location.href = "main.do";
    window.close();
}
</script>
     	<style type="text/css">
   
body {
  background-image: url('/intepark/resources/auctionUpFile/brickwall1.png');
}

 .box1 {
     position: absolute;
        left: 20px;
        top: 50px;
        
}
 .box2 {
    padding: 10px; margin-left: 500px;

}  
.swiper-container {
      width: 80%;
      height: 80%;
    
    }
     .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
</style>
  <style> #panorama { width: 450px; height: 300px; position: relative; z-index: 1000; display: table; -moz-transform-origin: top left; -webkit-transform-origin: top left; -ms-transform-origin: top left; transform-origin: top left; }
   </style>
   <script type="text/javascript">



function initScale(){ var ress = navigator.userAgent; if (ress.indexOf("Android 1.", 0) > -1 ){ //안드로이드2. 이하만 설정 if (ress.indexOf("480", 0) > -1 ) { // 480x800 var per = 0.5226824457593688; } else if(ress.indexOf("600", 0) > -1 ) { // 600 x 1024 var per = 0.681 } else if(ress.indexOf("1280", 0) > -1 ) { // 800 x 1280 var per = 0.631 } } else { var dh = window.innerHeight; var dw = window.innerWidth; var cw = parseInt( $('#panorama').css('width') ); var ch = parseInt( $('#panorama').css('height') ); var per = dw/cw; var per2 =dh/ch; if(per > per2 ){ per = per2; } var gapH = ( dh - (ch*per) )/2; var gapW = ( dw - (cw*per) )/2 } $("#panorama").css('transform', 'scale('+per+','+per+')'); $('body').css('margin-top', gapH ); $('body').css('margin-left', gapW ); curScale = per; } window.onresize = function(){ initScale(); } window.onload = function() { initScale(); } </script>
   
<script type="text/javascript">
//이미지 클릭시 원본 크기로 팝업 보기
function doImgPop(img){
 img1= new Image();
 img1.src=(img);
 imgControll(img);
}
 
function imgControll(img){
 if((img1.width!=0)&&(img1.height!=0)){
    viewImage(img);
  }
  else{
     controller="imgControll('"+img+"')";
     intervalID=setTimeout(controller,20);
  }
}

function viewImage(img){
 W=img1.width;
 H=img1.height;
 O="width="+W+",height="+H+",scrollbars=yes";
 imgWin=window.open("","",O);
 imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
 imgWin.document.write("<body topmargin=0 leftmargin=0>");
 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
 imgWin.document.close();
}
function doDisplay(){
	   var con = document.getElementById("nopa");
	   var con1 = document.getElementById("pano");
	    if(con.style.display=='none'){
	        con.style.display = 'block';
	        con1.style.display = 'none';
	    }
	}
function doDisplay1(){
	   var con = document.getElementById("pano");
	   var con1 = document.getElementById("nopa");
	    if(con.style.display=='none'){
	        con.style.display = 'block';
	        con1.style.display = 'none';
	    }
	}
</script>
</head>
<body>
  <div class="modal-dialog" role="document" style="margin:0; padding-left : 5px;">
    <div class="modal-content" style="width:800px; height:500px; top:25px; left:80px; border: 2px solid rgba(0,0,0,.2); ">
      <div class="modal-header" style="text-align:center;  display: block;    border-bottom: 2px solid #e9ecef;">
        <h5 class="modal-title">${att.title }</h5>
      </div>
      <div class="modal-body">
      <!-- 파노라마 이미지 뷰어 -->
  <div id="pano" class="col-lg-4" style="width:400px; height:300px; position: absolute; display:none;">
  <div id="panorama"></div>
  </div>
 
     <div id="nopa" class="col-lg-4" style="width:450px; height:330px; position: absolute;">
       
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	     <%--  <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/img-1.jpg" class="img-circle" width="300px" height="200px"></div> --%>
	     <c:if test="${rfile[0] eq 'null' }">
	     <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/portfolio_Noimage.png" class="img-circle" width="300px" height="200px"></div>
	     </c:if>
	     <c:if test="${rfile[0] ne 'null' }">
        <div class="swiper-slide"><img src="/intepark/resources/auctionUpFile/${rfile[0] }" class="img-circle" width="300px" height="200px" onclick="doImgPop('/intepark/resources/auctionUpFile/${rfile[0] }')"></div>
        <c:if test="${not empty rfile[1] }">
        <div class="swiper-slide"><img src="/intepark/resources/auctionUpFile/${rfile[1] }" class="img-circle"  width="300px" height="200px" onclick="doImgPop('/intepark/resources/auctionUpFile/${rfile[1] }')"></div>
           	<c:if test="${not empty rfile[2] }">
       <div class="swiper-slide"><img src="/intepark/resources/auctionUpFile/${rfile[2] }" class="img-circle"  width="300px" height="200px" onclick="doImgPop('/intepark/resources/auctionUpFile/${rfile[2] }')"></div>
        </c:if>
        </c:if>
        </c:if>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	  </div>
      </div><!-- col-lg-4 끝 -->
							
                         <div class="box2">
                            <label for="title">공사가능일 :</label>
                            <p>${att.possibledate }</p>
                         
                        </div>
                         <div class="box2">
                
                        </div>
                         <div class="box2">
                            <label for="title">예상금액 :</label>
                            <p>${att.price }</p>
                        </div>
              <div class="box2">
                
                        </div>
                         <div class="box2">
                            <label for="title">기타 상세정보 :</label>
                            <p>${att.etc }</p>
                        </div>

      </div>
  
      <div class="modal-footer" style="border-top: 2px solid #e9ecef;">
  <c:if test="${not empty att.panorama }">  
       <button onclick="doDisplay()" style="background-color: #ffc107; left:90px; position: absolute;" class="btn">기본 이미지 보기</button>
  <button onclick="doDisplay1()" style="background-color: #ffc107; left:245px; position: absolute;" class="btn">360도 이미지 보기</button>
  </c:if>  
        <input type='button' value="Close" class="btn btn-secondary" onClick='window.close()'>
        <c:if test="${loginUser.userid eq att.userid }">
<c:if test="${auc.progress ne '진행' }">
<form method="post" action="auctionAttendProgess2.do" name="frm">
<input type="hidden" name="auctionno" value="${att.auctionno }">
<input type="hidden" name="consid" value="${att.consid }">
<input type="button" value="시공진행" onclick="erchk()" style="background-color: #ffc107;" class="btn">
</form>
</c:if>
</c:if>
      </div>
    </div>
  </div>
 


<script src="${pageContext.request.contextPath }/resources/js/swiper.min.js"></script>
<script type="text/javascript">
<!-- Initialize Swiper -->
  var swiper = new Swiper('.swiper-container', {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
</script>
<script>

// 아래 코드의 01.jpg 만 원하는 이미지로 교체한 후 URL 을 적어주면 됩니다

var sImageFileName = "/intepark/resources/auctionUpFile/${att.panorama}"; pannellum.viewer('panorama', { "type": "equirectangular", "panorama": sImageFileName }); </script>

</body>
</html>