<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>하이캠퍼! | 회원가입</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.min.css">
    <style>
        .logo-frame {
            text-align: center;
            margin-bottom: 30px;			
        }

		.logo-frame img {			
			width: 300px;
        }

        .user-frame {
            text-align: center;
            width: 300px;
            margin: 0 auto;            
            border-radius: 10px;
            height: 150px;      
            background: rgb(112, 156, 238);
            color: white;
            padding: 25px;
        }
        
        .host-frame {
            text-align: center;
            width: 300px;
            margin: 0 auto;            
            border-radius: 10px;
            height: 150px;
            background-color: rgb(112, 156, 170);
            color: white;
            padding: 25px; 
        }

        .btn-nav {
            width: 80%;
            padding: 10px;
        }

        .info {
            font-size: 2rem;
            padding: 0.8rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo-frame">
            <a href="/">
                <img src="/resources/img/logo1.jpg" alt="logo">
            </a>
            <h2>하이캠퍼 회원가입</h2>
        </div>
        
        <div class="row">
            <div class="col-sm-6">
                <div class="user-frame">
                    <div class="info">
                        <span>일반 회원</span> 
                    </div>
                    <a href="/common/usersignupform" class="btn btn-default btn-nav">가입하기</a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="host-frame">
                    <div class="info">
                        <span>호스트 회원</span>
                    </div>
                    <a href="/common/hostsignupform" class="btn btn-default btn-nav">가입하기</a>
                </div>
            </div>
        </div>
        
    </div>
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>