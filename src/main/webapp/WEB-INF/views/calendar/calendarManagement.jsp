<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='resources/fullcalendar/timegrid/main.min.css' rel='stylesheet' />

<script src='resources/fullcalendar/core/main.js'></script>
<script src='resources/fullcalendar/daygrid/main.js'></script>
<script src="resources/fullcalendar/interaction/main.min.js"></script>
<script src="resources/fullcalendar/timegrid/main.min.js"></script>
<script src='resources/fullcalendar/core/locales/ko.js'></script>

<script src='resources/js/jquery-3.4.1.min.js' ></script>

<script>
	/* fullcalendar api 사용해 달력 불러옴 */
	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid' ],
      locale: 'ko',
      events:function(info, successCallback, failureCallback) {
    	  $(function(){
    		  
    	  $.ajax({
      		url : "selectCalendar3.do",
      		type : "post",
      		dataType : "json",
      		success : function(data){
      			var jsonStr = JSON.stringify(data);
      			var json = JSON.parse(jsonStr);
				var events = [];
				
      			for(var i in json.list){
						events.push({id:json.list[i].cno,title:decodeURIComponent(json.list[i].ctitle).replace(/\+/gi, " "),start:json.list[i].cstart,end:json.list[i].cend,color:json.list[i].ccolor,textColor:"white"})
						console.log(json.list[i].cno);
		      	}
      			
      			successCallback(events);	
      		},
      		error : function(jqXHR, textStatus, errorThrown){
      			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
      		}
          });
    	  });
      },
      eventClick:function(event){
		console.log(event.el);
		console.log(event.event.title);
      }
      
    });  
    
    calendar.render();

	}); 

	/* 일정등록 색깔 select값 선택된 옵션값과 동일하게 보여줌 */ 
	backgroundCh = function(){
		var sel = document.getElementById('sel');
		sel.style.backgroundColor = sel.value;
	};

	/* 일정등록 달력 시작 끝 날짜 동일하게 맞춰줌  */
	function sameDate(){
	var c1 = document.getElementById("cstart").value;
	console.log("aaaa");
	var c2 = document.getElementById("cend");
	c2.value = c1;
};	

</script>

<style type="text/css">
  html, body {
   width: 100%; height: 100%; 
} 
 
</style>
<title>업체 일정 관리</title>
<%@ include file="../common/jscsspath.jsp" %>
</head>
<body>
<jsp:include page="../common/header.jsp" /><br>
<div class="container" style="margin-top: 60px;">
    <div class="row">
      <div class="col-lg-12">
      <span> ${sessionScope.loginCons.companyname } </span> &nbsp;<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
 	  일정등록
      </button>
      <div id='calendar'></div>
      </div>
      </div><!-- row 끝 -->
</div><!-- container 끝 -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정등록</h5><br>      
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="insertCalendar3.do" method="post">
      <div class="modal-body">
      제목 : &nbsp;<input type="text" name="ctitle" style="margin-bottom: 10px;" required><br>
      일시 : &nbsp;<input type="date" id="cstart" name="cstart" style="margin-bottom: 10px;" required onchange="sameDate();">&nbsp;-&nbsp;
      <input type="date" id="cend" name="cend"  style="margin-bottom: 10px;"><br>
      내용 : &nbsp;<textarea rows="10" cols="50" name="ccontent" style="margin-bottom: 10px;"></textarea><br>
      색상 : &nbsp;
      <select name="ccolor" id="sel" onchange="backgroundCh();" style="width:100px;">
      		<option selected value="white">없음</option>
      		<option value="red" style="background:red; width:100pt;" />
      		<option value="green" style="background:green;" />
      		<option value="yellow" style="background:yellow;" />
      </select>
      <input type="hidden" name="consid" value="${sessionScope.loginCons.consid}">
      </div>
      <div class="modal-footer">
      <input type="submit" id="submit" value="확인" onclick="return check();">
        <!-- <button type="button" id="confirm" class="btn btn-primary" data-dismiss="modal">확인</button> -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
      </form>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>