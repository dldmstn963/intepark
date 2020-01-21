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
<script type="text/javascript">
$(function(){
	$('.ui.modal')
	  .modal('show')
	;
});
</script>
<script type="text/javascript">
function popup(img){
    var url = "img2.do?img=" + img;
    var name = "popup test1";
    var option = "width = 500, height = 500, top = 100, left = 400, location = no"
window.open(url, name, option);
}

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
</head>
<body>

  <div class="modal-dialog" role="document" style="margin:0; padding-left : 5px;">
    <div class="modal-content" style="width:800px; height:500px;">
      <div class="modal-header">
        <h5 class="modal-title">${att.title }</h5>
      </div>
      <div class="modal-body">
   
     <div class="col-lg-4" style="width:400px; height:300px; position: absolute;">
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	     <%--  <div class="swiper-slide"><img src="${pageContext.request.contextPath }/resources/img/woosoo/img-1.jpg" class="img-circle" width="300px" height="200px"></div> --%>
	     <c:if test="${rfile[0] ne 'null' }">
        <div class="swiper-slide"><a href="javascript:popup('${rfile[0]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[0] }" class="img-circle" width="300px" height="200px"></a></div>
        <c:if test="${not empty rfile[1] }">
        <div class="swiper-slide"><a href="javascript:popup('${rfile[1]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[1] }" class="img-circle"  width="300px" height="200px"></a></div>
           	<c:if test="${not empty rfile[2] }">
       <div class="swiper-slide"><a href="javascript:popup('${rfile[2]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[2] }" class="img-circle"  width="300px" height="200px"></a></div>
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
  
      <div class="modal-footer">
        <input type='button' value="Close" class="btn btn-secondary" onClick='window.close()'>
      </div>
    </div>
  </div>
 

<c:if test="${loginUser.userid eq att.userid }">
<div align="center">
<form method="post" action="auctionAttendProgess2.do" name="frm">
<input type="hidden" name="auctionno" value="${att.auctionno }">
<input type="hidden" name="consid" value="${att.consid }">
<input type="button" value="시공진행" onclick="erchk()" style="background-color: #ffc107;" class="btn">
</form>
</div>
</c:if>
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
</body>
</html>