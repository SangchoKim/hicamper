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
	<title>하이캠퍼! | 결제 페이지</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.min.css">
    <style>
        .price {
            font-weight: 800;
            font-size: 20px;            
        }

        .total-price {
            font-weight: 800;
            font-size: 20px;           
        }

        .own-point {
            font-weight: 800;
            font-size: 20px;           
        }

        .after-pay-point {
            font-weight: 800;
            font-size: 20px;           
        }

        .point-frame div {
            margin: 10px;
        }

        .control {
            text-align: center;
            margin-top: 50px;            
        }
        
        .btn {
            padding: 10px;
        }

        .table {
            background: rgb(203, 240, 255);
        }

        .logo-frame {
			width: 350px;
			text-align: center;
			margin: 30px auto;
			background-color: orange;
			border-radius: 20px;						
		}
		
		.logo-frame img {
			max-width: 300px;			
		}
    </style>
</head>
<body>
    <div class="container">
        <div class="logo-frame">
			<a href="/">
				<img src="/resources/img/logo2.png" alt="logo">
			</a>					
        </div>
        
        <div class="pay-content">
            <div class="book-frame">
                <div class="info">
                    <h3>예약현황</h3>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>캠핑장명</th>
                            <th>위치</th>
                            <th>상품명</th>
                            <th>이용일자</th>
                            <th>요금</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${cam_list[0].campsite_name} </td>
                            <td>${cam_list[0].address}</td>
                            <td>${cam_list[0].room_name}</td>
                            <td>${sessionScope.calDataDays.checkin} ~ ${sessionScope.calDataDays.checkout}</td>
                            <td>
                                <div class="price"><fmt:formatNumber value="${cam_list[0].price}" pattern="#,###" /> 원 (1박)</div>                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">합계</td>
                            <td>
                                <div class="total-price">								    
								    <fmt:formatNumber value="${cam_list[0].price * sessionScope.calDataDays.calDataDays}" pattern="#,###" /> 원 (${sessionScope.calDataDays.calDataDays}박)
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>       
            
            <div class="point-frame">
                <div class="info">
                    <h3>포인트 현황</h3>
                </div>      
                <table class="table" style="width: 50%;">
                    <tr>
                        <td>보유 포인트</td>
                        <td class="own-point"><fmt:formatNumber value="${user_list[0].current_point}" pattern="#,###" /> 포인트</td>                        
                    </tr>
                    <tr>
                        <td>결제요금</td>
                        <td class="total-price"><fmt:formatNumber value="${cam_list[0].price * sessionScope.calDataDays.calDataDays}" pattern="#,###" /> 원</td>                        
                    </tr>  

                    <tr>
                        <td>결제 후 잔여 포인트</td>
                        <td class="after-pay-point">
                        	<c:if test="${0 >= user_list[0].current_point - cam_list[0].price * sessionScope.calDataDays.calDataDays}">                      		
                        		<script>
                        			alert("포인트를 충전해주세요");
                        		    document.location.href ="/user/pointform"; 
                        		</script>             	                        	
                        	</c:if>
                        	<fmt:formatNumber value="${user_list[0].current_point - cam_list[0].price * sessionScope.calDataDays.calDataDays}" pattern="#,###" /> 포인트
                        </td>
                    </tr>                    
                </table>
            </div>
            
            <div class="control">                
                <form action="/user/bookinginprogress_2" method="post" >
                	<input hidden="${cam_list[0].room_no}" name="room_no" value="${cam_list[0].room_no}">
                	<input hidden="${cam_list[0].campsite_no}" name="campsite_no" value="${cam_list[0].campsite_no}">
                	<input hidden="${cam_list[0].host_no}" name="host_no" value="${cam_list[0].host_no}">
                	<input hidden="${user_list[0].user_no}" name="user_no" value="${user_list[0].user_no}">
                	<input hidden="${cam_list[0].price * sessionScope.calDataDays.calDataDays}" name="use_point" value="${cam_list[0].price * sessionScope.calDataDays.calDataDays}">
                	<input hidden="${sessionScope.calDataDays.checkin}" name="check_in" value="${sessionScope.calDataDays.checkin}">
                	<input hidden="${sessionScope.calDataDays.checkout}" name="check_out" value="${sessionScope.calDataDays.checkout}">
                	<button type="submit" class="btn btn-primary btn-pay">결제하기</button>
                	<a href="/user/showbookingpage?campsite_no=${cam_list[0].campsite_no}" class="btn btn-default btn-cancel">취소하기</a>               
                </form>                
            </div>
        </div>
    </div>
    
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>