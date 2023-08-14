ument.addEventListener("DOMContentLoaded", function() {

	inputEvent();
})


/*input 예외 처리*/
function inputEvent() {

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

	mobile.value = "";
	edit3.style.display = "block";
	section3.style.display = "none";
	submit3.style.display = "none";
	cancel3.style.display = "none";
}

/* 닉네임 수정 */


// 닉네임 중복 확인
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
				alerOneBtn('이미 등록된 닉네임입니다.');
			} else {
				alert("아닌데");
				updateNickname();
			}
		}
	}
}

function pdateNickname(){
	
}

/* 알림 발생 후 리셋 */
function reset() {
	window.location.href = "http://localhost/myPage";
}
