window.addEventListener('scroll', function() {
	const header = document.querySelector('header');

	if (window.scrollY > 1) { // 스크롤이 200px 이상 내려갔을 때
		header.classList.add('scrolled');
	} else {
		header.classList.remove('scrolled');
	}
});


function logoutProc() {
	window.location.href = "http://localhost/logout";
}