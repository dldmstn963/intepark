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
	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
  
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid' ],
      locale: 'ko',
    });
  
    calendar.render();
  }); 
  
	/* document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
		 
		    var calendar = new Calendar(calendarEl, {
		      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
		      header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		      editable: true,
		      droppable: true, // this allows things to be dropped onto the calendar
		      drop: function(info) {
		        // is the "remove after drop" checkbox checked?
		        if (checkbox.checked) {
		          // if so, remove the element from the "Draggable Events" list
		          info.draggedEl.parentNode.removeChild(info.draggedEl);
		        }
		      },
		      locale: 'ko',
		      events: [
		          {
		              title : 'evt1',
		              start : '2019-09-03'
		          },
		          {
		              title    :    'evt2',
		              start    :    '2019-09-10',
		              end    :    '2019-09-20'
		          },
		          {
		              title    :    'evt3',
		              start    :    '2019-09-25T12:30:00',
		              allDay    :    false
		          }
		      ]
		    });
		 
		    calendar.render();
		  });   */
    	  
</script>
<title>업체 일정 관리</title>
<%@ include file="../common/jscsspath.jsp" %>
</head>
<body>
<jsp:include page="../common/header.jsp" /><br>

<div class="container" style="margin-top: 60px;">
    <div class="row">
      <div class="col-lg-12">
      <%-- <a href="${pageContext.request.contextPath}/WEB-INF/views/calendar/insertCalendar.jsp">일정등록</a> --%>
      <!-- <a href="insertCalendar3.do" target="_blank">일정등록</a> -->
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
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
      <div class="modal-body">
      제목 : <input type="text" name="ctitle"><br>
      일시 : <input type="date" name="cstart">-<input type="date" name="cend"><br>
      내용 : <textarea rows="20" cols="50"></textarea><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>