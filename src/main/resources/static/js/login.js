document.addEventListener("DOMContentLoaded", function() {

	let idInput = document.getElementById("id");
	let passwordInput = document.getElementById("password");

	let idDiv = document.querySelector(".ico_email");
	let passwordDiv = document.querySelector(".ico_pw");

	idInput.addEventListener("focus", function() {
		idDiv.classList.add("inp_focus");

	});

	passwordInput.addEventListener("focus", function() {
		passwordDiv.classList.add("inp_focus");
	});

	idInput.addEventListener("blur", function() {
		if (idInput.value == "") {
			idDiv.classList.remove("inp_focus");
			idDiv.classList.add("inp_error");
		} else {
			idDiv.classList.remove("inp_error");
			idDiv.classList.remove("inp_focus");
		}
	});

	passwordInput.addEventListener("blur", function() {
		if (passwordInput.value == "") {
			passwordDiv.classList.remove("inp_focus");
			passwordDiv.classList.add("inp_error");
		} else {
			passwordDiv.classList.remove("inp_error");
			passwordDiv.classList.remove("inp_focus");
		}
	});
	
	idInput.addEventListener('keydown', handleEnterKey);
	passwordInput.addEventListener('keydown', handleEnterKey);
})

function handleEnterKey(event) {
	if (event.key === 'Enter') {
		event.preventDefault(); // 기본 엔터 동작을 막습니다.
		loginCheck(); // Submit 버튼을 클릭합니다.
	}
}

function loginCheck() {
	let id = document.getElementById('id');
	let password = document.getElementById('password');

	if (id.value != "" && password.value != "") {
		var loginForm = document.getElementById('loginForm');
		loginForm.submit();
	}
}

function showAlert(message) {
	if (message === "실패") {
		alert("아이디/비밀번호를 다시 확인하세요.");
	}
}

/*카카오톡 로그인*/
function goToKakao() {
	var urlToGo = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=dca763bc3428cc888c8dba870629cb39&redirect_uri=http://ec2-54-180-94-214.ap-northeast-2.compute.amazonaws.com:8888/stay/kakaoLogin";
	window.location.href = urlToGo;
}