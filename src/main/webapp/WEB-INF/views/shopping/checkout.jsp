<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>인테파크</title>

    <!-- Favicon  -->
    <link rel="icon" href="/intepark/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/intepark/resources/css/core-style.css">
	<link rel="stylesheet" href="/intepark/resources/css/font.css">
</head>

<body>
<div class="main-content-wrapper d-flex clearfix">

       <jsp:include page="common/header.jsp" />

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>주문 결제</h2>
                            </div>
                            







                           
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            <form action="orderinsert4.do" method="post">
                                <div class="row">
                                  <div class="col-12 mb-3">
                                        <select class="w-100" id="country" name="dlvynum">
                                        <c:if test="${!empty list}">
                                        <option value="">주소록</option>
                                        </c:if>
                                        <option value="0">직접 입력</option>
                                        <c:forEach var="li" items="${list }">
                                        <option value="${li.dlvynum }">
                                        ${li.dlvyname }/
                                        ${li.addressee }/
                                        ${li.address }/
                                        ${li.phone }
                                        </option>
                                        </c:forEach>
                                    </select>
                                    </div>
                                    <div id="divylist" class="col-12 mb-3">
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="company" placeholder="배송지 이름" value="" name="dlvyname">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="company" placeholder="받으시는 분" value="" name="addressee">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="email" placeholder="핸드폰 번호" value="" name="phone">
                                    </div>
                                  
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control mb-3" id="street_address" placeholder="주소" value="" name="address">
                                    </div>
                                    </div>
                               
                                    
                                    <div class="col-12 mb-3">
                                        <select class="w-100" id="country2" name="requestnum">
                                        <option value="">배송시 요청사항 목록</option>
                                       <option value="0">직접 입력</option>
                                        <c:forEach var="li" items="${list2 }">
                                        <option value="${li.requestnum }">
                                        ${li.requestcn }
                                        </option>
                                        </c:forEach>
                                    </select>
                                    </div>
                                    <div class="col-12 mb-3" id="requests"><input type="text" class="form-control mb-3" id="street_address" placeholder="배송시 요청사항 입력" value="" name="requestcn"></div>
                                    
                                    
                                   <!--  <div class="col-12 mb-3">
                                        <input type="text" class="form-control mb-3" id="street_address" placeholder="배송시 요청사항" value="" name="requestcn">
                                    </div> -->

                                </div>
                               <input type="hidden" name="userid" value="${loginUser.userid }">
                               <input type="hidden" name="goodsnum" value="${orders.goodsnum }">
								<input type="hidden" name="goodsprice" value="${orders.goodsprice }">
								<input type="hidden" name="orderquantity" value="${orders.orderquantity }">
								<input type="hidden" name="orderprice" value="${orders.orderquantity * orders.goodsprice }">
								
                               <input type="submit">
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>전체 합계</h5>
                            <ul class="summary-table">
                                <li><span>상품 금액:</span> <span>${orders.goodsprice * orders.orderquantity}원 </span></li>
                                <li><span>배송비:</span> <span>2,500원</span></li>
                                <li><span>전체 주문 금액:</span> <span>26,500원</span></li>
                            </ul>

                            <div class="payment-method">
                                <!-- Cash on delivery -->
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="cod" checked>
                                    <label class="custom-control-label" for="cod">착불</label>
                                </div>
                                <!-- Paypal -->
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="paypal">
                                    <label class="custom-control-label" for="paypal">페이팔 <img class="ml-15" src="/intepark/resources/img/core-img/paypal.png" alt=""></label>
                                </div>
                            </div>

                            <div class="cart-btn mt-100">
                                <a href="#" class="btn amado-btn w-100">결제하기</a>
                            </div>
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
	
	 <script type="text/javascript">
$(function(){
	if(${!empty list}){
		$('#divylist').hide();
	}	
$('#country').change(function(){
	if(this.value==0){
$('#divylist').show();
		};
});

$('#country').change(function(){
	if(this.value!=0){
	$('#divylist').hide();
		};
	});

if(${!empty list2}){
	$('#requests').hide();
}	
$('#country2').change(function(){
if(this.value==0){
$('#requests').show();
	};
});

$('#country2').change(function(){
	if(this.value!=0){
	$('#requests').hide();
		};
	});

});
                            </script>
	
</body>

</html>