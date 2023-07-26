/*
function allCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	userName = document.getElementById('userName');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if(confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(userName.value == ""){
		alert('이름은 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

function pwCheck(){
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	label = document.getElementById('label');
	
	 if(pw.value == confirm.value){
		 label.innerHTML = '일치'
	 }else{
		 label.innerHTML = '불일치'
	 }
	// window.alert('pwCheck 호출')
}

*/
function loginCheck(){
	let id = document.getElementById('id');
	let password = document.getElementById('password');
	const uidError = document.getElementById('uidError');
	const upwError = document.getElementById('upwError');
	
	if(id.value == ""){
		uidError.style.display = 'block';
		alert('아이디는 필수 항목입니다.');
	}else if(password.value == ""){
		upwError.style.display = 'block';
		alert('비밀번호는 필수 항목입니다.');
	}else{
		var loginForm = document.getElementById('loginForm');
		loginForm.submit();
	}
}
/*

function deleteCheck(){
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	
	if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if (confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else {
		var f = document.getElementById('f');
		f.submit();
	}
}
*/

