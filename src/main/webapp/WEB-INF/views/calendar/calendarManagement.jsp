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

<!-- <script src='resources/js/jquery-3.4.1.min.js' ></script> -->

<script>
	var myMap = new Map();
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
          			var sdate = new Date(json.list[i].cstart);
          			var edate = new Date(json.list[i].cend);
          			if(sdate != edate){
						edate.setDate(edate.getDate() + 1);
          			} 
						events.push({id:json.list[i].cno,
											title:decodeURIComponent(json.list[i].ctitle).replace(/\+/gi, " "),
											start:sdate,
											end:edate,
											color:json.list[i].ccolor,
											textColor:"white",
											allDay:true})
						console.log(json.list[i].cno);
						if(json.list[i].ccontent != null){
						myMap.set(json.list[i].cno, decodeURIComponent(json.list[i].ccontent).replace(/\+/gi, " "));
						}
		      	}		      	     			
      			successCallback(events);	
      		},
      		error : function(jqXHR, textStatus, errorThrown){
      			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
      		}
          });
    	  });
      },
      /* 일정클릭시 해당 이벤트 값 넣어서 출력 */
      eventClick:function(event){
          $("#myModal").modal();
    	  var sdate = new Date(event.event.start);
    	  var edate = new Date(event.event.end);
    
    	  if(sdate != edate){
			edate.setDate(edate.getDate() - 1);
          }
          
    	  sdate = getFormatDate(sdate);
    	  edate = getFormatDate(edate); 		
  		
  		$("#eventModal").css("display", "block");
  		$("#fctitle").val(event.event.title);
  		$("#fcstart").val(sdate);
  		$("#fcend").val(edate);
  		$("#fccolor").val(event.event.backgroundColor).css('backgroundColor', event.event.backgroundColor);
  		$("#fccontent").val(myMap.get(Number(event.event.id)));
  		$("#cno").val(event.event.id);
        }
     	
    });  
    
    calendar.render();

	}); 

	//날짜 포맷 변경
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;
	}

	/* 일정등록 or 수정 색깔 select값 선택된 옵션값과 동일하게 보여줌 */ 
	backgroundCh = function(){
		var sel = document.getElementById('sel');
		sel.style.backgroundColor = sel.value;
	};
	
	backgroundCh1 = function(){
		var sel = document.getElementById('fccolor');
		sel.style.backgroundColor = sel.value;
	};

	/* 일정등록 달력 시작 끝 날짜 동일하게 맞춰줌  */
	function sameDate(){
	var c1 = document.getElementById("cstart").value;
	var c2 = document.getElementById("cend");
	c2.value = c1;
	};
	
	function sameDate1(){
	var c1 = document.getElementById("fcstart").value;
	var c2 = document.getElementById("fcend");
	c2.value = c1;
	};	

	 /* 일정등록 submit시 끝날짜가 시작날짜보다 작은지 확인 */
	function check(){
	var flag = true;
	var start = document.getElementById("cstart").value;
	var end = document.getElementById("cend").value;
	if(start>end){
		alert("시작일은 마감일보다 클 수 없습니다.");
		flag = false;
	}
				
		return flag;
	};  

	function check1(){
	var flag = true;
	var start = document.getElementById("fcstart").value;
	var end = document.getElementById("fcend").value;
	if(start>end){
		alert("시작일은 마감일보다 클 수 없습니다.");
		flag = false;
	}
				
		return flag;
	};

	/* 일정삭제시 */
	function sendNo(){
		var cno = document.getElementById("cno").value;
		console.log(cno);
		location.href = "deleteCalendar3.do?cno="+cno;
		}

</script>

<style type="text/css">
  html, body {
   width: 100%; height: 100%; 
}
#read{
	display:none;
} 
.fc-sun {color:#e31b23}
  .fc-sat {color:#007dc3}
</style>
<title>업체 일정 관리</title>
<%@ include file="../common/jscsspath.jsp" %>
</head>
<body>
<jsp:include page="../common/header.jsp" /><br>
<div class="container" style="margin-top: 60px;">
    <div class="row">
      <div class="col-lg-12">
	  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
 	  일정등록
      </button>
      <div id='calendar'></div>
      </div>
      </div><!-- row 끝 -->
</div><!-- container 끝 -->

<jsp:include page="../common/footer.jsp" />
<!-- 복사 --><!-- fade  -->
<div class="modal fade" tabindex="-1" id="myModal" role="dialog" data-backdrop="false">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">일정 수정</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                    </div>
                    
                    <div class="modal-body">

      <form action="updateCalendar3.do" method="post">
      <div class="modal-body">
      제목 : &nbsp;<input type="text" id="fctitle" name="ctitle" style="margin-bottom: 10px;" required><br>
      일시 : &nbsp;<input type="date" id="fcstart" name="cstart" style="margin-bottom: 10px;" required onchange="sameDate1();">&nbsp;-&nbsp;
      <input type="date" id="fcend" name="cend"  style="margin-bottom: 10px;"><br>
      내용 : &nbsp;<textarea rows="10" cols="50" id="fccontent" name="ccontent" style="margin-bottom: 10px;"></textarea><br>
      색상 : &nbsp;
      <select name="ccolor" id="fccolor" class="sel" onchange="backgroundCh1();" style="width:100px;">
      		<option value="white">없음</option>
      		<option value="red" style="background:red; width:100pt;" />
      		<option value="green" style="background:green;" />
      		<option value="blue" style="background:blue;" />
      </select>
      <input type="hidden" name="consid" value="${sessionScope.loginCons.consid}">
      <input type="hidden" id="cno" name="cno">
      </div>
      <div class="modal-footer">
      <input class="btn btn-primary" type="submit" value="수정" onclick="return check1();">
      <a class="btn btn-primary" onclick="sendNo();" style="color:white;">삭제</a>
        <!-- <button type="button" id="confirm" class="btn btn-primary" data-dismiss="modal">확인</button> -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
      </form>
                </div>
            </div>
        </div>
        </div>
<!-- 끝 -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
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
      		<option value="blue" style="background:blue;" />
      </select>
      <input type="hidden" name="consid" value="${sessionScope.loginCons.consid}">
      </div>
      <div class="modal-footer">
      <input type="submit" value="확인" onclick="return check();">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>