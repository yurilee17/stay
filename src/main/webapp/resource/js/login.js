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
})

function loginCheck() {
	let id = document.getElementById('id');
	let password = document.getElementById('password');

	if (id.value != "" && password.value != "") {
		var loginForm = document.getElementById('loginForm');
		loginForm.submit();
	}
}

function showAlert(text) {
    alert(text);
}
