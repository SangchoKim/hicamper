<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>하이캠퍼! | 알림</title>
</head>
<body>
	<script>
		var success = '${YES}';
		var fail = '${NO}';
		var forward = '${forward}';
		var method_name = '${method_name}';
		var campsite_no = '${campsite_no}';
		
		var fun = function(){			
			if(success === "yes"){	
				if (method_name === "cancelBooking") {		
					alert("예약을 취소했습니다.");
					document.location.href = forward;
				} else if (method_name === "updatecamp") {
					alert("수정되었습니다.");	
					document.location.href = forward;
				} else if (method_name === "deletecamp") {
					alert("삭제되었습니다");	
					document.location.href = forward;	
				} else if (fail === "no") {		
					alert("오류가 발생하였습니다.");
					document.location.href = forward;
				} else if (method_name == "addpoint") {
					alert("충전완료");
					document.location.href = forward;		
				}else if (method_name == "addpoint1") {
					alert("충전완료");
					document.location.href = forward; 
				}else if (method_name == "review_user") {
					alert("작성완료");
					document.location.href = forward;
				} else if (method_name == "bookinginprogress_2") {
					alert("예약이 불가능합니다.");
					document.location.href = forward + campsite_no;
				} else if (method_name == "reg_product") {
					alert("등록되었습니다.");	
					document.location.href = forward;
				} else if (method_name == "Interceptor") {
					document.location.href = forward;	
				} else if (method_name == "updateinfo") {
					alert("호스트 정보가 수정되었습니다.");	
					document.location.href = forward;	
				} else if (method_name == "deleteinfo") {
					alert("호스트 계정이 삭제되었습니다. 홈으로 이동합니다.");
					document.location.href = forward;	
				} else if (method_name == "roomdelete") {
					alert("정상적으로 처리되었습니다.");	
					document.location.href = forward;
				} else if (method_name == "roommodify") {
					alert("수정이 완료되었습니다.");
					document.location.href = forward;
				} else if (method_name == "admin_dehost") {
					alert("삭제완료");
					document.location.href = forward;
				} else if (method_name == "admin_deuser") {
					alert("삭제완료");
					document.location.href = forward;
				}											
			} else if (success === "no"){
				if (method_name == "roomdelete") {
					alert("처리되지않았습니다. 다시한번 시도해 주세요.");	
					document.location.href = forward;
				} else if (method_name == "roommodify") {
					alert("처리되지않았습니다. 다시한번 시도해 주세요.");	
					document.location.href = forward;
				} else if (method_name == "bookingprogress_1") {
					alert("일반 회원만 이용가능합니다. 죄송해요!!!");	
					document.location.href = forward;				
				} else if (method_name == "addcamp") {
					alert("캠프사이트는 하나만 등록할 수 있습니다. 나중에 고칠게요!!!");
					document.location.href = forward;
				} else if (method_name == "regProduct2") {
					alert("상품 등록 전에 캠프 사이트를 등록해주세요.");
					document.location.href = forward;
				}
			}
		};
		fun();
	</script>	
</body>
</html>