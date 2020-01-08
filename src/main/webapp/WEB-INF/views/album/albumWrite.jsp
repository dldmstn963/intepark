<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#holder { 
  border: 10px dashed #ccc; 
  width: 300px; 
  height: 300px; 
}
#holder.hover { 
  border: 10px dashed #333; 
}
</style>
<%@ include file="../common/jscsspath.jsp" %>

<script type="text/javascript">
window.onload=function(){
	var holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  state.innerHTML = 'File API & FileReader available';
}
 
holder.ondragover = function () { this.className = 'hover'; return false; };
holder.ondragend = function () { this.className = ''; return false; };
holder.ondrop = function (e) {
  this.className = '';
  e.preventDefault();

  var file = e.dataTransfer.files[0],
      reader = new FileReader();
  console.log(file); //파일객체
  reader.onload = function (event) {
    console.log(event.target);
    console.log(event.target.result); //파일정보를 div안에 넣는다.
    holder.style.background = 'url(' + event.target.result + ') no-repeat center';
  };

  console.log(event.target.result);
  reader.readAsDataURL(file);

  return false;
};
}
</script>
   
</head>
<body>
        <!--================Header Menu Area =================-->
       	<jsp:include page="../common/header.jsp" />
<div>
<div id="holder"></div> 
  <p id="status">File API  FileReader API not supported</p>
 </div>
</body>
</html>