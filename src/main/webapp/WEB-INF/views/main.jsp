<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<title>인테파크</title>
<%@ include file="common/jscsspath.jsp" %>
</head>
<body>
        <!--================Header Menu Area =================-->
       	<jsp:include page="common/header.jsp" />
        <!--================Header Menu Area =================-->
        
        <!--================Home Banner Area =================-->
        <section class="home_banner_area">
            <div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content">
						<h5>The joy of home owning</h5>
						<h3>Find Your New Home</h3>
						<a class="main_btn" href="#">Learn More</a>
					</div>
				</div>
            </div>
            <div class="container">
				<div class="advanced_search">
					<h3>Search Properties for</h3>
					<div class="search_select">
						<select class="s_select">
							<option value="1">Choose Locations</option>
							<option value="2">Property Type</option>
							<option value="4">Bedrooms</option>
						</select>
						<select class="s_select">
							<option value="1">Property Type</option>
							<option value="2">Choose Locations</option>
							<option value="4">Bedrooms</option>
						</select>
						<select class="s_select">
							<option value="1">Bedrooms</option>
							<option value="2">Property Type</option>
							<option value="4">Choose Locations</option>
						</select>
						<select class="s_select">
							<option value="1">Bathrooms</option>
							<option value="2">Property Type</option>
							<option value="4">Bedrooms</option>
						</select>
					</div>
					<div class="search_range">
						<div class="range_item">
							<h5>Price Range</h5>
							<div id="slider-range"></div>
							<span class="d_text">$200</span>
							<input type="text" id="amount" readonly style="border:0;" class="amount">
						</div>
						<div class="range_item">
							<h5>property Area</h5>
							<div id="slider-range2"></div>
							<span class="d_text2">50sqm</span>
							<input type="text" id="amount2" readonly style="border:0;" class="amount2">
						</div>
					</div>
					<button type="submit" value="submit" class="btn submit_btn">Search Property</button>
				</div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->
        
        <!--================Welcome Area =================-->
        <section class="welcome_area p_120">
        	<div class="container">
        		<div class="row welcome_inner">
        			<div class="col-lg-6">
        				<div class="welcome_img">
        					<img class="img-fluid" src="img/welcome-1.jpg" alt="">
        				</div>
        			</div>
        			<div class="col-lg-6">
        				<div class="welcome_text">
        					<h4>Welcome to SEL Center</h4>
        					<p>inappropriate behavior is often laughed off as “boys will be boys,” women face higher conduct standards especially in the workplace. That’s why it’s crucial that, as women, our behavior on the job is beyond reproach. inappropriate behavior is often laughed.</p>
        					<div class="row">
        						<div class="col-sm-4">
        							<div class="wel_item">
        								<i class="lnr lnr-database"></i>
        								<h4>$2.5M</h4>
        								<p>Total Donation</p>
        							</div>
        						</div>
        						<div class="col-sm-4">
        							<div class="wel_item">
        								<i class="lnr lnr-book"></i>
        								<h4>1465</h4>
        								<p>Total Projects</p>
        							</div>
        						</div>
        						<div class="col-sm-4">
        							<div class="wel_item">
        								<i class="lnr lnr-users"></i>
        								<h4>3965</h4>
        								<p>Total Volunteers</p>
        							</div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        </section>
        <!--================End Welcome Area =================-->
        
        <!--================Properties Area =================-->
        <section class="properties_area">
        	<div class="container">
        		<div class="main_title">
        			<h2>Our Top Rated Properties</h2>
        			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
        		</div>
        		<div class="row properties_inner">
        			<div class="col-lg-4">
        				<div class="properties_item">
        					<div class="pp_img">
        						<img class="img-fluid" src="img/properties/pp-1.jpg" alt="">
        					</div>
        					<div class="pp_content">
        						<a href="#"><h4>04 Bed Duplex</h4></a>
        						<div class="tags">
        							<a href="#">04 Beds</a>
        							<a href="#">03 Baths</a>
        							<a href="#">750 sqm</a>
        							<a href="#"><i class="fa fa-check" aria-hidden="true"></i>Pool</a>
        							<a href="#"><i class="fa fa-times" aria-hidden="true"></i>Bar</a>
        							<a href="#"><i class="fa fa-times" aria-hidden="true"></i>Pool</a>
        						</div>
        						<div class="pp_footer">
        							<h5>Total: $3.5M</h5>
        							<a class="main_btn" href="#">For Sale</a>
        						</div>
        					</div>
        				</div>
        			</div>
        			<div class="col-lg-4">
        				<div class="properties_item">
        					<div class="pp_img">
        						<img class="img-fluid" src="img/properties/pp-2.jpg" alt="">
        					</div>
        					<div class="pp_content">
        						<a href="#"><h4>04 Bed Duplex</h4></a>
        						<div class="tags">
        							<a href="#">04 Beds</a>
        							<a href="#">03 Baths</a>
        							<a href="#">750 sqm</a>
        							<a href="#"><i class="fa fa-check" aria-hidden="true"></i>Pool</a>
        							<a href="#"><i class="fa fa-times" aria-hidden="true"></i>Bar</a>
        							<a href="#"><i class="fa fa-times" aria-hidden="true"></i>Pool</a>
        						</div>
        						<div class="pp_footer">
        							<h5>Total: $3.5M</h5>
        							<a class="main_btn" href="#">For Sale</a>
        						</div>
        					</div>
        				</div>
        			</div>
        			<div class="col-lg-4">
        				<div class="properties_item">
        					<div class="pp_img">
        						<img class="img-fluid" src="img/properties/pp-3.jpg" alt="">
        					</div>
        					<div class="pp_content">
        						<a href="#"><h4>04 Bed Duplex</h4></a>
        						<div class="tags">
        							<a href="#">04 Beds</a>
        							<a href="#">03 Baths</a>
        							<a href="#">750 sqm</a>
        							<a href="#"><i class="fa fa-check" aria-hidden="true"></i>Pool</a>
        							<a href="#"><i class="fa fa-times" aria-hidden="true"></i>Bar</a>
        							<a href="#"><i class="fa fa-times" aria-hidden="true"></i>Pool</a>
        						</div>
        						<div class="pp_footer">
        							<h5>Total: $3.5M</h5>
        							<a class="main_btn" href="#">For Sale</a>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        </section>
        <!--================End Properties Area =================-->
        
        <!--================Testimonials Area =================-->
        <section class="testimonials_area p_120">
        	<div class="container">
        		<div class="row testimonials_inner">
        			<div class="col-lg-4">
        				<div class="testi_left_text">
        					<h4>Client’s Feedback</h4>
        					<p>inappropriate behavior is often laughed off as “boys will be boys,” women face higher conduct standards especially in the workplace. That’s why it’s crucial that, as women, our behavior on the job is beyond reproach. inappropriate behavior is often laughed.</p>
        				</div>
        			</div>
        			<div class="col-lg-8">
        				<div class="testi_slider owl-carousel">
							<div class="item">
								<div class="testi_item">
									<img src="img/testimonials/testi-1.png" alt="">
									<p>It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has been achieving great heights so far as its</p>
									<h4>Cordelia Barton</h4>
									<h6>CEO at Google</h6>
								</div>
							</div>
							<div class="item">
								<div class="testi_item">
									<img src="img/testimonials/testi-2.png" alt="">
									<p>It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has been achieving great heights so far as its</p>
									<h4>Cordelia Barton</h4>
									<h6>CEO at Google</h6>
								</div>
							</div>
							<div class="item">
								<div class="testi_item">
									<img src="img/testimonials/testi-1.png" alt="">
									<p>It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has been achieving great heights so far as its</p>
									<h4>Cordelia Barton</h4>
									<h6>CEO at Google</h6>
								</div>
							</div>
							<div class="item">
								<div class="testi_item">
									<img src="img/testimonials/testi-2.png" alt="">
									<p>It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has been achieving great heights so far as its</p>
									<h4>Cordelia Barton</h4>
									<h6>CEO at Google</h6>
								</div>
							</div>
							<div class="item">
								<div class="testi_item">
									<img src="img/testimonials/testi-1.png" alt="">
									<p>It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has been achieving great heights so far as its</p>
									<h4>Cordelia Barton</h4>
									<h6>CEO at Google</h6>
								</div>
							</div>
							<div class="item">
								<div class="testi_item">
									<img src="img/testimonials/testi-2.png" alt="">
									<p>It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has been achieving great heights so far as its</p>
									<h4>Cordelia Barton</h4>
									<h6>CEO at Google</h6>
								</div>
							</div>
						</div>
        			</div>
        		</div>
        	</div>
        </section>
        <!--================End Testimonials Area =================-->
        
        <!--================Cities Area =================-->
        <section class="cities_area p_120">
        	<div class="container">
        		<div class="main_title">
        			<h2>Demandable Cities</h2>
        			<p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast, day to day,</p>
        		</div>
        		<div class="row cities_inner">
        			<div class="col-lg-3 col-md-6">
        				<div class="cities_item">
        					<img class="img-fluid" src="img/cities/cities-1.jpg" alt="">
        					<a class="main_btn2" href="#">Book Now</a>
        				</div>
        			</div>
        			<div class="col-lg-3 col-md-6">
        				<div class="cities_item">
        					<img class="img-fluid" src="img/cities/cities-2.jpg" alt="">
        					<a class="main_btn2" href="#">Book Now</a>
        				</div>
        			</div>
        			<div class="col-lg-3 col-md-6">
        				<div class="cities_item">
        					<img class="img-fluid" src="img/cities/cities-3.jpg" alt="">
        					<a class="main_btn2" href="#">Book Now</a>
        				</div>
        			</div>
        			<div class="col-lg-3 col-md-6">
        				<div class="cities_item">
        					<img class="img-fluid" src="img/cities/cities-4.jpg" alt="">
        					<a class="main_btn2" href="#">Book Now</a>
        				</div>
        			</div>
        		</div>
        	</div>
        </section>
        <!--================End Cities Area =================-->
        
        <!--================Feature Area =================-->
        <section class="feature_area p_120">
        	<div class="container">
        		<div class="main_title">
        			<h2>Why we are the best</h2>
        			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor</p>
        		</div>
        		<div class="row feature_inner">
        			<div class="col-lg-4 col-md-6">
        				<div class="feature_item">
        					<h4><i class="lnr lnr-user"></i>Expert Technicians</h4>
        					<p>Usage of the Internet is becoming more common due to rapid advancement of technology and power.</p>
        				</div>
        			</div>
        			<div class="col-lg-4 col-md-6">
        				<div class="feature_item">
        					<h4><i class="lnr lnr-license"></i>Professional Service</h4>
        					<p>Usage of the Internet is becoming more common due to rapid advancement of technology and power.</p>
        				</div>
        			</div>
        			<div class="col-lg-4 col-md-6">
        				<div class="feature_item">
        					<h4><i class="lnr lnr-phone"></i>Great Support</h4>
        					<p>Usage of the Internet is becoming more common due to rapid advancement of technology and power.</p>
        				</div>
        			</div>
        			<div class="col-lg-4 col-md-6">
        				<div class="feature_item">
        					<h4><i class="lnr lnr-rocket"></i>Technical Skills</h4>
        					<p>Usage of the Internet is becoming more common due to rapid advancement of technology and power.</p>
        				</div>
        			</div>
        			<div class="col-lg-4 col-md-6">
        				<div class="feature_item">
        					<h4><i class="lnr lnr-diamond"></i>Highly Recomended</h4>
        					<p>Usage of the Internet is becoming more common due to rapid advancement of technology and power.</p>
        				</div>
        			</div>
        			<div class="col-lg-4 col-md-6">
        				<div class="feature_item">
        					<h4><i class="lnr lnr-bubble"></i>Positive Reviews</h4>
        					<p>Usage of the Internet is becoming more common due to rapid advancement of technology and power.</p>
        				</div>
        			</div>
        		</div>
        	</div>
        </section>
        <!--================End Feature Area =================-->
        
        
        <!--================Clients Logo Area =================-->
        <section class="clients_logo_area p_120">
        	<div class="container">
        		<div class="main_title">
        			<h2>Reliable Customers</h2>
        			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris</p>
        		</div>
        		<div class="clients_slider owl-carousel">
        			<div class="item">
        				<img src="img/clients-logo/c-logo-1.png" alt="">
        			</div>
        			<div class="item">
        				<img src="img/clients-logo/c-logo-2.png" alt="">
        			</div>
        			<div class="item">
        				<img src="img/clients-logo/c-logo-3.png" alt="">
        			</div>
        			<div class="item">
        				<img src="img/clients-logo/c-logo-4.png" alt="">
        			</div>
        			<div class="item">
        				<img src="img/clients-logo/c-logo-5.png" alt="">
        			</div>
        		</div>
        	</div>
        </section>
        <!--================End Clients Logo Area =================-->
        
        
        <!--================ start footer Area  =================-->	
        <jsp:include page="common/footer.jsp" />
		<!--================ End footer Area  =================-->
</body>
</html>