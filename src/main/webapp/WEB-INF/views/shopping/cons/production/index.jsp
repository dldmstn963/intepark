<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
    <link href="/intepark/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/intepark/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/intepark/resources/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="/intepark/resources/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/intepark/resources/build/css/custom.min.css" rel="stylesheet">
<title>인테파크</title>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<%@ include file="/WEB-INF/views/shopping/cons/common/header.jsp"%>
			<!-- top navigation -->
			<%@ include file="/WEB-INF/views/shopping/cons/common/topheader.jsp"%>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="row" style="display: inline-block;">
						<div class="top_tiles">
							<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-caret-square-o-right"></i>
									</div>
									<div class="count">${countOrders }</div>
									<h3>확인해야할 주문 수</h3>
								</div>
							</div>
							<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-comments-o"></i>
									</div>
									<div class="count">${countInquiry }</div>
									<h3>답변 해야할 문의 수</h3>
								</div>
							</div>
							<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-sort-amount-desc"></i>
									</div>
									<div class="count">${countallOrders }</div>
									<h3>총 주문수</h3>
								</div>
							</div>
							<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-check-square-o"></i>
									</div>
									<div class="count"><fmt:formatNumber value="${countallOrdersPrice }" groupingUsed="true"/></div>
									<h3>총 판매금액</h3>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										판매금액 <small>월 단위 판매금액</small>
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-md-9 col-sm-12 ">
										<div class="demo-container" style="height: 500px">
										<img src="/intepark/resources/img/lolo.jpg">
											  <!-- <div id="curve_chart" style="width: 1200px; height: 500px"></div> -->
										</div>

									</div>

									<div class="col-md-3 col-sm-12 ">
										<div>
											<div class="x_title">
												<h2>답변 안한 문의내역</h2>
												
												<div class="clearfix"></div>
											</div>
											<ul class="list-unstyled top_profiles scroll-view">
												
												 <c:forEach var="li" items="${list }" varStatus="status" >
												<li class="media event"><a
													class="pull-left border-aero profile_thumb"> <i
														class="fa fa-user aero"></i>
												</a>
												
													<div class="media-body">
														<a class="title" href="#">${li.userid }</a>
														<p>
															<a href="moveinquiryDetail4.do?inquirynum=${li.inquirynum }">${li.inquirycn }</a>
														</p>
														<p>
															<small>${li.inquirydate }</small>
														</p>
													</div></li>
													
													</c:forEach>
											</ul>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- /page content -->

			<!-- footer content -->
			 <%@ include file="/WEB-INF/views/shopping/cons/common/footer.jsp" %>
			<!-- /footer content -->
		</div>
	</div>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '판매 금액' ],
          ['2004',  1000],
          ['2005',  1170],
          ['2006',  660],
          ['2007',  1030]
        ]);

        var options = {
          title: '월 단위 판매금액',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
	<!-- jQuery -->
    <script src="/intepark/resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
   <script src="/intepark/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="/intepark/resources/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/intepark/resources/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="/intepark/resources/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- jQuery Sparklines -->
    <script src="/intepark/resources/vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- Flot -->
    <script src="/intepark/resources/vendors/Flot/jquery.flot.js"></script>
    <script src="/intepark/resources/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="/intepark/resources/vendors/Flot/jquery.flot.time.js"></script>
    <script src="/intepark/resources/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="/intepark/resources/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="/intepark/resources/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="/intepark/resources/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="/intepark/resources/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="/intepark/resources/vendors/DateJS/build/date.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/intepark/resources/vendors/moment/min/moment.min.js"></script>
    <script src="/intepark/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="/intepark/resources/build/js/custom.min.js"></script>
	
</body>
</html>