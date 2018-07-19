<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>하이캠퍼! | 회원 인증</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
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
</head>
<body>
	<c:if test="${value eq 1}">
		<div id="popup" class="out">
	      	<div class="in" id="ino">
	        	<p style="text-align: left;"><span style="font-size: 14pt;"><b><span style="font-size: 18pt;">비밀번호 확인</span></b></span></p>
	        	<p style="text-align: left; line-height: 1.5;"><b>보안을 위해 <span style=" color:red;">비밀번호</span>를
	        	입력해주세요.</b></p>
	        	<hr><br>
	                
	        	<form action="/host/compare_pw" method="post" id="check1">
	        		<p style="text-align: left; line-height: 1.5;"><b><span>아이디 :${list[0].id }</span></b></p>
		         	<c:forEach var="list" items="${list}">
		         		<input type="hidden" name="value" value="${value }">
		        		<input type="hidden" name="id" value="${list.id }">
		        		<input type="hidden" name="room_no" value="${list.room_no}">
		         	</c:forEach>
		        	<br>
		      		<input type="hidden" name="staus" value="update">
		      		<p style="text-align: letf; line-height: 1.5;"><b><span>비밀번호 : 
		      		<input type="password" id="authpw" size=25  name="password" placeholder="비밀번호를 입력하세요."></span></b></p>
		       		<br><br><br><br>
	       			            
			       	<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">    
			      		<span class="pop_bt" style="font-size: 13pt;">
			            	<b><input type="button" value="확인" onClick="auth()"></b>
			      		</span>
			        </div>
		        </form>
	            	            	
		   		<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
		   			<span class="pop_bt" style="font-size: 13pt;" ><b>
		    			<a href="/host/showcamp">닫기</a>
		   			</b></span>
		   		</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${value eq 2}">
		<div id="popup" class="out">
	      	<div class="in" id="ino">
	        	<p style="text-align: left;"><span style="font-size: 14pt;"><b><span style="font-size: 18pt;">비밀번호 확인</span></b></span></p>
	        	<p style="text-align: left; line-height: 1.5;"><b>보안을 위해 <span style=" color:red;">비밀번호</span>를
	        	입력해주세요.</b></p>
	        	<hr><br>
	                
	        	<form action="/host/compare_pw" method="post" id="check2">
	        		<p style="text-align: left; line-height: 1.5;"><b><span>아이디 :${list[0].id }</span></b></p>
	         	<c:forEach var="list" items="${list}">
	         		<input type="hidden" name="value" value="${value }">
	        		<input type="hidden" name="id" value="${list.id }">
	        		<input type="hidden" name="room_no" value="${list.room_no}">
	         	</c:forEach>
	        	<br>
	      		<input type="hidden" name="staus" value="update">
	      		<p style="text-align: letf; line-height: 1.5;"><b><span>비밀번호 : 
	      		<input type="password" id="authpw" size=25  name="password" placeholder="비밀번호를 입력하세요."></span></b></p>
	       		<br><br><br><br>
	       		
	            
		       	<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">    
		      		<span class="pop_bt" style="font-size: 13pt;">
		            	<b><input type="button" value="확인" onClick="auth1()"></b>
		      		</span>
		        </div>
		        </form>
	            
	            	
		   		<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
		   			<span class="pop_bt" style="font-size: 13pt;" ><b>
		    			<a href="/host/showcamp">닫기</a>
		   			</b></span>
		   		</div>
			</div>
		</div>
		</c:if>
		
		
		<script>
			$(document).ready(function() {
	            $('#popup').show();
	    	});
			
	        function close_pop(flag) {
	        	$('#popup').hide();
	        };
	        
	        
	        function auth(){
	        	var con = confirm("정말로 삭제하시겠습니까?");
	        	if(con === true){
	        		$('#check1').submit();
	        	};
	        	false;      	
	        }; 
	        function auth1(){
	        	var con = confirm("정말로 수정하시겠습니까?");
	        	if (con === true) {
	        		$('#check2').submit();
	        	};	        	        		        		        		
	        	false;      	
	        }; 
	    </script>
</body>
</html>