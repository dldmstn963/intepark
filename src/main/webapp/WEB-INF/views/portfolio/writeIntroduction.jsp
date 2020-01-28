<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeIntroduction</title>

<style type="text/css">
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}
</style>
<script type="text/javascript" src="/intepark/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->

<div class="container">
<br>
<div class="row">
	
	<div class="col-lg-9"></div><!-- 9 끝 -->
	
	<div class="col-lg-3" style="text-align:right;">
	<div style="display:inline-block;">
		<form action="conslist5.do" method="post" onsubmit="return warning();">
			<button class="btn btn-success btn-sm" style="font:small-caption;">목록으로</button>&nbsp;&nbsp;
		</form>	
	</div>
					
	</div><!-- 3 끝 -->
	
	</div><!-- row 끝 -->



	<div class="row" style="min-height:600px;">
		
		<div class="col-lg-3">
		
		<div class="col-lg-12" style="margin-left:10px; margin-top:100px;"><!-- 프로필 이미지 -->
		<c:if test="${empty cons.profilerenameimg}">
		<img src="${pageContext.request.contextPath }/resources/img/woosoo/cons_profile_noimage.jpg" width="100px" height="100px">
		</c:if>
		<c:if test="${!empty cons.profilerenameimg }">
		<img src="${pageContext.request.contextPath }/resources/img/woosoo/${cons.profilerenameimg}" width="100px" height="100px">
		</c:if>
		</div>
		
		<div class="col-lg-12" style="margin-top:15px;"><h3>${cons.companyname }</h3></div><!-- 업체명 -->
		<div class="col-lg-12">${cons.consarea }</div><!-- 업체시공분야 -->
		
		<div class="col-lg-12" style="margin-top:3px;">
		
			<span class="star-prototype">${rv.rvavg }</span>&nbsp; <c:if test="${rv.count != 0 }">${rv.count }개&nbsp;</c:if>
			
		</div>
		
		<c:if test="${cons.consid eq sessionScope.loginCons.consid }"><!-- 해당 시공사 로그인시 -->
			<div class='col-lg-12' style="margin-top:7px;">
				<div class="form-group">
	      		<form action="selectRequestList5.do" method="post" onsubmit="return warning2();">
	      		<input type="hidden" value="${cons.consid}" name="consid">
	      		<input type="submit" value="상담신청 내역조회" class="form-control btn-primary">
	      		</form>
	      		</div>
			</div>
		</c:if>
		
		<div class="col-lg-12"><strong>주소</strong>&nbsp;&nbsp;&nbsp;${cons.address }</div>
		<div class="col-lg-12"><strong>경력</strong>&nbsp;&nbsp;&nbsp;${cons.career }</div>
		<div class="col-lg-12"><strong>&nbsp;A/S</strong>&nbsp;&nbsp;&nbsp;${cons.asdate }</div>
		
		
		</div><!-- div 3 끝 -->
		
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->		
		
		<div class="col-lg-9">
			<div class="container">
		      <div class="row">
		        <div class="col">
		        
		            <ul class="nav nav-tabs">
		              <li class="nav-item">
		                <a class="nav-link active" data-toggle="tab" href="#aa">소개글</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" data-toggle="tab" onclick="po('${consid}');">포트폴리오</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" data-toggle="tab" onclick="re('${consid}');">리뷰</a>
		              </li>
		            </ul>
		            
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
		            <div class="tab-content"><!-- 탭 컨테이너 시작 -->
		            
		            
	<!-- --------------------------------------------------------------소개글 탭 구역 시작---------------------------------------------------------------------- -->
		              <div class="tab-pane fade show active" id="aa">
		              
		              	<form action="updateIntroduction5.do" method="post" >
      						<input type="hidden" value="${cons.consid}" name="consid">
      						<button onclick="submitContents(this);" class="btn btn-success btn-sm" style="float:right; margin-top:5px; font:small-caption;">저장하기</button>
      					
      						<br><h4 style="color:black;">&nbsp;업체 소개글 작성하기</h4>
		              
		                	<textarea name="ir1" id="ir1" rows="18" style="width:100%;">
		                	${cons.pfintroduction }
		                	</textarea>
		                
		                </form>
		                
		              </div>
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
  
	<!-- ------------------------------------------------------------포트폴리오 탭 구역 시작---------------------------------------------------------------------- -->	              
		              <!-- <div class="tab-pane fade" id="bb">
		              </div> -->
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
			              
	<!-- ----------------------------------------------------------------리뷰 탭 구역 시작------------------------------------------------------------------------- -->	              
		              <!-- <div class="tab-pane fade" id="cc"> 
		              </div> -->
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	            
		            
 
		            </div><!-- 탭 컨테이너 끝 -->
		            		            
		        </div><!-- 메인 col 끝 -->
		      </div><!-- 메인 row 끝 -->
		    </div><!-- 메인 컨테이너 끝 -->
		</div><!-- div 9 끝 -->
		
	</div><!-- row 끝 -->
</div><!-- 컨테이너 끝 -->


<script type="text/javascript">
//포트폴리오 클릭시
function po(consid){
	if(!confirm(" 저장하기를 버튼을 누르지 않으면 \n 변경된 내용이 저장되지 않습니다. \n 이대로 작성페이지를 나가시겠습니까?"))
		return false;
	location.href = "pfOne5.do?consid="+consid+"&message="+'portfolio';
}

//리뷰클릭시
function re(consid){
	if(!confirm(" 저장하기를 버튼을 누르지 않으면 \n 변경된 내용이 저장되지 않습니다. \n 이대로 작성페이지를 나가시겠습니까?"))
		return false;
	location.href = "pfOne5.do?consid="+consid+"&message="+'review';
}

//목록으로 클릭시
function warning(){
	if(confirm(" 저장하기를 버튼을 누르지 않으면 \n 변경된 내용이 저장되지 않습니다. \n 이대로 작성페이지를 나가시겠습니까?")){
		return true;
		}else{
		return false;	
			}
}

//상담신청 내역조회 클릭시
function warning2(){
	if(confirm(" 저장하기를 버튼을 누르지 않으면 \n 변경된 내용이 저장되지 않습니다. \n 이대로 작성페이지를 나가시겠습니까?")){
		return true;
		}else{
		return false;	
			}
}

$.fn.generateStars = function() {
	return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};

	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();

</script>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->

<script type="text/javascript">
//스마트에디터 스크립트

var oEditors = [];
//추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder:"ir1",
sSkinURI: "/intepark/resources/se2/SmartEditor2Skin.html", 
htParams : {
bUseToolbar : true,    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
bUseVerticalResizer : true,  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
bUseModeChanger : true,   // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
//aAdditionalFontList : aAdditionalFontSet,  // 추가 글꼴 목록
fOnBeforeUnload : function(){
//alert("완료!");
}
}, //boolean
fOnAppLoad : function(){
//예제 코드
//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);


					  /* //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
  					oEditors.getById["notice_content"].exec("PASTE_HTML", [notice_content.getValue()]); */

},
fCreator: "createSEditor2"
});

function pasteHTML() {
var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
var sHTML = oEditors.getById["ir1"].getIR();
alert(sHTML);
}

function submitContents(elClickedObj) {

/* var s = oEditors.getById["ir1"].getIR();

if (this.frm.eaTitle.value == ''){
alert('제목을 기재해 주세요');
this.frm.eaTitle.focus();
return false;
}

if(!s) {
alert('내용을 기재해 주세요');
return true;
} */

oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

/*  try {
elClickedObj.form.submit();
} catch(e) {} */
}

function setDefaultFont() {
var sDefaultFont = '궁서';
var nFontSize = 24;
oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}

</script>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>