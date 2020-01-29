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
                       <form action="goodsinsert4.do" name="join" method="post" enctype="multipart/form-data">
                      <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="name">카테고리 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                         <select name="categorynum" class="form-control">
                      			<option value="1">의자</option>
                      			<option value="2">침구</option>
                      			<option value="3">가구</option>
                      			<option value="4">패브릭</option>
                      			<option value="5">테이블</option>
                      			<option value="6">조명</option>
                      			<option value="7">DIY 셀프 시공</option>
                      			</select>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="email">상품명 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                          <input type="text" id="email" name="goodsname" required="required" class="form-control">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="email">가격<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                          <input type="number" id="email2" name="price" required="required" class="form-control">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="number">재고 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                          <input type="number" id="number" required="required" name="inventory" data-validate-minmax="10,100" class="form-control">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="occupation">썸네일 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                         <input type="file" name="file" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password" class="col-form-label col-md-3 label-align">주석<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6">
                          <input id="password" type="text" name="comments" required="required" class="form-control" >
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password2" class="col-form-label col-md-3 col-sm-3 label-align ">최대 구매 수량<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6">
                          <input id="password2" type="number" name="maximum" required="required" class="form-control" >
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="textarea">상품설명 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                          <textarea id="textarea" name="description" class="form-control" required="required"></textarea>
                        </div>
                      </div>
                       <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="occupation">파일 상세 사진 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                         <input type="file" name="file1">
                        </div>
                      </div>
                               <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="occupation">파일 상세 사진 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                         <input type="file" name="file2">
                        </div>
                      </div>
                               <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="occupation">파일 상세 사진 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                         <input type="file" name="file3">
                        </div>
                      </div>
                               <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="occupation">파일 상세 사진 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6">
                         <input type="file" name="file4">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 offset-md-3">
                          <button type="reset" class="btn btn-danger">초기화</button>
                          <button id="submit" type="submit" class="btn btn-success">등록</button>
                        </div>
                      </div>
                    </form>
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
