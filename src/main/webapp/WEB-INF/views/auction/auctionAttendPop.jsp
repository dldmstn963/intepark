<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuctionAttendPop</title>
<%@ include file="../common/jscsspath.jsp" %>
<script type="text/javascript">
function popup(img){
    var url = "img2.do?img=" + img;
    var name = "popup test1";
    var option = "width = 500, height = 500, top = 100, left = 400, location = no"
window.open(url, name, option);
}

</script>
</head>
<body>

<div class="container">
         
  <table class="table" >
    <tbody>
      <tr>
  <th style="width: 174px;">제목 : </th>
        <td>${att.title }</td>
      </tr>
      <tr>
       <th>공사가능일  : </th>
        <td>${att.possibledate }</td>
      </tr>
      <tr>
       <th>예상금액 : </th>
        <td>${att.price }</td>
      </tr>
      <tr>
       <th>이미지 : (클릭시 확대)</th>
  	<c:if test="${rfile[0] ne 'null' }">
        <td><a href="javascript:popup('${rfile[0]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[0] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></a></td>
        <c:if test="${not empty rfile[1] }">
        <td><a href="javascript:popup('${rfile[1]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[1] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></a></td>
           	<c:if test="${not empty rfile[2] }">
        <td><a href="javascript:popup('${rfile[2]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[2] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></a></td>
        </c:if>
        </c:if>
        </c:if>
      </tr>
      <tr>
       <th>기타 상세정보 : </th>
        <td>${att.etc }</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>