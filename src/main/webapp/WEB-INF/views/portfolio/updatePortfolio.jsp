<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writePortfolio</title>

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
		                <a class="nav-link" data-toggle="tab" onclick="so('${cons.consid}');">소개글</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link active" data-toggle="tab" href="#bb">포트폴리오</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" data-toggle="tab" onclick="re('${cons.consid}');">리뷰</a>
		              </li>
		            </ul>
		            
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
		            <div class="tab-content"><!-- 탭 컨테이너 시작 -->
		            
		            
	<!-- --------------------------------------------------------------소개글 탭 구역 시작---------------------------------------------------------------------- -->
		              <!-- <div class="tab-pane fade show active" id="aa">
		              </div> -->
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->	              
  
	<!-- ------------------------------------------------------------포트폴리오 탭 구역 시작---------------------------------------------------------------------- -->	              
		              <div class="tab-pane fade show active" id="bb">
		              
		              
		              <form action="updatePF5.do" method="post" enctype="multipart/form-data">
      						<input type="hidden" value="${cons.consid}" name="consid">
      						<input type="hidden" value="${pfTitle.pfnum }" name="pfnum">
      						<button class="btn btn-success btn-sm" style="float:right; margin-top:5px; font:small-caption;" onclick="return Check();">작성완료</button>
      						<a href="#" onclick="qu('${cons.consid}','${pfTitle.pfnum }');"><input type="button" class="btn btn-success btn-sm" style="float:right; margin-top:5px; margin-right:5px; font:small-caption;" value="수정취소"></a>
      						
      						<br>
      						<div class="row">
      						<div class="col-lg-4">
      						<h4 style="color:black;">&nbsp;포토폴리오 작성하기</h4><h6>&nbsp;&nbsp;&nbsp;(최소 2장~최대 10장)</h6>
      						</div><!-- 4 끝 -->
      						
      						<div class="col-lg-8">
      						<input type="text" name="pftitle" id="pftitle" class="form-control" maxlength="30" value="${pfTitle.pftitle }" placeholder="포트폴리오 제목 (30자 이하) (필수입력 입니다.)">
      						</div><!-- 8 끝 -->
      						</div><!-- row 끝 -->
      						
      						<br>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
      						<div style="border:2px solid lightgray; border-radius: 5px; min-height:430px; padding:10px; margin-bottom:30px;">
      						
      							<div id="attachFileDiv">
								<input type="button" value="사진넣기" id="plus" class="btn" onclick="attachFile.add()" style="margin-left:5px; float:right;"><br><br>
								<c:forEach items="${pfOne }" var="pfOne" varStatus="status">
								<div class="finput" id="file${status.index }" style="margin-top: 3px; border-top: 2px solid lightgray; padding-top: 7px; ">
								<img id="prev_dv${status.index }" class="obj" src="${pageContext.request.contextPath }/resources/portfolio_file/${pfOne.pfrename }" style="width: 100px; height: 100px;">	
								<input type="hidden" name="originalRename" id="selectFile${status.index }" value="${pfOne.pfrename }">
								<input type="button" value="삭제" style="margin-left: 5px; float:right;" onclick="del2('${status.index }','selectFile${status.index }');">
								<input type="text" name="pfcoment1" style="display:inline-block; float:right; width:60%;" maxlength="50" value="${pfOne.pfcoment }" placeholder="포토 설명 (50자 이하) (선택사항 입니다.)" class="form-control">
								
								</div>
								</c:forEach>
								</div>
																	
      						</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->      						

		                </form>

		              </div>
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

function del2(idx, selectFile){ // 파일필드 삭제

	selectFile.remove;
	
	var a = $("input[name=files]").length;	//사진갯수담기
    //console.log(a);

    if(a < 11){	//사진이 10장 이하면 사진넣기버튼 보이기
        $("#plus").css("display","block");
        }

   //var fileField = $("#fileField"+idx).val();
   //var file = $("#file"+idx).val();
    
    /* if(document.getElementById('fileField' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
    	if(a == 10){
            $("#plus").css("display","none");
            }
        return;
    } */
    document.getElementById('attachFileDiv').removeChild(document.getElementById('file'+idx));
              
}

</script>



<script type="text/javascript">

attachFile = {
    idx:${count},
    add:function(){ // 파일필드 추가
        var o = this;
        var idx = o.idx;

        var a = $("input[name=files]").length;	//사진갯수담기
        //console.log(a);

        if(a > 8){	//사진이 10개 이상이면 사진넣기 버튼 안보이기
            $("#plus").css("display","none");
            }

        var div = document.createElement('div');
        div.style.marginTop = '3px';
        div.style.borderTop = 'solid 2px lightgray';
        div.style.paddingTop = '7px';
        div.id = 'file' + o.idx;

        var dv = document.createElement('dv');
        dv.style.marginTop = '3px';
        dv.id = 'dv' + o.idx;

        var file = document.all ? document.createElement('<input name="files">') : document.createElement('input');
        file.type = 'file';
        file.name = 'files';
        file.size = '40';
        file.id = 'fileField' + o.idx;
        file.required = 'required';
        file.onchange = function(){o.prev(this,'dv'+idx)};
        
        var btn = document.createElement('input');
        btn.type = 'button';
        btn.value = '삭제';
        btn.onclick = function(){o.del(idx)};
        btn.style.marginLeft = '5px';



        div.appendChild(file);
        
        //div.appendChild(btn);
        document.getElementById('attachFileDiv').appendChild(div);
        			$("#file"+o.idx).append("<input type='text' name='pfcoment2' style='display:inline-block; width:60%;'"
                										+"maxlength='50' placeholder='포토 설명 (50자 이하) (선택사항 입니다.)' class='form-control'>");
        			$("#file"+o.idx).append(btn);
                    document.getElementById('attachFileDiv').appendChild(dv);
                    //$("#file"+o.idx).append("<input type='text' name='pfcoment2'>");

        o.idx++;
    },
    del:function(idx){ // 파일필드 삭제

    	var a = $("input[name=files]").length;	//사진갯수담기
        //console.log(a);

        if(a < 11){	//사진이 10장 이하면 사진넣기버튼 보이기
            $("#plus").css("display","block");
            }
        
        if(document.getElementById('fileField' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
        	if(a == 10){
                $("#plus").css("display","none");
                }
            return;
        }
        document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
                    document.getElementById('attachFileDiv').removeChild(document.getElementById('dv' + idx));
    },
    prev:function(targetObj,View_area){ // 이미지 미리보기
        var preview = document.getElementById(View_area); //div id
        //alert(View_area); //사진업로드후 확인알러트
       var ua = window.navigator.userAgent;
//ie일때(IE8 이하에서만 작동)
if (ua.indexOf("MSIE") > -1) {
    targetObj.select();
    try {
        var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
        var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


        if (ie_preview_error) {
            preview.removeChild(ie_preview_error); //error가 있으면 delete
        }

        var img = document.getElementById(View_area); //이미지가 뿌려질 곳

        //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
        img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
    } catch (e) {
        if (!document.getElementById("ie_preview_error_" + View_area)) {
            var info = document.createElement("<p>");
            info.id = "ie_preview_error_" + View_area;
            info.innerHTML = e.name;
            preview.insertBefore(info, null);
        }
    }
//ie가 아닐때(크롬, 사파리, FF)
} else {
    var files = targetObj.files;
    for ( var i = 0; i < files.length; i++) {
        var file = files[i];
        var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
        var prevImg = document.getElementById("prev_" + View_area);
        if (!file.type.match(imageType)){
            preview.removeChild(prevImg);
            continue;
            }
         //이전에 미리보기가 있다면 삭제
        if (prevImg) {
            preview.removeChild(prevImg);
        }
        var img = document.createElement("img");
        img.id = "prev_" + View_area;
        img.classList.add("obj");
        img.file = file;
        img.style.width = '100px';
        img.style.height = '100px';
        preview.appendChild(img);
        if (window.FileReader) { // FireFox, Chrome, Opera 확인.
            var reader = new FileReader();
            reader.onloadend = (function(aImg) {
                return function(e) {
                    aImg.src = e.target.result;
                };
            })(img);
            reader.readAsDataURL(file);
        } else { // safari is not supported FileReader
            //alert('not supported FileReader');
            if (!document.getElementById("sfr_preview_error_"
                    + View_area)) {
                var info = document.createElement("p");
                info.id = "sfr_preview_error_" + View_area;
                info.innerHTML = "not supported FileReader";
                preview.insertBefore(info, null);
            }
        }
    }
}

    }
}

</script>







<script type="text/javascript">

//작성취소 클릭시
function qu(consid,pfnum){
	if(!confirm(" 저장하기를 버튼을 누르지 않으면 \n 변경된 내용이 저장되지 않습니다. \n 이대로 작성페이지를 나가시겠습니까?"))
		return false;
	location.href = "selectPfOne5.do?consid="+consid+"&pfnum="+pfnum;
}

//작성완료 클릭시
function Check(){
	//제목이 null 이면
	var pftitle = $("#pftitle").val();
	//console.log(pftitle);
	if(pftitle.length == 0){
		alert("제목을 입력하세요.");
		return false;
		}

	//var hrename = $(".finput").length;
	//console.log(hrename);
	
	var a = $("input[name=files]").length;
	//console.log(a);
		if(/* hrename+ */a<2){
			alert("신규사진은 최소 2장이상 첨부하셔야 합니다.")
			return false;
		}
	return true;
}

//소개 글클릭시
function so(consid){
	if(!confirm(" 저장하기를 버튼을 누르지 않으면 \n 변경된 내용이 저장되지 않습니다. \n 이대로 작성페이지를 나가시겠습니까?"))
		return false;
	location.href = "pfOne5.do?consid="+consid;
}

//리뷰 클릭시
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
<jsp:include page="../common/footer.jsp" />
</body>
</html>