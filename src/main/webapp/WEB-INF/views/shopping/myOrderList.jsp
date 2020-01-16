<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="common/shopjscss.jsp" %>
    <!-- Title  -->
    <title>인테파크</title>
</head>

<body>
<div class="main-content-wrapper d-flex clearfix">

      <jsp:include page="common/header.jsp" />

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>나의 쇼핑 정보</h2>
                        </div>

                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th>주문 일/판매자</th>
                                        <th>상품 정보</th>
                                        <th>가격</th>
                                        <th>주문 상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="li" items="${list }" varStatus="status" >
                                    <tr>
                                    <td class="cart_product_desc">
                                    ${li.orderdate }
                                    <br>
                                     ${li.consid }
                                    </td>
                                        <td class="cart_product_img">
                                            <a href="#"><img src="/intepark/resources/img/goodthumspic/${li.thumbnail }" alt="Product"></a>
                                            <br>
                                            ${li.goodsname }
                                            <br>
                                            ${li.orderquantity} 개
                                        </td>
                                        <td class="cart_product_desc">
                                            <span>${li.orderprice }</span>
                                        </td>
                                        <td class="price">
                                            <h5>${li.orderstatus }</h5>
                                        </td>
                                    </tr>
                                    
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="display:none;" id="alertbox"></div>
                    <div class="col-12 col-lg-4">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    	<jsp:include page="common/footer.jsp" />
	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/intepark/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="/intepark/resources/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="/intepark/resources/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="/intepark/resources/js/plugins.js"></script>
	<!-- Active js -->
	<script src="/intepark/resources/js/active.js"></script>
</body>

</html>