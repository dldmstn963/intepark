<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jscsspath.jsp"%>
<!-- <script type="text/javascript">
$(function(){
$("#test2").on("click", function(){
	$.ajax({
		url: "auctionAttend2.do?auc=${auction.auctionno}",
		type: "post",  //json 을 받을 때는 post 로 지정해야 함
		/* data: {name: "신사임당", age: 45}, */
		dataType: "json", //받는 값의 종류 지정
		success: function(obj){
			//json 배열을 받았을 때는 object -> string -> parsing : json
			console.log(obj);
			
			//리턴된 객체를 문자열로 변환 처리
			var objStr = JSON.stringify(obj);
			//객체문자열을 json 으로 바꿈
			var jsonObj = JSON.parse(objStr);
			
			//출력용 문자열 준비
		var outValues = $("#d3").html(); 
	
			outValues += '<tr><th>부서번호</th><th>이름</th><th>부서</th></tr>';

			//출력할 문자열 만들기
			for(var i in jsonObj.list){
				outValues += jsonObj.list[i].auctionno 
						+ ", " + jsonObj.list[i].consid
						+ ", " + decodeURIComponent(jsonObj.list[i].title.replace(/\+/gi, " "))
						+ ", " + jsonObj.list[i].possibledate
						+ ", " + jsonObj.list[i].price
						+ ", " + jsonObj.list[i].ofile
						+ ", " + jsonObj.list[i].rfile
						+ ", " + decodeURIComponent(jsonObj.list[i].etc.replace(/\+/gi, " "))
						+ ", " + decodeURIComponent(jsonObj.list[i].progress.replace(/\+/gi, " "))
						+ "<br>";
			}
			$("#d3").html(outValues);
		},
		error: function(request, status, errorData){
			console.log("error code : " + request.status
					+ "\nMessage : " + request.responseText
					+ "\nError : " + errorData);
		}
	});
});
});
</script> -->
<script type="text/javascript">
function erchk() {
	$("#frm").submit();
}
</script>
<style type="text/css">
</style>


</head>
<body>
	<jsp:include page="../common/header.jsp" />
<div class="container">
         
  <table class="table" >
    <tbody>
      <tr>
  <th style="width: 174px;">제목 : </th>
        <td>${auction.title }</td>
      </tr>
      <tr>
       <th>인테리어 분류 : </th>
        <td>${auction.interiorsection }</td>
      </tr>
      <tr>
       <th>공사시작일 : </th>
        <td>${auction.startday }</td>
      </tr>
      <tr>
       <th>이름 : </th>
        <td>${auction.name }</td>

      </tr>
      <tr>
       <th>휴대전화번호 : </th>
        <td>${auction.phone }</td>
      </tr>
      <tr>
       <th>이메일 : </th>
        <td>${auction.email }</td>
      </tr>
      <tr>
       <th>희망금액 : </th>
        <td>${auction.price }</td>
      </tr>
      <tr>
       <th>주소 : </th>
        <td>${auction.address }</td>
      </tr>
      <tr>
       <th>첨부파일 : </th>
  	<c:if test="${rfile[0] ne 'null' }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[0] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></td>
        <c:if test="${not empty rfile[1] }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[1] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></td>
           	<c:if test="${not empty rfile[2] }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[2] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></td>
        </c:if>
        </c:if>
        </c:if>
         	
      

     
      </tr>
      <tr>
       <th>기타 상세정보 : </th>
        <td>${auction.etc }</td>
      </tr>
    </tbody>
  </table>
</div>
<div style="text-align: center;">
<form method="post" action="auctionAttend2.do" id="frm">
<input type="hidden" name="auc" value="${auction.auctionno }">
<input type="button" value="경매참여/목록보기" onclick="erchk()" style="background-color: #ffc107;">
</form>
</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>