<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
         
  <table class="table">
    <tbody>
      <tr>
  <th><i class="fas fa-angle-right"></i>Firstname</th>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
       <th>Firstname</th>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
       <th>Firstname</th>
        <td>July</td>
        <td>Dooley</td>
        <td><img src="/intepark/resources/auctionUpFile/${auction.rfile }" class="img-thumbnail" alt="Cinque Terre"></td>
      </tr>
    </tbody>
  </table>
</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>