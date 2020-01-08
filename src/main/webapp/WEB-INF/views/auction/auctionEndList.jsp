<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

<div style="text-align:center; margin:0 0 100px 0; background:#555; line-height:80px;">
	<a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt;" href="https://ktsmemo.cafe24.com/s/jquery/82" target="_blank">https://ktsmemo.cafe24.com/s/jquery/82</a>
</div>


<!-- 예제 시작 -->

<table id="preset" style="display:none;">
	<tr name="tr_attach_file">
		<th>첨부파일</th>
		<td>
			<input type="file" name="attachFile" />
		</td>
	</tr>
</table>

<form name="form1" method="post" action="">
<table cellpadding="5" cellspacing="0" border="1">
	<tr>
		<th>제목</th>
		<td>.</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>.</td>
	</tr>
	<tr name="tr_attach_file">
		<th>첨부파일</th>
		<td>
			<input type="file" name="attachFile" /> <button type="button" onclick="addFile()">추가</button>
		</td>
	</tr>
	<!-- 추가 버튼을 누르면 위 숨겨진 테이블의 tr 을 가져다가 추가할 겁니닷 -->
</table>
</form>

<script>

	function addFile(){
		$('[name=form1] [name=tr_attach_file]:last').after( $('#preset tr').clone() );
		// $('#preset tr').clone() : id=preset 에서 tr 요소 셀렉트 하여 복제 !!
		// form1 안에 이름이 tr_attach_file 인것 중 마지막 것 다음에 추가합니다.
		// 이렇게 하면 실행때 마다 동적으로 하나씩 추가됩니다.
	}

</script>

</body>
</html>