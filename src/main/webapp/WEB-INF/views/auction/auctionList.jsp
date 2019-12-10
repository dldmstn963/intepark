<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auctionList</title>
<!--       Bootstrap CSS
        <link rel="stylesheet" href="/intepark/resources/css/bootstrap.css">
        <link rel="stylesheet" href="/intepark/resources/vendors/linericon/style.css">
        <link rel="stylesheet" href="/intepark/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="/intepark/resources/vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="/intepark/resources/vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="/intepark/resources/vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="/intepark/resources/vendors/animate-css/animate.css">
        <link rel="stylesheet" href="/intepark/resources/vendors/jquery-ui/jquery-ui.css">
        main css
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <script type="text/javascript" src="/intepark/resources/js/jquery-3.4.1.min.js"></script> -->
        <%@ include file="../common/jscsspath.jsp" %>
        	
     	<style type="text/css">
	</style>
</head>
<body>
   	<jsp:include page="../common/header.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <!-- <div class="alert alert-info">
                Please Wait...</div> -->
            <div class="alert alert-success" style="display:none;">
                <span class="glyphicon glyphicon-ok"></span> Drag table row and cange Order</div>
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            Column heading
                        </th>
                        <th>
                            Column heading
                        </th>
                        <th>
                            Column heading
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="active">
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                    </tr>
                    <tr class="success">
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                    </tr>
                    <tr class="warning">
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                    </tr>
                    <tr class="danger">
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                        <td>
                            Column content
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
  <jsp:include page="../common/footer.jsp" />
</body>
</html>