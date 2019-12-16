<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mt-50">
							<li class="breadcrumb-item"><a href="#">카테고리</a></li>
							<li class="breadcrumb-item"><a href="#">가구</a></li>
							<li class="breadcrumb-item"><a href="#">의자</a></li>
							<li class="breadcrumb-item active" aria-current="page">하얀 의자</li>
						</ol>
					</nav>
				</div>
			</div>

			<div class="row">
				<div class="col-12 col-lg-7">
					<div class="single_product_thumb">
						<div id="product_details_slider" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li class="active" data-target="#product_details_slider"
									data-slide-to="0"
									style="background-image: url(/intepark/resources/img/product-img/pro-big-1.jpg);">
								</li>
								<li data-target="#product_details_slider" data-slide-to="1"
									style="background-image: url(/intepark/resources/img/product-img/pro-big-2.jpg);">
								</li>
								<li data-target="#product_details_slider" data-slide-to="2"
									style="background-image: url(/intepark/resources/img/product-img/pro-big-3.jpg);">
								</li>
								<li data-target="#product_details_slider" data-slide-to="3"
									style="background-image: url(/intepark/resources/img/product-img/pro-big-4.jpg);">
								</li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<a class="gallery_img" href="img/product-img/pro-big-1.jpg">
										<img class="d-block w-100"
										src="/intepark/resources/img/product-img/pro-big-1.jpg"
										alt="First slide">
									</a>
								</div>
								<div class="carousel-item">
									<a class="gallery_img" href="img/product-img/pro-big-2.jpg">
										<img class="d-block w-100"
										src="/intepark/resources/img/product-img/pro-big-2.jpg"
										alt="Second slide">
									</a>
								</div>
								<div class="carousel-item">
									<a class="gallery_img" href="img/product-img/pro-big-3.jpg">
										<img class="d-block w-100"
										src="/intepark/resources/img/product-img/pro-big-3.jpg"
										alt="Third slide">
									</a>
								</div>
								<div class="carousel-item">
									<a class="gallery_img" href="img/product-img/pro-big-4.jpg">
										<img class="d-block w-100"
										src="/intepark/resources/img/product-img/pro-big-4.jpg"
										alt="Fourth slide">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-lg-5">
					<div class="single_product_desc">
						<!-- Product Meta Data -->
						<div class="product-meta-data">
							<div class="line"></div>
							<p class="product-price">${goods.price }원</p>
							<a href="product-details.html">
								<h6>${goods.goodsname }</h6>
							</a>
							<!-- Ratings & Review -->
							<div
								class="ratings-review mb-15 d-flex align-items-center justify-content-between">
								<div class="ratings">
									<i class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i>
								</div>
								<div class="review">
									<a href="#">평점 주기</a>
								</div>
							</div>
							<!-- Avaiable -->
							<p class="avaibility">
								<i class="fa fa-circle"></i>구매 가능
							</p>
						</div>

						<div class="short_overview my-5">
							<p>하얀의자 설명입니다.</p>
						</div>

						<!-- Add to Cart Form -->
						<form class="cart clearfix" method="post">
							<div class="cart-btn d-flex mb-50">
								<p>수량</p>
								<div class="quantity">
									<span class="qty-minus"
										onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
										class="fa fa-caret-down" aria-hidden="true"></i></span> <input
										type="number" class="qty-text" id="qty" step="1" min="1"
										max="300" name="quantity" value="1"> <span
										class="qty-plus"
										onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
										class="fa fa-caret-up" aria-hidden="true"></i></span>
								</div>
							</div>
							<button type="submit" name="addtocart" value="5"
								class="btn amado-btn">결제 하기</button>
							<br> <br>
							<button type="submit" name="addtocart" value="5"
								class="btn amado-btn">장바구니 담기</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Product Details Area End -->
	</div>
<div align="center">
<table border="1px solid black">
<tr>
<td>사진</td>
<td>내용</td>
<td>작성자</td>
<td>등록일</td>
</tr>
</table>
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