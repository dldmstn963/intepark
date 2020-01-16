<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="common/shopjscss.jsp" %>
    <!-- Title  -->
    <title>인테파크</title>
</head>

<body>
<div class="main-content-wrapper d-flex clearfix">

   <jsp:include page="common/header.jsp" />
       <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">목록</h6>

                <!--  Catagories  -->
                <div class="catagories-menu">
                    <ul>
                        <li class="active"><a href="moveshopcategory4.do">전체</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=1">가구</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=2">침구</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=3">패브릭</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=4">홈데코/조명</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=5">가전</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=6">수납/정리</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=7">생활 용품</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=8">주방</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=9">DIY 셀프시공</a></li>
                        <li><a href="moveshopcategorysub4.do?categorynum=10">시공/서비스</a></li>
                    </ul>
                </div>
            </div>
            </div>
            
 

        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="product-topbar d-xl-flex align-items-end justify-content-between">
                            <!-- Total Products -->
                            <div class="total-products">
                                <!-- 리스트 썸네일 선택 <div class="view d-flex">
                                    <a href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
                                </div> -->
                            </div>
                            <!-- Sorting -->
                            <div class="product-sorting d-flex">
                               <!--  <div class="sort-by-date d-flex align-items-center mr-15">
                                    <p>정렬 : </p>
                                    <form action="#" method="get">
                                        <select name="select" id="sortBydate">
                                            <option value="value">날짜</option>
                                            <option value="value">Newest</option>
                                            <option value="value">Popular</option>
                                        </select>
                                    </form>
                                </div> -->
                                <!-- 뷰수 설정<div class="view-product d-flex align-items-center">
                                    <p>View</p>
                                    <form action="#" method="get">
                                        <select name="select" id="viewProduct">
                                            <option value="value">12</option>
                                            <option value="value">24</option>
                                            <option value="value">48</option>
                                            <option value="value">96</option>
                                        </select>
                                    </form>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
					<c:forEach var="li" items="${list }">
                    <!-- Single Product Area -->
                    <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                        <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img">
                                <img src="/intepark/resources/img/goodthumspic/${li.thumbnail }" alt="">
                            </div>

                            <!-- Product Description -->
                            <div class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data">
                                    <div class="line"></div>
                                    <p class="product-price"><fmt:formatNumber value="${li.price }" groupingUsed="true"/> 원</p>
                                    <a href="moveproduct4.do?goodsnum=${li.goodsnum }">
                                        <h6>${li.goodsname }</h6>
                                    </a>
                                </div>
                                <!-- Ratings & Cart -->
                                <div class="ratings-cart text-right">
                                   <!--  <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div> -->
                                    <div class="cart">
                                        <a href="shbasketinsert42.do?goodsnum=${li.goodsnum }" data-toggle="tooltip" data-placement="left" title="장바구니 담기"><img src="/intepark/resources/img/core-img/cart.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					</c:forEach>

                </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <li class="page-item"><a class="page-link" href="moveshopcategorysub4.do?page=1&categorynum=${categorynum }">|◁</a></li>
                            	<c:if test="${ (beginPage-10) < 1}">
                                <li class="page-item"><a class="page-link" href="moveshopcategorysub4.do?page=1&categorynum=${categorynum }">◀◀</a></li>
                            </c:if>
								<c:if test="${ (beginPage-10) > 1}">
                                <li class="page-item"><a class="page-link" href="moveshopcategorysub4.do?page=${beginPage-10 }&categorynum=${categorynum }">◀◀</a></li>
								</c:if>
                            <c:forEach var="p" begin="${beginPage }" end="${endPage }">
                                <c:if test="${p == currentPage }">
                                <li class="page-item active"><a class="page-link" href="moveshopcategorysub4.do?page=${p }&categorynum=${categorynum }">${p }</a></li>
                                </c:if >
                                <c:if test="${p != currentPage }">
                                <li class="page-item"><a class="page-link" href="moveshopcategorysub4.do?page=${p }&categorynum=${categorynum }">${p }</a></li>
                                </c:if >
                                </c:forEach>
                                <c:if test="${(endPage+10) > maxPage }">
                                <li class="page-item"><a class="page-link" href="moveshopcategorysub4.do?page=${maxPage }&categorynum=${categorynum }">▶▶</a></li>
                            </c:if>
                            <c:if test="${(endPage+10) < maxPage }">
                                <li class="page-item"><a class="page-link" href="moveshopcategorysub4.do?page=${endPage + 10 }&categorynum=${categorynum }">▶▶</a></li>
                            </c:if>
                                <li class="page-item"><a class="page-link" href="moveshopcategorysub4.do?page=${maxPage }&categorynum=${categorynum }">▷|</a></li>
                            </ul>
                        </nav>
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