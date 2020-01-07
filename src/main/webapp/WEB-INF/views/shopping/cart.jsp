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
                            <h2>장바구니</h2>
                        </div>

                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>상품 명</th>
                                        <th>가격</th>
                                        <th>수량</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <!--  <tr>
                                        <td class="cart_product_img">
                                            <a href="#"><img src="/intepark/resources/img/bg-img/cart1.jpg" alt="Product"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5>에펠 의자</h5>
                                        </td>
                                        <td class="price">
                                            <span>15,000원</span>
                                        </td>
                                        <td class="qty">
                                            <div class="qty-btn d-flex">
                                                <p>수량</p>
                                                <div class="quantity">
                                                    <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                    <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                                    <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cart_product_img">
                                            <a href="#"><img src="/intepark/resources/img/bg-img/cart2.jpg" alt="Product"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5>귀여운 선인장</h5>
                                        </td>
                                        <td class="price">
                                            <span>10,000원</span>
                                        </td>
                                        <td class="qty">
                                            <div class="qty-btn d-flex">
                                                <p>수량</p>
                                                <div class="quantity">
                                                    <span class="qty-minus" onclick="var effect = document.getElementById('qty2'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                    <input type="number" class="qty-text" id="qty2" step="1" min="1" max="300" name="quantity" value="1">
                                                    <span class="qty-plus" onclick="var effect = document.getElementById('qty2'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr> -->
                                    <c:forEach var="li" items="${list }" varStatus="status" >
                                    <tr>
                                        <td class="cart_product_img">
                                            <a href="#"><img src="/intepark/resources/img/goodthumspic/${li.thumbnail }" alt="Product"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5>${li.goodsname }</h5>
                                        </td>
                                        <td class="price">
                                            <span>${li.price * li.quantity }원</span>
                                        </td>
                                        <td class="qty">
                                            <div class="qty-btn d-flex">
                                                <p>수량</p>
                                                <form action="updateshbasket4.do">
                                                <div class="quantity">
                                                    <span class="qty-minus" onclick="var effect = document.getElementById('qty${status.count }'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                    <input type="number" class="qty-text" id="qty${status.count }" step="1" min="1" max="300" name="quantity" value="${li.quantity }">
                                                    <span class="qty-plus" onclick="var effect = document.getElementById('qty${status.count }'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                </div>
                                                <input type="hidden" value="${li.shbasketnum }" name="shbasketnum">
                                            <input type="submit" value="수정" > 
                                                </form>
                                            </div>
                                            &nbsp;
                                            <input type="button" value="삭제" onclick="return delete${li.shbasketnum}();"> 
													<script type="text/javascript">
														function delete${li.shbasketnum}() {
															var result = confirm('정말 삭제하시겠습니까?');
															if (result) {
																		$.ajax({
																			url : "shbasketdelete4.do",
																			type : "post",
																			data : {
																				shbasketnum : ${li.shbasketnum}
																			},
																			success : function(data){
																				location.reload();
																				$("#alertbox").html(data);
																			}
																		})
																return false;
															}
														}
													</script>
                                        </td>
                                    </tr>
                                    
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="display:none;" id="alertbox"></div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>전체 합계</h5>
                            <ul class="summary-table">
                                <li><span>상품 금액 : </span> <span>24,000원</span></li>
                                <li><span>배송비 :</span> <span>2,500원</span></li>
                                
                                <li><span>전체 주문 금액:</span> <span>26,500원</span></li>
                            </ul>
                            <div class="cart-btn mt-100">
								<c:url var="url" value="moveshbasketorderinsert4.do">
								<c:forEach var="li" items="${list }">
									<c:param name="goodsnum" value="${li.goodsnum}"/>
									<c:param name="quantity" value="${li.quantity}"/>
								</c:forEach>
								</c:url>
                                <a href=${url } class="btn amado-btn w-100">주문하기</a>
                            </div>
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
</body>

</html>