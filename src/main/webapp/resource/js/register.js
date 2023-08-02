let timer = 0;

document.addEventListener("DOMContentLoaded", function() {
	let phone = document.getElementById("phone");
	let digit = document.getElementById("digit");

	let btnSend = document.querySelector(".btn_send");
	let btnOk = document.querySelector(".btn_ok");

	let phoneValue = phone.value; // 이전 값 저장용 변수
	let digitValue = phone.value; // 이전 값 저장용 변수

	phone.addEventListener("input", function() {

		if (isNaN(phone.value)) {
			phone.value = phoneValue;
		} else {
			phoneValue = phone.value;
			if (phone.value.length >= 10) {
				btnSend.classList.add("active");
			} else {
				btnSend.classList.remove("active");
			}
		}
	});

	digit.addEventListener("input", function() {

		if (isNaN(digit.value)) {
			digit.value = digitValue;
		} else {
			digitValue = digit.value;
			if (digit.value.length >= 4) {
				btnOk.classList.add("active");
			} else {
				btnOk.classList.remove("active");
			}
		}
	});
})


/*인증번호 전송, 재전송 선택 시*/
function btnSend() {
	let phone = document.getElementById("phone");
	let nemButton = document.getElementById("nemButton");
	let verificationCode = document.getElementById("verificationCode");
	
	if (phone.value.length >= 10 && nemButton.classList.contains('active')) {
		nemButton.classList.remove("active");
		nemButton.classList.add("send");
		nemButton.textContent = "재전송";

		verificationCode.style.display = "block"; // div를 화면에 보이도록 설정

		// 3분 (180초)으로 타이머 시작
		const display = document.querySelector(".timer");

		if (timer === 0) {
			timer = 20;
			startTimer(display, nemButton);
		} else {
			timer = 20;
		}


	} else if (nemButton.classList.contains('send')) {
		alert("1분 후에 다시 시도해주세요.");
	} else {
		alert("휴대폰 번호를 입력하세요.");
	}

}

// 타이머 시작 함수
function startTimer(display, nemButton) {
	let verificationCode = document.getElementById("verificationCode");
	let minutes, seconds;

	// 타이머 갱신
	const updateTimer = setInterval(function() {


		minutes = parseInt(timer / 60, 10);
		seconds = parseInt(timer % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;

		display.textContent = minutes + ":" + seconds;

		if (timer === 10) {
			nemButton.classList.add("active");
		}
		if (--timer < 0) {
			clearInterval(updateTimer);
			display.textContent = "00:00";
			verificationCode.style.display = "none"; // div를 화면에 보이도록 설정
		}

	}, 1000);
}

/*확인 버튼 선택 시*/

