<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 채팅 상담</title>
<style type="text/css">
	
	#messages {
		background: LightSkyBlue;
		height: 640px;
		overflow: auto;
	}
	
	.chat_content {
		background: rgb(255, 255, 102);
		padding: 10px;
		border-radius: 10px;
		display: inline-block;
		position: relative;
		margin: 10px;
		float: right;
		clear: both;
	}
	
	.chat_content:after {
		content: '';
		positon: absolute;
		right: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 20px solid transparent;
		border-left-color: rgb(255, 255, 102);
		border-right: 0;
		border-top: 0;
		margin-top: -3.5px;
		margin-right: -10px;
	}
	
	.other-side {
		background: white;
		float: left;
		clear: both;
	}
	
	.other-side:after {
		content: '';
		positon: absolute;
		right: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 20px solid transparent;
		border-right-color: white;
		border-left: 0;
		border-top: 0;
		margin-top: -3.5px;
		margin-right: -10px;
	}
</style>
<script src='resources/js/jquery-3.4.1.min.js' ></script>
<script >
$(function(){
	var messages=document.getElementById("messages");
	var messageinput = document.getElementById("messageinput");
	var chatno = document.getElementById("chatno").value;
	var sender = document.getElementById("sender").value;
	var who = sender.split("/");
	
	ws = new WebSocket("ws://localhost:8333/intepark/echo.do");

	/* 서버열릴때 */
	ws.onopen = function(){
		ws.send("room/" + chatno + "," + who[1]);		
		};

	/* 서버로부터 받은 메세지 보내주기 */
	ws.onmessage = function(message){
			var cut = message.data.split("/");
			if(cut[0] == "accept"){
				messages.innerHTML+="<br/>"+ "<p style='align:center;'>" + cut[1] + "님이 입장하셨습니다.</p><br>";	
			}else if(cut[0] == "refuse"){
				messages.innerHTML+="<br/>"+ "<p style='align:center;'>" + cut[1] + "님이 거절하셨습니다.</p><br>";	
			}else if(cut[0] == "chat"){
				messages.innerHTML+="<br/>"+ "<p class='chat_content other-side'>"
				 + cut[1] + " : " + cut[2] + "</p><br>";	
			}					
		};

	/* 서버 닫힐때 */
	ws.onclose = function(event){
			ws.send("exit/" + chatno + "," + who[1]);
		};

	$.ajax({
		url : "selectMsg3.do",
		type : "post",
		dataType : "json",
		data : {chatno : chatno},
		success : function(data){
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);

			var values = "";
			for(var i in json.list){
			if(json.list[i].userid == null && json.list[i].consid != null){
				if(json.list[i].consid.equals(who[1])){
					values += json.list[i].consid + " : " + decodeURIComponent(json.list[i].chatcontent).replace(/\+/gi, " ") + "<br>"
				}else{
					values += json.list[i].consid + " : " + decodeURIComponent(json.list[i].chatcontent).replace(/\+/gi, " ") + "<br>"
				}				
			}else if(json.list[i].userid != null && json.list[i].consid == null){
				if(json.list[i].userid.equals(who[1])){
					values += json.list[i].userid + " : " + decodeURIComponent(json.list[i].chatcontent).replace(/\+/gi, " ") + "<br>"
				}else{
					values += json.list[i].userid + " : " + decodeURIComponent(json.list[i].chatcontent).replace(/\+/gi, " ") + "<br>"
				}
							
			}
			}
			$("#messages").html(values);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});				
});

function send(){
	var who = document.getElementById("sender").value.split("/");

	if($("#messageinput").val() == null){
		alert("메세지를 입력해주세요!");
	}else{
		$("#messages").html($("#messages").html() + "<p class='chat_content'>" 
				+ who[1] + " : " + $("#messageinput").val() + "</p><br>");
	
		$.ajax({
			url : "insertChatMsg3.do",
			type : "post",
			data : {
						chatno : Number($("#chatno").val()),
						chatcontent : $("#messageinput").val(),
						user : $("#sender").val()
					},
			success : function(data){
				console.log("저장성공");
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
		});
	
		ws.send("chat/"+ who[1] +"/"+ $("#messageinput").val());
		
		$("#messageinput").val("");
	}
	
	
}

function enterKey(){
	if(window.event.keyCode == 13){
		send();
	}
}
</script>
</head>
<body>

<c:if test="${!empty sessionScope.loginUser}">
<input type="hidden" id="sender" value="user/${sessionScope.loginUser.userid }">
</c:if>
<c:if test="${!empty sessionScope.loginCons}">
<input type="hidden" id="sender" value="cons/${sessionScope.loginCons.consid }">
</c:if>
<input type="hidden" id="chatno" value="${chatno}">



		<div id="messages"></div> <br>
		<input type="text" id="messageinput" onkeyup="enterKey();">
		<input type="button" value="보내기" onclick="send();">

</body>
</html>