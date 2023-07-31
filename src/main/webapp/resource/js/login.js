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