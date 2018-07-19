<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">		
		<title>하이캠퍼! | 패스워드 찾기</title>
		<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
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
            	<h2>비밀번호 찾기</h2>
			</div>
			
			<div class="row">
	            <div class="col-sm-6">
	                <div class="user-frame">
	                    <div class="info">
	                        <span>일반 회원</span> 
	                    </div>
	                    <a href="/common/usearch_pw" class="btn btn-default btn-nav">비밀번호 찾기</a>
	                </div>
	            </div>
	            <div class="col-sm-6">
	                <div class="host-frame">
	                    <div class="info">
	                        <span>호스트 회원</span>
	                    </div>
	                    <a href="/common/hsearch_pw" class="btn btn-default btn-nav">비밀번호 찾기</a>
	                </div>
	            </div>
        	</div>
		</div>
	</body>
</html>