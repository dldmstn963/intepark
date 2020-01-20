<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewFormView</title>
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->

<style type="text/css">
#ok {
	color:white;
	background:rgb(200, 177, 162);
}

.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 80px;
  height: 80px;
  display: inline-block;
  /* text-indent: -9999px; */
  cursor: pointer;
}
.starR.on{background-position:0 0;}
span {
     outline: none; /* 선택을 했을 때 테두리가 보이는 현상을 처리 */
}
.photo-input__upload__button:active, .photo-input__upload__button:focus, .photo-input__upload__button:hover {
    opacity: .5;
    cursor: pointer;
}
#preview img {
    width: 100px;
    height: 100px;
}
#preview p {
    text-overflow: ellipsis;
    overflow: hidden;
}
.preview-box {
    border: 1px solid;
    padding: 5px;
    padding-right:0px;
    border-radius: 5px;
    margin-bottom: 10px;
    margin-right:5px;
    
    display:inline-block;
}
#attach{
	border-radius: 5px;
}
.aa{
	float:right;
	color:gray;
}
</style>

</head>
<body>
<div class="container">
<!-- -----------------------------------------------프로필 구역▼------------------------------------------------------------------------------------------------------------------ -->
	<div class="row">
		<div class="col-lg-12">
			
			<div style="width:100%; height:240px; text-align:center; background:rgb(250, 248, 241);">
			<div style="text-align:center; padding-top:20px;">
			
			<img src="${pageContext.request.contextPath }/resources/img/logo.png" ><br><br>
			
			<h3 style="color:rgb(200, 177, 162);"><strong>시공사 리뷰 쓰기</strong></h3>
			
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

<!-- -----------------------------------------------리뷰 작성 구역▼--------------------------------------------------------------------------------------------------------- -->
	<br><br>
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-7">
	
	
		
		<form action="insertReview5.do" method="post" name="frm" enctype="multipart/form-data">
			<input type="hidden" name="consid" value="${cons.consid}">
			<c:if test="${!empty sessionScope.loginCons }">
			<input type="hidden" name="userid" value="${sessionScope.loginCons.consid }">
			</c:if>
			<c:if test="${!empty sessionScope.loginUser }">
			<input type="hidden" name="userid" value="${sessionScope.loginUser.userid }">
			</c:if>
			
				
				<h4 style="color:black;"><strong>친절도</strong></h4>
				<p style="font-weight:bold;">전문가님은 상담하실 때와 시공을 진행하실 때 항상 친절하셨나요?</p>
				<span id="rvkind_keyup" tabindex="0"></span>
				<input type="hidden" name="rvkind" id="rvkind">
				<div class="starRev1">
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				</div>
				
				<br><br>
				
				<h4 style="color:black;"><strong>시공가격</strong></h4>
				<p style="font-weight:bold;">전문가님이 진행해주신 시공의 가격은 전반적으로 만족스러우셨나요?</p>
				<span id="rvprice_keyup" tabindex="0"></span>
				<input type="hidden" name="rvprice" id="rvprice">
				<div class="starRev2">
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				</div>
				
				<br><br>
				
				<h4 style="color:black;"><strong>퀄리티</strong></h4>
				<p style="font-weight:bold;">전문가님이 진행해주신 인테리어 시공의 최종 퀄리티는 만족스러웠나요?</p>
				<span id="rvquality_keyup" tabindex="0"></span>
				<input type="hidden" name="rvquality" id="rvquality">
				<div class="starRev3">
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				</div>
				
				<br><br>
				
				<h4 style="color:black;"><strong>전문성</strong></h4>
				<p style="font-weight:bold;">작업 기간 엄수, 자재 변경 이슈, 돌발 상황 대처 등 전문가님의 전문성은 어땠나요?</p>
				<span id="rvprofessional_keyup" tabindex="0"></span>
				<input type="hidden" name="rvprofessional" id="rvprofessional">
				<div class="starRev4">
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				</div>
				
				<br><br>
				
				<h4 style="color:black;"><strong>책임감</strong></h4>
				<p style="font-weight:bold;">인테리어 시공이 완료된 후 뒷정리와 A/S서비스 등 전문가님의 책임감은 어떻게 평가하시나요?</p>
				<span id="rvresponsible_keyup" tabindex="0"></span>
				<input type="hidden" name="rvresponsible" id="rvresponsible">
				<div class="starRev5">
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				  <span class="starR"></span>
				</div>
				
				<br><br>
				
			<!-- -------------------------------------------------------------------------------------------------------------------- -->
				
				<h4 style="color:black;"><strong>시공 시기</strong></h4>
				<span id="rvperiod_keyup" tabindex="0"></span><!-- <span id="rvperiod2_keyup"></span> -->
				<div style="display:inline; margin-right:15px;">
				<select class="selectpicker" title="연도 선택" name="rvperiod" id="rvperiod">
				  <option>2020년</option>
				  <option>2019년</option>
				  <option>2018년</option>
				  <option>2017년</option>
				  <option>2016년</option>
				  <option>2015년</option>
				  <option>2014년</option>
				  <option>2013년</option>
				  <option>2012년</option>
				  <option>2011년</option>
				  <option>2010년</option>
				</select>
				</div>
				
				<select class="selectpicker" title="월 선택" name="rvperiod2" id="rvperiod2">
				  <option>1월</option>
				  <option>2월</option>
				  <option>3월</option>
				  <option>4월</option>
				  <option>5월</option>
				  <option>6월</option>
				  <option>7월</option>
				  <option>8월</option>
				  <option>9월</option>
				  <option>10월</option>
				  <option>11월</option>
				  <option>12월</option>
				</select>
				
				<br><br><br>
				
			<!-- -------------------------------------------------------------------------------------------------------------------- -->
				
				<h4 style="color:black;"><strong>시공 지역</strong></h4>
				<span id="rvregion_keyup" tabindex="0"></span><span id="rvregion2_keyup" tabindex="0"></span>
				<div style="display:inline; margin-right:15px;">
					<select class="selectpicker" data-size="10" title="시를 선택해주세요" name="rvregion" id="rvregion" onChange="sub_change1()"> <!-- data-size="10" option갯수제한 -->
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
					<select class="form-control" name="rvregion2" id="rvregion2">
							  <option selected="selected" disabled>구를 선택해 주세요</option>
					</select>
				</div>
				
				<br><br><br>
				
			<!-- -------------------------------------------------------------------------------------------------------------------- -->
			
				<h4 style="color:black;"><strong>건물 유형</strong></h4>
				<span id="rvbuildingtype_keyup" tabindex="0"></span>
				<select class="form-control selectpicker" title="유형 선택" name="rvbuildingtype" id="rvbuildingtype">
				  <option>원룸&오피스텔</option>
				  <option>아파트</option>
				  <option>빌라&연립</option>
				  <option>단독주택</option>
				  <option>사무공간</option>
				  <option>상업공간</option>
				  <option>기타</option>
				</select>
				
				<br><br><br>
				
			<!-- -------------------------------------------------------------------------------------------------------------------- -->
			
				<h4 style="color:black;"><strong>시공 분야</strong></h4>
				<span id="rvarea_keyup" tabindex="0"></span>
				<select class="form-control selectpicker" title="분야 선택" name="rvarea" id="rvarea">
				  <option>종합</option>
				  <option>도배&장판</option>
				  <option>타일&욕실</option>
				  <option>페인트&필름</option>
				  <option>마루&바닥</option>
				  <option>도어&샷시</option>
				  <option>전기&조명</option>
				  <option>주방&가구</option>
				  <option>전문디자인</option>
				  <option>기타</option>
				</select>
				
				<br><br><br>	
				
			<!-- -------------------------------------------------------------------------------------------------------------------- -->
			
				<h4 style="color:black;"><strong>시공 평수</strong></h4>
				<span id="rvspacious_keyup" tabindex="0"></span>
				<select class="form-control selectpicker" title="평수 선택" name="rvspacious" id="rvspacious">
				  <option>10평 미만</option>
				  <option>10평대</option>
				  <option>20평대</option>
				  <option>30평대</option>
				  <option>40평대</option>
				  <option>50평 이상</option>
				</select>
				
				<br><br><br>	
				
			<!-- -------------------------------------------------------------------------------------------------------------------- -->
			
				<h4 style="color:black;"><strong>시공 가격</strong></h4>
				<span id="rvprice2_keyup" tabindex="0"></span>
				<select class="form-control selectpicker" title="가격 선택" name="rvprice2" id="rvprice2">
				  <option>100만원 이하</option>
				  <option>100~500만원</option>
				  <option>500~1000만원</option>
				  <option>1000만원~2000만원</option>
				  <option>2000만원~3000만원</option>
				  <option>3000만원 이상</option>
				</select>
				
				<br><br><br>	
				
			<!-- -------------------------------------------------------------------------------------------------------------------- -->	
			
				<h4 style="color:black;"><strong>총평</strong></h4>
				<p style="font-weight:bold;">인테리어 시공 전문가님의 서비스와 작업물 전반에 대하여 간단한 총평을 부탁드립니다. (최소 60자)</p>
				<span id="rvcritique_keyup" tabindex="0"></span>
				<textarea name="rvcritique" id="rvcritique" style="min-height:120px;"placeholder="처음 상담부터 친절하셨고, 작업도 꼼꼼하게 해주셨어요. 주변 사람들과 비교해보니 퀄리티 대비 가격도 합리적인 편이었습니다. 5개월 정도 지났는데 현재까지 하자는 없고, A/S도 약속해 주셔서 걱정 없이 지내고 있습니다. 주변에 엄청 추천하고 있어요!"  class="form-control text-area-input"></textarea>
				<span style="color:#aaa; float:right;" id="counter">(0 / 최대 300자)</span>
				<br><br>	
				
			<!-- -------------------------------------------------------------------------------------------------------------------- -->	
			
			
			
			<h4><strong style="color:black;">시공 사진</strong>&nbsp;(선택)</h4>
				<p style="font-weight:bold;">시공 전/후 이미지 혹은 완성 이미지를 공유해주세요! (최대 5장)</p>
			
			
			<div class="wrapper">
        <div class="body" style="display:inline-block;">
        
            <!-- 미리보기 영역 -->
            <div id="preview" style="display:inline-block;"></div>
            
        </div>

        <!-- 첨부 버튼 -->
        <div id="attach" style="display:inline-block; width:100px; height:100px; border:1px solid;">
                <label for="uploadInputBox"><i class="fa fa-camera-retro fa-2x" style="padding-left: 33px;padding-top: 28px;"></i><br>&nbsp;&nbsp;&nbsp;사진올리기</label>
                <input type="file" id="uploadInputBox" name="filedata" multiple style="display: none" />
        </div>
        
        
        </div>
			
			
			<input type="hidden" name="rvoriginalname" id="rvoriginalname">
			<input type="hidden" name="rvrename" id="rvrename">
			
				
				<br><br><br>

			<div class="form-group">
				<input type="button" value="완료" class="form-control btn" id="ok" onclick="reviewCheck();">
			</div>
		</form>
			<br><br><br>
			<br><br><br>
			
			
			</div><!-- 7 div 끝 -->
		<div class="col-lg-2"></div>
	</div><!-- row 끝 -->
	
</div><!-- container 끝 -->

<script type="text/javascript">

 //임의의 file object영역
        var files = {};
        var previewIndex = 0;
 
        // image preview 기능 구현
        // input = file object[]
        function addPreview(input) {
            if (input[0].files) {
                //파일 선택이 여러개였을 시의 대응
                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                    var file = input[0].files[fileIndex];
 
                    if (validation(file.name))
                        continue;
                    setPreviewForm(file);
                }
            } /* else
                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다. */
        }

        function setPreviewForm(file, img){
            var reader = new FileReader();
            
            //div id="preview" 내에 동적코드추가.
            //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
            reader.onload = function(img) {
                var imgNum = previewIndex++;
                $("#preview").append(
                        "<div class=\"preview-box\" value=\"" + imgNum +"\">" +
                        "<a href=\"#\" class=\"aa\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">" +
                        "<i class=\"fa fa-times-circle-o fa-lg\"></i></a>" +
                        "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>" +
                        /* "<p>" + file.name + "</p>" + */"</div>"
                );
                files[imgNum] = file;            
            };
            reader.readAsDataURL(file);
        }
  
        //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
        function deletePreview(obj) {
            var imgNum = obj.attributes['value'].value;
            delete files[imgNum];
            $("#preview .preview-box[value=" + imgNum + "]").remove();
            $("#ok").focus();
            
            /* $(window).scroll(function () { 스크롤 다운하던거
                var scrollValue = $(document).scrollTop(); 
                console.log(scrollValue); 
                }); */
        }

        //client-side validation
        //always server-side validation required
        function validation(fileName) {
            fileName = fileName + "";
            var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
            var fileNameExtension = fileName.toLowerCase().substring(
                    fileNameExtensionIndex, fileName.length);
            if (!((fileNameExtension === 'jpg')
                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                return true;
            } else {
                return false;
            }
        }
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////       
               function imgUpload(){
                   //console.log(Object.keys(files).length);
                   if(Object.keys(files).length == 0){		//첨부파일이 없을경우 ajax 실행없이 submit 처리
                	   $("form").submit();
                	   return false;
                       }
                   if(Object.keys(files).length > 5){
                       alert("이미지는 최대 5장 첨부 가능합니다.");
                       return false;
                       }

                   var formData = new FormData();

                for (var key in files){      
                	formData.append('files',files[key]);
                	
                	/* console.log("오브젝트 : " + Object.keys(files));
                    console.log("파일즈 : " + files);
                    console.log("파일즈 인덱스 : " + files[key]);
                    console.log(Object.keys(files));
                    console.log(files); */
               }
    
                $.ajax({
                    type : 'POST',
                    enctype : 'multipart/form-data',
                    processData : false,
                    contentType : false,
                    cache : false,
                    timeout : 600000,
                    url : 'insertImgUpload5.do',
                    dataType : 'JSON',
                    data : formData,
                    success : function(jsonData) {
                            //alert('이미지 업로드 성공');
                            //json 배열을 받았을 때는 object -> string -> parsing : json
                           //json 객체 한 개를 받았을 때는 바로 출력 처리할 수 있음
                           
            				$("#rvoriginalname").val(decodeURIComponent(jsonData.rvoriginalname.replace(/\+/gi, " ")));
            				$("#rvrename").val(jsonData.rvrename);

            				$("form").submit();
            				return false;
            			},	//seccess끝
            			error: function(request, status, errorData){
            				console.log("error code : " + request.status
            						+ "\Message : " + request.responseText
            						+"\Error : " + errorData);
            			}
                });	//ajax 끝
            } //imgUpload 끝
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
               
            // <input type=file> 태그 기능 구현
             $(document).ready(function() {
            $('#attach input[type=file]').change(function() {
                addPreview($(this)); //preview form 추가하기
            });
        });




//친절도---------------------------------------------------------------------------------------------------------
$('.starRev1 span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	  $("#rvkind").val(value);
	  //var rvkind = $("#rvkind").val();
	  //console.log(rvkind);
	  return false;
	});
$('.starRev1 span').click(function(){
	var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	$("#rvkind").val(value);
	var rvkind = $("#rvkind").val();
	//console.log("콘솔이다 : " + rvkind);
	if(rvkind != 0){
		$("#rvkind_keyup").html("");
	}
	return false;
});	
	
//시공가격---------------------------------------------------------------------------------------------------------	
$('.starRev2 span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	  $("#rvprice").val(value);
	  return false;
	});
$('.starRev2 span').click(function(){
	var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	$("#rvprice").val(value);
	var rvprice = $("#rvprice").val();
	//console.log("콘솔이다 : " + rvprice);
	if(rvprice != 0){
		$("#rvprice_keyup").html("");
	}
	return false;
});	

//퀄리티---------------------------------------------------------------------------------------------------------
$('.starRev3 span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	  $("#rvquality").val(value);
	  return false;
	});
$('.starRev3 span').click(function(){
	var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	$("#rvquality").val(value);
	var rvquality = $("#rvquality").val();
	//console.log("콘솔이다 : " + rvprice);
	if(rvquality != 0){
		$("#rvquality_keyup").html("");
	}
	return false;
});		

//전문성---------------------------------------------------------------------------------------------------------
$('.starRev4 span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	  $("#rvprofessional").val(value);
	  return false;
	});
$('.starRev4 span').click(function(){
	var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	$("#rvprofessional").val(value);
	var rvprofessional = $("#rvprofessional").val();
	//console.log("콘솔이다 : " + rvprice);
	if(rvprofessional != 0){
		$("#rvprofessional_keyup").html("");
	}
	return false;
});

//책임감---------------------------------------------------------------------------------------------------------
$('.starRev5 span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	  $("#rvresponsible").val(value);
	  return false;
	});	
$('.starRev5 span').click(function(){
	var value = $(this).addClass('on').prevAll('span').addClass('on').length+1;
	$("#rvresponsible").val(value);
	var rvresponsible = $("#rvresponsible").val();
	//console.log("콘솔이다 : " + rvprice);
	if(rvresponsible != 0){
		$("#rvresponsible_keyup").html("");
	}
	return false;
});	

//시공 시기---------------------------------------------------------------------------------------------------------	
/* $("#rvperiod").change(function(){
	var rvperiod = $(this).val();
	//console.log("콘솔이다 : " + rvperiod);
	if(rvperiod != 0){
		$("#rvperiod_keyup").html("");
	}
}); */

$("#rvperiod2").change(function(){
	var rvperiod2 = $(this).val();
	//console.log("콘솔이다 : " + rvperiod2);
	if(rvperiod2 != 0){
		$("#rvperiod_keyup").html("");
	}
	return false;
});	

//시공 지역---------------------------------------------------------------------------------------------------------
function sub_change1()
{
    $("#rvregion2 option:eq(0)").prop("selected", true); //처음 위치로 돌아가기
    
 	vn_mnu1 = frm.rvregion.selectedIndex;

	 if ( vn_mnu1 == 1 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 26;
	  //frm.rvregion2.options[0].text =  '구를 선택해 주세요';
	  frm.rvregion2.options[1].text =  '강남구';
	  frm.rvregion2.options[2].text =  '강동구';
	  frm.rvregion2.options[3].text =  '강북구';
	  frm.rvregion2.options[4].text =  '강서구';
	  frm.rvregion2.options[5].text =  '관악구';
	  frm.rvregion2.options[6].text =  '광진구';
	  frm.rvregion2.options[7].text =  '구로구';
	  frm.rvregion2.options[8].text =  '금천구';
	  frm.rvregion2.options[9].text =  '노원구';
	  frm.rvregion2.options[10].text =  '도봉구';
	  frm.rvregion2.options[11].text =  '동대문구';
	  frm.rvregion2.options[12].text =  '동작구';
	  frm.rvregion2.options[13].text =  '마포구';
	  frm.rvregion2.options[14].text =  '서대문구';
	  frm.rvregion2.options[15].text =  '서초구';
	  frm.rvregion2.options[16].text =  '성동구';
	  frm.rvregion2.options[17].text =  '성북구';
	  frm.rvregion2.options[18].text =  '송파구';
	  frm.rvregion2.options[19].text =  '양천구';
	  frm.rvregion2.options[20].text =  '영등포구';
	  frm.rvregion2.options[21].text =  '용산구';
	  frm.rvregion2.options[22].text =  '은평구';
	  frm.rvregion2.options[23].text =  '종로구';
	  frm.rvregion2.options[24].text =  '중구';
	  frm.rvregion2.options[25].text =  '중랑구';
	 }
	 if ( vn_mnu1 == 2 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 17;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '강서구';
	  frm.rvregion2.options[2].text =  '금정구';
	  frm.rvregion2.options[3].text =  '남구';
	  frm.rvregion2.options[4].text =  '동구';
	  frm.rvregion2.options[5].text =  '동래구';
	  frm.rvregion2.options[6].text =  '부산진구';
	  frm.rvregion2.options[7].text =  '북구';
	  frm.rvregion2.options[8].text =  '사상구';
	  frm.rvregion2.options[9].text =  '사하구';
	  frm.rvregion2.options[10].text =  '서구';
	  frm.rvregion2.options[11].text =  '수영구';
	  frm.rvregion2.options[12].text =  '연제구';
	  frm.rvregion2.options[13].text =  '영도구';
	  frm.rvregion2.options[14].text =  '중구';
	  frm.rvregion2.options[15].text =  '해운대구';
	  frm.rvregion2.options[16].text =  '기장군';
	 }
	 if ( vn_mnu1 == 3 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 9;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '남구';
	  frm.rvregion2.options[2].text =  '달서구';
	  frm.rvregion2.options[3].text =  '동구';
	  frm.rvregion2.options[4].text =  '북구';
	  frm.rvregion2.options[5].text =  '서구';
	  frm.rvregion2.options[6].text =  '수성구';
	  frm.rvregion2.options[7].text =  '중구';
	  frm.rvregion2.options[8].text =  '달성군';
	 }
	 if ( vn_mnu1 == 4 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 11;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '계양구';
	  frm.rvregion2.options[2].text =  '미추홀구';
	  frm.rvregion2.options[3].text =  '남동구';
	  frm.rvregion2.options[4].text =  '동구';
	  frm.rvregion2.options[5].text =  '부평구';
	  frm.rvregion2.options[6].text =  '서구';
	  frm.rvregion2.options[7].text =  '연수구';
	  frm.rvregion2.options[8].text =  '중구';
	  frm.rvregion2.options[9].text =  '강화군';
	  frm.rvregion2.options[10].text =  '옹진군';
	 }
	 if ( vn_mnu1 == 5 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 6;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '광산구';
	  frm.rvregion2.options[2].text =  '남구';
	  frm.rvregion2.options[3].text =  '동구';
	  frm.rvregion2.options[4].text =  '북구';
	  frm.rvregion2.options[5].text =  '서구';
	 }
	 if ( vn_mnu1 == 6 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 6;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '대덕구';
	  frm.rvregion2.options[2].text =  '동구';
	  frm.rvregion2.options[3].text =  '서구';
	  frm.rvregion2.options[4].text =  '유성구';
	  frm.rvregion2.options[5].text =  '중구';
	 }
	 if ( vn_mnu1 == 7 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 6;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '남구';
	  frm.rvregion2.options[2].text =  '동구';
	  frm.rvregion2.options[3].text =  '북구';
	  frm.rvregion2.options[4].text =  '중구';
	  frm.rvregion2.options[5].text =  '울주군';
	 }
	 if ( vn_mnu1 == 8 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 19;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '강릉시';
	  frm.rvregion2.options[2].text =  '고성군';
	  frm.rvregion2.options[3].text =  '동해시';
	  frm.rvregion2.options[4].text =  '삼척시';
	  frm.rvregion2.options[5].text =  '속초시';
	  frm.rvregion2.options[6].text =  '양구군';
	  frm.rvregion2.options[7].text =  '양양군';
	  frm.rvregion2.options[8].text =  '영월군';
	  frm.rvregion2.options[9].text =  '원주시';
	  frm.rvregion2.options[10].text =  '인제군';
	  frm.rvregion2.options[11].text =  '정선군';
	  frm.rvregion2.options[12].text =  '철원군';
	  frm.rvregion2.options[13].text =  '춘천시';
	  frm.rvregion2.options[14].text =  '태백시';
	  frm.rvregion2.options[15].text =  '평창군';
	  frm.rvregion2.options[16].text =  '홍천군';
	  frm.rvregion2.options[17].text =  '화천군';
	  frm.rvregion2.options[18].text =  '횡성군';
	}
	 if ( vn_mnu1 == 9 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 31;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '가평군';
	  frm.rvregion2.options[2].text =  '고양시';
	  frm.rvregion2.options[3].text =  '과천시';
	  frm.rvregion2.options[4].text =  '광명시';
	  frm.rvregion2.options[5].text =  '광주시';
	  frm.rvregion2.options[6].text =  '구리시';
	  frm.rvregion2.options[7].text =  '군포시';
	  frm.rvregion2.options[8].text =  '김포시';
	  frm.rvregion2.options[9].text =  '남양주시';
	  frm.rvregion2.options[10].text =  '동두천시';
	  frm.rvregion2.options[11].text =  '부천시';
	  frm.rvregion2.options[12].text =  '성남시';
	  frm.rvregion2.options[13].text =  '수원시';
	  frm.rvregion2.options[14].text =  '시흥시';
	  frm.rvregion2.options[15].text =  '안산시';
	  frm.rvregion2.options[16].text =  '양주시';
	  frm.rvregion2.options[17].text =  '양평군';
	  frm.rvregion2.options[18].text =  '여주시';
	  frm.rvregion2.options[19].text =  '연천군';
	  frm.rvregion2.options[20].text =  '오산시';
	  frm.rvregion2.options[21].text =  '용인시';
	  frm.rvregion2.options[22].text =  '의왕시';
	  frm.rvregion2.options[23].text =  '의정부시';
	  frm.rvregion2.options[24].text =  '이천시';
	  frm.rvregion2.options[25].text =  '파주시';
	  frm.rvregion2.options[26].text =  '평택시';
	  frm.rvregion2.options[27].text =  '포천시';
	  frm.rvregion2.options[28].text =  '하남시';
	  frm.rvregion2.options[29].text =  '화성시';
	  frm.rvregion2.options[30].text =  '안성시';
	 }
	 if ( vn_mnu1 == 10 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 20;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '거제시';
	  frm.rvregion2.options[2].text =  '거창군';
	  frm.rvregion2.options[3].text =  '고성군';
	  frm.rvregion2.options[4].text =  '김해시';
	  frm.rvregion2.options[5].text =  '남해군';
	  frm.rvregion2.options[6].text =  '마산시';
	  frm.rvregion2.options[7].text =  '밀양시';
	  frm.rvregion2.options[8].text =  '사천시';
	  frm.rvregion2.options[9].text =  '산청군';
	  frm.rvregion2.options[10].text =  '양산시';
	  frm.rvregion2.options[11].text =  '의령군';
	  frm.rvregion2.options[12].text =  '진주시';
	  frm.rvregion2.options[13].text =  '창녕군';
	  frm.rvregion2.options[14].text =  '창원시';
	  frm.rvregion2.options[15].text =  '통영시';
	  frm.rvregion2.options[16].text =  '하동군';
	  frm.rvregion2.options[17].text =  '함안군';
	  frm.rvregion2.options[18].text =  '함양군';
	  frm.rvregion2.options[19].text =  '합천군';
	}
	 if ( vn_mnu1 == 11 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 24;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '경산시';
	  frm.rvregion2.options[2].text =  '경주시';
	  frm.rvregion2.options[3].text =  '구미시';
	  frm.rvregion2.options[4].text =  '김천시';
	  frm.rvregion2.options[5].text =  '문경시';
	  frm.rvregion2.options[6].text =  '상주시';
	  frm.rvregion2.options[7].text =  '안동시';
	  frm.rvregion2.options[8].text =  '영주시';
	  frm.rvregion2.options[9].text =  '영천시';
	  frm.rvregion2.options[10].text =  '포항시';
	  frm.rvregion2.options[11].text =  '고령군';
	  frm.rvregion2.options[12].text =  '군위군';
	  frm.rvregion2.options[13].text =  '봉화군';
	  frm.rvregion2.options[14].text =  '성주군';
	  frm.rvregion2.options[15].text =  '영덕군';
	  frm.rvregion2.options[16].text =  '영양군';
	  frm.rvregion2.options[17].text =  '예천군';
	  frm.rvregion2.options[18].text =  '울릉군';
	  frm.rvregion2.options[19].text =  '울진군';
	  frm.rvregion2.options[20].text =  '의성군';
	  frm.rvregion2.options[21].text =  '청도군';
	  frm.rvregion2.options[22].text =  '청송군';
	  frm.rvregion2.options[23].text =  '칠곡군';
	}
	 if ( vn_mnu1 == 12 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 23;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '광양시';
	  frm.rvregion2.options[2].text =  '나주시';
	  frm.rvregion2.options[3].text =  '목포시';
	  frm.rvregion2.options[4].text =  '순천시';
	  frm.rvregion2.options[5].text =  '여수시';
	  frm.rvregion2.options[6].text =  '강진군';
	  frm.rvregion2.options[7].text =  '고흥군';
	  frm.rvregion2.options[8].text =  '곡성군';
	  frm.rvregion2.options[9].text =  '구례군';
	  frm.rvregion2.options[10].text =  '담양군';
	  frm.rvregion2.options[11].text =  '무안군';
	  frm.rvregion2.options[12].text =  '보성군';
	  frm.rvregion2.options[13].text =  '신안군';
	  frm.rvregion2.options[14].text =  '영광군';
	  frm.rvregion2.options[15].text =  '영암군';
	  frm.rvregion2.options[16].text =  '완도군';
	  frm.rvregion2.options[17].text =  '장성군';
	  frm.rvregion2.options[18].text =  '장흥군';
	  frm.rvregion2.options[19].text =  '진도군';
	  frm.rvregion2.options[20].text =  '함평군';
	  frm.rvregion2.options[21].text =  '해남군';
	  frm.rvregion2.options[22].text =  '화순군';
	}
	 if ( vn_mnu1 == 13 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 15;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '군산시';
	  frm.rvregion2.options[2].text =  '김제시';
	  frm.rvregion2.options[3].text =  '남원시';
	  frm.rvregion2.options[4].text =  '익산시';
	  frm.rvregion2.options[5].text =  '전주시';
	  frm.rvregion2.options[6].text =  '정읍시';
	  frm.rvregion2.options[7].text =  '고창군';
	  frm.rvregion2.options[8].text =  '무주군';
	  frm.rvregion2.options[9].text =  '부안군';
	  frm.rvregion2.options[10].text =  '순창군';
	  frm.rvregion2.options[11].text =  '완주군';
	  frm.rvregion2.options[12].text =  '임실군';
	  frm.rvregion2.options[13].text =  '장수군';
	  frm.rvregion2.options[14].text =  '진안군';
	}
	 if ( vn_mnu1 == 14 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 17;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '계롱시';
	  frm.rvregion2.options[2].text =  '공주시';
	  frm.rvregion2.options[3].text =  '논산시';
	  frm.rvregion2.options[4].text =  '보령시';
	  frm.rvregion2.options[5].text =  '서산시';
	  frm.rvregion2.options[6].text =  '아산시';
	  frm.rvregion2.options[7].text =  '천안시';
	  frm.rvregion2.options[8].text =  '금산군';
	  frm.rvregion2.options[9].text =  '당진시';
	  frm.rvregion2.options[10].text =  '부여군';
	  frm.rvregion2.options[11].text =  '서천군';
	  frm.rvregion2.options[12].text =  '연기군';
	  frm.rvregion2.options[13].text =  '예산군';
	  frm.rvregion2.options[14].text =  '청양군';
	  frm.rvregion2.options[15].text =  '태안군';
	  frm.rvregion2.options[16].text =  '홍성군';
	}
	 if ( vn_mnu1 == 15 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 13;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '제천시';
	  frm.rvregion2.options[2].text =  '청주시';
	  frm.rvregion2.options[3].text =  '충주시';
	  frm.rvregion2.options[4].text =  '괴산군';
	  frm.rvregion2.options[5].text =  '단양군';
	  frm.rvregion2.options[6].text =  '보은군';
	  frm.rvregion2.options[7].text =  '영동군';
	  frm.rvregion2.options[8].text =  '옥천군';
	  frm.rvregion2.options[9].text =  '음성군';
	  frm.rvregion2.options[10].text =  '증평군';
	  frm.rvregion2.options[11].text =  '진천군';
	  frm.rvregion2.options[12].text =  '청원군';
	}
	 if ( vn_mnu1 == 16 )
	 {
	  $("#selectbox2").css("display", "none");
	  frm.rvregion2.length = 1;
	}
	 if ( vn_mnu1 == 17 )
	 {
		 $("#selectbox2").css("display", "inline-block");
	  frm.rvregion2.length = 3;
	  //frm.rvregion2.options[0].text =  '';
	  frm.rvregion2.options[1].text =  '제주시';
	  frm.rvregion2.options[2].text =  '서귀포시';
	}
	 return false;								
}
//시 span 값없애기
$("#rvregion").change(function(){
	var rvregion = $(this).val();
	
	if(rvregion.length != 0){
		$("#rvregion_keyup").html("");
	}
	return false;
});
//구 span 값없애기
$("#rvregion2").change(function(){
	var rvregion2 = $(this).val();
	
	if(rvregion2.length != 0 /* || ($("#rvregion").val() == "세종특별자치시") */){
		$("#rvregion2_keyup").html("");
	}
	return false;
});

//건물 유형---------------------------------------------------------------------------------------------------------
$("#rvbuildingtype").change(function(){
	var rvbuildingtype = $(this).val();
	
	if(rvbuildingtype.length != 0){
		$("#rvbuildingtype_keyup").html("");
	}
	return false;
});

//시공 분야---------------------------------------------------------------------------------------------------------
$("#rvarea").change(function(){
	var rvarea = $(this).val();
	
	if(rvarea.length != 0){
		$("#rvarea_keyup").html("");
	}
	return false;
});

//시공 평수---------------------------------------------------------------------------------------------------------
$("#rvspacious").change(function(){
	var rvspacious = $(this).val();
	
	if(rvspacious.length != 0){
		$("#rvspacious_keyup").html("");
	}
	return false;
});

//시공 가격---------------------------------------------------------------------------------------------------------
$("#rvprice2").change(function(){
	var rvprice2 = $(this).val();
	
	if(rvprice2.length != 0){
		$("#rvprice2_keyup").html("");
	}
	return false;
});

//총평---------------------------------------------------------------------------------------------------------
$('#rvcritique').keyup(function(){
	var rvcritique = $(this).val();

	if (rvcritique.length < 60){
		$('#rvcritique_keyup').html('<font color="red">&nbsp; 최소 60자 이상 작성하셔야 합니다.</font>');
		}else if(rvcritique.length >= 60){
			$("#rvcritique_keyup").html("");
			}
	return false;
});
$('#rvcritique').focusout(function(){
	var rvcritique = $(this).val();

	if (rvcritique.length == 0){
		$('#rvcritique_keyup').html('<font color="red">&nbsp; 필수 입력 항목입니다.</font>');
		return false;
		}
});

//총평 textarea 글자제한
$('#rvcritique').keyup(function (e){
    var rvcritique = $(this).val();
    $('#counter').html("(" + rvcritique.length + " / 최대 300자)");    //글자수 실시간 카운팅

    if (rvcritique.length > 300){
        alert("최대 300자까지 입력 가능합니다.");
        $(this).val(rvcritique.substring(0, 300));
        $('#counter').html("(300 / 최대 300자)");
    }
    return false;
});



	//완료 버튼 누를때---------------------------------------------------------------------------------------------------
	function reviewCheck(){
		var rvkind = $("#rvkind").val();	//친절도
		var rvprice = $("#rvprice").val();	//시공가격
		var rvquality = $("#rvquality").val();	//퀄리티
		var rvprofessional = $("#rvprofessional").val();	//전문성
		var rvresponsible = $("#rvresponsible").val();	//책임감
		var rvperiod = $("#rvperiod").val()	//시공 시기(연)
		var rvperiod2 = $("#rvperiod2").val()	//시공 시기(월)
		var rvregion = $("#rvregion").val();	 //시공 지역 (시)
		var rvregion2 = $("#rvregion2").val();	 //시공 지역 (구)
		var rvbuildingtype = $('#rvbuildingtype').val();  //건물 유형
		var rvarea = $('#rvarea').val();  //시공 분야
		var rvspacious = $('#rvspacious').val();  //시공 평수
		var rvprice2 = $('#rvprice2').val();  //시공 가격
		var rvcritique = $('#rvcritique').val();  //총평
		
		
		//친절도 선택 안되었으면
		if(rvkind.length == 0){
			$("#rvkind_keyup").html('<font color="red">&nbsp; 별점을 매겨주세요.</font><br>');
			$("#rvkind_keyup").focus();
			return false;
		}
		
		//시공가격 선택 안되었으면
		if(rvprice.length == 0){
			$("#rvprice_keyup").html('<font color="red">&nbsp; 별점을 매겨주세요.</font><br>');
			$("#rvprice_keyup").focus();
			return false;
		}
		
		//퀄리티 선택 안되었으면
		if(rvquality.length == 0){
			$("#rvquality_keyup").html('<font color="red">&nbsp; 별점을 매겨주세요.</font><br>');
			$("#rvquality_keyup").focus();
			return false;
		}
		
		//전문성 선택 안되었으면
		if(rvprofessional.length == 0){
			$("#rvprofessional_keyup").html('<font color="red">&nbsp; 별점을 매겨주세요.</font><br>');
			$("#rvprofessional_keyup").focus();
			return false;
		}
		
		//책임감 선택 안되었으면
		if(rvresponsible.length == 0){
			$("#rvresponsible_keyup").html('<font color="red">&nbsp; 별점을 매겨주세요.</font><br>');
			$("#rvresponsible_keyup").focus();
			return false;
		}
		
		//시공 시기 선택 안되었으면
		if(rvperiod.length == 0){
			$("#rvperiod_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font><br>');
			$("#rvperiod_keyup").focus();
			return false;
		}
		if(rvperiod2.length == 0){
			$("#rvperiod_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font><br>');
			$("#rvperiod_keyup").focus();
			return false;
		}

		//시공 지역 (시) 선택 안되었으면
		if(rvregion.length == 0){
			$("#rvregion_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font><br>');
			$("#rvregion").focus();
			return false;
			}
		//시공 지역 (구) 선택 안되었으면
		if(rvregion != "세종특별자치시" && rvregion2 == null){
			$("#rvregion2_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font><br>');
			$("#rvregion2").focus();
			return false;
			}
		
		//건물 유형이 체크 안되었으면
		if(rvbuildingtype.length == 0){
			$("#rvbuildingtype_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font>');
			$("#rvbuildingtype_keyup").focus();
			return false;
			}

		//시공 분야가 체크 안되었으면
		if(rvarea.length == 0){
			$("#rvarea_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font>');
			$("#rvarea_keyup").focus();
			return false;
			}

		//시공 평수가 체크 안되었으면
		if(rvspacious.length == 0){
			$("#rvspacious_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font>');
			$("#rvspacious_keyup").focus();
			return false;
			}

		//시공 가격이 체크 안되었으면
		if(rvprice2.length == 0){
			$("#rvprice2_keyup").html('<font color="red">&nbsp; 필수 선택 항목입니다.</font>');
			$("#rvprice2_keyup").focus();
			return false;
			}

		//총평이 작성 안되었으면
		if(rvcritique.length == 0){
			$("#rvcritique_keyup").html('<font color="red">&nbsp; 필수 입력 항목입니다.</font>');
			$("#rvcritique").focus();
			return false;
			}
		if(rvcritique.length < 60){
			$("#rvcritique_keyup").html('<font color="red">&nbsp; 최소 60자 이상 작성하셔야 합니다.</font>');
			$("#rvcritique").focus();
			return false;
			}

		//유효검사 완료되면 첨부파일 ajax 실행
		imgUpload();
} //reviewCheck 끝

</script>

</body>
</html>