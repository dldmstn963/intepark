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
span {
     outline: none; /* 선택을 했을 때 테두리가 보이는 현상을 처리 */
}
</style>

</head>
<body>
<%@ include file="../request/Modal.jsp" %><!-- 모달 jsp -->
<div class="container">
<!-- -----------------------------------------------프로필 구역▼------------------------------------------------------------------------------------------------------------------ -->
	<div class="row">
		<div class="col-lg-12">
			
			<div style="width:100%; height:240px; text-align:center; background:rgb(250, 248, 241);">
			<div style="text-align:center; padding-top:20px;">
			
			<img src="${pageContext.request.contextPath }/resources/img/logo.png" ><br><br><br>
			
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
		<div class="col-lg-3"></div>
		<div class="col-lg-7">
	
	
			
			<form action="insertRequest5.do" method="post" onsubmit="return requestCheck();" name="frm">
			<input type="hidden" name="consid" value="${cons.consid}">
			<c:if test="${!empty sessionScope.loginCons.consid }">
			<input type="hidden" name="userid" value="${sessionScope.loginCons.consid }">
			</c:if>
			<c:if test="${!empty sessionScope.loginUser.userid }">
			<input type="hidden" name="userid" value="${sessionScope.loginUser.userid }">
			</c:if>
			
				<div class="form-group">
					<h4><strong>시공 분야를 선택해 주세요</strong></h4>
					<p>해당 전문가님이 시공 가능한 분야는 아래와 같습니다.</p>
					<span id="reqarea_keyup" tabindex="0" style="padding-bottom:20px;"></span>
					
					<c:forEach var="area" items="${areas }">
					<div class="custom-control custom-checkbox" style="display:inline;">
					<input type="checkbox" name="reqarea" id="${area.trim() }" value="${area.trim() }" class="custom-control-input">
					<label for="${area.trim() }" class="custom-control-label" ><h4>${area.trim() }</h4></label>
					</div>
					</c:forEach>
					
				</div>
				<br>
				<div class="form-group">
				<h4><strong>시공할 지역을 알려주세요</strong></h4>
				<span id="reqregion_keyup"></span><span id="reqregion2_keyup"></span>
				<div style="display:inline; margin-right:15px;">
					<select class="selectpicker" data-size="10" title="시를 선택해주세요" name="reqregion" id="reqregion" onChange="sub_change1()"> <!-- data-size="10" option갯수제한 -->
							  <!-- <option selected="selected" disabled>시를 선택해 주세요</option> -->
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
				<div style="display:none;" id="selectbox2">
					<select class="form-control" name="reqregion2" id="reqregion2">
							  <option selected="selected" disabled>구를 선택해 주세요</option>
					</select>
				</div>
				</div>
				<br>
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
					<input type="text" name="reqname" id="reqname" style="margin-bottom:10px;" class="form-control" placeholder="이름을 입력하세요" >
				</div>
				<br>
				<div class="form-group">
					<label for="reqphone"><h4><strong>상담받을 핸드폰번호를 입력하세요</strong></h4></label>
					<br><span id="reqphone_keyup"></span>
					<input type="tel" name="reqphone" id="reqphone" onkeydown="telCheck(event,this)" maxlength="13" style="margin-bottom:10px;" class="form-control" placeholder="010 1234 5678" >
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
			<br><br><br>
			

			
		</div><!-- 7 div 끝 -->
		<div class="col-lg-2"></div>
	</div><!-- row 끝 -->
	
</div><!-- container 끝 -->

<script type="text/javascript">

//시공 분야---------------------------------------------------------------------------------------------------------

$("input[name=reqarea]").change(function(){
	var reqarea = $("input[name=reqarea]").is(":checked", true);
	
	if(reqarea == true){
		$("#reqarea_keyup").html("");
	}
});

//시공 지역---------------------------------------------------------------------------------------------------------
function sub_change1()
{
    $("#reqregion2 option:eq(0)").prop("selected", true); //처음 위치로 돌아가기
    
 	vn_mnu1 = frm.reqregion.selectedIndex;

	 if ( vn_mnu1 == 1 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 26;
	  //frm.reqregion2.options[0].text =  '구를 선택해 주세요';
	  frm.reqregion2.options[1].text =  '강남구';
	  frm.reqregion2.options[2].text =  '강동구';
	  frm.reqregion2.options[3].text =  '강북구';
	  frm.reqregion2.options[4].text =  '강서구';
	  frm.reqregion2.options[5].text =  '관악구';
	  frm.reqregion2.options[6].text =  '광진구';
	  frm.reqregion2.options[7].text =  '구로구';
	  frm.reqregion2.options[8].text =  '금천구';
	  frm.reqregion2.options[9].text =  '노원구';
	  frm.reqregion2.options[10].text =  '도봉구';
	  frm.reqregion2.options[11].text =  '동대문구';
	  frm.reqregion2.options[12].text =  '동작구';
	  frm.reqregion2.options[13].text =  '마포구';
	  frm.reqregion2.options[14].text =  '서대문구';
	  frm.reqregion2.options[15].text =  '서초구';
	  frm.reqregion2.options[16].text =  '성동구';
	  frm.reqregion2.options[17].text =  '성북구';
	  frm.reqregion2.options[18].text =  '송파구';
	  frm.reqregion2.options[19].text =  '양천구';
	  frm.reqregion2.options[20].text =  '영등포구';
	  frm.reqregion2.options[21].text =  '용산구';
	  frm.reqregion2.options[22].text =  '은평구';
	  frm.reqregion2.options[23].text =  '종로구';
	  frm.reqregion2.options[24].text =  '중구';
	  frm.reqregion2.options[25].text =  '중랑구';
	 }
	 if ( vn_mnu1 == 2 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 17;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '강서구';
	  frm.reqregion2.options[2].text =  '금정구';
	  frm.reqregion2.options[3].text =  '남구';
	  frm.reqregion2.options[4].text =  '동구';
	  frm.reqregion2.options[5].text =  '동래구';
	  frm.reqregion2.options[6].text =  '부산진구';
	  frm.reqregion2.options[7].text =  '북구';
	  frm.reqregion2.options[8].text =  '사상구';
	  frm.reqregion2.options[9].text =  '사하구';
	  frm.reqregion2.options[10].text =  '서구';
	  frm.reqregion2.options[11].text =  '수영구';
	  frm.reqregion2.options[12].text =  '연제구';
	  frm.reqregion2.options[13].text =  '영도구';
	  frm.reqregion2.options[14].text =  '중구';
	  frm.reqregion2.options[15].text =  '해운대구';
	  frm.reqregion2.options[16].text =  '기장군';
	 }
	 if ( vn_mnu1 == 3 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 9;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '남구';
	  frm.reqregion2.options[2].text =  '달서구';
	  frm.reqregion2.options[3].text =  '동구';
	  frm.reqregion2.options[4].text =  '북구';
	  frm.reqregion2.options[5].text =  '서구';
	  frm.reqregion2.options[6].text =  '수성구';
	  frm.reqregion2.options[7].text =  '중구';
	  frm.reqregion2.options[8].text =  '달성군';
	 }
	 if ( vn_mnu1 == 4 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 11;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '계양구';
	  frm.reqregion2.options[2].text =  '미추홀구';
	  frm.reqregion2.options[3].text =  '남동구';
	  frm.reqregion2.options[4].text =  '동구';
	  frm.reqregion2.options[5].text =  '부평구';
	  frm.reqregion2.options[6].text =  '서구';
	  frm.reqregion2.options[7].text =  '연수구';
	  frm.reqregion2.options[8].text =  '중구';
	  frm.reqregion2.options[9].text =  '강화군';
	  frm.reqregion2.options[10].text =  '옹진군';
	 }
	 if ( vn_mnu1 == 5 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 6;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '광산구';
	  frm.reqregion2.options[2].text =  '남구';
	  frm.reqregion2.options[3].text =  '동구';
	  frm.reqregion2.options[4].text =  '북구';
	  frm.reqregion2.options[5].text =  '서구';
	 }
	 if ( vn_mnu1 == 6 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 6;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '대덕구';
	  frm.reqregion2.options[2].text =  '동구';
	  frm.reqregion2.options[3].text =  '서구';
	  frm.reqregion2.options[4].text =  '유성구';
	  frm.reqregion2.options[5].text =  '중구';
	 }
	 if ( vn_mnu1 == 7 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 6;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '남구';
	  frm.reqregion2.options[2].text =  '동구';
	  frm.reqregion2.options[3].text =  '북구';
	  frm.reqregion2.options[4].text =  '중구';
	  frm.reqregion2.options[5].text =  '울주군';
	 }
	 if ( vn_mnu1 == 8 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 19;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '강릉시';
	  frm.reqregion2.options[2].text =  '고성군';
	  frm.reqregion2.options[3].text =  '동해시';
	  frm.reqregion2.options[4].text =  '삼척시';
	  frm.reqregion2.options[5].text =  '속초시';
	  frm.reqregion2.options[6].text =  '양구군';
	  frm.reqregion2.options[7].text =  '양양군';
	  frm.reqregion2.options[8].text =  '영월군';
	  frm.reqregion2.options[9].text =  '원주시';
	  frm.reqregion2.options[10].text =  '인제군';
	  frm.reqregion2.options[11].text =  '정선군';
	  frm.reqregion2.options[12].text =  '철원군';
	  frm.reqregion2.options[13].text =  '춘천시';
	  frm.reqregion2.options[14].text =  '태백시';
	  frm.reqregion2.options[15].text =  '평창군';
	  frm.reqregion2.options[16].text =  '홍천군';
	  frm.reqregion2.options[17].text =  '화천군';
	  frm.reqregion2.options[18].text =  '횡성군';
	}
	 if ( vn_mnu1 == 9 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 31;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '가평군';
	  frm.reqregion2.options[2].text =  '고양시';
	  frm.reqregion2.options[3].text =  '과천시';
	  frm.reqregion2.options[4].text =  '광명시';
	  frm.reqregion2.options[5].text =  '광주시';
	  frm.reqregion2.options[6].text =  '구리시';
	  frm.reqregion2.options[7].text =  '군포시';
	  frm.reqregion2.options[8].text =  '김포시';
	  frm.reqregion2.options[9].text =  '남양주시';
	  frm.reqregion2.options[10].text =  '동두천시';
	  frm.reqregion2.options[11].text =  '부천시';
	  frm.reqregion2.options[12].text =  '성남시';
	  frm.reqregion2.options[13].text =  '수원시';
	  frm.reqregion2.options[14].text =  '시흥시';
	  frm.reqregion2.options[15].text =  '안산시';
	  frm.reqregion2.options[16].text =  '양주시';
	  frm.reqregion2.options[17].text =  '양평군';
	  frm.reqregion2.options[18].text =  '여주시';
	  frm.reqregion2.options[19].text =  '연천군';
	  frm.reqregion2.options[20].text =  '오산시';
	  frm.reqregion2.options[21].text =  '용인시';
	  frm.reqregion2.options[22].text =  '의왕시';
	  frm.reqregion2.options[23].text =  '의정부시';
	  frm.reqregion2.options[24].text =  '이천시';
	  frm.reqregion2.options[25].text =  '파주시';
	  frm.reqregion2.options[26].text =  '평택시';
	  frm.reqregion2.options[27].text =  '포천시';
	  frm.reqregion2.options[28].text =  '하남시';
	  frm.reqregion2.options[29].text =  '화성시';
	  frm.reqregion2.options[30].text =  '안성시';
	 }
	 if ( vn_mnu1 == 10 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 20;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '거제시';
	  frm.reqregion2.options[2].text =  '거창군';
	  frm.reqregion2.options[3].text =  '고성군';
	  frm.reqregion2.options[4].text =  '김해시';
	  frm.reqregion2.options[5].text =  '남해군';
	  frm.reqregion2.options[6].text =  '마산시';
	  frm.reqregion2.options[7].text =  '밀양시';
	  frm.reqregion2.options[8].text =  '사천시';
	  frm.reqregion2.options[9].text =  '산청군';
	  frm.reqregion2.options[10].text =  '양산시';
	  frm.reqregion2.options[11].text =  '의령군';
	  frm.reqregion2.options[12].text =  '진주시';
	  frm.reqregion2.options[13].text =  '창녕군';
	  frm.reqregion2.options[14].text =  '창원시';
	  frm.reqregion2.options[15].text =  '통영시';
	  frm.reqregion2.options[16].text =  '하동군';
	  frm.reqregion2.options[17].text =  '함안군';
	  frm.reqregion2.options[18].text =  '함양군';
	  frm.reqregion2.options[19].text =  '합천군';
	}
	 if ( vn_mnu1 == 11 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 24;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '경산시';
	  frm.reqregion2.options[2].text =  '경주시';
	  frm.reqregion2.options[3].text =  '구미시';
	  frm.reqregion2.options[4].text =  '김천시';
	  frm.reqregion2.options[5].text =  '문경시';
	  frm.reqregion2.options[6].text =  '상주시';
	  frm.reqregion2.options[7].text =  '안동시';
	  frm.reqregion2.options[8].text =  '영주시';
	  frm.reqregion2.options[9].text =  '영천시';
	  frm.reqregion2.options[10].text =  '포항시';
	  frm.reqregion2.options[11].text =  '고령군';
	  frm.reqregion2.options[12].text =  '군위군';
	  frm.reqregion2.options[13].text =  '봉화군';
	  frm.reqregion2.options[14].text =  '성주군';
	  frm.reqregion2.options[15].text =  '영덕군';
	  frm.reqregion2.options[16].text =  '영양군';
	  frm.reqregion2.options[17].text =  '예천군';
	  frm.reqregion2.options[18].text =  '울릉군';
	  frm.reqregion2.options[19].text =  '울진군';
	  frm.reqregion2.options[20].text =  '의성군';
	  frm.reqregion2.options[21].text =  '청도군';
	  frm.reqregion2.options[22].text =  '청송군';
	  frm.reqregion2.options[23].text =  '칠곡군';
	}
	 if ( vn_mnu1 == 12 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 23;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '광양시';
	  frm.reqregion2.options[2].text =  '나주시';
	  frm.reqregion2.options[3].text =  '목포시';
	  frm.reqregion2.options[4].text =  '순천시';
	  frm.reqregion2.options[5].text =  '여수시';
	  frm.reqregion2.options[6].text =  '강진군';
	  frm.reqregion2.options[7].text =  '고흥군';
	  frm.reqregion2.options[8].text =  '곡성군';
	  frm.reqregion2.options[9].text =  '구례군';
	  frm.reqregion2.options[10].text =  '담양군';
	  frm.reqregion2.options[11].text =  '무안군';
	  frm.reqregion2.options[12].text =  '보성군';
	  frm.reqregion2.options[13].text =  '신안군';
	  frm.reqregion2.options[14].text =  '영광군';
	  frm.reqregion2.options[15].text =  '영암군';
	  frm.reqregion2.options[16].text =  '완도군';
	  frm.reqregion2.options[17].text =  '장성군';
	  frm.reqregion2.options[18].text =  '장흥군';
	  frm.reqregion2.options[19].text =  '진도군';
	  frm.reqregion2.options[20].text =  '함평군';
	  frm.reqregion2.options[21].text =  '해남군';
	  frm.reqregion2.options[22].text =  '화순군';
	}
	 if ( vn_mnu1 == 13 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 15;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '군산시';
	  frm.reqregion2.options[2].text =  '김제시';
	  frm.reqregion2.options[3].text =  '남원시';
	  frm.reqregion2.options[4].text =  '익산시';
	  frm.reqregion2.options[5].text =  '전주시';
	  frm.reqregion2.options[6].text =  '정읍시';
	  frm.reqregion2.options[7].text =  '고창군';
	  frm.reqregion2.options[8].text =  '무주군';
	  frm.reqregion2.options[9].text =  '부안군';
	  frm.reqregion2.options[10].text =  '순창군';
	  frm.reqregion2.options[11].text =  '완주군';
	  frm.reqregion2.options[12].text =  '임실군';
	  frm.reqregion2.options[13].text =  '장수군';
	  frm.reqregion2.options[14].text =  '진안군';
	}
	 if ( vn_mnu1 == 14 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 17;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '계롱시';
	  frm.reqregion2.options[2].text =  '공주시';
	  frm.reqregion2.options[3].text =  '논산시';
	  frm.reqregion2.options[4].text =  '보령시';
	  frm.reqregion2.options[5].text =  '서산시';
	  frm.reqregion2.options[6].text =  '아산시';
	  frm.reqregion2.options[7].text =  '천안시';
	  frm.reqregion2.options[8].text =  '금산군';
	  frm.reqregion2.options[9].text =  '당진시';
	  frm.reqregion2.options[10].text =  '부여군';
	  frm.reqregion2.options[11].text =  '서천군';
	  frm.reqregion2.options[12].text =  '연기군';
	  frm.reqregion2.options[13].text =  '예산군';
	  frm.reqregion2.options[14].text =  '청양군';
	  frm.reqregion2.options[15].text =  '태안군';
	  frm.reqregion2.options[16].text =  '홍성군';
	}
	 if ( vn_mnu1 == 15 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 13;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '제천시';
	  frm.reqregion2.options[2].text =  '청주시';
	  frm.reqregion2.options[3].text =  '충주시';
	  frm.reqregion2.options[4].text =  '괴산군';
	  frm.reqregion2.options[5].text =  '단양군';
	  frm.reqregion2.options[6].text =  '보은군';
	  frm.reqregion2.options[7].text =  '영동군';
	  frm.reqregion2.options[8].text =  '옥천군';
	  frm.reqregion2.options[9].text =  '음성군';
	  frm.reqregion2.options[10].text =  '증평군';
	  frm.reqregion2.options[11].text =  '진천군';
	  frm.reqregion2.options[12].text =  '청원군';
	}
	 if ( vn_mnu1 == 16 )
	 {
	  $("#selectbox2").css("display", "none");
	  frm.reqregion2.length = 1;
	}
	 if ( vn_mnu1 == 17 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.reqregion2.length = 3;
	  //frm.reqregion2.options[0].text =  '';
	  frm.reqregion2.options[1].text =  '제주시';
	  frm.reqregion2.options[2].text =  '서귀포시';
	}								
}
//시 span 값없애기
$("#reqregion").change(function(){
	var reqregion = $(this).val();
	
	if(reqregion.length != 0){
		$("#reqregion_keyup").html("");
	}
});
//구 span 값없애기
$("#reqregion2").change(function(){
	var reqregion2 = $(this).val();
	
	if(reqregion2.length != 0 /* || ($("#reqregion").val() == "세종특별자치시") */){
		$("#reqregion2_keyup").html("");
	}
});

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

function telCheck(event,tel){	//자동 하이픈 넣기
	var utel= tel.value;
	var code= event.keyCode;

	if(code==8 || code ==46){
		return false;
		}

	if(utel.length == 3)
		tel.value=utel+'-';
	if(utel.length == 8)
		tel.value=utel+'-';
	return false;
}

$('#reqphone').keyup(function(){
	var reqphone = $(this).val().trim();
	//var pattern = /^(01[016789])([1-9]{2}[0-9]{3,4})([0-9]{4})$/; 
	var pattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	//alert(pattern.test(reqphone));
	
	// 01로 시작하는 핸드폰 및 지역번호와 050, 070 검증함. 그리고 -(하이픈)은 넣어도 되고 생략해도 되나 넣을 때에는 정확한 위치에 넣어야 함.
	//var pattern = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;


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

	var reqarea = $("input[name=reqarea]").is(":checked", true);	//시공 분야
	var reqregion = $("#reqregion")	.val();	 //시공 지역 (시)
	var reqregion2 = $("#reqregion2").val();	 //시공 지역 (구)
	var reqbudget = $('#reqbudget').val();  //시공 예산
	var reqname = $('#reqname').val();	 //고객 이름
	var reqnamepattern = /^[가-힣]{2,5}$/;
	var reqphone = $('#reqphone').val();  //고객 전화번호
	//var reqphonepattern = /^(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/; 
	var reqphonepattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

	//시공 분야 선택 안되었으면
	if(reqarea == false){
		$("#reqarea_keyup").html('<font color="red">&nbsp; 최소 한개 이상 선택하세요.</font><br>');
		$("#reqarea_keyup").focus();
		return false;
		}
	//시공 지역 (시) 선택 안되었으면
	if(reqregion.length == 0){
		$("#reqregion_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font><br>');
		$("#reqregion").focus();
		return false;
		}
	//시공 지역 (구) 선택 안되었으면
	if(reqregion != "세종특별자치시" && reqregion2 == null){
		$("#reqregion2_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font><br>');
		$("#reqregion2").focus();
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