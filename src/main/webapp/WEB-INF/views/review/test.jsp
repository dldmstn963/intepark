<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<%@ include file="../common/jscsspath.jsp" %>
<!-- ---------------------------------------------------------------------------------------------------------- -->

<style>
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
    border-radius: 5px;
    margin-bottom: 10px;
    margin-right:10px;
    
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
<h1>첨부파일 테스트 페이지</h1>
<form id="uploadForm" method="POST" enctype="multipart/form-data" action="testSubmit5.do" onsubmit="return reviewCheck();">
<div class="wrapper">
        <div class="body" style="display:inline-block;">
        
            <!-- 미리보기 영역 -->
            <div id="preview" style="display:inline-block;"></div>
            
            <!-- multipart 업로드시 영역 -->
            <!-- <form id="uploadForm" style="display: none;" /> -->
        </div>

        <!-- 첨부 버튼 -->
        <div id="attach" style="display:inline-block; width:100px; height:100px; border:1px solid;">
                <label for="uploadInputBox"><i class="fa fa-camera-retro fa-2x" style="padding-left: 33px;padding-top: 28px;"></i><br>&nbsp;&nbsp;&nbsp;사진올리기</label>
                <input type="file" id="uploadInputBox" name="filedata" multiple style="display: none" />
        </div>
        
        <div class="footer">
        <input type="submit" value="등록이다">
            <!-- <button class="submit"><a href="#" title="등록" >등록</a></button> -->
        </div>
</div>
</form>
 <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script> -->
    <script>
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
            } else
                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
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
 
       
            //submit 등록. 실제로 submit type은 아니다.
               function reviewCheck(){

            	   var form = $('#uploadForm')[0];
                   var formData = new FormData(form);
             	  

                for (var key in files){      
                	formData.append('files',files[key]);
                	
                	console.log("오브젝트 : " + Object.keys(files));
                    console.log("파일즈 : " + files);
                    console.log("파일즈 인덱스 : " + files[key]);
                    console.log(Object.keys(files));
                    console.log(files);
               }


                $.ajax({
                    type : 'POST',
                    enctype : 'multipart/form-data',
                    processData : false,
                    contentType : false,
                    cache : false,
                    timeout : 600000,
                    url : 'testSubmit5.do',
                    dataType : 'JSON',
                    data : formData,
                    success : function(result) {
                        //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                        //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                        //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                        if (result === -1) {
                            alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                            // 이후 동작 ...
                        } else if (result === -2) {
                            alert('파일이 20MB를 초과하였습니다.');
                            // 이후 동작 ...
                        }else if (result === 3) {
                            alert('파일이 갯수가 5개를 초과하였습니다.');
                            // 이후 동작 ...    
                        } else {
                            alert('이미지 업로드 성공');
                            // 이후 동작 ...
                        }
                    }
                    //전송실패에대한 핸들링은 고려하지 않음
                });
                
                return false;
                
       
            }
            // <input type=file> 태그 기능 구현
            
             $(document).ready(function() {
            $('#attach input[type=file]').change(function() {
                addPreview($(this)); //preview form 추가하기
            });
        });
    </script>






















</body>
</html>