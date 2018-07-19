<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>웹소켓 채팅창</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	
	    $(function(){
	    	
			var ws = new WebSocket("ws://localhost/chat");
	
			ws.onopen = function(){
			};
			
			ws.onclose = function(){
			};
			
			ws.onmessage = function(message){
				$("#log").append(message.data).append("<br/>");
				$("#message").val("")
			};
			
			ws.onerror = function(event){
				alert("에러발생");
			};
			
			$("#form").submit(function(){
				ws.send($("#nick").val() + ' -> ' +$("#message").val());
				return false;
			});
	    });
	    
	</script>
</head>
<body>
	<a href="/">HOME</a>
	<br>
	<h1>웹소켓 채팅</h1>
	<div id="log"></div>
	<p></p>
  	<form id="form" action="#">
  		<input type="hidden" id="nick" value="${nick }"/>
  		${nick }
		<input type="text" id="message" />
		<input type="submit" id="send" value="전송" />
	</form>
</body>
</html>