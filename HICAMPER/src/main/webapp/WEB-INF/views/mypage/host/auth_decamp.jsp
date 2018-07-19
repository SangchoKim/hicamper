<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
		<title>하이캠퍼! | 회원 인증</title>
		
		<style type="text/css">
			table {
				border: 1px solid gray;
				text-align: center;
			}
			th {
				text-align: center;
			}
			td {
				padding: 10px;
			}
			.out {
			        display: none;
			        position: fixed; 
			        z-index: 1; 
			        left: 0;
			        top: 0;
			        width: 100%; 
			        height: 100%; 
			        overflow: auto; 
			        background-color: rgb(0,0,0); 
			        background-color: rgba(0,0,0,0.4); 
			}
			.in {
			        background-color: #fefefe;
			        margin: 15% auto; 
			        padding: 20px;
			        border: 1px solid #888;
			        width: 30%;
			}
			a:link { color: black; text-decoration: none;}
	 		a:visited { color: black; text-decoration: none;}
	 		a:hover { color: black; text-decoration: underline;}
	 		a:hover { text-decoration:none !important}	
		</style>
        
		<script type="text/javascript">           
        
			$( document ).ready(function() {
	            $('#popup').show();
	    	});
			
	        function close_pop(flag) {
	        	$('#popup').hide();
	        };
		
        
			function auth() {		
				
				var authpw = document.getElementById("authpw").value;
				
				<c:forEach var="list" items="${list}">
					var hostpw = '${list.password}';
				</c:forEach>
				
				var same_url = '${same_url}';
				var diff_url = '${diff_url}';
	
				if ( hostpw == authpw ) {
					alert("비밀번호가 일치합니다.")
					document.location.href = same_url;
				} else {
					alert("비밀번호가 다릅니다.");
					document.location.href = diff_url;
				}	
			}
	</script>	
	
	</head>
	<body>
		<div id="popup" class="out">
	      	<div class="in">
	        	<p style="text-align: left;"><span style="font-size: 14pt;"><b><span style="font-size: 18pt;">비밀번호 확인</span></b></span></p>
	        	<p style="text-align: left; line-height: 1.5;"><b>고객님의 개인정보 및 캠핑장 정보를 안전하게 보호하기 위해 <span style=" color:red;">비밀번호</span>를
	        	<br>다시 한번 입력해주세요.</b></p>
	        	<hr><br>
	                
	         	<c:forEach var="list" items="${list}">
	        	<p style="text-align: left; line-height: 1.5;"><b><span>아이디 : <c:out value="${list.id}"/></span></b></p>
	         	</c:forEach>
	        	<br>
	        	 
	      		<input type="hidden" name="staus" value="update">
	      		<p style="text-align: letf; line-height: 1.5;"><b><span>비밀번호 : 
	      		<input type="password" id="authpw" size=25 placeholder="비밀번호를 입력하세요."></span></b></p>
	       		<br><br><br><br>
	       		
	            
		       	<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">    
		      		<span class="pop_bt" style="font-size: 13pt;">
		            	<b><input type="button" value="확인" onClick="auth()"></b>
		      		</span>
		        </div>
	            
	            	
		   		<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
		   			<span class="pop_bt" style="font-size: 13pt;" ><b>
		    			<a href="/host/showcamp">닫기</a>
		   			</b></span>
		   		</div>
			</div>
		</div>
	</body>
</html>