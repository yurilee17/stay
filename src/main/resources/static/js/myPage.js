let timer = 0;
document.addEventListener("DOMContentLoaded", function() {
	inputEvent();
})


/*input 예외 처리*/
function inputEvent() {
	// 닉네임 확인
	let inpWrap1 = document.querySelector(".inp_wrap1");
	let nickname = document.getElementById("nickname");
	let error1 = document.getElementById("error1");

	const pattern = /^[가-힣]*$/;

	if (inpWrap1 != null && nickname != null) {
		nickname.addEventListener("input", function() {
			var message = "";
			if (nickname.value === '') {
				inpWrap1.classList.add("inp_error");
				message = "닉네임을 입력하세요.";
			} else if (nickname.value.length >= 15) {
				inpWrap1.classList.add("inp_error");
				message = "14자를 넘을 수 없습니다.";
			} else if (nickname.value.length <= 1) {
				inpWrap1.classList.add("inp_error");
				message = "2자 이상 입력하세요.";
			} else if (!pattern.test(nickname.value)) {
				inpWrap1.classList.add("inp_error");
				message = "특수문자는 입력 할 수 없습니다.";
			} else {
				inpWrap1.classList.remove("inp_error");
				message = "";
			}
			error1.innerHTML = message;
		});
	}

	// 이름 확인
	let inpWrap2 = document.querySelector(".inp_wrap2");
	let name = document.getElementById("name");
	let error2 = document.getElementById("error2");

	const pattern2 = /^(?!$).*/;
	const pattern3 = /^\S.*$/;

	if (inpWrap2 != null && name != null) {
		name.addEventListener("input", function() {
			var message = "";
			if (!pattern2.test(name.value)) {
				inpWrap2.classList.remove("inp_error");
				message = "";
			} else if (!pattern3.test(name.value)) {
				inpWrap2.classList.add("inp_error");
				message = "공백은 입력할 수 없습니다.";
			} else {
				inpWrap2.classList.remove("inp_error");
				message = "";
			}
			error2.innerHTML = message;
		});
	}

	//문자 인증
	let mobile = document.getElementById("mobile");
	let digit = document.getElementById("digit");

	let btnSend = document.querySelector(".btn_send");
	let btnOk = document.querySelector(".btn_ok");

	let inpWrap3 = document.querySelector(".inp_wrap3");
	let error3 = document.getElementById("error3");


	var numberPattern = /^010[0-9]{8}$/;
	var numberPattern2 = /^[0-9]+$/;

	if (mobile != null && digit != null) {
		let mobileValue = mobile.value; // 이전 값 저장용 변수
		let digitValue = digit.value; // 이전 값 저장용 변수

		mobile.addEventListener("input", function() {
			var message = "";
			if (mobile.value === '') {
				mobileValue = ''; // 완전히 공백일 때는 이전 값도 공백으로 업데이트
				btnSend.classList.remove("active");
				inpWrap3.classList.add("inp_error");
				message = "휴대폰 번호를 인증받으세요.";
			} else if (numberPattern2.test(mobile.value)) {
				mobileValue = mobile.value;
				if (numberPattern.test(mobile.value)) {
					btnSend.classList.add("active");
					inpWrap3.classList.remove("inp_error");
					message = "";
				} else {
					btnSend.classList.remove("active");
					inpWrap3.classList.add("inp_error");
					message = "휴대폰 번호 형식이 아닙니다.";
				}
			} else {
				mobile.value = mobileValue;
			}
			error3.innerHTML = message;
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

	//비빌번호 변경
	let originalPw = document.getElementById("originalPw");
	let password = document.getElementById("password");
	let newPwRe = document.getElementById("newPwRe");

	let originalPwMsg = document.getElementById("original_pw_msg");
	let newPwMsg = document.getElementById("new_pw_msg")
	let newPwReMsg = document.getElementById("new_pw_re_msg")

	let btnOne = document.querySelector(".btn_one");



	if (originalPw != null && password != null) {

		const pattern = /^(?=.*[a-zA-Z])(?=.*\d)|(?=.*[a-zA-Z])(?=.*[^a-zA-Z\d])|(?=.*\d)(?=.*[^a-zA-Z\d]).{8,}$/;

		originalPw.addEventListener("input", function() {
			if (originalPw.value === '') {
				originalPwMsg.innerHTML = "기존 비밀번호를 입력해주세요.";
			} else {
				originalPwMsg.innerHTML = "";
			}

			if (originalPw.value != '' && password.value.length >= 8 &&
				pattern.test(password.value) &&
				newPwRe.value === password.value) {
				btnOne.removeAttribute("disabled");
			} else {
				btnOne.setAttribute("disabled", "");
			}

		});


		password.addEventListener("blur", function() {
			if (pattern.test(password.value)) {
				newPwMsg.innerHTML = "";
			}

			if (originalPw.value != '' && password.value.length >= 8 &&
				pattern.test(password.value) &&
				newPwRe.value === password.value) {
				btnOne.removeAttribute("disabled");
			} else {
				btnOne.setAttribute("disabled", "");
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

			if (originalPw.value != '' && password.value.length >= 8 &&
				pattern.test(password.value) &&
				newPwRe.value === password.value) {
				btnOne.removeAttribute("disabled");
			} else {
				btnOne.setAttribute("disabled", "");
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

			if (originalPw.value != '' && password.value.length >= 8 &&
				pattern.test(password.value) &&
				newPwRe.value === password.value) {
				btnOne.removeAttribute("disabled");
			} else {
				btnOne.setAttribute("disabled", "");
			}

		});

	}

	let withdrawPw = document.getElementById("password");
	let withdrawBt = document.querySelector(".button-areaButton");

	if (withdrawPw != null && withdrawBt != null) {

		withdrawPw.addEventListener("input", function() {

			if (withdrawPw.value.length >= 4) {
				withdrawBt.removeAttribute("disabled");
			} else {
				withdrawBt.setAttribute("disabled", "");
			}

		});

	}

}

/* 수정 부분 출력&숨김 */
function edit1Bt() {
	let edit1 = document.getElementById("edit1");
	let section1 = document.getElementById("section1");
	let submit1 = document.getElementById("submit1");
	let cancel1 = document.getElementById("cancel1");

	edit1.style.display = "none";
	section1.style.display = "block";
	submit1.style.display = "block";
	cancel1.style.display = "block";
}

function cancel1Bt() {
	let nickname = document.getElementById("nickname");
	let edit1 = document.getElementById("edit1");
	let section1 = document.getElementById("section1");
	let submit1 = document.getElementById("submit1");
	let cancel1 = document.getElementById("cancel1");

	nickname.value = "";
	edit1.style.display = "block";
	section1.style.display = "none";
	submit1.style.display = "none";
	cancel1.style.display = "none";
}

function edit2Bt() {
	let edit2 = document.getElementById("edit2");
	let section2 = document.getElementById("section2");
	let submit2 = document.getElementById("submit2");
	let cancel2 = document.getElementById("cancel2");

	edit2.style.display = "none";
	section2.style.display = "block";
	submit2.style.display = "block";
	cancel2.style.display = "block";
}

function cancel2Bt() {
	let name = document.getElementById("name");
	let edit2 = document.getElementById("edit2");
	let section2 = document.getElementById("section2");
	let submit2 = document.getElementById("submit2");
	let cancel2 = document.getElementById("cancel2");

	name.value = "";
	edit2.style.display = "block";
	section2.style.display = "none";
	submit2.style.display = "none";
	cancel2.style.display = "none";
}

function edit3Bt() {
	let edit3 = document.getElementById("edit3");
	let section3 = document.getElementById("section3");
	let submit3 = document.getElementById("submit3");
	let cancel3 = document.getElementById("cancel3");

	edit3.style.display = "none";
	section3.style.display = "block";
	submit3.style.display = "block";
	cancel3.style.display = "block";
}

function cancel3Bt() {
	let mobile = document.getElementById("mobile");
	let edit3 = document.getElementById("edit3");
	let section3 = document.getElementById("section3");
	let submit3 = document.getElementById("submit3");
	let cancel3 = document.getElementById("cancel3");
	let verificationCode = document.getElementById("verificationCode");

	mobile.value = "";
	edit3.style.display = "block";
	section3.style.display = "none";
	submit3.style.display = "none";
	cancel3.style.display = "none";
	verificationCode.style.display = "none";
}

/* 닉네임 수정 */
// 닉네임 중복 확인
var xhrNick;
function sendNickname() {
	let inpWrap1 = document.querySelector(".inp_wrap1");
	let infoNickname = document.getElementById("infoNickname").value;
	let nickname = document.getElementById('nickname').value

	if (!inpWrap1.classList.contains('inp_error')) {
		if (infoNickname === nickname) {
			reset();
		} else {
			xhrNick = new XMLHttpRequest();
			pro = false;
			xhrNick.open('post', 'serchNickname');
			xhrNick.send(nickname);
			xhrNick.onreadystatechange = sendNicknameProc
		}
	}

}

function sendNicknameProc() {

	if (xhrNick.readyState === 4 && xhrNick.status === 200) {
		if (!pro) {
			// 응답을 이미 처리했으면 두 번째 호출 무시
			pro = true;
			if (xhrNick.responseText === '닉네임 중복') {
				alerOneBtn('이미 등록된 닉네임입니다.');
			} else {
				form1.submit();
			}
		}
	}
}
/* 이름 수정 */
function updateName() {
	let inpWrap2 = document.querySelector(".inp_wrap2");

	if (!inpWrap2.classList.contains('inp_error')) {
		form2.submit();
	}
}
/* 번호 수정 */
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
				let PhoneConfirmForm = document.getElementById('PhoneConfirmForm');

				form3.submit();

			} else if (xhr.responseText === '인증 실패') {
				alert("인증번호와 다르게 입력되었습니다.\n재입력해 주시기 바랍니다.");
				console.log("test 결과: " + xhr.responseText);
			}
		}
	}
}

/*기존 비밀번호 확인*/
var sendPwxhr;
var pro2;
function sendPw() {
	let originalPw = document.getElementById('originalPw').value;
	let id = document.getElementById('id').value;
	var reqData = { id: id, originalPw: originalPw }
	reqData = JSON.stringify(reqData)

	pro2 = false;
	sendPwxhr = new XMLHttpRequest();
	sendPwxhr.open('post', 'pwCon');
	sendPwxhr.setRequestHeader('content-type', 'application/json');
	sendPwxhr.send(reqData);
	sendPwxhr.onreadystatechange = sendPwProc
}

function sendPwProc() {
	if (sendPwxhr.readyState === 4 && sendPwxhr.status === 200) {
		if (!pro2) {
			// 응답을 이미 처리했으면 두 번째 호출 무시
			pro2 = true;
			if (sendPwxhr.responseText === '비밀번호 일치') {
				newPw();
			} else if (sendPwxhr.responseText === '비밀번호 불일치') {
				let originalPwMsg = document.getElementById("original_pw_msg");

				originalPwMsg.innerHTML = "기존 비밀번호가 일치하지 않습니다.";

			}
		}
	}
}

/* 비밀번호 변경 */
function newPw() {
	let originalPw = document.getElementById("originalPw");
	let password = document.getElementById("password");

	let newPwMsg = document.getElementById("new_pw_msg")
	if (originalPw.value === password.value) {
		newPwMsg.style.color = 'red';
		newPwMsg.innerHTML = "기존 비밀번호와 다른 비밀번호를 입력해주세요.";
	} else {
		alerOneBtn('비밀번호 변경이 완료되었습니다');

	}
}

/* 알림 발생 후  */
function alerOne() {
	mypageForm.submit();
};

/* 알림 발생 후 리셋 */
function reset() {
	/*window.location.href = "http://localhost/myPage";*/
	window.location.href = "http://ec2-54-180-94-214.ap-northeast-2.compute.amazonaws.com:8888/stay/myPage";
}


/*withdraw 비밀번호 확인*/
var withdrawxhr;
var pro3;
function withdrawSendPw() {
	let password = document.getElementById('password').value;
	let id = document.getElementById('id').value;
	var reqData = { id: id, originalPw: password }
	reqData = JSON.stringify(reqData)

	pro3 = false;
	withdrawxhr = new XMLHttpRequest();
	withdrawxhr.open('post', 'pwCon');
	withdrawxhr.setRequestHeader('content-type', 'application/json');
	withdrawxhr.send(reqData);
	withdrawxhr.onreadystatechange = withdrawSendProc
}

function withdrawSendProc() {
	if (withdrawxhr.readyState === 4 && withdrawxhr.status === 200) {
		if (!pro3) {
			// 응답을 이미 처리했으면 두 번째 호출 무시
			pro3 = true;
			if (withdrawxhr.responseText === '비밀번호 일치') {
				withdrawForm.submit();
			alert("일치");
			} else if (withdrawxhr.responseText === '비밀번호 불일치') {
				alert("비밀번호가 일치하지 않습니다.");

			}
		}
	}
}

/* 페이지 뒤로가기 */
function goBack() {
	window.history.back();
}