window.addEventListener('scroll', function() {
	const header = document.querySelector('header');

	if (window.scrollY > 1) { // 스크롤이 200px 이상 내려갔을 때
		header.classList.add('scrolled');
	} else {
		header.classList.remove('scrolled');
	}
});


function logoutProc() {
	/*window.location.href = "http://localhost/logout";*/
	window.location.href = "http://ec2-54-180-94-214.ap-northeast-2.compute.amazonaws.com:8888/stay/logout";
}