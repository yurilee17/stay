let auth = "";
let infoNmae = "";
let info = "";

document.addEventListener("DOMContentLoaded", function() {

	let userSearchInput = document.getElementById("userSearchInput")

	loadSelectedValue();
	userSearchInput.addEventListener('keydown', handleEnterKey);
})

function handleEnterKey(event) {
	if (event.key === 'Enter') {
		event.preventDefault(); // 기본 엔터 동작을 막습니다.
		searchButton(); // Submit 버튼을 클릭합니다.
	}
}

/* 기존에 선택 된 값 유지 */
function loadSelectedValue() {
	let userAuth = document.getElementById('userAuth'); // 권한
	let userAuthValue = localStorage.getItem('userAuthValue');

	let userSearchInput = document.getElementById('userSearchInput'); // 검색어
	let userSearchValue = localStorage.getItem('userSearchValue');

	let userSelet = document.getElementById('userSelet'); // 검색어 종류
	let userSeletValue = localStorage.getItem('userSeletValue');

	if (userAuthValue) {
		userAuth.value = userAuthValue;
	}
	if (userSearchValue) {
		userSearchInput.value = userSearchValue;
	}
	if (userSeletValue) {
		userSelet.value = userSeletValue;
	}
}


function selectAuth(value) {

	auth = value;

	localStorage.setItem('userAuthValue', value);
	searchUser();
}

function infoName(value) {
	if (value === "id") {
		infoNmae = "id";
	} else if (value === "mobile") {
		infoNmae = "mobile";
	} else if (value === "name") {
		infoNmae = "name";
	} else if (value === "nickname") {
		infoNmae = "nickname";
	} else {
		infoNmae = "";
	}
	localStorage.setItem('userSeletValue', infoNmae);
}

function searchButton() {
	infoName(userSeletValue)
	let userSearchInput = document.getElementById("userSearchInput")
	info = userSearchInput.value;
	
	localStorage.setItem('userSearchValue', info);
	searchUser()
}

/*selectElement.selectedIndex = i;*/
function searchUser() {
	let url = "";
	if (auth != "" && info != "") {
		url = "stayUser?option1Name=authority" + "&option1=" + auth + "&option2Name=" + infoNmae
			+ "&option2=" + info + "&currentPage=";
	} else if (auth != "") {
		url = "stayUser?option1Name=authority" + "&option1=" + auth + "&option2Name="
			+ "&option2=" + "&currentPage=";
	} else if (info != "") {
		url = "stayUser?option1Name=" + "&option1=" + "&option2Name=" + infoNmae
			+ "&option2=" + info + "&currentPage=";
	} else {
		url = "stayUser?option1Name=" + "&option1=" + "&option2Name="
			+ "&option2=" + "&currentPage=";
	}
	window.location.href = url;
}
