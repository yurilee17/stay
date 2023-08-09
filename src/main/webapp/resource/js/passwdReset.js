document.addEventListener("DOMContentLoaded", function() {

	btnSendd();
	inputEvent();

})

let timer = 0;
/*input 예외 처리*/
function inputEvent() {

	//아이디 확인
	let idInput = document.getElementById("id");
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
				btnOk.setAttribute("disabled", "");
			} else if (numberPattern.test(digit.value)) {
				digitValue = digit.value;
				if (digit.value.length >= 4) {
					btnOk.removeAttribute("disabled");
				} else {
					btnOk.setAttribute("disabled", "");
				}
			} else {
				digit.value = digitValue;
			}

		});
	}

	// 비밀번호 재설정
	let password = document.getElementById("password");
	let confirmPasswd = document.getElementById("confirm_passwd");

	if (password != null && confirmPasswd != null) {
		let pwDiv = document.querySelector(".pw");
		let confirmPwDiv = document.querySelector(".confirmPw");
		let newPwMsg = document.getElementById("new_pw_msg")
		let newPwReMsg = document.getElementById("new_pw_re_msg")
		let btnLink = document.querySelector(".btn_link");

		const pattern = /^(?=.*[a-zA-Z])(?=.*\d)|(?=.*[a-zA-Z])(?=.*[^a-zA-Z\d])|(?=.*\d)(?=.*[^a-zA-Z\d]).{8,}$/;

		password.addEventListener("focus", function() {
			pwDiv.classList.add("inp_focus");
		});

		password.addEventListener("blur", function() {
			pwDiv.classList.remove("inp_focus");
		});


		password.addEventListener("input", function() {
			var message = "";
			if (password.value === '') {
				newPwMsg.style.color = 'red';
				message = "새 비밀번호를 입력해주세요.";
			} else if (password.value.length <= 7) {
				newPwMsg.style.color = 'red';
				message = "사용불가 : 최소 8자 이상 입력해주세요.";
			} else if (!pattern.test(password.value)) {
				newPwMsg.style.color = 'red';
				message = "사용불가 : 영문,숫자,특수문자 중 2가지 이상을 조합해주세요.";
			} else if (pattern.test(password.value)) {
				newPwMsg.style.color = 'blue';
				message = "사용가능 : 안전한 비밀번호입니다.";

			}
			newPwMsg.innerHTML = message;

			if (password.value.length >= 8 && pattern.test(password.value) && confirmPasswd.value === password.value) {
				btnLink.removeAttribute("disabled");
			} else {
				btnLink.setAttribute("disabled", "");
			}
		});


		confirmPasswd.addEventListener("focus", function() {
			confirmPwDiv.classList.add("inp_focus");
		});

		confirmPasswd.addEventListener("blur", function() {
			confirmPwDiv.classList.remove("inp_focus");
		});

		confirmPasswd.addEventListener("input", function() {
			var message = "";
			if (confirmPasswd.value === '') {
				message = "새 비밀번호를 한번 더 입력해 주세요.";
			} else if (confirmPasswd.value != password.value) {
				message = "새 비밀번호가 일치하지 않습니다.";
			} else {
				message = '';
			}
			newPwReMsg.innerHTML = message;

			if (password.value.length >= 8 && pattern.test(password.value) && confirmPasswd.value === password.value) {
				btnLink.removeAttribute("disabled");
			} else {
				btnLink.setAttribute("disabled", "");
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
function btnSendd() {
	let digit = document.getElementById("digit");
	let error = document.getElementById("error");
	let btnSend = document.getElementById("btnSend");
	if (btnSend != null) {
		// 3분 (180초)으로 타이머 시작
		if (btnSend.classList.contains('send')) {
			alert("1분 후에 다시 시도해주세요.");
		} else {

			btnSend.classList.add("send");
			const display = document.querySelector(".timer");
			digit.removeAttribute("disabled");
			error.style.display = "none"

			if (timer === 0) {
				timer = 180;
				startTimer(display, btnSend);
			} else {
				timer = 180;
			}
			sendMsg();
			if (btnSend.classList.contains('re')) {
				alert("인증번호가 재전송되었습니다.");
			} else {
				alert("인증번호가 전송되었습니다.");
			}
			btnSend.classList.add("re");
		}
	}

}

function btnOk() {
	let btnOk = document.querySelector(".btn_ok");

	btnOk.setAttribute("disabled", "");
	sendDigit();


}

// 타이머 시작 함수
function startTimer(display, btnSend) {
	let digit = document.getElementById("digit");
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
			digit.removeAttribute("disabled");
		}
		if (--timer < 0) {
			clearInterval(updateTimer);
			display.textContent = "00:00";
			digit.value = "";
			digit.setAttribute("disabled", "");
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
				let PhoneConfirmForm = document.getElementById('PhoneConfirmForm');

				PhoneConfirmForm.submit();

			} else if (xhr.responseText === '인증 실패') {
				alert("인증번호와 다르게 입력되었습니다.\n재입력해 주시기 바랍니다.");
				console.log("test 결과: " + xhr.responseText);
			}
		}
	}
}

/* 비밀번호 재설정 */
function changePwSubmit() {
	alert("비밀번호 변경이 완료되었습니다.");
	let passwdNewForm = document.getElementById("passwdNewForm");
	passwdNewForm.submit();
}
