<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
        var IMP = window.IMP; 
    	IMP.init('imp34502552');
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
		// 카카오페이 결제
        function requestPay() {
            IMP.request_pay({
				pg: "kakaopay.{TC0ONETIME}",
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '당근 10kg',
                amount : 1004,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'             
                
            }, function (rsp) { // callback
            	 if (rsp.success) {
            	      // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            	      // jQuery로 HTTP 요청
            	      jQuery.ajax({
            	        url: "reservation/paymentComplete", 
            	        method: "POST",
            	        headers: { "Content-Type": "application/json" },
            	        data: {
            	          imp_uid: rsp.imp_uid,            // 결제 고유번호
            	          merchant_uid: rsp.merchant_uid   // 주문번호
            	        }
            	      }).done(function (data) {
            	        // 가맹점 서버 결제 API 성공시 로직
            	      })
            	    } else {
            	      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            	    }
            });
        }
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
    <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>