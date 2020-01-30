<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>인테파크</title>

    <!-- Favicon  -->
    <link rel="icon" href="/intepark/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/intepark/resources/css/core-style.css">
	<link rel="stylesheet" href="/intepark/resources/css/font.css">
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
    border-radius: 2px;
    margin-bottom: 10px;
    width:200px;
    display:inline-block;
}
</style>
</head>

<body>
<div class="main-content-wrapper d-flex clearfix">

       <jsp:include page="common/header.jsp" />

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>문의사항 작성</h2>
                            </div>

                            <form action="goodsinquiryInsert4.do" method="post">
                                <div class="row">
                               &nbsp;&nbsp; 문의 유형 : <div class="col-3 mb-3">
                                        <select class="w-100" id="country" name="inquirytype">
                                        <option value="1">상품</option>
                                        <option value="2">배송</option>
                                        <option value="3">기타</option>
                                    </select> 
                                  
                                    </div>
                                    <!-- &nbsp;&nbsp;&nbsp; 비밀 여부 : 
                                   &nbsp;&nbsp;&nbsp; <input type="checkbox" name="secretat" value="Y" />  &nbsp;&nbsp;&nbsp;예 
                                    &nbsp;&nbsp;&nbsp;<input type="checkbox" name="secretat" value="N" />&nbsp;&nbsp;&nbsp; 아니오 -->
                                    <div class="col-12 mb-3">
                                       <input type="text" class="form-control" id="company" placeholder="제목" name="inquirytitle">
                                    </div>
                                 &nbsp; 
                                    <div class="col-12 mb-3">
                                        <textarea class="form-control w-100" id="comment" cols="30" rows="10" placeholder="내용" name="inquirycn"></textarea>
                                    </div>
                                    <div class="cart-btn mt-100">
                                  <div class="wrapper">
        <div class="body">
            <!-- 첨부 버튼 -->
           <!--  <div id="attach">
                <label for="uploadInputBox">사진첨부</label>
                <input type="file" id="uploadInputBox" name="filedata" multiple style="display: none" />
            </div> -->
            
            <!-- 미리보기 영역 -->
            <div id="preview"></div>
            
            <!-- multipart 업로드시 영역 -->
            <form id="uploadForm" style="display: none;" />
        </div>
        <div class="footer">
            <button class="submit" style="display: none" ><a href="#" title="등록" class="btnlink">등록</a></button>
        </div>
</div>
								
                                <input type="submit" class="btn amado-btn w-100" value="작성하기" onclick="return button1_click();">
                            </div>
                                </div>
                                <input type="hidden" name="userid" value=${param.userid }>
                                <input type="hidden" name="goodsnum" value=${param.goodsnum }>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>문의할 상품 정보</h5>
                            <ul class="summary-table">
                                <li><img src="/intepark/resources/img/goodthumspic/${goods.thumbnail }"></li>
                                <li><span>상품 이름 :</span> <span>${goods.goodsname }</span></li>
                            </ul>


                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- ##### Main Content Wrapper End ##### -->

	<jsp:include page="common/footer.jsp" />

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="/intepark/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="/intepark/resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="/intepark/resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="/intepark/resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="/intepark/resources/js/active.js"></script>
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
                    if(validation(file.name)) continue;
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
                        "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>" +
                        "<p>" + file.name + "</p>" +
                        "<a href=\"#\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">" +
                        "삭제" + "</a>"
                        + "</div>"
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
        function imageupload() {         
            var form = $('#uploadForm')[0];
            var formData = new FormData(form);

            for (var key in files){      
                formData.append('files',files[key]);
            }
            var result1="";
            //ajax 통신으로 multipart form을 전송한다.
            $.ajax({
                type : 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
                cache : false,
                timeout : 600000,
                url : 'goodsInquiryimgup4.do',
                dataType : 'JSON',
                data : formData,
                async: false,
                success : function(result) {
                    //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                    //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                    //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                    if (result === -1) {
                        alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                        // 이후 동작 ...
                    } else if (result === -2) {
                        alert('파일이 10MB를 초과하였습니다.');
                        // 이후 동작 ...
                    } else {
                        //alert('이미지 업로드 성공');
                        // 이후 동작 ...
                        console.log('222222');
                        result1 = true; 
                    }
                }
                //전송실패에대한 핸들링은 고려하지 않음
            });
            return result1;
        };
        function button1_click() {
            console.log('111111');
            if(imageupload()){
            console.log('3333333');
        	return true;
                }
        }
        $(document).ready(function() {
            //submit 등록. 실제로 submit type은 아니다.
            
            // <input type=file> 태그 기능 구현
            $('#attach input[type=file]').change(function() {
                addPreview($(this)); //preview form 추가하기
            });
        });
    </script>
</body>

</html>