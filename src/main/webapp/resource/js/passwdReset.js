document.addEventListener("DOMContentLoaded", function() {

	inputEvent();

})

let timer = 0;
/*input 예외 처리*/
function inputEvent() {

	//아이디 확인
	let idInput = document.getElementById("id");
	alert(idInput);
	let idDiv = document.querySelector(".ico_email");

	if (idInput != null && idDiv != null) {
		let btn = document.querySelector(".btn_link");

		idInput.addEventListener("focus", function() {
			idDiv.classList.add("inp_focus");
		});

		idInput.addEventListener("blur", function() {
			idDiv.classList.remove("inp_focus");
		});

		idInput.addEventListener("input", function() {
			if (idInput.value == "") {
				idDiv.classList.add("inp_error");
				btn.setAttribute("disabled", "");
			} else {
				idDiv.classList.remove("inp_error");
				btn.removeAttribute("disabled");
			}
		});

	}

	// 인증번호 확인
	let digit = document.getElementById("digit");
	if (digit != null) {
		let btnOk = document.querySelector(".btn_ok");

		let digitValue = digit.value; // 이전 값 저장용 변수

		var numberPattern = /^[0-9]+$/;

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
}

/* 아이디 확인 */
var xhr;
var pro;
function idCheck() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'sendId')
	xhr.send(document.getElementById('id').value)
	xhr.onreadystatechange = idCheckProc
}

function idCheckProc() {
	if (xhr.readyState === 4 && xhr.status === 200) {
		if (xhr.responseText === '로그인 성공') {
			var idSearchForm = document.getElementById('idSearchForm');

			idSearchForm.submit();
		} else {
			let btn = document.querySelector(".btn_link");

			alert("존재하지 않는 회원입니다.");
			btn.setAttribute("disabled", "");
		}

	}
}

/*인즌번호 재전송*/
function btnSend() {
	let btnSend = document.getElementById("btnSend");

	// 3분 (180초)으로 타이머 시작
	if (btnSend.classList.contains('send')) {
		alert("1분 후에 다시 시도해주세요.");
	} else {
		btnSend.classList.add("send");
		const display = document.querySelector(".timer");

		if (timer === 0) {
			timer = 180;
			startTimer(display, btnSend);
		} else {
			timer = 180;
		}
		sendMsg();
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
	let btnSend = document.getElementById("btnSend");
	let digit = document.getElementById("digit");
	let btnOk = document.querySelector(".btn_ok");
	let error = document.getElementById("error");
	let minutes, seconds;

	// 타이머 갱신
	const updateTimer = setInterval(function() {


		minutes = parseInt(timer / 60, 10);
		seconds = parseInt(timer % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;

		display.textContent = minutes + ":" + seconds;

		if (timer === 120) {
			btnSend.classList.remove("send");
		}
		if (--timer < 0) {
			clearInterval(updateTimer);
			display.textContent = "03:00";
			digit.value = "";
			btnOk.classList.remove("active");
			error.style.display = "inline"

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