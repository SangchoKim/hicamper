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
	<title>하이캠퍼! | 예약 내역</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
    <link href="/resources/css/glnav.css" rel="stylesheet">
 
    <style>
    	.control {
    		text-align: center;
    	}
    </style>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>    
    <div class="container">
        <div class="booking">
            <h3>나의 예약 내역</h3>
            <ul class="nav nav-tabs">                
                <li class="active"><a data-toggle="tab" href="#menu1">예약 목록</a></li>
                <li><a data-toggle="tab" href="#menu2">완료 목록</a></li>
                <li><a data-toggle="tab" href="#menu3">취소 목록</a></li>
            </ul>
            
            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active">
                    <table class="table">
                        <thead>
                            <tr>
                            	<th>No.</th>
                                <th>캠핑장명</th>
                                <th>상품명</th>
                                <th>날짜</th>
                                <th>결제일</th>
                                <th colspan="2">메뉴</th>
                      		</tr>
                        </thead>
                      	<c:if test="${!empty list1 }">
		                    <c:forEach var="list1" items="${list1}" varStatus="status">
	                    		<c:if test="${list1.status eq 0}">
			                    	<tbody>
				                    	<tr class="info">
				                      		<td>${status.count}</td>
				                          	<td>
				                          		<a href="/user/showbookingpage?campsite_no=${list1.campsite_no}">
				                          			${list1.campsite_name}
				                          		</a>
				                          	</td>
				                          	<td>${list1.room_name}</td>
				                          	<td>${list1.check_in} ~ ${list1.check_out}</td>
				                          	<c:set var = "date" value = "${list1.reg_date}"/>
				                          	<td>${fn:substring(date, 0, 10)}</td>
				                          	<td><a href="/user/cancelbooking_user?book_no=${list1.book_no}" id="cencel" class="btn btn-default">예약취소</a></td>
				                    	</tr>
				                	</tbody>
			                	</c:if>
		                  	</c:forEach>
	                	</c:if>
                	</table>
                </div>
                
                <div id="menu2" class="tab-pane fade">
	                <table class="table">
	                    <thead>
                        	<tr>
	                        	<th>No.</th>
	                            <th>캠핑장명</th>
	                            <th>상품명</th>
	                            <th>날짜</th>
	                            <th>결제일</th>
	                            <th>메뉴</th>                                    
	                        </tr>
	                    </thead>
	                    <c:if test="${!empty list2 }">
		                    <c:forEach var="list2" items="${list2}" varStatus="status">
		                     	<tbody>
			                         <tr class="success">
                       			 	 	<td>${status.count}</td>
			                         	<td>
			                         		<a href="/user/showbookingpage?campsite_no=${list2.campsite_no}">${list2.campsite_name}</a>			                         		
			                         	</td>
		                             	<td>${list2.room_name}</td>
			                            <td>${list2.check_in} ~ ${list2.check_out}</td>
			                        	<c:set var = "date" value = "${list2.reg_date}"/>
		                    			<td>${fn:substring(date, 0, 10)}</td> 
		                        		<td><a href="/user/review_form?campsite_no=${list2.campsite_no}" class="btn btn-default">리뷰쓰기</a></td>                                
			                         </tr>
		                   		</tbody>
		                    </c:forEach>
	                    </c:if>
	                </table>
                </div>
                       
                <div id="menu3" class="tab-pane fade">
                    <table class="table">
                        <thead>
                            <tr>
                            	<th>No.</th>
                                <th>캠핑장명</th>
                                <th>상품명</th>
                                <th>날짜</th>
                                <th>결제일</th>                                
                            </tr>
                        </thead>
                        <c:if test="${!empty list1 }">
                        	<c:forEach var="list1" items="${list1}" varStatus="status">
	                    		<c:if test="${list1.status eq 1}">
		                  			<tbody>
                      					<tr class="danger">
              								<td>${status.count}</td>
				                          	<td>
				                          		<a href="/user/showbookingpage?campsite_no=${list1.campsite_no}">${list1.campsite_name}</a>
				                          	</td>
				                          	<td>${list1.room_name}</td>
				                          	<td>${list1.check_in} ~ ${list1.check_out}</td>
				                          	<c:set var="date" value="${list1.reg_date}"/>
		                    				<td>${fn:substring(date, 0, 10)}</td>   
			                      		</tr>
              						</tbody>
		                 		</c:if>
		                  	</c:forEach>
	                  	</c:if>
                    </table>
                </div>                                    
            </div>
        </div>
        
        <div class="control">
	        <a href="/" class="btn btn-default">홈으로</a>                
        </div>     
    </div>
    	   

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>