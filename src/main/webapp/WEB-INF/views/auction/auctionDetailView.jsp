<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="../common/jscsspath.jsp"%>

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
	<jsp:include page="../common/footer.jsp" />
</body>
</html>