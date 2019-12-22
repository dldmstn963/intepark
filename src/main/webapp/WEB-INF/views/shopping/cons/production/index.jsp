<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
									<div class="count">179</div>
									<h3>New Sign ups</h3>
									<p>Lorem ipsum psdea itgum rixt.</p>
								</div>
							</div>
							<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-comments-o"></i>
									</div>
									<div class="count">179</div>
									<h3>New Sign ups</h3>
									<p>Lorem ipsum psdea itgum rixt.</p>
								</div>
							</div>
							<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-sort-amount-desc"></i>
									</div>
									<div class="count">179</div>
									<h3>New Sign ups</h3>
									<p>Lorem ipsum psdea itgum rixt.</p>
								</div>
							</div>
							<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
								<div class="tile-stats">
									<div class="icon">
										<i class="fa fa-check-square-o"></i>
									</div>
									<div class="count">179</div>
									<h3>New Sign ups</h3>
									<p>Lorem ipsum psdea itgum rixt.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Transaction Summary <small>Weekly progress</small>
									</h2>
									<div class="filter">
										<div id="reportrange" class="pull-right"
											style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
											<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span>December
												30, 2014 - January 28, 2015</span> <b class="caret"></b>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-md-9 col-sm-12 ">
										<div class="demo-container" style="height: 280px">
											<div id="chart_plot_02" class="demo-placeholder"></div>
										</div>
										<div class="tiles">
											<div class="col-md-4 tile">
												<span>Total Sessions</span>
												<h2>231,809</h2>
												<span class="sparkline11 graph" style="height: 160px;">
													<canvas width="200" height="60"
														style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
												</span>
											</div>
											<div class="col-md-4 tile">
												<span>Total Revenue</span>
												<h2>$231,809</h2>
												<span class="sparkline22 graph" style="height: 160px;">
													<canvas width="200" height="60"
														style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
												</span>
											</div>
											<div class="col-md-4 tile">
												<span>Total Sessions</span>
												<h2>231,809</h2>
												<span class="sparkline11 graph" style="height: 160px;">
													<canvas width="200" height="60"
														style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
												</span>
											</div>
										</div>

									</div>

									<div class="col-md-3 col-sm-12 ">
										<div>
											<div class="x_title">
												<h2>Top Profiles</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
													<li class="dropdown"><a href="#"
														class="dropdown-toggle" data-toggle="dropdown"
														role="button" aria-expanded="false"><i
															class="fa fa-wrench"></i></a>
														<div class="dropdown-menu"
															aria-labelledby="dropdownMenuButton">
															<a class="dropdown-item" href="#">Settings 1</a> <a
																class="dropdown-item" href="#">Settings 2</a>
														</div></li>
													<li><a class="close-link"><i class="fa fa-close"></i></a>
													</li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<ul class="list-unstyled top_profiles scroll-view">
												<li class="media event"><a
													class="pull-left border-aero profile_thumb"> <i
														class="fa fa-user aero"></i>
												</a>
													<div class="media-body">
														<a class="title" href="#">Ms. Mary Jane</a>
														<p>
															<strong>$2300. </strong> Agent Avarage Sales
														</p>
														<p>
															<small>12 Sales Today</small>
														</p>
													</div></li>
												<li class="media event"><a
													class="pull-left border-green profile_thumb"> <i
														class="fa fa-user green"></i>
												</a>
													<div class="media-body">
														<a class="title" href="#">Ms. Mary Jane</a>
														<p>
															<strong>$2300. </strong> Agent Avarage Sales
														</p>
														<p>
															<small>12 Sales Today</small>
														</p>
													</div></li>
												<li class="media event"><a
													class="pull-left border-blue profile_thumb"> <i
														class="fa fa-user blue"></i>
												</a>
													<div class="media-body">
														<a class="title" href="#">Ms. Mary Jane</a>
														<p>
															<strong>$2300. </strong> Agent Avarage Sales
														</p>
														<p>
															<small>12 Sales Today</small>
														</p>
													</div></li>
												<li class="media event"><a
													class="pull-left border-aero profile_thumb"> <i
														class="fa fa-user aero"></i>
												</a>
													<div class="media-body">
														<a class="title" href="#">Ms. Mary Jane</a>
														<p>
															<strong>$2300. </strong> Agent Avarage Sales
														</p>
														<p>
															<small>12 Sales Today</small>
														</p>
													</div></li>
												<li class="media event"><a
													class="pull-left border-green profile_thumb"> <i
														class="fa fa-user green"></i>
												</a>
													<div class="media-body">
														<a class="title" href="#">Ms. Mary Jane</a>
														<p>
															<strong>$2300. </strong> Agent Avarage Sales
														</p>
														<p>
															<small>12 Sales Today</small>
														</p>
													</div></li>
											</ul>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Weekly Summary <small>Activity shares</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">

									<div class="row"
										style="border-bottom: 1px solid #E0E0E0; padding-bottom: 5px; margin-bottom: 5px;">
										<div class="col-md-7" style="overflow: hidden;">
											<span class="sparkline_one"
												style="height: 160px; padding: 10px 25px;">
												<canvas width="200" height="60"
													style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
											</span>
											<h4 style="margin: 18px">Weekly sales progress</h4>
										</div>

										<div class="col-md-5">
											<div class="row" style="text-align: center;">
												<div class="col-md-4">
													<canvas class="canvasDoughnut" height="110" width="110"
														style="margin: 5px 10px 10px 0"></canvas>
													<h4 style="margin: 0">Bounce Rates</h4>
												</div>
												<div class="col-md-4">
													<canvas class="canvasDoughnut" height="110" width="110"
														style="margin: 5px 10px 10px 0"></canvas>
													<h4 style="margin: 0">New Traffic</h4>
												</div>
												<div class="col-md-4">
													<canvas class="canvasDoughnut" height="110" width="110"
														style="margin: 5px 10px 10px 0"></canvas>
													<h4 style="margin: 0">Device Share</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-4">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Top Profiles <small>Sessions</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item One Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Three Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Top Profiles <small>Sessions</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item One Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Three Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Top Profiles <small>Sessions</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item One Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Two Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
									<article class="media event">
										<a class="pull-left date">
											<p class="month">April</p>
											<p class="day">23</p>
										</a>
										<div class="media-body">
											<a class="title" href="#">Item Three Title</a>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
										</div>
									</article>
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