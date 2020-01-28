<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3d</title>
<%@ include file="../common/jscsspath.jsp"%>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<jsp:include page="../common/header.jsp" />
<br>
<br>
<br>
<br>
<br>
<center>
<iframe id="myFrame" frameborder="0" src="https://roomtodo.com/designer?site_key=6a204bd89f3c8348afd5c77c717a097a" width="1300" height="500"></iframe>
<br> 
	<input type="button" value="캡쳐" class="btn btn-success"/>
</center>
<br> 
<br> 

	<a id="target" style="display: none"></a>

	<style>
#screenshot_mask {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	display: block;
	opacity: 0.3;
	text-align: center;
	box-sizing: border-box;
	z-index: 2147483647;
	border-color: black;
	border-style: solid;
}

#screenshot_focus:before, #screenshot_focus:after {
	border: none !important;
	content: "" !important;
	height: 100% !important;
	position: absolute !important;
	width: 100% !important
}

#screenshot_focus:before {
	border-right: 1px solid white !important;
	border-bottom: 1px solid white !important;
	left: -100% !important;
	top: -100% !important
}

#screenshot_focus:after {
	border-top: 1px solid white !important;
	border-left: 1px solid white !important;
	left: 0 !important;
	top: 0 !important
}

#screenshot_focus {
	height: 100% !important;
	position: fixed !important;
	width: 100% !important;
	z-index: 2147483648 !important
}
</style>


	
	<jsp:include page="../common/footer.jsp" />
	

<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"></script>
	<script>
		$(":button").on(
				'click',
				function(e) { //캡쳐 기능 활성화

					var height = window.innerHeight;

					var width = $(document).width();

					var $mask = $('<div id="screenshot_mask"></div>').css(
							"border-width", "0 0 " + height + "px 0");

					var $focus = $('<div id="screenshot_focus"></div>');

					$("body").append($mask); //dimmed 추가

					$("body").append($focus); //마우스 커서에 따라 캡쳐 영역을 만들 div

					var selectArea = false;

					$("body").one("mousedown", function(e) { //캡쳐 영역 선택 시작

						e.preventDefault();

						selectArea = true;

						startX = e.clientX;

						startY = e.clientY;

					}).one(
							'mouseup',
							function(e) { //캡쳐 시작

								selectArea = false;

								$("body").off('mousemove', mousemove); //이벤트 삭제

								$("#screenshot_focus").remove(); //마우스 포커스 삭제

								$("#screenshot_mask").remove(); //딤 삭제

								var x = e.clientX;

								var y = e.clientY;

								var top = Math.min(y, startY);

								var left = Math.min(x, startX);

								var width = Math.max(x, startX) - left;

								var height = Math.max(y, startY) - top;

								html2canvas(document.body).then(
										function(canvas) { //전체 화면 캡쳐

											var img = canvas.getContext('2d')
													.getImageData(left, top,
															width, height); //선택 영역만큼 crop

											var c = document
													.createElement("canvas");

											c.width = width;

											c.height = height;

											c.getContext('2d').putImageData(
													img, 0, 0);

											save(c); //crop한 이미지 저장

										});

							}).on("mousemove", mousemove); //캡쳐 영역 크기 변경

					function mousemove(e) {

						var x = e.clientX;

						var y = e.clientY;

						$focus.css("left", x); //마우스 커서 따라 좌표 포커스 이동

						$focus.css("top", y);

						if (selectArea) { //캡쳐 영역 선택 그림

							var top = Math.min(y, startY);

							var right = width - Math.max(x, startX);

							var bottom = height - Math.max(y, startY);

							var left = Math.min(x, startX);

							$mask.css("border-width", [ top + 'px',
									right + 'px', bottom + 'px', left + 'px' ]
									.join(' '));

						}

					}

					function save(canvas) { //파일로 저장

						if (navigator.msSaveBlob) {

							var blob = canvas.msToBlob();

							return navigator.msSaveBlob(blob, '3D배치.jpg');

						} else {

							var el = document.getElementById("target");

							el.href = canvas.toDataURL("image/jpeg");

							el.download = '3D배치.jpg';

							el.click();

						}

					}

				});
	</script>
</body>
</html>