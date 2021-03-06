<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auctionChange</title>

<%@ include file="../common/jscsspath.jsp" %>   	
     	<style type="text/css">
div{
align:center;
}
a:focus, a:active {
  text-decoration: none;
  outline: none;
  transition: all 300ms ease 0s;
  -moz-transition: all 300ms ease 0s;
  -webkit-transition: all 300ms ease 0s;
  -o-transition: all 300ms ease 0s;
  -ms-transition: all 300ms ease 0s; }

input, select, textarea {
  outline: none;
  appearance: unset !important;
  -moz-appearance: unset !important;
  -webkit-appearance: unset !important;
  -o-appearance: unset !important;
  -ms-appearance: unset !important; }

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
  appearance: none !important;
  -moz-appearance: none !important;
  -webkit-appearance: none !important;
  -o-appearance: none !important;
  -ms-appearance: none !important;
  margin: 0; }

input:focus, select:focus, textarea:focus {
  outline: none;
  box-shadow: none !important;
  -moz-box-shadow: none !important;
  -webkit-box-shadow: none !important;
  -o-box-shadow: none !important;
  -ms-box-shadow: none !important; }

input[type=checkbox] {
  appearance: checkbox !important;
  -moz-appearance: checkbox !important;
  -webkit-appearance: checkbox !important;
  -o-appearance: checkbox !important;
  -ms-appearance: checkbox !important; }

input[type=radio] {
  appearance: radio !important;
  -moz-appearance: radio !important;
  -webkit-appearance: radio !important;
  -o-appearance: radio !important;
  -ms-appearance: radio !important; }

img {
  max-width: 100%;
  height: auto; }

figure {
  margin: 0; }

input[type=number] {
  -moz-appearance: textfield !important;
  appearance: none !important;
  -webkit-appearance: none !important; }

input:-webkit-autofill {
  box-shadow: 0 0 0 30px transparent inset;
  -moz-box-shadow: 0 0 0 30px transparent inset;
  -webkit-box-shadow: 0 0 0 30px transparent inset;
  -o-box-shadow: 0 0 0 30px transparent inset;
  -ms-box-shadow: 0 0 0 30px transparent inset; }

h2 {
  line-height: 1.66;
  margin: 0;
  padding: 0;
  font-weight: 700;
  color: #222;
  font-family: 'Montserrat';
  font-size: 20px;
  text-transform: uppercase;
  margin-bottom: 32px; }

.clear {
  clear: both; }
form { 

        margin: 0 auto; 

        width:800px;

    }

/* .container {
  width: 1400px;
  position: relative;
  margin: 0 auto;
  background: #fff; } */

/* .signup-img, .signup-form {
  width: 50%; } */

.signup-img {
  margin-bottom: -7px; }

.register-form {
  padding: 50px 100px 50px 70px; }

.form-row {
  margin: 0 -15px; }
  .form-row .form-group {
    width: 50%;
    padding: 0 15px; }

.form-group {
  margin-bottom: 23px;
  position: relative; }

input, select ,textarea{
  display: block;
  width: 100%;
  border: 1px solid #ebebeb;
  padding: 11px 20px;
  box-sizing: border-box;
  font-family: 'Montserrat';
  font-weight: 500;
  font-size: 13px; }
  input:focus, select:focus {
    border: 1px solid #ff6801; }

label {
  font-size: 14px;
  font-weight: bold;
  font-family: 'Montserrat';
  margin-bottom: 2px;
  display: block; }

.form-radio {
  margin-bottom: 18px; }
  .form-radio input {
    width: auto;
    display: inline-block; }

.radio-label {
  padding-right: 72px; }

.form-radio-item {
  position: relative;
  margin-right: 45px; }
  .form-radio-item label {
    font-weight: 500;
    font-size: 13px;
    padding-left: 25px;
    position: relative;
    z-index: 9;
    display: block;
    cursor: pointer; }

.check {
  display: inline-block;
  position: absolute;
  border: 1px solid #ebebeb;
  border-radius: 50%;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  -o-border-radius: 50%;
  -ms-border-radius: 50%;
  height: 13px;
  width: 13px;
  top: 4px;
  left: 0px;
  z-index: 5;
  transition: border .25s linear;
  -webkit-transition: border .25s linear; }
  .check:before {
    position: absolute;
    display: block;
    content: '';
    width: 9px;
    height: 9px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    -o-border-radius: 50%;
    -ms-border-radius: 50%;
    top: 2px;
    left: 2px;
    margin: auto;
    transition: background 0.25s linear;
    -webkit-transition: background 0.25s linear; }

input[type=radio] {
  position: absolute;
  visibility: hidden; }
  input[type=radio]:checked ~ .check {
    border: 1px solid #ff6801; }
  input[type=radio]:checked ~ .check::before {
    background: #ff6801; }

.form-select {
  position: relative; }

select {
  appearance: none !important;
  -moz-appearance: none !important;
  -webkit-appearance: none !important;
  -o-appearance: none !important;
  -ms-appearance: none !important;
  position: relative;
  background: 0 0;
  z-index: 10;
  cursor: pointer; }

.select-icon {
  z-index: 0;
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  justify-content: center;
  -moz-justify-content: center;
  -webkit-justify-content: center;
  -o-justify-content: center;
  -ms-justify-content: center;
  align-items: center;
  -moz-align-items: center;
  -webkit-align-items: center;
  -o-align-items: center;
  -ms-align-items: center; }
  .select-icon i {
    justify-content: center;
    -moz-justify-content: center;
    -webkit-justify-content: center;
    -o-justify-content: center;
    -ms-justify-content: center;
    align-items: center;
    -moz-align-items: center;
    -webkit-align-items: center;
    -o-align-items: center;
    -ms-align-items: center;
    width: 40px;
    height: 20px;
    font-size: 18px;
    color: #999; }

.form-submit {
  text-align: right;
  padding-top: 27px; }

.submit {
  width: 140px;
  height: 40px;
  display: inline-block;
  font-family: 'Poppins';
  font-weight: 400;
  font-size: 13px;
  padding: 10px;
  border: none;
  cursor: pointer; }

#reset {
  background: #f8f8f8;
  color: #999;
  margin-right: 8px; }
  #reset:hover {
    background: #ff6801;
    color: #fff; }

#submit {
  background: #ff6801;
  color: #fff; }
  #submit:hover {
    background-color: #cd5300; }

@media screen and (max-width: 992px) {
  .container {
    width: calc(100% - 40px);
    max-width: 100%; }

  .signup-content {
    flex-direction: column;
    -moz-flex-direction: column;
    -webkit-flex-direction: column;
    -o-flex-direction: column;
    -ms-flex-direction: column; }

  .signup-img, .signup-form {
    width: 100%; } }
@media screen and (max-width: 768px) {
  .register-form {
    padding: 50px 40px 50px 40px; } }
@media screen and (max-width: 575px) {
  .form-row {
    flex-direction: column;
    -moz-flex-direction: column;
    -webkit-flex-direction: column;
    -o-flex-direction: column;
    -ms-flex-direction: column;
    margin: 0px; }

  .form-row .form-group {
    width: 100%;
    padding: 0px; }

  .radio-label {
    padding-right: 22px; }

  .form-radio-item {
    margin-right: 25px; } }
@media screen and (max-width: 480px) {
  .form-radio {
    flex-direction: column;
    -moz-flex-direction: column;
    -webkit-flex-direction: column;
    -o-flex-direction: column;
    -ms-flex-direction: column; }

  .submit {
    width: 100%; }

  #reset {
    margin-right: 0px;
    margin-bottom: 10px; } 
    .dropzone {
    background: white;
    border-radius: 5px;
    border: 2px dashed rgb(0, 135, 247);
    border-image: none;
    max-width: 500px;
    margin-left: auto;
    margin-right: auto;
}

/*# sourceMappingURL=style.css.map */
</style>
<!-- <link rel="stylesheet" href="css/style1.css">  -->
<script type="text/javascript">

$(document).ready(function (e){
  $("input[type='file']").change(function(e){

    //div 내용 비워주기
    $('#preview2').empty();
    $('#preview').empty();

    var files = e.target.files;
    var arr =Array.prototype.slice.call(files);

	if(arr.length >= 4){
			alert("안되요 많아요");
			  $("#upfile").val("");
			  return false;
		}
    
    //업로드 가능 파일인지 체크
    for(var i=0;i<files.length;i++){
      if(!checkExtension(files[i].name,files[i].size)){
        return false;
      }
    }
    
    preview(arr);
    
    
  });//file change
  
  function checkExtension(fileName,fileSize){

    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    var maxSize = 20971520;  //20MB
    
    if(fileSize >= maxSize){
      alert('파일 사이즈 초과');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    
    if(regex.test(fileName)){
      alert('업로드 불가능한 파일이 있습니다.');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    return true;
  }
  
  function preview(arr){
    arr.forEach(function(f){
      
      //파일명이 길면 파일명...으로 처리
      var fileName = f.name;
      if(fileName.length > 10){
        fileName = fileName.substring(0,7)+"...";
      }
      
      //div에 이미지 추가
      var str = '<div style="display: inline-flex; padding: 10px;"><li>';
      str += '<span>'+fileName+'</span><br>';
      
      //이미지 파일 미리보기
      if(f.type.match('image.*')){
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
          //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
          str += '<img src="'+e.target.result+'" title="'+f.name+'" width=150 height=150 />';
          str += '</li></div>';
          $(str).appendTo('#preview');
        } 
        reader.readAsDataURL(f);
      }else{
        str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
        $(str).appendTo('#preview');
      }
    });//arr.forEach
  }
});

</script>
<script type="text/javascript">
/* window.onload=function(){
	document.getElementById('startday').valueAsDate = ${auction.startday};
	} */



</script>

</head>
<body>

	<jsp:include page="../common/header.jsp" />
        

 <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <form method="post" class="register-form" id="register-form" action="AuctionUpdate2.do" enctype="multipart/form-data">
                               <!--              <div class="form-row">
                            <label for="auctionsection" class="radio-label" style="margin-left: 15px; margin-bottom: 20px; padding-right: 30px;">견적분류 :</label><br>
                            <div class="form-radio-item">
                                <label for="nomal">일반견적</label>
                                  <input type="radio" name="auctionsection" id="nomal" value="nomal" checked>
                                <span class="check"></span>
                            </div>
                            <div class="form-radio-item">
                                <label for="fast">긴급견적</label>
                                 <input type="radio" name="auctionsection" id="fast" value="fast">
                                <span class="check"></span>
                            </div>
                            
                        </div> -->
                           <div class="form-row">
                            <div class="form-group">
                                <label for="interiorsection">인테리어 분류 :</label>
                                <div class="form-select">
                                    <select name="interiorsection" id="interiorsection">
                                        <option value=""></option>
                                        <option value="종합" <c:if test="${auction.interiorsection eq '종합'}">selected</c:if>>종합</option>
                                        <option value="도배" <c:if test="${auction.interiorsection eq '도배'}">selected</c:if>>도배</option>
                                         <option value="장판" <c:if test="${auction.interiorsection eq '장판'}">selected</c:if>>장판</option>
                                          <option value="마루" <c:if test="${auction.interiorsection eq '마루'}">selected</c:if>>마루</option>
                                           <option value="주방" <c:if test="${auction.interiorsection eq '주방'}">selected</c:if>>주방</option>
                                            <option value="욕실" <c:if test="${auction.interiorsection eq '욕실'}">selected</c:if>>욕실</option>
                                             <option value="타일" <c:if test="${auction.interiorsection eq '타일'}">selected</c:if>>타일</option>
                                              <option value="페인트" <c:if test="${auction.interiorsection eq '페인트'}">selected</c:if>>페인트</option>
                                               <option value="도어" <c:if test="${auction.interiorsection eq '도어'}">selected</c:if>>도어</option>
                                                <option value="샷시" <c:if test="${auction.interiorsection eq '샷시'}">selected</c:if>>샷시</option>
                                                 <option value="블라인드" <c:if test="${auction.interiorsection eq '블라인드'}">selected</c:if>>블라인드</option>
                                                  <option value="설비" <c:if test="${auction.interiorsection eq '설비'}">selected</c:if>>설비</option>
                                                   <option value="조명" <c:if test="${auction.interiorsection eq '조명'}">selected</c:if>>조명</option>
                                                    <option value="기타" <c:if test="${auction.interiorsection eq '기타'}">selected</c:if>>기타</option>
                                    </select>
                                    <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="startday">공사시작일 :</label>
                                <input type="date" name="startday" id="startday" value="${auction.startday}" required/>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="title">주소 :</label>
                            <input type="text" name="address" id="address" value="${auction.address}">
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="name">이름 :</label>
                                <input type="text" name="name" id="name" value="${auction.name }" required/>
                            </div>
                            <div class="form-group">
                                <label for="phone">휴대전화번호 :</label>
                                <input type="tel" name="phone" id="phone" value="${auction.phone }" required/>
                            </div>
                        </div>
                            <div class="form-row">
                            <div class="form-group">
                                <label for="email">이메일 :</label>
                                <input type="email" name="email" id="email" value="${auction.email }" required/>
                            </div>
                            <div class="form-group">
                                <label for="price">희망금액 :</label>
                                <input type="text" name="price" id="price" value="${auction.price }" required/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="title">제목 :</label>
                            <input type="text" name="title" id="title" value="${auction.title }">
                        </div>
                    <div class="form-group">
                            <label for="upfile">참고사진 :</label>
                                 <input type="file" name="upfile" id="upfile" multiple >
        						<div id="preview"></div>
        						<div id="preview2">
        						  	<c:if test="${rfile[0] ne 'null' }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[0] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></td>
        <c:if test="${not empty rfile[1] }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[1] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></td>
           	<c:if test="${not empty rfile[2] }">
        <td><img src="/intepark/resources/auctionUpFile/${rfile[2] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></td>
        </c:if>
        </c:if>
        </c:if>
 </div>
 		<c:if test="${rfile[0] ne 'null' }">
        <input type="hidden" value="${rfile[0]}" name="rfile1">
        <c:if test="${not empty rfile[1] }">     
        <input type="hidden" value="${rfile[1]}" name="rfile2">
           	<c:if test="${not empty rfile[2] }">
        <input type="hidden" value="${rfile[2]}" name="rfile3">
        </c:if>
        </c:if>
        </c:if>
                        </div> 
                        <div class="form-group">
                            <label for="etc">기타 상세정보 :</label>
                            <textarea rows="10" cols="80" name="etc">${auction.etc }</textarea>
                        </div>
                        <div class="form-submit">
                  
                    	<c:if test="${not empty auction.userid}">
                       	<input type="hidden" value="${auction.auctionno }" name="auctionno">
                       	</c:if>
                       	<c:if test="${empty auction.userid}">
                       	<input type="hidden" value="${auction.auctionno }" name="nonauctionno">
                       	</c:if>
                            <input type="reset" value="작성취소" class="submit" name="reset" id="reset" />
                            <input type="submit" value="수정" class="submit" name="submit" id="submit" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

  <jsp:include page="../common/footer.jsp" />
</body>
  <script src="/intepark/resources/vendors/dropzone/dist/dropzone.js"></script>
</html>