<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auctionEnroll</title>

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
function validate() {
	

	var interiorsection = document.getElementById("interiorsection");
	var startday = document.getElementById("startday");
	var address = document.getElementById("address");
	var name = document.getElementById("name");
	var phone = document.getElementById("phone");
	var email = document.getElementById("email");
	var price = document.getElementById("price");



	/* price 정규식 */
	var price1 = /^[0-9]+$/;

	/* email 정규식 */
	var email1 = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;


	/* 날짜 정규식 */
	var startday1 = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 

    if ((interiorsection.value) == ""){
    	$("#interiorsection_keyup").html('<font color="red">&nbsp; 인테리어 분류를 선택하여 주십시요.</font><br>');
        interiorsection.focus();
        return false;
    }
    
    if ((startday.value) == ""){
    	$("#startday_keyup").html('<font color="red">&nbsp; 시공날짜를 입력하여 주십시요.</font><br>');
        startday.focus();
        return false;
    }
    
    if ((address.value) == ""){
    	$("#address_keyup").html('<font color="red">&nbsp; 시공 주소를 입력하여 주십시요.</font><br>');
        address.focus();
        return false;
    }
    if ((name.value) == ""){
    	$("#name_keyup").html('<font color="red">&nbsp; 이름을 입력하여 주십시요.</font><br>');
        name.focus();
        return false;
    }
    if ((phone.value) == ""){
    	$("#phone_keyup").html('<font color="red">&nbsp; 전화번호를 입력하여 주십시요.</font><br>');
        phone.focus();
        return false;
    }
    if ((email.value) == ""){
    	$("#email_keyup").html('<font color="red">&nbsp; 이메일을 입력하여 주십시요.</font><br>');
    	email.focus();
        return false;
    }
    if ((price.value) == ""){
    	$("#price_keyup").html('<font color="red">&nbsp; 희망금액을 입력하여 주십시요.</font><br>');
    	price.focus();
        return false;
    }
    
    if(!email1.test($('#email').val())){
    	$("#email_keyup").html('<font color="red">&nbsp; 이메일을 형식에 맞게 입력하여 주십시요.</font><br>');
  	  return false;
    }
    
    if(!price1.test(price.value)){
    	$("#price_keyup").html('<font color="red">&nbsp; 숫자만 입력가능합니다.</font><br>');
  	  return false;
    }
    
    if(!startday1.test(startday.value)){
    	$("#startday_keyup").html('<font color="red">&nbsp; 시공날짜를 입력하여 주십시요.</font><br>');
  	  return false;
    }
    return true;
}
</script>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
        
                 
 <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <form method="post" class="register-form" id="register-form" onsubmit="return validate()" action="auctionEnroll2.do" enctype="multipart/form-data">
                         <!--                    <div class="form-row">
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
                                        <option value="종합">종합</option>
                                        <option value="도배">도배</option>
                                         <option value="장판">장판</option>
                                          <option value="마루">마루</option>
                                           <option value="주방">주방</option>
                                            <option value="욕실">욕실</option>
                                             <option value="타일">타일</option>
                                              <option value="페인트">페인트</option>
                                               <option value="도어">도어</option>
                                                <option value="샷시">샷시</option>
                                                 <option value="블라인드">블라인드</option>
                                                  <option value="설비">설비</option>
                                                   <option value="조명">조명</option>
                                                    <option value="기타">기타</option>
                                    </select>
                                    <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                     <span id="interiorsection_keyup" tabindex="0"></span>
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="startday">공사시작일 :</label>
                                <input type="date" name="startday" id="startday" />
                                <span id="startday_keyup" tabindex="0"></span>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="title">주소 :</label>
                            <input type="text" name="address" id="address" value="${loginUser.address }" >
                            <span id="address_keyup" tabindex="0"></span>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="name">이름 :</label>
                                <input type="text" name="name" id="name" value="${loginUser.username }" />
                                  <span id="name_keyup" tabindex="0"></span>
                            </div>
                            <div class="form-group">
                                <label for="phone">휴대전화번호 :</label>
                                <input type="tel" name="phone" id="phone" value="${loginUser.phone }" />
                                 <span id="phone_keyup" tabindex="0"></span>
                            </div>
                        </div>
                            <div class="form-row">
                            <div class="form-group">
                                <label for="email">이메일 :</label>
                                <input type="email" name="email" id="email" value="${loginUser.useremail }" />
                                  <span id="email_keyup" tabindex="0"></span>
                            </div>
                            <div class="form-group">
                                <label for="price">희망금액 :</label>
                                <input type="text" name="price" id="price" />
                                   <span id="price_keyup" tabindex="0"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="title">제목 :</label>
                            <input type="text" name="title" id="title">
                             <span id="title_keyup" tabindex="0"></span>
                        </div>
                    <div class="form-group">
                            <label for="upfile">참고사진 :</label>
                                 <input type="file" name="upfile" id="upfile" multiple >
        						<div id="preview"></div>
                        </div> 
                        <div class="form-group">
                            <label for="etc">기타 상세정보 :</label>
                            <textarea rows="10" cols="80" name="etc"></textarea>
                        </div>
                        <div class="form-submit">
                    
                        <input type="hidden" value="${loginUser.userid}"  name="userid" id="userid">
                    
                            <input type="reset" value="작성취소" class="submit" name="reset" id="reset" />
                            <input type="submit" value="경매등록" class="submit" name="submit" id="submit" />
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