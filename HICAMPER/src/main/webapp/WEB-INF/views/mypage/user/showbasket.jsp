<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
   		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   		<link rel="stylesheet" href="/resources/css/glnav.css">

		<title>하이캠퍼! | 장바구니</title>
    	<style>
	    	.container {
	    		margin-top: 100px;
	    	}
	    	
	        .camp-img {
	            width: 100%;           
	            max-height: 50px;
	        }
	        
	        tr {
	            border-bottom: 1px solid gray;
	        }
	
	        tr:last-child {
	            border: none;
	        }
	      	
	      	.btn-book, .btn-delete {
	      		margin: 2px;
	      	}
    </style>
	</head>
	<body>
		<jsp:include page="../../include/header.jsp"></jsp:include>	    	
		<div class="container">
	        <div class="basket">
	            <h3>장바구니</h3>
	            <table class="table">
	                <thead>
	                    <tr>
	                    	<th class="col-sm-2">사진</th>
	                        <th class="col-sm-4">캠핑장명</th>
	                        <th class="col-sm-3">위치</th>
	                        <th class="col-sm-1">편의시설</th>
	                        <th class="col-sm-1">액티비티</th>
	                        <th class="col-sm-2">예약/삭제</th>
	                    </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="list" items="${list}">
		                    <tr>
		                        <td>    
		                            <a href="/user/showbookingpage?campsite_no=${list.campsite_no}">
		                                <img class="camp-img" src="/resources/fileupload/${list.saveFileName}" alt="${list.filename}">                            
		                            </a>
		                        </td>
		                        <td>${list.campsite_name}</td>
		                        <td>${list.address}</td>
		                        <td>${list.comforts}</td>
		                        <td>${list.activity}</td>
		                        <td>
		                        	<form id="de">
		                        		<input type="hidden" name="basket_no"  id="basket_no">
		                       		</form>
		                       	</td>
		                        <td>
		                        	<a href="/user/showbookingpage?campsite_no=${list.campsite_no}"><button class="btn btn-primary btn-book">예약</button></a>
		                        	<input type="button" class="btn btn-default btn-delete" value="삭제" onClick="de(${list.basket_no});">
		                        </td>
		                    </tr>
		   				</c:forEach>                      
	                </tbody>
	            </table>
	                      
	        </div>        
    	</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script>
			var url = "/user/showbasket";
			
			function de(no) {
				var conf = confirm("정말 장바구니에서 제거하시겠습니까?");
		        if(true == conf){
		    		var form = $('#de');
		    		$('#basket_no').val(no);
	    			form.attr('action','/user/deletebasket');
		    		form.attr('method','post');
		    		form.submit()
		        } else if(false == conf) {
		        	document.location.href = url;
		        }
			};
			
		</script>
	</body>
</html>