<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>하이캠퍼! | 예약 내역</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/css/bootstrap/css/bootstrap.min.css">
<link href="/resources/css/glnav.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include> 
	<div class="container">
		<div class="booking">
			<h3>예약 내역</h3>
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#menu1">예약 현황</a></li>
			</ul>

			<div class="tab-content">
				<div id="menu1" class="tab-pane fade in active">
					<table class="table">
						<thead>
							<tr>
								<th>No.</th>
								<th>예약자</th>
								<th>방 이름</th>
								<th>방 분류</th>
								<th>방 가격</th>
								<th>체크인</th>
								<th>체크 아웃</th>
								<th>예약 날짜</th>
							</tr>
						</thead>
						<c:if test="${!empty list0 && !empty list2}">
							<tbody>
									<c:forEach var="list0" items="${list0}" varStatus="status">								
									<tr class="info">
										<td>${status.count}</td>
										<td><button class="btn" type="button" class="btn btn-default" value="${list2[status.index].user_no}">
										${list2[status.index].name}</button></td>
										<td>${list0.room_name}</td>
										<td>${list0.room_group}</td>
										<td><fmt:formatNumber value="${list0.price}" pattern="#,###" /></td>										
										<td>${list0.check_in}</td>
										<td>${list0.check_out}</td>
										<c:set var="date" value="${list0.reg_date}" />
										<td>${fn:substring(date, 0, 10)}</td>				
										<c:forEach var="list2" items="${list2}" varStatus="status">
										<input type="hidden" class="user_no"  value="${list2.user_no}">
										</c:forEach>								
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
				</div>
			</div>
		</div>
		<script>
			var tmp;
			$('.btn').on('click', function(event) {	
				var user_no = event.target.value;
				
				$.ajax({
					type :"GET",
					url: "/host/currentbookingdetail_host",
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					data: {
						"user_no" : user_no
					},
					
					success : function(data){
						var jo = JSON.parse(data);	
						console.log(jo);
						$('#id_modal').html(jo.id);
						$('#name_modal').html(jo.name);
						$('#num_modal').html(jo.phone_num);
						$('#mail_modal').html(jo.email);
						$('#birth_modal').html(jo.birth);
						$('#gender_modal').html(jo.gender);
						$('#myModal').show();
					}
				})		
			});
						
		</script>
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">예약자 정보</h4>
						<button type="button" class="close" id="close1" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<label for="Id">ID</label>
						<ul class="list-group" id="id_modal">
							<li></li>
						</ul>
					</div>
					<div class="modal-body">
						<label for="Id">이름</label>
						<ul class="list-group" id="name_modal">
							
						</ul>
					</div>
					<div class="modal-body">
						<label for="Id">전화번호</label>
						<ul class="list-group" id="num_modal">
							
						</ul>
					</div>
					<div class="modal-body">
						<label for="Id">이메일</label>
						<ul class="list-group" id="mail_modal">
							
						</ul>
					</div>
					<div class="modal-body">
						<label for="Id">생년월일</label>
						<ul class="list-group" id="birth_modal">
							
						</ul>
					</div>
					<div class="modal-body">
						<label for="Id">성별</label>
						<ul class="list-group" id="gender_modal">
							
						</ul>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal" id="close">Close</button>
					</div>

				</div>
			</div>
		</div>
		<a href="/" class="btn btn-default">홈으로</a>
	</div>
	<script>
	$('#close,#close1').on('click',function(){
		$('#myModal').hide();		
	});
	</script>
</body>
</html>