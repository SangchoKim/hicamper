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
	<title>하이캠퍼! | 마이 호스팅</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/glnav.css">
	<link href="/resources/css/footer.css" rel="stylesheet">
	<style type="text/css">
		.container {
			margin-top: 50px;
			margin-bottom: 100px;			
		}
		
		.campsite-control {
			text-align: center;
		}
		
		.campsite-img-frame {
			text-align: center;
			margin: 20px;
		}
		
		.campsite-img {
			max-width: 100%;			
		}
		
		.table > tbody > tr > td {
 		    vertical-align: middle; 		     		    
		}
		
		.room-row td {
			border-right: 1px solid gray;
		}
		
		.room-row td:last-child {
			border: none;
		}
		
		.room-img-frame {
			text-align: center;
			margin: 20px;
		}
		
		.room-img {
			max-width: 100%;			
		}
	</style>	
</head>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include>    
	<div class="container">
        <h2>마이 호스팅</h2>
        <div class="contents">            
            <ul class="nav nav-tabs">                
                <li class="active"><a data-toggle="tab" href="#menu1">나의 캠핑장</a></li>
                <li><a data-toggle="tab" href="#menu2">등록 상품</a></li>                
            </ul>
            
            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active">
                	<c:if test="${!empty list}">
	                	<div class="campsite-img-frame">
		                    <img src="/resources/fileupload/${list[0].saveFileName}" alt="캠핑장 대표 사진" class="campsite-img">
	                	</div>
	                    <table class="table table-hover">
	                        <tbody>
	                        	<%pageContext.setAttribute("crlf", "\r\n");%>
	                            <tr>
	                                <th class="col-sm-2">캠핑장명</th>
	                                <td>${list[0].campsite_name}</td>
	                            </tr>
	                            <tr>
	                                <th>주소</th>
	                                <td>${list[0].address}</td>
	                            </tr>
	                            <tr>
	                                <th>연락처</th>
	                                <td>${list[0].phone_num}</td>
	                            </tr>
	                            <tr>
	                                <th>편의시설</th>
	                                <td>${list[0].comforts}</td>
	                            </tr>
	                            <tr>
	                                <th>액티비티</th>
	                                <td>${list[0].activity}</td>                                         
	                            </tr>
	                            <tr>
	                               <th>캠핑장 상세설명</th>
	                               <c:set var = "explanation" value = "${list[0].explanation}"/>                               
	                               <td>${fn:replace(explanation, crlf, "</br>")}</td>
	                            </tr>
	                            <tr>                            	                            	                            	
	                                <th>주의사항</th>
	                                <c:set var = "attension" value = "${list[0].attension}"/>
	                                <td>${fn:replace(attension, crlf, "</br>")}</td>
	                            </tr>                                
	                        </tbody>
	                    </table>
	                    <div class="campsite-control">
		                    <a href="/host/auth_decamp?campsite_no=${list[0].campsite_no}" class="btn btn-default">삭제</a>
		                    <a href="/host/auth_upcamp?campsite_no=${list[0].campsite_no}" class="btn btn-success">수정</a>                    
	                    </div>                	
                	</c:if>
                	
                	<c:if test="${empty list}">
                		<h3>캠핑장을 등록해보세요!</h3>                		
                		<a href="/host/addcamp" class="btn btn-primary">캠핑장 등록하기</a>
                	</c:if>
                </div>
                
                <div id="menu2" class="tab-pane fade">
                	<c:if test="${!empty room}">
	                    <table class="table table-hover">
	                        <thead>
	                            <tr>
	                                <th>상품 이미지</th>
	                                <th>상품명</th>
	                                <th>분류</th>
	                                <th>수용인원</th>
	                                <th>수량</th>
	                                <th>가격</th>
	                                <th>메뉴</th>
	                            </tr>                            
	                        </thead>
	                        <tbody>                        	
		                       	<c:forEach var="room" items="${room}">
		                            <tr class="room-row">
		                                <td class="align-middle room-img-frame">
		                                	<img src="/resources/campingroom/${room.saveFileName}" class="room-img" alt="상품 이미지">		                                	
		                                </td>
		                                <td class="align-middle">${room.room_name}</td>
		                                <td class="align-middle">${room.room_group}</td>
		                                <td class="align-middle">${room.accept_people}명</td>
		                                <td class="align-middle">${room.amount}개</td>
		                                <td class="align-middle"><fmt:formatNumber value="${room.price}" pattern="#,###" />원</td>
		                                
		                                <td>
		                                    <a href="/host/room_auth?room_no=${room.room_no}&value=1" class="btn btn-default">삭제</a>
		                                    <a href="/host/room_auth?room_no=${room.room_no}&value=2" class="btn btn-success">수정</a>
		                                </td>
		                            </tr>
	                          	</c:forEach>
	                        </tbody>
	                    </table>
                    </c:if>
                    
                    <c:if test="${empty room}">
                    	<h3>캠핑 상품을 등록해보세요!</h3>
                		<a href="/host/roomform" class="btn btn-success">캠핑상품 등록하기</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	<jsp:include page="../../include/footer.jsp"></jsp:include>			
</body>
</html>