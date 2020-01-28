<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<script type="text/javascript" src="/intepark/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->
<style type="text/css">
#holder {
	border: 2px dashed #ccc;
	width: 100%;
	height: 220px;
}

#holder.hover {
	border: 5px dashed #333;
}
</style>
<script type="text/javascript">
window.onload = function() { //파일첨부 시작
	var holder = document.getElementById('holder'); 
	var state = document.getElementById('statuss');

	if (typeof window.FileReader === 'undefined') {
		state.className = 'no6';
	} else {
		state.className = 'ok6';
		state.innerHTML = '<br><br><br><br>사진을 올려주세요(5개까지)';
	}

	holder.ondragover = function() {
		this.className = 'hover';
		return false;
	};
	holder.ondragend = function() {
		this.className = '';
		return false;
	};
	holder.ondrop = function(e) {
		state.style.display= "none";
		this.className = '';
		e.preventDefault();

		var files = e.dataTransfer.files;
		//갯수 제한 확인
		var size = document.getElementById("imghidden").childElementCount/3;
		var fileSize = files.length;
		console.log(size);
		console.log(fileSize);
		if(size+fileSize>5){
			alert("5개이상 첨부 하실 수 없습니다.");
			return false;
		}
		//파일형식확인
		var check = fileCheck(files);
		if(!check)
			return false;
	
		for(var i=0; i<files.length; i++){
            imgUpload(files[i]);
		}
	}
}
	function fileCheck(files){
		var result = true; 
		for(var i=0; i<files.length; i++){
       	 var fileNameExtensionIndex = files[i].name.lastIndexOf('.') + 1;
       	 var fileNameExtension = files[i].name.toLowerCase().substring(fileNameExtensionIndex, files[i].name.length);
      	  if (!((fileNameExtension === 'jpg')
                || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
            alert('jpg, gif, png 확장자만 업로드 가능합니다.');
            result = false;
           	return false;
    	    }
		}
		return result;
	}

	function imgUpload(file){
		var reader = new FileReader();
		reader.readAsDataURL(file);
    		reader.onload = function(event) {

				var formData = new FormData();
				formData.append("file",file);

                $.ajax({
                    type : 'POST',
                    enctype : 'multipart/form-data',
                    processData : false,
                    contentType : false,
                    cache : false,
                    timeout : 600000,
                    url : 'albumImgUpload.do',
                    dataType : 'JSON',
                    data : formData,
                    success : function(data) {
                        var divrename=data.rename.replace(".","");
						$("#holder").append("<div style='display:inline-block; margin:5px;' id='div"+divrename+
                    			"'><img style='height: 180px; width: 177px;' src='/intepark/resources/albumImgs/"+data.root+"/"+data.rename+
                    			"'><p align='center'>"+decodeURIComponent(data.oriname)+
                    			"&nbsp;&nbsp;<a href='#' onclick='imgDelete(\""+divrename+"\",\""+data.rename+"\",\""+data.root+"\");'><i class='fa fa-times fa-2x'></i></a></p></div>");
						//히든에 original값추가
            			$("#imghidden").append("<input type='hidden' id='ori"+divrename+"' name='oriname' value='"+decodeURIComponent(data.oriname)+"'>");
            			//히든에 rename 값추가
            			$("#imghidden").append("<input type='hidden' id='re"+divrename+"' name='rename' value='"+data.rename+"'>");
            			//히든에 root 값추가
            			$("#imghidden").append("<input type='hidden' id='root"+divrename+"' name='imgroot' value='"+data.root+"'>");
            			},	//seccess끝
            		error: function(request, status, errorData){
            				console.log("error code : " + request.status
            						+ "\Message : " + request.responseText
            						+"\Error : " + errorData);
            		}
                });	//ajax 끝
    		}	
		}	

function imgDelete(divname,rename,root){
	$.ajax({
		type : 'POST',
		url : "albumImgDelete.do",
		data : {rename : rename, root:root},
		success : function(data) {
			$('#div'+divname).remove();
			$('#re'+divname).remove();
			$('#ori'+divname).remove();
			$('#root'+divname).remove();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log("error : " + jqXHR + ", " + textStatus
					+ ", " + errorThrown);
		}
	});
	return false;
}

</script>

</head>
<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="../common/header.jsp" />
	<!--================Header Menu Area =================-->
	<div class="container">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div class="x_content">
					<h2 align="center">
						<strong>인테리어 사진첩</strong>
					</h2>
					<form id="aform" action="albumInsert.do" method="post">
					<input type="hidden" name="userid" value="${sessionScope.loginUser.userid}">
					<input type="text" placeholder="제목을 작성해주세요." maxlength="30" name="albumtitle" style="width:100%; height:50px;" id="atitle" required>
					<h6></h6>
					<div style="display: inline-block;" id="holder">
						<p id="statuss" align="center"></p>
					</div>
						<div id="imghidden"></div>
					<h6></h6>
	                  <textarea name="albumcontents" id="ir1" rows="10" style="width:100%;"></textarea>
		              <div style="text-align:right;">
		              <input class="btn" type="button" id="asubmit" value="저장">
		              </div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--================ start footer Area  =================-->
	<jsp:include page="../common/footer.jsp" />
	<!--================ End footer Area  =================-->	
<script type="text/javascript">
//스마트에디터 스크립트
var oEditors = [];
//추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder:"ir1",
fCreator: "createSEditor2",
sSkinURI: "/intepark/resources/se2/SmartEditor2Skin.html", 
htParams : {
bUseToolbar : true,    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
bUseVerticalResizer : true,  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
bUseModeChanger : true,   // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
}
});

$("#asubmit").click(function(){
oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
var atext = document.getElementById("ir1").value;
var textlength= atext.length;
var imgCount = document.getElementById("imghidden").childElementCount/3;
var atitle = document.getElementById("atitle").value;
if(atitle==''){
	alert("제목을 작성해주세요.");
	return false;
}

if(atext=='<p><br></p>' && textlength==11){
	alert("글내용을 작성해주세요.");
	return false;
}

if(imgCount==0){
	alert("이미지를 첨부해주세요.");
	return false;
}
$("#aform").submit();
});
function pasteHTML() {
var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
var sHTML = oEditors.getById["ir1"].getIR();
alert(sHTML);
}

function setDefaultFont() {
var sDefaultFont = '궁서';
var nFontSize = 24;
oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}


</script>
</body>
</html>