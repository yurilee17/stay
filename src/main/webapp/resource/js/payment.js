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
		var userName = document.querySelector('.userName').textContent;
		var userPhone = document.querySelector('.userPhone').textContent;
			
            IMP.request_pay({
				pg: "kakaopay.{TC0ONETIME}",
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, // 주문일련번호? 환불시 필요
                name : stayname + " " + roomname, // 상품명
                amount : stayprice, // 가격
/*                buyer_email : userName,*/
                buyer_name : userName,
                buyer_tel : userPhone,
           
                
            }, function (rsp) { // callback
            	 if (rsp.success) {
            	      // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            	      // jQuery로 HTTP 요청
            	      var msg = '결제가 완료되었습니다';
            	      var result = {
            	          "impUid": rsp.imp_uid,            // 결제 고유번호
            	          "merchantUid": rsp.merchant_uid,   // 주문번호
            	          "totalprice": rsp.amount,				// 가격
            	          "name": rsp.buyer_name,		// 결제자 이름
            	          "mobile" : rsp.buyer_tel			// 결제자 연락처
					  }
					  console.log("결제 성공" + msg);
            	      
            	      jQuery.ajax({
            	        url: "reservation/paymentComplete", 
            	        method: "POST",
            	        headers: { "Content-Type": "application/json" },
            	        data: JSON.stringify(result, ['imp_uid', 'merchant_uid', 'totalprice', 'name', 'mobile']),
            	        contentType: "application/json;charset=utf-8",
            	        dataType: "json",
            	        success:function(res){
							if(res == 1) {
								console.log("추가 성공");
							}else {
								console.log("Insert Fail!!!");
							}
						},
						error:function(){
							console.log("Insert ajax 통신 실패");
						}
						
            	      }) //ajax
            	      document.getElementById('reservationForm').submit();
            	    } else {
					
            	      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            	    }
            	    console.log(msg);
            });
        }
        
        
        function refundKakao() {
				jQuery.ajax({
	      // 예: http://www.myservice.com/payments/cancel
	      url: "reservation/paymentCancel", 
	      type: "POST",
	      contentType: "application/x-www-form-urlencoded; charset = utf-8",
	      data: {
	        merchant_uid: rsp.merchant_uid, // 예: ORD20180131-0000011
	        cancel_request_amount: rsp.amount, // 환불금액
	        reason: "테스트 결제 환불", // 환불사유
	      }
	    }).done(function(result){
			console.log("환불 성공 : " + result);
		}).fail(function(error){
			console.log("환불 실패 : " + error);
		});
	  }

        
		
		document.addEventListener("DOMContentLoaded", function() {
	    const paymentSelect = document.getElementById("payment-select");
	
	    paymentSelect.addEventListener("change", function() {
	        const selectedPayment = paymentSelect.value;
	        if (selectedPayment !== "KAKAO") {
	            alert("현재 지원중인 결제수단이 아닙니다.");
	            paymentSelect.value = "KAKAO"; // 카카오페이 선택으로 되돌림
	        }
	    });
		});




/*		var IMP = window.IMP; 
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
		var userName = document.querySelector('.userName').textContent;
		var userPhone = document.querySelector('.userPhone').textContent;
			
            IMP.request_pay({
				pg: "kakaopay.{TC0ONETIME}",
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, // 주문일련번호? 환불시 필요
                name : stayname + " " + roomname, // 상품명
                amount : stayprice, // 가격
                buyer_email : userName,
                buyer_name : userName,
                buyer_tel : userPhone,
           
                
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
            	          merchant_uid: rsp.merchant_uid,   // 주문번호
            	          totalprice: rsp.amount,				// 가격
            	          name: rsp.buyer_name,		// 결제자 이름
            	          mobile : rsp.buyer_tel			// 결제자 연락처
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
        
        
        function refundKakao() {
				jQuery.ajax({
	      // 예: http://www.myservice.com/payments/cancel
	      url: "reservation/paymentCancel", 
	      type: "POST",
	      contentType: "application/json",
	      data: JSON.stringify({
	        merchant_uid: rsp.merchant_uid, // 예: ORD20180131-0000011
	        cancel_request_amount: rsp.amount, // 환불금액
	        reason: "테스트 결제 환불", // 환불사유
	      }),
	      dataType: "json"
	    });
	  }

        
		
		 카카오페이가 아니면 requestPay 함수가 실행되지 않도록.... 해야되는데 안 됨
        document.addEventListener("DOMContentLoaded", function() {
            const paymentSelect = document.getElementById("payment-select");
            const payButton = document.querySelector(".agreePayment");

            payButton.addEventListener("click", function() {
                const selectedPayment = paymentSelect.value;
                if (selectedPayment === "KAKAO") {
                    requestKakao(); // 결제 수단이 "KAKAO"인 경우에만 requestKakao() 함수 실행
                } else {
                    // 다른 결제 수단에 대한 처리를 추가할 수 있습니다.
                    console.log("선택한 결제 수단이 KAKAO가 아닙니다.");
                }
            });
        });*/