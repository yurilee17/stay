		var IMP = window.IMP; 
    	IMP.init('imp34502552');
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
		// 카카오페이 결제
        function requestKakao() {
			
		var stayname = document.querySelector('.stayname').textContent;
		var roomname = document.querySelector('.roomname').textContent;
		var stayprice = parseInt(document.querySelector('.in_price').textContent);
			
            IMP.request_pay({
				pg: "kakaopay.{TC0ONETIME}",
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : stayname + " " + roomname,
                amount : stayprice,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
           
                
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
            	      document.getElementById('reservationForm').submit();
            	    } else {
            	      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            	    }
            });
        }
		
		/* 카카오페이가 아니면 requestPay 함수가 실행되지 않도록.... 해야되는데 안 됨*/
        document.addEventListener("DOMContentLoaded", function() {
            const paymentSelect = document.getElementById("payment-select");
            const payButton = document.querySelector(".btn_pay");

            payButton.addEventListener("click", function() {
                const selectedPayment = paymentSelect.value;
                if (selectedPayment === "KAKAO") {
                    requestKakao(); // 결제 수단이 "KAKAO"인 경우에만 requestKakao() 함수 실행
                } else {
                    // 다른 결제 수단에 대한 처리를 추가할 수 있습니다.
                    console.log("선택한 결제 수단이 KAKAO가 아닙니다.");
                }
            });
        });