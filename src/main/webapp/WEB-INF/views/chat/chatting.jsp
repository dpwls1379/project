<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../idSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="Myid" value="${id }"></c:set>
<script type="text/javascript">
	var websocket;
	$(function() {
		$('#message').keypress(function(event) {
			var keycode = event.keyDode ? event.keyCode : event.which;
			if(keycode == 13){
				send();
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() {
			send();
		});
		$('#enterBtn').click(function() {
			connect();
		//	$('#enterExit').html('<input type="button" value="퇴장" id="exitBtn" class="btn btn-success btn-sm">');
		});
		$('#exitBtn').click(function() {	
		//	$('#enterExit').html('<input type="button" value="입장" id="enterBtn" class="btn btn-success btn-sm">');
			disconnect();	
		});
	});
	
	function send() {
		var id='${id}';
		var msg=$('#message').val();
		websocket.send('msg:'+id+' --> '+msg);
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		//채팅 메세지 입력 되면 스크롤 자동으로 내리기
		$('#message').val('');
	}
	
	function connect() {
		websocket = new WebSocket('ws://192.168.40.5:8181/project/chatting-ws.do');
		websocket.onopen=onOpen;
		websocket.onmessage=onMessage;
		websocket.onclose=onClose;
	}
	
	function disconnect() {
		websocket.close();
	}
	
	function onOpen(evt) {
		addMessage("연결되었습니다.");
	}
	
	function onMessage(evt) {
		var data=evt.data;
		addMessage(data);
	}
	
	function onClose(evt) {
		addMessage("종료되었습니다.");
	}
	
	function addMessage(msg) {
// 		$('#chatArea').prepend(msg+'<br>');
		$('#chatArea').append(msg+'<br>');
	}
	
</script>
</head>
<body>
	<div class="container">
		<table class="table table-bordered"  >
			<caption class="text-primary">${Myid} 채팅창</caption>
			
			<tr>
				<td id="enterExit">
					<input type="button" value="입장" id="enterBtn" class="btn btn-success btn-sm">
					<input type="button" value="퇴장" id="exitBtn" class="btn btn-success btn-sm">
				</td>
			</tr>
			<tr>
				<td>
					<pre class="pre-scrollable chatPre" id="chatArea" >
						
					</pre>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="message" required="required">
					<input type="button" value="전송" class="btn btn-defualt btn-sm" id="sendBtn">
				</td>
			</tr>
			
		</table>
	</div>
</body>
</html>