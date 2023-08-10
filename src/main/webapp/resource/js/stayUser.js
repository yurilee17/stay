let auth = "";
let infoNmae = "";
let info = "";

function selectAuth(value) {
	alert(value);
	
	auth = value;
	/*if (value === "user") {
		auth = "user";
	} else if (value === "admin") {
		auth = "admin";
	} else {
		auth = "";
	}*/

	searchUser();
}

function infoName(value) {
	if (value === "id") {
		infoNmae = id;
	} else if (value === "mobile") {
		infoNmae = mobile;
	} else if (value === "name") {
		infoNmae = name;
	} else if (value === "nickname") {
		infoNmae = nickname;
	} else {
		infoNmae = "";
	}
}

function searchButton() {
	let userSearchInput = document.getElementById("userSearchInput")
	info = userSearchInput.value;
	searchUser()
}
/*selectElement.selectedIndex = i;*/
function searchUser() {
	if(auth != "" && info != ""){
		alert("2");
	}else if(auth != ""){
		alert("a");
	}else if(info != ""){
		alert("i");
	}else{
		alert("");
	}
}