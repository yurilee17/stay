let timer = 0;

document.addEventListener("DOMContentLoaded", function() {
	inputEvent();
})


$(document).ready(function() {
	$("input[name=checkAll]").click(function() {
		if($("input[name=checkAll]").is(":checked")) $("input[name=checkone]").prop("checked", true);
		else $("input[name=checkone]").prop("checked", false);
	});
	
	$("input[name=checkone]").click(function() {
		var total = $("input[name=checkOne]").length;
		var checked = $("input[name=checkOne]:checked").length;
		
		if(total != checked) $("input[name=checkAll]").prop("checked", false);
		else $("input[name=checkAll]").prop("checked", true); 
	});
});



/* 예약내역 팝업 공통 */
function pop_reserve(el){
	var $el = $('.' + el);
	prevent_scroll();
	$('.bg_dimm').fadeIn(150);
	$el.fadeIn(150);
	align_verticalAll(el);
}

/* 숙소이용규칙 및 취소/환불규정 Iscroll */
var iscroll_policy; // 지역카테고리

function iscroll_run_policy01 () {
	iscroll_policy = new IScroll('.pop_agree_01 .fix_cont',{
		mouseWheel:true,
		interactiveScrollbars:true,
		shrinkScrollbars:'scale',
		fadeScrollbars:true,
		click:true
	});
}

function pop_agree_01(){ // 숙소이용규칙 및 취소/환불규정 동의
	prevent_on();
	prevent_scroll();
	$('.pop_agree_01').fadeIn(150);
	$('.bg_dimm').fadeIn(150);
	iscroll_run_policy01(); // iscroll
	$('.fix_title').bind('touchmove',function(i){i.preventDefault()}); // 타이틀 터치 방지
}

/* 개인정보 제 3자 제공 Iscroll */
var iscroll_policy_02; // 지역카테고리

function iscroll_run_policy02 () {
	iscroll_policy_02 = new IScroll('.pop_agree_02 .fix_cont',{
		mouseWheel:true,
		interactiveScrollbars:true,
		shrinkScrollbars:'scale',
		fadeScrollbars:true,
		click:true
	});
}

function pop_agree_02(){ // 개인정보 수집 및 이용동의 팝업
	prevent_on();
	prevent_scroll();
	$('.pop_agree_02').fadeIn(150);
	$('.bg_dimm').fadeIn(150);
	iscroll_run_policy02(); // iscroll
	$('.fix_title').bind('touchmove',function(i){i.preventDefault()}); // 타이틀 터치 방지
}

function pop_agree_03(){ // 개인정보 제 3자 제공 동의 팝업
	prevent_on();
	prevent_scroll();
	$('.pop_agree_03').fadeIn(150);
	$('.bg_dimm').fadeIn(150);
	// iscroll_run_policy02(); // iscroll
	$('.fix_title').bind('touchmove',function(i){i.preventDefault()}); // 타이틀 터치 방지
}

function pop_agree_04(){ // 만 14세 이상 확인
	prevent_on();
	prevent_scroll();
	$('.pop_agree_04').fadeIn(150);
	$('.bg_dimm').fadeIn(150);
	// iscroll_run_policy02(); // iscroll
	$('.fix_title').bind('touchmove',function(i){i.preventDefault()}); // 타이틀 터치 방지
}



/*input 예외 처리*/
function inputEvent() {

	//문자 인증
	let mobile = document.getElementById("userPhone");
	let digit = document.getElementById("digit");

	if (mobile != null && digit != null) {
			
		let btnSend = document.querySelector(".btn_send");
		let btnOk = document.querySelector(".btn_ok");

		let mobileValue = mobile.value; // 이전 값 저장용 변수
		let digitValue = digit.value; // 이전 값 저장용 변수

		var numberPattern = /^010[0-9]{8}$/;
		var numberPattern2 = /^[0-9]+$/;

		mobile.addEventListener("input", function() {
			if (mobile.value === '') {
				mobileValue = ''; // 완전히 공백일 때는 이전 값도 공백으로 업데이트
				btnSend.classList.remove("active");
			} else if (numberPattern2.test(mobile.value)) {
				mobileValue = mobile.value;
				if (numberPattern.test(mobile.value)) {
					btnSend.classList.add("active");
				} else {
					btnSend.classList.remove("active");
				}
			} else {
				mobile.value = mobileValue;
			}
		});

		digit.addEventListener("input", function() {
			if (digit.value === '') {
				digitValue = ''; // 완전히 공백일 때는 이전 값도 공백으로 업데이트
				btnOk.classList.remove("active");
			} else if (numberPattern2.test(digit.value)) {
				digitValue = digit.value;
				if (digit.value.length >= 4) {
					btnOk.classList.add("active");
				} else {
					btnOk.classList.remove("active");
				}
			} else {
				digit.value = digitValue;
			}

		});
	}


}

/*인증번호 전송, 재전송 선택 시*/
function btnSend() {
	let mobile = document.getElementById("userPhone");
	let btnSend = document.querySelector(".btn_send");
	let verificationCode = document.getElementById("verificationCode");

	if (mobile.value.length >= 10 && btnSend.classList.contains('active')) {
		btnSend.classList.remove("active");
		btnSend.classList.add("send");
		btnSend.textContent = "재전송";

		verificationCode.style.display = "block"; // div를 화면에 보이도록 설정

		// 3분 (180초)으로 타이머 시작
		const display = document.querySelector(".timer");

		if (timer === 0) {
			timer = 180;
			startTimer(display, btnSend);
		} else {
			timer = 180;
		}
	} else if (mobile.value.length <= 9 && mobile.value.length >= 1) {
		alert("휴대폰 번호 형식이 아닙니다.");
	} else if (btnSend.classList.contains('send')) {
		alert("1분 후에 다시 시도해주세요.");
	} else {
		alert("휴대폰 번호를 입력하세요.");
	}

	sendMsg();
}

function btnOk() {
	let digit = document.getElementById("digit");
	let btnOk = document.querySelector(".btn_ok");

	if (digit.value.length >= 4 && btnOk.classList.contains('active')) {
		digit.classList.remove("active");
	
		sendDigit();

	} else if (digit.value.length <= 3 && digit.value.length >= 1) {
		alert("인증 번호 형식이 아닙니다.");
	} else {
		alert("인증 번호를 입력하세요.");
	}

}

// 타이머 시작 함수
function startTimer(display, btnSend) {
	let digit = document.getElementById("digit");
	let btnOk = document.querySelector(".btn_ok");
	let minutes, seconds;

	// 타이머 갱신
	const updateTimer = setInterval(function() {


		minutes = parseInt(timer / 60, 10);
		seconds = parseInt(timer % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;

		display.textContent = minutes + ":" + seconds;

		if (timer === 120) {
			btnSend.classList.add("active");
		}
		if (--timer < 0) {
			clearInterval(updateTimer);
			display.textContent = "00:00";
			digit.value = "";
			verificationCode.style.display = "none"; // div를 화면에 안 보이도록 설정
			btnOk.classList.remove("active");
			alert("인증번호가 만료되었습니다. 재전송 해주시기 바랍니다.");
			timer = 0;

		}

	}, 1000);
}

/* 문자 전송 */
var xhr;
var pro;
function sendMsg() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'sendMsg')
	xhr.send(document.getElementById('userPhone').value)
	xhr.onreadystatechange = resProc
}

function resProc() {
	if (xhr.readyState === 4 && xhr.status === 200) {
		if (xhr.responseText === '전송 완료') {
		}
		console.log("test 결과: " + xhr.responseText);
	}
}

/*인증번호 확인*/
function sendDigit() {
	pro = false;
	xhr.open('post', 'sendDigit');
	xhr.send(document.getElementById('digit').value);
	xhr.onreadystatechange = sendDigitProc
}

function sendDigitProc() {
	if (xhr.readyState === 4 && xhr.status === 200) {
		if (!pro) {
			// 응답을 이미 처리했으면 두 번째 호출 무시
			pro = true;
			if (xhr.responseText === '인증 성공') {
				buyer_phone.data('phoneverify')
			} else if (xhr.responseText === '인증 실패') {
				alert("인증번호와 다르게 입력되었습니다. 재입력해 주시기 바랍니다.");
				console.log("test 결과: " + xhr.responseText);
			}
		}
	}
}





// Main ---------------------------------------------------------------------------------------------------------------E

// #1.결제하기
function payment_confirm(){
    var regName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
    var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    var buyer = $('input[name=userName]');
    var buyer_phone = $('input[name=userPhone]');

    if(!buyer.val()) {
        alert_Msg('예약자 이름을 입력해주세요.');
        return false;
    }
    if(regName.test(buyer.val())==false){
        alert_Msg('예약자 이름은 한글,영문,숫자만 입력이 가능합니다.');
        return false;
    }
    if(Number(buyer.val().length)>20){
        $('.inp_info_02 .from_name').show();
        alert_Msg('예약자 이름은 20자 이하로 입력해주세요.');
        return false;
    }
    if(!buyer_phone.val()){
        alert_Msg('휴대폰 번호를 입력해 주세요.');
        return false;
    }

    if(regPhone.test(buyer_phone.val())==false){
        alert_Msg('휴대폰 번호를 확인해 주세요.');
        return false;
    }

    if ($('#verificationCode').length > 0) {
        if(buyer_phone.data('phoneverify') != 'Y'
            || buyer_phone.data('phoneverify') === undefined) {
            alert_Msg('휴대폰 번호 미인증 되었습니다.');
            return false;
        }
    }

    if($('#order_form').find('input[name=checkin_type]').val()==1){
        if($('input[name=dayuse_select]').val()=="N"){
            alert_Msg('이용시간을 선택해주세요.');
            return false;
        }
    }

    buyer_phone.val(buyer_phone.val().replace(/\-/ig, ''));


    // 약관 체크
	if($('.agree input[name=checkOne]:checked').length !== 3){
            alert_Msg('필수 이용 동의 항목에 동의(체크)해주세요.');
            return false;
		}


    // 예약내역 확인 팝업
    pop_reserve('reserve_chk');
}


