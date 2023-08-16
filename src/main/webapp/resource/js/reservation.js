let timer = 0;

document.addEventListener("DOMContentLoaded", function() {

	inputEvent();
})

/*인증번호 전송, 재전송 선택 시*/
function btnSend() {
	let mobile = document.getElementById("mobile");
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
	} else if (mobile.value.length <= 9 && hone.value.length >= 1) {
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
	xhr.send(document.getElementById('mobile').value)
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
				let mobile = document.getElementById('mobile').value; // 전송하고자 하는 값
				let id = document.getElementById('id').value; // 전송하고자 하는 값
				let url = '';
				if (id != "") {
					url = "http://localhost/register?mobile=" + encodeURIComponent(mobile) + "&id=" + encodeURIComponent(id);
				} else {
					url = "http://localhost/register?mobile=" + encodeURIComponent(mobile);
				}

				window.location.href = url;
			} else if (xhr.responseText === '인증 실패') {
				alert("인증번호와 다르게 입력되었습니다. 재입력해 주시기 바랍니다.");
				console.log("test 결과: " + xhr.responseText);
			}
		}
	}
}