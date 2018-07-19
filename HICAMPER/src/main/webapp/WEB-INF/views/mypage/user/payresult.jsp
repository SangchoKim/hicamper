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
	<title>하이캠퍼! | 결제 결과</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.min.css">
    <style>
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

        .table {
            background: rgb(203, 240, 255);
        }

        .guide {
            margin: 0 auto;
            max-width: 400px;
            font-size: 24px;
        }
        
        .control {
            text-align: center;
            margin: 30px;
        }

        .btn {
            padding: 10px;
        }

        .price {
            font-weight: 800;
            font-size: 20px;            
        }

        .total-price {
            font-weight: 800;
            font-size: 20px;           
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
        
        <div class="guide">
            <p>예약이 완료되었습니다. 예약 정보는 마이 페이지에서 언제든지 확인하실 수 있습니다.</p>
        </div>
        <div class="book-frame">
            <div class="info">
                <h3>예약 결과</h3>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th>캠핑장명</th>
                        <th>위치</th>
                        <th>상품명</th>
                        <th>이용일자</th>
                        <th>요금</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${list[0].campsite_name }</td>
                        <td>${list[0].address}</td>
                        <td>${list[0].room_name}</td>
                        <td>${list[0].check_in} ~ ${list[0].check_out} (${sessionScope.calDataDays.calDataDays}박 ${sessionScope.calDataDays.calDataDays+1}일)</td>
                        <td>
                            <div class="price"><fmt:formatNumber value="${list[0].price}" pattern="#,###" /> 원 (1박)</div>                                
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">합계</td>
                        <td>
                            <div class="total-price">
                            	<fmt:formatNumber value="${sessionScope.calDataDays.calDataDays * list[0].price}" pattern="#,###" /> 원 (${sessionScope.calDataDays.calDataDays}박)
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="control">
            <a href="/user/currentbooking_user" class="btn btn-default">나의 예약 목록</a>
        </div>
    </div>

	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>