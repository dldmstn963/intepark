<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <!-- 금액표시 포멧 -->
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point</title>
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
</head> 
<body>
<%@ include file="../request/Modal.jsp" %>
<header>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</header>
<script type="text/javascript">
$(function(){
$("#check_module").click(function () {
	
	//필수 동의가 체크 안되었으면
	if($("#tongyi1").is(":checked") == false){
		$("#tongyi1").focus();
		alert("서비스 이용을 위한 제3자 정보제공에 동의해 주세요");
		return false;
		}
	if($("#tongyi2").is(":checked") == false){
		$("#tongyi2").focus();
		alert("개인정보 취급방침에 동의해 주세요 ");
		return false;
		}
var IMP = window.IMP; // 생략가능
var value = $('input[name=price]:checked').val();
IMP.init('imp00751002');
// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: 'inicis', // version 1.1.0부터 지원.
/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '인테파크 포인트',
//결제창에서 보여질 이름

amount: value,
//가격
buyer_email: 'iamport@siot.do',
buyer_name: '구매자이름',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
/* m_redirect_url: 'auctionList2.do' */
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if ( rsp.success ) {
	
	var value = $('input[name=price]:checked').val();
    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    jQuery.ajax({
        url: "point2.do", //cross-domain error가 발생하지 않도록 주의해주세요
        type: 'POST',
        dataType: 'json',
        data: {
            consid : "${point.consid}",
            chargeamount : value,
            chargepoint : value,
            restpoint : "${point.restpoint}"
            
            //기타 필요한 데이터가 있으면 추가 전달
        }
    }).done(function(data) {
        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
        if ( everythings_fine ) {
            msg = '결제가 완료되었습니다.';
            msg += '\n고유ID : ' + rsp.imp_uid;
            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
            msg += '\결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            
            alert(msg);
        } else {
            //[3] 아직 제대로 결제가 되지 않았습니다.
            //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
        }
    });
    //성공시 이동할 페이지
 location.href="main.do";
} else {
    msg = '결제에 실패하였습니다.';
    msg += '에러내용 : ' + rsp.error_msg;
    //실패시 이동할 페이지
    location.href="main.do";
    alert(msg);
}
});
});
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#tongyiAll").click(function(){
        //클릭되었으면
        if($("#tongyiAll").prop("checked")){
            //input태그의 name이 tongyi인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=tongyi]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 tongyi인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=tongyi]").prop("checked",false);
        }
    });
});
//체크박스 부분해제시 tongyiAll 도 해제
$(document).on('click', 'input[name="tongyi"]', function(){
    $("#tongyiAll").prop("checked", false);
});
//부분체크 박스로 전부 선택되었을때 tongyiAll 도 선택
$("input[name=tongyi]").on('change', function(){
	if($("input[name=tongyi]").eq(0).is(":checked") && $("input[name=tongyi]").eq(1).is(":checked")){
		$("#tongyiAll").prop("checked", true);
		} 
});
});
$(document).on('click', 'input[name="price"]', function(){
	var value = $('input[name=price]:checked').val();
	 $('#point').val(value);
});
//신청하기 버튼 누를때---------------------------------------------------------------------------------------------------
function requestCheck(){
	
	//필수 동의가 체크 안되었으면
	if($("#tongyi1").is(":checked") == false){
		$("#tongyi1").focus();
		alert("서비스 이용을 위한 제3자 정보제공에 동의해 주세요");
		return false;
		}
	if($("#tongyi2").is(":checked") == false){
		$("#tongyi2").focus();
		alert("개인정보 취급방침에 동의해 주세요 ");
		return false;
		}
	
	return true;
}
</script>
 
<jsp:include page="../common/header.jsp" />
        
                 
 <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <form method="post" class="register-form" id="register-form" action="auctionAttendEnroll2.do" enctype="multipart/form-data">
                         <div class="form-row">
                         <div class="form-group">
                            <label for="restPoint">잔여포인트 :</label>
                            <input type="text" name="restPoint" id="restPoint" value="<fmt:formatNumber value="${point.restpoint}" pattern="#,###"/>" readonly />
                        </div>
                        </div>
                        <br><br>
                        
               <div class="form-row">
                            <label for="auctionsection" class="radio-label" style="margin-left: 15px; margin-bottom: 20px; padding-right: 30px;">충전금액 :</label><br>
                            <div class="form-radio-item">
                                <label for="10000">10,000</label>
                                  <input type="radio" name="price" id="10000" value="10000" checked>
                                <span class="check"></span>
                            </div>
                            <div class="form-radio-item">
                                <label for="20000">20,000</label>
                                 <input type="radio" name="price" id="20000" value="20000">
                                <span class="check"></span>
                            </div>
                             <div class="form-radio-item">
                                <label for="30000">30,000</label>
                                 <input type="radio" name="price" id="30000" value="30000">
                                <span class="check"></span>
                            </div>
                             <div class="form-radio-item">
                                <label for="40000">40,000</label>
                                 <input type="radio" name="price" id="40000" value="40000">
                                <span class="check"></span>
                            </div>
                             <div class="form-radio-item">
                                <label for="50000">50,000</label>
                                 <input type="radio" name="price" id="50000" value="50000">
                                <span class="check"></span>
                            </div>
                            <br><br>
                                 <div class="form-group">
                            <label for="point">충전포인트 :</label>
                            <input type="text" name="point" id="point" readonly />
                        </div>
                            
                        </div>
                        <br><br><br>
    <div class="custom-control custom-checkbox">
					<input type="checkbox" id="tongyiAll" class="custom-control-input">
					<label class="custom-control-label" for="tongyiAll"><h4>전체 동의하기</h4></label>
				</div>
				<div class="custom-control custom-checkbox" style="margin-left:20px;">
					<input type="checkbox" name="tongyi" id="tongyi1" class="custom-control-input">
					<label class="custom-control-label" for="tongyi1"><h6><a data-target="#layerpop" data-toggle="modal" data-backdrop="static">
					<u style="color:black;">서비스 이용을 위한 제3자 정보제공</u></a> 동의 <font color="red">(필수)</font></h6></label>
				</div>
				<div class="custom-control custom-checkbox" style="margin-left:20px;">
					<input type="checkbox" name="tongyi" id="tongyi2" class="custom-control-input">
					<label class="custom-control-label" for="tongyi2"><h6><a data-target="#layerpop2" data-toggle="modal" data-backdrop="static">
					<u style="color:black;">개인정보 취급방침</u></a> 동의 <font color="red">(필수)</font></h6></label>
				</div>
				<div class="container">
				<br>
                    <button id="check_module" type="button"><img src="resources/img/images/KakaoPay.png" width="200" height="50" style="cursor:pointer;align:center;"></button>
                    </div>
 <%--    <input type="hidden" value="${ }" id="consid" name="consid"> --%>
                    
                    </form>
                </div>
            </div>
        </div>
    </div>
 
  <jsp:include page="../common/footer.jsp" />
</body>
</html>