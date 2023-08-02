let timer = 0;

document.addEventListener("DOMContentLoaded", function() {

	inputEvent();

})

/*input 예외 처리*/
function inputEvent() {
	let phone = document.getElementById("phone");
	let digit = document.getElementById("digit");

	let btnSend = document.querySelector(".btn_send");
	let btnOk = document.querySelector(".btn_ok");

	let phoneValue = phone.value; // 이전 값 저장용 변수
	let digitValue = digit.value; // 이전 값 저장용 변수

	var numberPattern = /^[0-9]+$/;

	phone.addEventListener("input", function() {
		if (phone.value === '') {
			phoneValue = ''; // 완전히 공백일 때는 이전 값도 공백으로 업데이트
			btnSend.classList.remove("active");
		} else if (numberPattern.test(phone.value)) {
			phoneValue = phone.value;
			if (phone.value.length >= 10) {
				btnSend.classList.add("active");
			} else {
				btnSend.classList.remove("active");
			}
		} else {
			phone.value = phoneValue;
		}
	});

	digit.addEventListener("input", function() {
		if (digit.value === '') {
			digitValue = ''; // 완전히 공백일 때는 이전 값도 공백으로 업데이트
			btnOk.classList.remove("active");
		} else if (numberPattern.test(digit.value)) {
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

/*인증번호 전송, 재전송 선택 시*/
function btnSend() {
	let phone = document.getElementById("phone");
	let btnSend = document.querySelector(".btn_send");
	let verificationCode = document.getElementById("verificationCode");

	if (phone.value.length >= 10 && btnSend.classList.contains('active')) {
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
	} else if (phone.value.length <= 9 && hone.value.length >= 1) {
		alert("휴대폰 번호 형식이 아닙니다.");
	} else if (btnSend.classList.contains('send')) {
		alert("1분 후에 다시 시도해주세요.");
	} else {
		alert("휴대폰 번호를 입력하세요.");
	}

	sendMsg();
}

function btnSend() {
	let phone = document.getElementById("phone");
	let btnSend = document.querySelector(".btn_send");
	let verificationCode = document.getElementById("verificationCode");

	if (phone.value.length >= 10 && btnSend.classList.contains('active')) {
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

		sendMsg();
	} else if (phone.value.length <= 9 && phone.value.length >= 1) {
		alert("휴대폰 번호 형식이 아닙니다.");
	} else if (btnSend.classList.contains('send')) {
		alert("1분 후에 다시 시도해주세요.");
	} else {
		alert("휴대폰 번호를 입력하세요.");
	}

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
			display.textContent = "00:05";
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
function sendMsg() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'sendMsg')
	xhr.send(document.getElementById('phone').value)
	console.log(data.userSelectedType)
	xhr.onreadystatechange = resProc
}

function resProc() {
	if (xhr.readyState === 4 && xhr.status === 200) {

	}
	if (xhr.responseText === '전송 완료') {

	}
	console.log("결과: " + xhr.responseText);
}

/*인증번호 확인*/
function sendDigit() {
	xhr.open('post', 'sendDigit');
	xhr.send(document.getElementById('digit').value);
	xhr.onreadystatechange = sendDigitProc
}

function sendDigitProc() {
	if (xhr.responseText === '인증 성공') {

		window.location.href = "http://localhost/register";
	} else if (xhr.responseText === '인증 실패') {
		
		alert("인증번호와 다르게 입력되었습니다. 재입력해 주시기 바랍니다.");
	}
	
}
