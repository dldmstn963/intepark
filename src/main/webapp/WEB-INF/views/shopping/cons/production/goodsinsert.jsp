<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
  <head>
   <!-- Bootstrap -->
    <link href="/intepark/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/intepark/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/intepark/resources/vendors/nprogress/nprogress.css" rel="stylesheet">
	<link  href="/intepark/resources/css/dropzone.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/intepark/resources/build/css/custom.min.css" rel="stylesheet">
    <title>인테파크</title>

	 <style>
        .upload-btn-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }
        
        .upload-btn {
            border: 2px solid gray;
            color: gray;
            background-color: white;
            padding: 8px 20px;
            border-radius: 8px;
            font-size: 20px;
            font-weight: bold;
        }
        
        .upload-btn-wrapper input[type=file] {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
        }
        
        #fileDragDesc {
            width: 100%; 
            height: 100%; 
            margin-left: auto; 
            margin-right: auto; 
            padding: 5px; 
            text-align: center; 
            line-height: 300px; 
            vertical-align:middle;
        }
    </style>
    
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
            <div class="page-title">
              <div class="title_left">
                <h3>상품 등록</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 등록</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                          </div>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <form action="goodsinsert4.do" method="post" enctype="multipart/form-data">
                      	카테고리 <select name="categorynum">
                      			<option value="1">가구</option>
                      			<option value="2">침구</option>
                      			</select><br>
                      	상품명 <input type="text" name="goodsname"><br>
                      	가격 <input type="number" name="price"><br>
                      	재고 <input type="number" name="inventory"><br>
                      	무료 배송 여부 <select name="freedlvy">
                      				<option value="N">N</option>
                      				<option value="Y">Y</option>
                      				</select><br>
                      	썸네일 <input type="file" name="file"><br>
                      	주석<input type="text" name="comments"><br>
                      	상품 설명<input type="text" name="description"><br>
                      	최대 구매 수량<input type="number" name="maximum"><br><br>
                      	파일 상세 사진 : <input type="file" name="file1"><br>
                      	파일 상세 사진 : <input type="file" name="file2"><br>
                      	파일 상세 사진 : <input type="file" name="file3"><br>
                      	파일 상세 사진 : <input type="file" name="file4"><br>
                      	<input type="hidden" name="consid" value="${sessionScope.loginCons.consid}">
                      	<input type="submit" value="등록">
                      </form>
                      <br>

                
                
                
                  
   
    
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
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
    
    <!-- Custom Theme Scripts -->
    <script src="/intepark/resources/build/js/custom.min.js"></script>
	
  </body>
</html>
