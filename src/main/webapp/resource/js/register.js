let timer = 0;

document.addEventListener("DOMContentLoaded", function() {

	inputEvent();
})

/*input 예외 처리*/
function inputEvent() {

	//문자 인증
	let mobile = document.getElementById("mobile");
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

	//회원가입
	let id = document.getElementById("id");
	let password = document.getElementById("password");
	let newPwRe = document.getElementById("newPwRe");

	let joinBtn = document.getElementById("joinBtn");


	if (id != null && password != null) {
		let idMsg = document.getElementById("userId_msg");
		let newPwMsg = document.getElementById("new_pw_msg")
		let newPwReMsg = document.getElementById("new_pw_re_msg")

		const pattern = /^(?=.*[a-zA-Z])(?=.*\d)|(?=.*[a-zA-Z])(?=.*[^a-zA-Z\d])|(?=.*\d)(?=.*[^a-zA-Z\d]).{8,}$/;


		id.addEventListener("blur", function() {
			var message = "";
			if (id.value === '') {
				message = "아이디를 입력해주세요.";
			}
			idMsg.innerHTML = message;

		});

		id.addEventListener("input", function() {
			
			if (id.value.includes('kakao')) {
				idMsg.innerHTML = "kakao 입력 불가";
			}

			if (!id.value.includes('kakao') &&
				id.value != '' &&
				password.value.length >= 8 &&
				pattern.test(password.value) &&
				newPwRe.value === password.value) {
				joinBtn.classList.add("active");
			} else {
				joinBtn.classList.remove("active");
			}

		});



		password.addEventListener("blur", function() {
			if (pattern.test(password.value)) {
				newPwMsg.innerHTML = "";

			}

			if (!id.value.includes('kakao') &&
				id.value != '' &&
				password.value.length >= 8 &&
				pattern.test(password.value) &&
				newPwRe.value === password.value) {
				joinBtn.classList.add("active");
			} else {
				joinBtn.classList.remove("active");
			}

		});

		password.addEventListener("input", function() {
			var message = "";
			if (password.value === '') {
				newPwMsg.style.color = 'red';
				message = "비밀번호를 입력해주세요.";
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

			if (!id.value.includes('kakao') &&
				id.value != '' &&
				password.value.length >= 8 &&
				pattern.test(password.value) &&
				newPwRe.value === password.value) {
				joinBtn.classList.add("active");
			} else {
				joinBtn.classList.remove("active");
			}
		});

		newPwRe.addEventListener("input", function() {
			var message = "";
			if (newPwRe.value === '') {
				message = "비밀번호를 한번 더 입력해 주세요.";
			} else if (newPwRe.value != password.value) {
				message = "비밀번호가 일치하지 않습니다.";
			} else {
				message = '';
			}
			newPwReMsg.innerHTML = message;

			if (!id.value.includes('kakao') &&
				id.value != '' &&
				password.value.length >= 8 &&
				pattern.test(password.value) &&
				newPwRe.value === password.value) {
				joinBtn.classList.add("active");
			} else {
				joinBtn.classList.remove("active");
			}
		});

	}

}

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

//회원가입 버튼 선택 시
function joinBtnt() {
	let joinBtn = document.getElementById("joinBtn");

	let nickname = document.getElementById("nickname");
	const pattern = /^[가-힣]*$/;


	if (joinBtn.classList.contains('active')) {
		if (nickname.value === '') {
			alert("*닉네임은(는) 필수입니다.");
		} else if (nickname.value.length >= 15) {
			alert("*닉네임은(는) 최대 14자 이하여야 합니다.");
		} else if (nickname.value.length <= 1) {
			alert("*닉네임은(는) 최소 2자 이상이어야 합니다.");
		} else if (!pattern.test(nickname.value)) {
			alert("잘못된 접근입니다.");
		} else {
			regForm.submit();
		}
	}
}

/*중복확인*/
// 아이디 확인
var xhrId;
function sendId() {
	xhrId = new XMLHttpRequest();
	pro = false;
	xhrId.open('post', 'sendId');
	xhrId.send(document.getElementById('id').value);
	xhrId.onreadystatechange = sendIdProc
}

function sendIdProc() {
	if (xhrId.readyState === 4 && xhrId.status === 200) {
		if (!pro) {
			// 응답을 이미 처리했으면 두 번째 호출 무시
			pro = true;
			if (xhrId.responseText === '실패') {
				sendNickname();
			} else {
				let idMsg = document.getElementById("userId_msg");

				idMsg.innerHTML = "이미 등록된 아이디입니다.";
				alert("이미 사용중인 아이디입니다.");
			}
		}
	}
}
// 닉네임 확인
var xhrNick;
function sendNickname() {
	xhrNick = new XMLHttpRequest();
	pro = false;
	xhrNick.open('post', 'serchNickname');
	xhrNick.send(document.getElementById('nickname').value);
	xhrNick.onreadystatechange = sendNicknameProc
}

function sendNicknameProc() {
	if (xhrNick.readyState === 4 && xhrNick.status === 200) {
		if (!pro) {
			// 응답을 이미 처리했으면 두 번째 호출 무시
			pro = true;
			if (xhrNick.responseText === '닉네임 중복') {
				let btnAdd = document.querySelector(".btn-add");
				let error = document.getElementById("unick-error");

				nicknameInput("닉네임 중복");
				btnAdd.classList.add("inp_error");
				error.innerHTML = "이미 등록된 닉네임입니다.";
				alert("이미 등록된 닉네임입니다.");

			} else {
				joinBtnt();
			}
		}
	}
}

//닉네임 오류 시
function nicknameInput(msg) {
	if (msg === "닉네임 중복") {
		let nickname = document.getElementById("nickname");
		let error = document.getElementById("unick-error");

		const pattern = /^[가-힣]*$/;

		nickname.addEventListener("input", function() {
			var message = "";
			if (nickname.value === '') {
				message = "닉네임을 입력하세요.";
			} else if (nickname.value.length >= 15) {
				message = "14자를 넘을 수 없습니다.";
			} else if (nickname.value.length <= 1) {
				message = "2자 이상 입력하세요.";
			} else if (!pattern.test(nickname.value)) {
				message = "특수문자는 입력 할 수 없습니다.";
			} else {
				message = "";
			}
			error.innerHTML = message;
		});
	}
}

