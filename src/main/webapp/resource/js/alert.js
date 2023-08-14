
// 알림(취소,동작)
function alerTwoBtn(text, bt) {
	let bgDimm = document.querySelector(".bgDimm");
	let popTwobtn = document.querySelector(".popTwobtn");
	let btnText = document.querySelector(".btnText");
	let colMint = document.querySelector(".colMint");

	if (bgDimm != null && popTwobtn != null) {
		bgDimm.style.display = 'block';
		popTwobtn.style.display = 'block';
		btnText.textContent = text;
		colMint.textContent = bt;
	}
}

// 알림 창 닫기
function closeLayer() {
	let bgDimm = document.querySelector(".bgDimm");
	let popTwobtn = document.querySelector(".popTwobtn");

	if (bgDimm != null && popTwobtn != null) {
		bgDimm.style.display = 'none';
		popTwobtn.style.display = 'none';
	}
}