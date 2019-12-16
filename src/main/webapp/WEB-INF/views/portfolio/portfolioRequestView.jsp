<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioRequestView</title>

<style type="text/css">
#ok {
	color:white;
	background:rgb(200, 177, 162);
}
</style>

<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->
</head>
<body>
<div class="container">

	<div class="row">
		<div class="col-lg-12">
			
			<div style="width:100%; height:250px; text-align:center; background:rgb(250, 248, 241);">
			<div style="text-align:center; padding-top:100px;">
			
			<c:if test="${empty cons.profilerenameimg}">
			<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" class="img-circle" width="100px" height="100px">
			</c:if>
			<c:if test="${!empty cons.profilerenameimg }">
			<img src="${pageContext.request.contextPath }/resources/img/woosoo/${cons.profilerenameimg}" class="img-circle" width="100px" height="100px">
			</c:if>
			
			<span style="font-size:2em;">&nbsp; ${cons.companyname}</span>
			
			</div><!-- 정보 div 끝 -->
			</div><!-- 백그라운드 div 끝 -->
		
		
		</div><!-- 12 div 끝 -->
	</div><!-- row 끝 -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<br><br>
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
	
	
			
			<form action="test5.do" method="post">
			<input type="hidden" name="consid" value="${cons.consid}">
		
<!-- <select class="selectpicker" data-size="10" title="지역을 선택해 주세요">
  <option>Mustard</option>
  <option>Ketchup</option>
  <option>Relish</option>
  <option>Relish</option>
</select> -->

				<div class="form-group">
					<label for="reqname"><h4><strong>이름을 입력하세요</strong></h4></label>
					<input type="text"name="reqname" id="reqname" style="margin-bottom:10px;" class="form-control" placeholder="이름을 입력하세요" required>
					<span id="reqname_keyup"></span>
				</div>
				<br>
				<div class="form-group">
					<label for="reqphone"><h4><strong>상담받을 핸드폰번호를 입력하세요</strong></h4></label>
					<input type="text"name="reqphone" id="reqphone" style="margin-bottom:10px;" class="form-control" placeholder="010 1234 5678" required>
					<span id="reqphone_keyup"></span>
				</div>
				<hr style="margin-top:30px;">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" id="tongyiAll" class="custom-control-input">
					<label class="custom-control-label" for="tongyiAll"><h4>전체 동의하기</h4></label>
				</div>
				<div class="custom-control custom-checkbox" style="margin-left:20px;">
					<input type="checkbox" name="tongyi" id="tongyi1" class="custom-control-input">
					<label class="custom-control-label" for="tongyi1"><h6><a href="#"><u style="color:black;">서비스 이용을 위한 제3자 정보제공</u></a> 동의 (필수)</h6></label>
				</div>
				<div class="custom-control custom-checkbox" style="margin-left:20px;">
					<input type="checkbox" name="tongyi" id="tongyi2" class="custom-control-input">
					<label class="custom-control-label" for="tongyi2"><h6><a href="#"><u style="color:black;">개인정보 취급방침</u></a> 동의 (필수)</h6></label>
				</div>
				<br><br>
				<div class="form-group">
				<input type="submit" value="상담 신청하기" class="form-control btn" id="ok">
				</div>
			</form>
			<br><br><br><br><br>

	
<!-- 	<div>
<form name='form'>
<select name='Step1' onchange='changes1Step(value)'>
<option>--1단계--</option>
<option value="용병">용병</option>
<option value="아이템">아이템</option>
</select>
<select name='Step2' onchange='changes2Step(value)'>
<option>--2단계--</option>
</select>
<select name='Step3'>
<option>--3단계--</option>
</select>
</form>
</div> -->



		</div><!-- 8 div 끝 -->
		<div class="col-lg-2"></div>
	</div><!-- row 끝 -->
	
</div><!-- container 끝 -->

<script type="text/javascript">

//고객 이름---------------------------------------------------------------------------------------------------------
$('#reqname').keyup(function(){
	var reqname = $(this).val().trim();
	var pattern = /^[가-힣]{2,5}$/;

	if (reqname.length == 0){
		$('#reqname_keyup').html('<font color="red">&nbsp; 필수 입력 항목입니다.</font>');
		return false;
		}
	else if (!pattern.test(reqname)){
		$('#reqname_keyup').html('<font color="red">&nbsp; 2~5자 이내 한글로 입력하세요. </font>');
		return false;
		}
	else if (pattern.test(reqname)){
		$('#reqname_keyup').html("");
		return true;
		}	
});

$('#reqname').focusout(function(){
	var reqname = $(this).val().trim();

	if (reqname.length == 0){
		$('#reqname_keyup').html('<font color="red">&nbsp; 필수 입력 항목입니다.</font>');
		return false;
		}
});

//고객 전화번호---------------------------------------------------------------------------------------------------
$('#reqphone').keyup(function(){
	var reqphone = $(this).val().trim();
	var pattern = /^(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/; 
	//alert(pattern.test(reqphone));
	
	if (reqphone.length == 0){
		$('#reqphone_keyup').html('<font color="red">&nbsp; 필수 입력 항목입니다.</font>');
		return false;
		}
	else if (!pattern.test(reqphone)){
		$('#reqphone_keyup').html('<font color="red">&nbsp; 잘못된 핸드폰번호 입니다. &nbsp;  -  을 제회한 숫자만 입력하세요. </font>');
		return false;
		}
	else if (pattern.test(reqphone)){
		$('#reqphone_keyup').html("");	
		return true;
		}
});

$('#reqphone').focusout(function(){
	var reqphone = $(this).val().trim();

	if (reqphone.length == 0){
		$('#reqphone_keyup').html('<font color="red">&nbsp; 필수 입력 항목입니다.</font>');
		return false;
		}
});

//신청하기 버튼 누를때---------------------------------------------------------------------------------------------------
$('#ok').on('click', function(){
	var reqname = $('#reqname').val();	//고객 이름
	var reqnamepattern = /^[가-힣]{2,5}$/;
	var reqphone = $('#reqphone').val();	//고객 전화번호
	var reqphonepattern = /^(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/; 

	// 고객 이름이 공백이거나 정규식에 맞지 않으면
	if(reqname == "" || !reqnamepattern.test(reqname)){
		$('#reqname').focus();
		return false;
		}
	// 고객 전화번호가 공백이거나 정규식에 맞지 않으면
	if(reqphone == "" || !reqphonepattern.test(reqphone)){
		$('#reqphone').focus();
		return false;
		}
	
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
    })
})



/*  function changes1Step(fr) {
  if(fr=="용병") {
   num = new Array("--2단계--", "소드맨","아처","매지션");
   vnum = new Array("--2단계--", "소드맨","아처", "매지션");
  }
  else if(fr=="아이템") {
   num = new Array("--2단계--", "무기","방어구","장신구", "잡화", "합성석");
   vnum = new Array("--2단계--", "무기","방어구","장신구", "잡화", "합성석");
  }
  for(i=0; i<form.Step2.length; i++) {
   form.Step2.options[i] = null;
  }
  for(i=0; i<form.Step3.length; i++) {
   form.Step3.options[i] = null;
  }
   form.Step3.options[0] = new Option("--3단계--", "--3단계--");
  for(i=0; i<num.length; i++) {
   form.Step2.options[i] = new Option(num[i],vnum[i]);
  }
 }
 function changes2Step(fr) {
  //용병 선택
  if(fr=="소드맨") {
   num = new Array("--3단계--", "버서커", "팔라딘");
   vnum = new Array("--3단계--", "버서커", "팔라딘");
  }
  else if(fr=="아처") {
   num = new Array("--3단계--", "헌터", "레인저");
   vnum = new Array("--3단계--", "헌터", "레인저");
  }
  else if(fr=="매지션") {
   num = new Array("--3단계--", "소서러","위자드");
   vnum = new Array("--3단계--", "소서러","위자드");
  }
  //아이템 선택
  else if(fr=="무기") {
   num = new Array("--3단계--", "검","활","지팡이");
   vnum = new Array("--3단계--", "검","활", "지팡이");
  }
  else if(fr=="방어구") {
   num = new Array("--3단계--", "갑옷","투구","장갑", "신발");
   vnum = new Array("--3단계--", "갑옷","투구","장갑", "신발");
  }
  else if(fr=="장신구") {
   num = new Array("--3단계--", "반지","목걸이");
   vnum = new Array("--3단계--", "반지","목걸이");
  }
  else if(fr=="잡화") {
   num = new Array("--3단계--", "");
   vnum = new Array("--3단계--", "");
  }
  else if(fr=="합정석") {
   num = new Array("--3단계--", "");
   vnum = new Array("--3단계--", "");
  }
  else
  {
   num = new Array("--3단계--");
   vnum = new Array("--3단계--");
  }
  for(i=0; i<form.Step3.length; i++) {
   form.Step3.options[i] = null;
  }
  for(i=0; i<num.length; i++) {
   form.Step3.options[i] = new Option(num[i],vnum[i]);
  }
 } */

</script>
</body>
</html>