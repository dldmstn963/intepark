<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <%@ include file="../common/jscsspath.jsp" %> 
<link rel="stylesheet" type="text/css" href="/intepark/resources/gu-upload/css/guupload.css"/> 
<script type="text/javascript" src="/intepark/resources/gu-upload/guuploadManager.js"></script>
<script type="text/javascript">

$(document).ready(function (e){
  $("input[type='file']").change(function(e){

    //div 내용 비워주기
    $('#preview').empty();

    var files = e.target.files;
    var arr =Array.prototype.slice.call(files);
    
    //업로드 가능 파일인지 체크
    for(var i=0;i<files.length;i++){
      if(!checkExtension(files[i].name,files[i].size)){
        return false;
      }
    }
    
    preview(arr);
    
    
  });//file change
  
  function checkExtension(fileName,fileSize){

    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    var maxSize = 20971520;  //20MB
    
    if(fileSize >= maxSize){
      alert('파일 사이즈 초과');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    
    if(regex.test(fileName)){
      alert('업로드 불가능한 파일이 있습니다.');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    return true;
  }
  
  function preview(arr){
    arr.forEach(function(f){
      
      //파일명이 길면 파일명...으로 처리
      var fileName = f.name;
      if(fileName.length > 10){
        fileName = fileName.substring(0,7)+"...";
      }
      
      //div에 이미지 추가
      var str = '<div style="display: inline-flex; padding: 10px;"><li>';
      str += '<span>'+fileName+'</span><br>';
      
      //이미지 파일 미리보기
      if(f.type.match('image.*')){
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
          //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
          str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
          str += '</li></div>';
          $(str).appendTo('#preview');
        } 
        reader.readAsDataURL(f);
      }else{
        str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
        $(str).appendTo('#preview');
      }
    });//arr.forEach
  }
});

</script>


</head>
<body>
  <form method="post" class="register-form" id="register-form" action="auctionEnroll2.do" enctype="multipart/form-data">
 <h1>첨부파일 미리보기</h1>
  <hr>
  <table border="1">
    <tr>
      <th align="center" bgcolor="orange" width="500px">첨부파일</th>
    </tr>
    <tr>
      <td align="center">
        <input type="file" name="upfile" id="upfile" multiple>
        <div id="preview"></div>
      </td>
    </tr>
  </table>
   <input type="reset" value="작성취소" class="submit" name="reset" id="reset" />
                            <input type="submit" value="경매등록" class="submit" name="submit" id="submit" />
  </form>
</body>
</html>