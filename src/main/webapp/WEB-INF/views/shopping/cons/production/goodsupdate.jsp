<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
  <head>
   
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
                <h3>상품 수정</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 수정</h2>
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
                      <form action="goodsupdate4.do" method="post" enctype="multipart/form-data">
                      	카테고리 <select name="categorynum">
                      			<option value="1">가구</option>
                      			<option value="2">침구</option>
                      			</select><br>
                      	상품명 <input type="text" name="goodsname" value="${goods.goodsname }"><br>
                      	가격 <input type="number" name="price" value="${goods.price }"><br>
                      	재고 <input type="number" name="inventory" value="${goods.inventory }"><br>
                      	무료 배송 여부 <select name="freedlvy">
                      				<option value="N">N</option>
                      				<option value="Y">Y</option>
                      				</select><br>
                      	썸네일 <input type="file" name="file"><br>
                      	주석<input type="text" name="comments" value="${goods.comments }"><br>
                      	상품 설명<input type="text" name="description" value="${goods.description }"><br>
                      	최대 구매 수량<input type="number" name="maximum" value="${goods.maximum }"><br>
                      	<input type="hidden" name="consid" value="${sessionScope.loginCons.consid}">
                      	<input type="hidden" name="goodsnum" value="${goods.goodsnum}">
                      	<input type="hidden" name="thumbnail" value="${goods.thumbnail}">
                      	<input type="submit" value="등록">
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
	
	<%@ include file="/WEB-INF/views/shopping/cons/common/jscsspath.jsp"%>
  </body>
</html>
