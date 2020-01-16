<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuctionAttendPop</title>
<%@ include file="../common/jscsspath.jsp" %>
<script type="text/javascript">
function popup(img){
    var url = "img2.do?img=" + img;
    var name = "popup test1";
    var option = "width = 500, height = 500, top = 100, left = 400, location = no"
window.open(url, name, option);
}

</script>
<script type="text/javascript">
function erchk(){
    var form = document.frm;
    
    form.submit();
    window.opener.location.href = "main.do";
    window.close();
}
</script>
     	<style type="text/css">
     	body{
     	background-image: url('img_girl.jpg');
     	}
     	p{
     	text-align : center;
     	font-style: normal ; 
font-weight: normal; 
font-size: 1.1em;
line-height: 2em; 
color: #8f859c;
font-family: inherit;
     	}
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
text-align : center;
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
</head>
<body>

<div class="container">
<br>
           <div class="form-group">
                            <label for="title">제목 :</label>
                            <p>${att.title }</p>
                        </div>
                         <div class="form-group">
                            <label for="title">공사가능일 :</label>
                            <p>${att.possibledate }</p>
                        </div>
                         <div class="form-group">
                            <label for="title">예상금액 :</label>
                            <p>${att.price }</p>
                        </div>
                         <div class="form-group">
                            <label for="title">이미지(클릭시 확대) :</label>
                            <p>	<c:if test="${rfile[0] ne 'null' }">
        <td><a href="javascript:popup('${rfile[0]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[0] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></a></td>
        <c:if test="${not empty rfile[1] }">
        <td><a href="javascript:popup('${rfile[1]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[1] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></a></td>
           	<c:if test="${not empty rfile[2] }">
        <td><a href="javascript:popup('${rfile[2]}');" target = "_self"><img src="/intepark/resources/auctionUpFile/${rfile[2] }" class="img-thumbnail" alt="Cinque Terre" width="150px" height="150px"></a></td>
        </c:if>
        </c:if>
        </c:if></p>
                        </div>
                         <div class="form-group">
                            <label for="title">기타 상세정보 :</label>
                            <p>${att.etc }</p>
                        </div>
</div>
<c:if test="${loginUser.userid eq att.userid }">
<div align="center">
<form method="post" action="auctionAttendProgess2.do" name="frm">
<input type="hidden" name="auctionno" value="${att.auctionno }">
<input type="hidden" name="consid" value="${att.consid }">
<input type="button" value="시공진행" onclick="erchk()" style="background-color: #ffc107;" class="btn">
</form>
</div>
</c:if>

</body>
</html>