<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='resources/js/jquery-3.4.1.min.js' ></script>
<script >
$(function(){
	var messages=document.getElementById("messages");

		/* $.ajax({
		url :  "insertChat3.do",
		type : "post",
		data : {
			consid : $("#cons").val(),
			userid : $("#user").val()
		},
		success : function(data){
			$("#chatno").val(data);
			console.log(data);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	}); */
	
	ws = new WebSocket("ws://localhost:8333/intepark/echo.do");

	/* 서버로 메세지 보낼때 */
	ws.onopen = function(){

		};

	/* 서버로부터 받은 메세지 보내주기 */
	ws.onmessage = function(message){
			console.log(message.data);
			var cut = message.data.split("/");
			messages.innerHTML+="<br/>"+cut[2] + " : " + cut[3];			
		};

	/* 서버 닫힐때 */
	ws.onclose = function(event){

		};

	$.ajax({
		url : "selectMsg3.do",
		type : "post",
		dataType : "json",
		data : {chatno : $("#chatno").val()},
		success : function(data){
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);

			var values = "";
			for(var i in json.list){
			if(json.list[i].userid == null && json.list[i].consid != null){
				values += json.list[i].chattime + "<br>" + json.list[i].consid + " : " + decodeURIComponent(json.list[i].chatcontent).replace(/\+/gi, " ") + "<br>"
			}else if(json.list[i].userid != null && json.list[i].consid == null){
				values += json.list[i].chattime + "<br>" + json.list[i].userid + " : " + decodeURIComponent(json.list[i].chatcontent).replace(/\+/gi, " ") + "<br>"			
			}
			}
			$("#messages").html(values);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});	

	$("#send").click(function(){
		var text = $("#messageinput").val();
		var room = $("#chatno").val();
		var id = $("#sender").val();
		var msg = $("#messages");
		msg.html(msg.html() + "<br>" + text);
		
		var who = $("#sender").val();
		console.log(who);
		var id = who.split("/");
		console.log(id[0] + ", " + id[1]);
		console.log(typeof id[0]);
		var a = id[0];
		var b = id[1];
		if(id[0] == "user"){
		console.log(id[0]);
		}else if(id[0] == "cons"){
		console.log(id[1]);
		}
		var c = 3;
		
		$.ajax({
			url : "insertChatMsg3.do",
			type : "post",
			data : {
						chatno : $("#chatno").val(),
						chatcontent : $("#messageinput").val(),
						user : who
					},
			success : function(data){
				console.log("저장성공");
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
	});

		$("#messageinput").val("");	
});
});
</script>
</head>
<body>
<h1>채팅</h1>
<div>
		<c:if test="${!empty sessionScope.loginUser}">
		<input type="hidden" id="sender" value="user/${sessionScope.loginUser.userid }">
		</c:if>
		<c:if test="${!empty sessionScope.loginCons}">
		<input type="hidden" id="sender" value="cons/${sessionScope.loginCons.consid }">
		</c:if>
		<input type="hidden" id="chatno" value=1>
        <input type="text" id="messageinput">
    </div>
    <div>
        <button type="button" id="send">Send</button>
        <button type="button">Close</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div>
</body>
</html>