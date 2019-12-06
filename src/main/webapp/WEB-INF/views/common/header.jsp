<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테파크</title>
</head>
<body>
   <!-- 고객 -->
        <header class="header_area">
            <div class="main_menu">
            <div align="right" style="position:absolute; top:10px; right:10px;">
               <a href="#" ><b style="color:blue;">로그아웃</b></a>
            </div> 
               <nav class="navbar navbar-expand-lg navbar-light">
               <div class="container box_1620" style="margin:300">
                  <!-- Brand and toggle get grouped for better mobile display -->
                  <a class="navbar-brand logo_h" href="index.jsp"><img src="img/logo.png" alt=""></a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                  </button>
                  <!-- Collect the nav links, forms, and other content for toggling -->
                  <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                  
                     <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">3D디자인 리스트</a></li> 
                        <li class="nav-item"><a class="nav-link" href="auctionList.do">견적 리스트</a></li>
                        <li class="nav-item"><a class="nav-link" href="properties.jsp">시공사 리스트</a></li>
                        <li class="nav-item"><a class="nav-link" href="agents.jsp">인테리어 게시판</a></li>
                              <li class="nav-item"><a class="nav-link" href="blog.jsp">쇼핑몰</a></li>
                              <li class="nav-item"><a class="nav-link" href="single-blog.jsp">고객센터</a></li>
                              <li class="nav-item"><a class="nav-link" href="elements.jsp">마이페이지</a></li>
                              <li class="nav-item"><a class="nav-link" href="contact.jsp">마이페이지</a></li>
                           
                     </ul>
                  </div> 
               </div>
               </nav>
            </div>
        </header>
        
        <!-- 시공사 -->
    <!--             <header class="header_area">
            <div class="main_menu">
            	<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620">
						Brand and toggle get grouped for better mobile display
						<a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						Collect the nav links, forms, and other content for toggling
						<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li> 
								<li class="nav-item"><a class="nav-link" href="about-us.html">About</a></li>
								<li class="nav-item"><a class="nav-link" href="properties.html">Properties</a></li>
								<li class="nav-item"><a class="nav-link" href="agents.html">Team</a></li>
								<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="elements.html">Elements</a></li>
									</ul>
								</li> 
								<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
										<li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
									</ul>
								</li> 
								<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="nav-item"><a href="#" class="search"><i class="lnr lnr-magnifier"></i></a></li>
							</ul>
						</div> 
					</div>
            	</nav>
            </div>
        </header> -->
        
        <!-- 관리자 -->
     <!--    
              <header class="header_area">
            <div class="main_menu">
            	<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620">
						Brand and toggle get grouped for better mobile display
						<a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						Collect the nav links, forms, and other content for toggling
						<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li> 
								<li class="nav-item"><a class="nav-link" href="about-us.html">About</a></li>
								<li class="nav-item"><a class="nav-link" href="properties.html">Properties</a></li>
								<li class="nav-item"><a class="nav-link" href="agents.html">Team</a></li>
								<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="elements.html">Elements</a></li>
									</ul>
								</li> 
								<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
										<li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
									</ul>
								</li> 
								<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="nav-item"><a href="#" class="search"><i class="lnr lnr-magnifier"></i></a></li>
							</ul>
						</div> 
					</div>
            	</nav>
            </div>
        </header> -->
</body>
</html>