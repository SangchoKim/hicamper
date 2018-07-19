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
	<title>하이캠퍼! | 에러 페이지</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<style type="text/css">
		html, body {
			height: 100%;
			overflow: hidden;
		}
		
		.error-page {
			display: flex;
			align-items: center;
			justify-content: center;
			text-align: center;
			height: 100%;
			font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
		}
		
		.error-page h1 {
			font-size: 30vh;
			font-weight: bold;
			position: relative;
			margin: -8vh 0 0;
			padding: 0;
		}
		
		.error-page h1:after {
			content: attr(data-h1);
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			color: transparent;
			/* webkit only for graceful degradation to IE */
			background: -webkit-repeating-linear-gradient(-45deg, #71b7e6, #69a6ce, #b98acc, #ee8176, #b98acc, #69a6ce, #9b59b6);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
			background-size: 400%;
			text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.25);
			animation: animateTextBackground 10s ease-in-out infinite;
		}
		
		.error-page h1 + p {
			color: #d6d6d6;
			font-size: 8vh;
			font-weight: bold;
			line-height: 10vh;
			max-width: 600px;
			position: relative;
		}
		
		.error-page h1 + p:after {
			content: attr(data-p);
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			color: transparent;
			text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5);
			-webkit-background-clip: text;
			-moz-background-clip: text;
			background-clip: text;
		}
		
		#particles-js {
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
		}
		
		@keyframes animateTextBackground {
			0% {
				background-position: 0 0;
			}
			
			25% {
				background-position: 100% 0;
			}
			
			50% {			
				background-position: 100% 100%;
			}
			
			75% {
				background-position: 0 100%;
			}
			
			100% {
				background-position: 0 0;
			}
		}
		
		@media (max-width: 767px) {
			.error-page h1 {
			font-size: 32vw;
		}
		
		.error-page h1 + p {
			font-size: 8vw;
			line-height: 10vw;
			max-width: 70vw;
		}	
	</style>
</head>	
<body>
	<div class="error-page">
		<div>		    
		    <h1 data-h1="403">403</h1>
		    <p data-p="FORBIDDEN">FORBIDDEN</p>		    
		</div>
	</div>	
</body>
</html>