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
	<title>#</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>별점기능</h1>
	<form action="/rankstarup" method="post">
		<div>
			<input type="radio" name="star" value="1">
			<input type="radio" name="star" value="2">
			<input type="radio" name="star" value="3">
			<input type="radio" name="star" value="4">
			<input type="radio" name="star" value="5">
		</div>
		<button type="submit">평가</button>
	</form>
	
	<h1>좋아요</h1>
	<div id="countlike">0</div>
	<button type="button" name="btnup" id="btnup" value="up">업</button>
	<h1>싫어요</h1>
	<div id="countdislike">0</div>
	<button type="button" name="btndown" id="btndown" value="down">다운</button>
	<script>
		$('#btnup, #btndown').on('click',function(){				
			var value = 1;
			
			if('up'== this.value){			
				$.ajax({
					type :"GET",
					url :"/thumbup?idx=" + ${idx},
					data : {
						"btnup" : value
					},					
					success : function(data){
						var jo = JSON.parse(data);
						$('#countlike').text(jo.data); 
						
						}					
					});
			} else {				
				$.ajax({
					type :"GET",
					url :"/thumbdown?idx="+ ${idx},
					data : {
						"btndown" : value
					},					
					success : function(data){
						var jo = JSON.parse(data);
						$('#countdislike').text(jo.data);
					}						
				});	
			}
		});	
	</script>	
</body>
</html>