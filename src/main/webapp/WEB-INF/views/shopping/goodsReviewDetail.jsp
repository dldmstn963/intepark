<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                <h2>리뷰 조회</h2>
                            </div>

                                <div class="row">
                                    <div class="col-12 mb-3">
                                       <input type="text" class="form-control" id="company"  name="inquirytitle" value="${review.reviewtitle }"readonly>
                                    </div>
                                 &nbsp; 
                                    <div class="col-12 mb-3">
                                        <textarea class="form-control w-100" id="comment" cols="30" rows="10" name="inquirycn" readonly>${review.reviewcn }
                                        </textarea><br><br>
                                        <c:forEach var="li" items="${list }" >
                                        <img src="/intepark/resources/img/goodsreviewpic/${li.refile }" width="300px;">
                                        </c:forEach>
                                    </div>
								<div class="cart-btn mt-100">
                               <c:if test="${review.userid == loginUser.userid }">
                                 <input type="button" class="btn amado-btn w-100" onclick="location.href='goodsReviewDelete4.do?reviewnum=${review.reviewnum}&goodsnum=${goods.goodsnum }'" value="삭제하기">
                               </c:if>
                            </div>
                                </div>
                                <input type="hidden" name="userid" value=${param.userid }>
                                <input type="hidden" name="goodsnum" value=${param.goodsnum }>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>상품 정보</h5>
                            <ul class="summary-table">
                                <li><img src="/intepark/resources/img/goodthumspic/${goods.thumbnail }"></li>
                                <li><span>상품 이름 :</span> <span>${goods.goodsname }</span></li>
                            </ul>


                            
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