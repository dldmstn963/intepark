<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioRequestView</title>
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->

<style type="text/css">
#ok {
	color:white;
	background:rgb(200, 177, 162);
}
table{
	border: 2px solid lightgray;
}
.table tr td{
	font-size:0.8em;
	padding:3px;
}
.table tr th{
	background:#F2F2F2;
}

</style>

</head>
<body>
<%@ include file="../portfolio/Modal.jsp" %><!-- 모달 jsp -->
<div class="container">
<!-- -----------------------------------------------프로필 구역▼------------------------------------------------------------------------------------------------------------------ -->
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

<!-- -----------------------------------------------상담신청 작성 구역▼--------------------------------------------------------------------------------------------------------- -->
	<br><br>
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
	
	
			
			<form action="insertRequest5.do" method="post" onsubmit="return requestCheck();" name="frm">
			<input type="hidden" name="consid" value="${cons.consid}">
			<c:if test="${!empty sessionScope.loginCons.consid }">
			<input type="hidden" name="userid" value="${sessionScope.loginCons.consid }">
			</c:if>
			<c:if test="${!empty sessionScope.loginUser.userid }">
			<input type="hidden" name="userid" value="${sessionScope.loginUser.userid }">
			</c:if>
			
			
				<div>
				<h4><strong>시공할 지역을 알려주세요</strong></h4>
				<span id="reqregion_keyup"></span>
				</div>
				
				<div style="display:inline; margin-right:15px;">
					<select title="시를 선택해주세요" data-size="10" name="reqregion" id="reqregion" onChange="sub_change1()"> <!-- data-size="10" option갯수제한 -->
							  <option disabled>시를 선택해 주세요</option>
							  <option>서울특별시</option>
							  <option>부산광역시</option>
							  <option>대구광역시</option>
							  <option>인천광역시</option>
							  <option>광주광역시</option>
							  <option>대전광역시</option>
							  <option>울산광역시</option>
							  <option>강원도</option>
							  <option>경기도</option>
							  <option>경상남도</option>
							  <option>경상북도</option>
							  <option>전라남도</option>
							  <option>전라북도</option>
							  <option>충청남도</option>
							  <option>충청북도</option>
							  <option>세종특별자치시</option><!-- 세종특별시는 하위지역 없음 -->
							  <option>제주특별자치도</option>
					</select>
				</div>
				
				<div style="display:inline;">
					<select title="시를 선택해주세요" data-size="10" name="reqregion2">
							  <option value=" " selected>---두번째 항목---</option>
					</select>
				</div>

				
				
				

				
				
				<%-- <%@ include file="../portfolio/City.jsp" %> --%><!-- 시공 지역 jsp -->
				<br><br>
				<div class="form-group">
					<h4><strong>시공 예산을 선택해 주세요</strong></h4>
					<span id="reqbudget_keyup"></span>
					<select class="form-control selectpicker" title="대략적인 예산을 선택해 주세요" name="reqbudget" id="reqbudget" > <!-- data-size="10" option갯수제한 -->
					  <option disabled>대략적인 예산을 선택해 주세요</option>
					  <option value="500만원 미만">500만원 미만</option>
					  <option value="500만원 ~ 1,000만원">500만원 ~ 1,000만원</option>
					  <option value="1,000만원 ~ 2,000만원">1,000만원 ~ 2,000만원</option>
					  <option value="2,000만원 ~ 3,000만원">2,000만원 ~ 3,000만원</option>
					  <option value="3,000만원 이상">3,000만원 이상</option>
					</select>
				</div>
				<br>
				<div class="form-group">
					<label for="reqname"><h4><strong>이름을 입력하세요</strong></h4></label>
					<br><span id="reqname_keyup"></span>
					<input type="text"name="reqname" id="reqname" style="margin-bottom:10px;" class="form-control" placeholder="이름을 입력하세요" >
				</div>
				<br>
				<div class="form-group">
					<label for="reqphone"><h4><strong>상담받을 핸드폰번호를 입력하세요</strong></h4></label>
					<br><span id="reqphone_keyup"></span>
					<input type="tel" name="reqphone" id="reqphone" style="margin-bottom:10px;" class="form-control" placeholder="010 1234 5678" >
				</div>
				<hr style="margin-top:30px;">
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
				<br><br>
				<div class="form-group">
				<input type="submit" value="상담 신청하기" class="form-control btn" id="ok">
				</div>
			</form>
			<br><br><br><br><br><br><br><br><br><br><br><br>
			

			
		</div><!-- 8 div 끝 -->
		<div class="col-lg-2"></div>
	</div><!-- row 끝 -->
	
</div><!-- container 끝 -->

<script type="text/javascript">

/* 	function sub_change1(){

		 var str = $("select[name=reqregion2]", document.frm.val();    // 가져오고싶은 객체가 속해있는 form 을 적어주면 끝~~~~
		    alert("전화번호 : " + str);
		}
   






function sub_change1()
{
 vn_mnu1 = frm.reqregion.selectedIndex;

 if ( vn_mnu1 == 1 )
 {
  frm.reqregion2.length = 3;
  frm.reqregion2.options[0].text =  '---두번째 항목---';
  frm.reqregion2.options[1].text =  '남';
  frm.reqregion2.options[2].text =  '여';
 }
 if ( vn_mnu1 == 2 )
 {
  frm.reqregion2.length = 7;
  frm.reqregion2.options[0].text =  '---두번째 항목---';
  frm.reqregion2.options[1].text =  '10대이하';
  frm.reqregion2.options[2].text =  '10대';
  frm.reqregion2.options[3].text =  '20대';
  frm.reqregion2.options[4].text =  '30대';
  frm.reqregion2.options[5].text =  '40대';
  frm.reqregion2.options[6].text =  '50대이상';
 }
 if ( vn_mnu1 == 3 )
 {
  frm.reqregion2.length = 16;
  frm.reqregion2.options[0].text =  '---두번째 항목---';
  frm.reqregion2.options[1].text =  '강원도';
  frm.reqregion2.options[2].text =  '경기도';
  frm.reqregion2.options[3].text =  '경상남도';
  frm.reqregion2.options[4].text =  '경상북도';
  frm.reqregion2.options[5].text =  '광주광역시';
  frm.reqregion2.options[7].text =  '대구광역시';
  frm.reqregion2.options[8].text =  '부산광역시';
  frm.reqregion2.options[9].text =  '서울특별시';
  frm.reqregion2.options[10].text =  '울산광역시';
  frm.reqregion2.options[11].text =  '전라남도';
  frm.reqregion2.options[12].text =  '전라북도';
  frm.reqregion2.options[13].text =  '제주도';
  frm.reqregion2.options[14].text =  '충청남도';
  frm.reqregion2.options[15].text =  '충청북도';
 }
 if ( vn_mnu1 == 4 )
 {
  frm.reqregion2.length = 6;
  frm.reqregion2.options[0].text =  '---두번째 항목---';
  frm.reqregion2.options[1].text =  '기독교';
  frm.reqregion2.options[2].text =  '불교';
  frm.reqregion2.options[3].text =  '천주교';
  frm.reqregion2.options[4].text =  '기타';
  frm.reqregion2.options[5].text =  '무교';
 }
}

 */




//시공 예산---------------------------------------------------------------------------------------------------------
$("#reqbudget").change(function(){
	var reqbudget = $(this).val();
	
	if(reqbudget.length != 0){
		$("#reqbudget_keyup").html("");
	}
});

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

$('#reqname').focusin(function(){
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

$('#reqphone').focusin(function(){
	var reqphone = $(this).val().trim();

	if (reqphone.length == 0){
		$('#reqphone_keyup').html('<font color="red">&nbsp; 필수 입력 항목입니다.</font>');
		return false;
		}
});

//신청하기 버튼 누를때---------------------------------------------------------------------------------------------------
function requestCheck(){
	
	var reqregion = $("#reqregion")	.val();	 //시공 지역
	var reqbudget = $('#reqbudget').val();  //시공 예산
	var reqname = $('#reqname').val();	 //고객 이름
	var reqnamepattern = /^[가-힣]{2,5}$/;
	var reqphone = $('#reqphone').val();  //고객 전화번호
	var reqphonepattern = /^(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/; 

	//시공 지역이 선택 안되었으면
	if(reqregion.length == 0){
		$("#reqregion_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font>');
		$("#reqregion").focus();
		return false;
		}	
	//시공 예산이 체크 안되었으면
	if(reqbudget.length == 0){
		$("#reqbudget_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font>');
		$("#reqbudget").focus();
		return false;
		}
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

//체크박스---------------------------------------------------------------------------------------------------
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

</script>

</body>
</html>