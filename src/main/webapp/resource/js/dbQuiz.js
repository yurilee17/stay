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
function phoneNum(){
const phoneInput = document.getElementById('phone');
const submitButton = document.getElementById('nemButton');

phoneInput.addEventListener('input', function() {
  const phoneNumber = phoneInput.value;

  // 입력된 전화번호가 10자리인 경우 버튼을 활성화
  if (phoneNumber.length >= 10) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
});
}

function loginCheck(){
	let id = document.getElementById('id');
	let password = document.getElementById('password');
	const idError = document.getElementById('idError');
	const pwError = document.getElementById('pwError');
	
	if(id.value == "" && password.value == ""){
		idError.style.display = 'block';
		pwError.style.display = 'block';
		
	}else if(id.value == ""){
		idError.style.display = 'block';
		pwError.style.display = 'none';

	}else if(password.value == "" ){
		idError.style.display = 'none';
		pwError.style.display = 'block';
		
	}else{
		idError.style.display = 'none';
		pwError.style.display = 'none';
		var loginForm = document.getElementById('loginForm');
		loginForm.submit();
	}
}
/*
			alert('아이디는 필수 항목입니다.');
			alert('비밀번호는 필수 항목입니다.');
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

