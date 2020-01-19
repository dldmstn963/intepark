<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	      <%@ include file="../common/jscsspath.jsp" %>
<!DOCTYPE html>
<html>

<head>
<%@ include file="common/shopjscss.jsp"%>
<!-- Title  -->
<title>인테파크</title>
</head>

<body>
<div class="main-content-wrapper d-flex clearfix">

	<jsp:include page="common/header.jsp" />
	<!-- Product Details Area Start -->
	<div class="single-product-area section-padding-100 clearfix">
		<div class="container-fluid">

			<div class="row">
				<!-- <div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mt-50">
							<li class="breadcrumb-item"><a href="#">카테고리</a></li>
							<li class="breadcrumb-item"><a href="#">가구</a></li>
							<li class="breadcrumb-item"><a href="#">의자</a></li>
							<li class="breadcrumb-item active" aria-current="page">하얀 의자</li>
						</ol>
					</nav>
				</div> -->
			</div>

			<div class="row">
				<div class="col-12 col-lg-7">
					<div class="single_product_thumb">
						<div id="product_details_slider" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<c:forEach var="li" items="${list }" varStatus="st" >
								
								
								<c:if test="${st.index == 0 }">
								<li class="active"  data-target="#product_details_slider" data-slide-to="${st.index}"
									data-slide-to="0"
									style="background-image: url(/intepark/resources/img/goodsdetailpic/${li.refile});">
								</c:if>
								<c:if test="${st.index != 0 }">
								<li data-target="#product_details_slider" data-slide-to="${st.index}"
									data-slide-to="0"
									style="background-image: url(/intepark/resources/img/goodsdetailpic/${li.refile});">
								</c:if>
								
								
								</c:forEach>
							</ol>
							<div class="carousel-inner">
							<c:forEach var="li" items="${list }" varStatus="st" >
								<c:if test="${st.index == 0 }">
									<div class="carousel-item active">
										<a class="gallery_img" href="/intepark/resources/img/goodsdetailpic/${li.refile}">
										<img class="d-block w-100"
										src="/intepark/resources/img/goodsdetailpic/${li.refile}"
										alt="First slide">
										</a>
									</div>
								</c:if>
								<c:if test="${st.index != 0 }">
									<div class="carousel-item ">
										<a class="gallery_img" href="/intepark/resources/img/goodsdetailpic/${li.refile}">
										<img class="d-block w-100"
										src="/intepark/resources/img/goodsdetailpic/${li.refile}"
										alt="First slide">
										</a>
									</div>
								</c:if>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-lg-5">
					<div class="single_product_desc">
						<!-- Product Meta Data -->
						<div class="product-meta-data">
							<div class="line"></div>
							<p class="product-price"><fmt:formatNumber value="${goods.price }" groupingUsed="true"/> 원</p>
							<a href="product-details.html">
								<h6>${goods.goodsname }</h6>
							</a>
							<!-- Ratings & Review -->
							<div
								class="ratings-review mb-15 d-flex align-items-center justify-content-between">
								<div class="ratings">
								<c:forEach begin="1" end="${reviewscore }">
									<i class="fa fa-star" aria-hidden="true"></i>
									</c:forEach> 
								</div>
								<!-- <div class="review">
									<a href="#">평점 주기</a>
								</div> -->
							</div>
							<!-- Avaiable -->
							<!-- <p class="avaibility">
								<i class="fa fa-circle"></i>구매 가능
							</p> -->
						</div>

						<div class="short_overview my-5">
							<p>${goods.description }</p>
						</div>

						<!-- Add to Cart Form -->
						<form class="cart clearfix" action="moveorderinsert4.do" method="post">
							<div class="cart-btn d-flex mb-50">
								<p>수량</p>
								<div class="quantity">
									<span class="qty-minus"
										onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
										class="fa fa-caret-down" aria-hidden="true"></i></span> <input
										type="number" class="qty-text" id="qty" step="1" min="1"
										max="300" name="orderquantity" value="1"> <span
										class="qty-plus"
										onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
										class="fa fa-caret-up" aria-hidden="true"></i></span>
								</div>
							</div>
							<input type="hidden" name="userid" value="${loginUser.userid }">
							<input type="hidden" name="goodsnum" value="${goods.goodsnum }">
							<input type="hidden" name="goodsprice" value="${goods.price }">
							
							<input type="submit" value="결제" class="btn amado-btn"><br><br>
							<input type="submit" value="장바구니" class="btn amado-btn" formaction="shbasketinsert4.do">
							<br> <br>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Product Details Area End -->
	</div>
<div align="center">
<div class="col-md-6 col-sm-6  ">
				<div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th class="column-title">사진</th>
                            <th class="column-title">제목</th>
                            <th class="column-title">작성자</th>
                            <th class="column-title">등록일</th>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
<c:forEach var="re" items="${ goodsreview}" varStatus="status">
<c:if test="${(status.count%2) == 0}">
                          <tr class="even pointer">
</c:if>
<c:if test="${(status.count%2) == 1}">
		<tr class="odd pointer">
</c:if>
                            <td class=" "><c:if test="${re.refile != 'null'}">
<img src="/intepark/resources/img/goodsreviewpic/${re.refile }" width="100px;">
</c:if></td>
                            <td class=" "><a href="goodsReviewDetail4.do?reviewnum=${re.reviewnum }&goodsnum=${goods.goodsnum}">${re.reviewtitle }</a></td>
                            <td class=" ">${re.userid }</td>
                            <td class=" ">${re.reviewdate }</td>
                          </tr>
</c:forEach>
                        </tbody>
                      </table>
                    </div>
</div>
<br>
<br>
<br>

<div align="center">
<nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page=1&page1=${currentPage1}">|◁</a></li>
                            	<c:if test="${ (beginPage-10) < 1}">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page=1&page1=${currentPage1}">◀◀</a></li>
                            </c:if>
								<c:if test="${ (beginPage-10) > 1}">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page=${beginPage-10 }&page1=${currentPage1}">◀◀</a></li>
								</c:if>
                            <c:forEach var="p" begin="${beginPage }" end="${endPage }">
                                <c:if test="${p == currentPage }">
                                <li class="page-item active"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page=${p }&page1=${currentPage1}">${p }</a></li>
                                </c:if >
                                <c:if test="${p != currentPage }">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page=${p }&page1=${currentPage1}">${p }</a></li>
                                </c:if >
                                </c:forEach>
                                <c:if test="${(endPage+10) > maxPage }">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page=${maxPage }&page1=${currentPage1}">▶▶</a></li>
                            </c:if>
                            <c:if test="${(endPage+10) < maxPage }">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page=${endPage + 10 }&page1=${currentPage1}">▶▶</a></li>
                            </c:if>
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page=${maxPage }&page1=${currentPage1}">▷|</a></li>
                            </ul>
                        </nav>
 </div>



<div class="col-md-6 col-sm-6  ">
				<div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th class="column-title">답변상태</th>
                            <th class="column-title">문의유형</th>
                            <th class="column-title">제목</th>
                            <th class="column-title">작성자</th>
                            <th class="column-title">등록일</th>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
<c:forEach var="re1" items="${ goodsInquiry}" varStatus="status">
<c:if test="${(status.count%2) == 0}">
                          <tr class="even pointer">
</c:if>
<c:if test="${(status.count%2) == 1}">
		<tr class="odd pointer">
</c:if>
                            <td class=" ">${re1.answersttus }</td>
                            <td class=" "><c:if test="${re1.inquirytype == 1}">
상품
</c:if>
<c:if test="${re1.inquirytype == 2}">
배송
</c:if>
<c:if test="${re1.inquirytype == 3}">
기타
</c:if></td>
                            <td class=" "><a href="goodsInquiryDetail4.do?inquirynum=${re1.inquirynum }&goodsnum=${goods.goodsnum}">${re1.inquirytitle }</a></td>
                            <td class=" ">${re1.userid }</td>
                            <td class=" ">${re1.inquirydate }</td>
                          </tr>
</c:forEach>
                        </tbody>
                      </table>
                    </div>
</div>



<br><br>


 

<div align="center">
<nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page1=1&page=${currentPage}">|◁</a></li>
                            	<c:if test="${ (beginPage1-10) < 1}">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page1=1&page=${currentPage}">◀◀</a></li>
                            </c:if>
								<c:if test="${ (beginPage1-10) > 1}">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page1=${beginPage1 -10 }&page=${currentPage}">◀◀</a></li>
								</c:if>
                            <c:forEach var="p" begin="${beginPage1 }" end="${endPage1 }">
                                <c:if test="${p == currentPage1 }">
                                <li class="page-item active"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page1=${p }&page=${currentPage}">${p }</a></li>
                                </c:if >
                                <c:if test="${p != currentPage1 }">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page1=${p }&page=${currentPage}">${p }</a></li>
                                </c:if >
                                </c:forEach>
                                <c:if test="${(endPage1 +10) > maxPage1 }">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page1=${maxPage1 }&page=${currentPage}">▶▶</a></li>
                            </c:if>
                            <c:if test="${(endPage1 +10) < maxPage1 }">
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page1=${endPage1 + 10 }&page=${currentPage}">▶▶</a></li>
                            </c:if>
                                <li class="page-item"><a class="page-link" href="moveproduct4.do?goodsnum=${goods.goodsnum}&page1=${maxPage1 }&page=${currentPage}">▷|</a></li>
                            </ul>
                        </nav>
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