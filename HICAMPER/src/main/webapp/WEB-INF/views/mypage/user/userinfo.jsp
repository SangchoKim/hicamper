<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">		
		<title>하이캠퍼! | 마이 페이지</title>
		<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/css/glnav.css">
		<style type="text/css">
			.content {
				margin-top: 100px;
				text-align: center;
			}
			
			.info {
				margin-bottom: 10px;
			}
			
			.table {
				width: 30%;			
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
		        background-color: rgba(0,0,0,0.4); 
	        }
	        
		    .in {
		        background-color: #fefefe;
		        margin: 20vh auto; 
		        padding: 2rem;
		        border: 1px solid #888;
		        width: 30%;
	        }
	        	                
	        .modal-info {
	        	border-bottom: 1px solid gray;
	        	margin-bottom: 10px;	        
	        }	        
	        
	        input[type=password] {
	        	padding: 2rem;
	        	margin-top: 10px;
	        	margin-bottom: 10px;	        	
	        }
		</style>
	</head>
	<body>
		<jsp:include page="../../include/header.jsp"></jsp:include>
		<div class="content">
			<div class="info">
				<h3><%= session.getAttribute("id") %> 님의 개인정보</h3>
			</div>
			
			<table class="table table-bordered" align="center">
				<c:forEach var="list" items="${list}">
					<tr>
						<th class="col-sm-2">아이디</th>
						<td>${list.id}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${list.name}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${list.phone_num}</td>			
					</tr>
					<tr>
						<th>이메일</th>
						<td>${list.email}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${list.birth}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${list.gender}</td>
					</tr>
					<tr>
						<th>보유 포인트</th>
						<c:if test="${empty list.current_point}">
							<td>0 포인트</td>
						</c:if>
						<c:if test="${!empty list.current_point}">
							<td><fmt:formatNumber value="${list.current_point}" pattern="#,###" /> 포인트</td>								
						</c:if>						
					</tr>
					<tr>
						<c:set var = "date" value = "${list.reg_date}"/>  						
						<th>가입일</th>
						<td>${fn:substring(date, 0, 10)}</td>
					</tr>
				</c:forEach>
			</table>	
			
			<div class="control">
				<input class="btn btn-success" type="button" value="수정하기" onClick="updateuser();">
				<input class="btn btn-default" type="button" value="탈퇴하기" onClick="deleteuser();">
			</div>
		</div>
		
			
		<!-- 모달 -->	
		<div id="popup" class="out">
      		<div class="in">
                <div class="modal-info">
                	<h3>비밀번호 확인</h1>
                </div>
                
                <div>
                	<p>보안을 위해 고객 님의 비밀번호를 확인합니다. <strong>비밀번호</strong>를 입력해주세요.</p>
                </div>
                
                <form id="form">
                	<input type="hidden" name="staus" value="update">
                	<div class="form-group">	                	
	                	<input class="form-control" type="password" name="authpw" placeholder="비밀번호를 입력하세요." required">                	
                	</div>
                	<div class="form-group">
                		<input type="submit" value="확인" class="btn btn-primary btn-block">                				
                	</div>
            	</form>
            	
            	<div>
            		<button class="btn btn-default btn-block" onclick="close_pop();">닫기</button>	
            	</div>
            	  
      		</div>
   		</div>
   		
   		
   		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript">      
		     
		        function close_pop(flag) {
		        	$('#popup').hide();
		        };
		        
		        function updateuser(flag) {
		        	$('#popup').show();   
					var form = $('#form');
					form.attr('action','/user/auth_up');
					form.attr('method','post');		
				};
				
				function deleteuser(flag) {
					$('#popup').show();
					var form = $('#form');
					form.attr('action','/user/auth_de');
					form.attr('method','post');
				};
		</script>	
	</body>
</html>