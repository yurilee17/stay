
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

function alerOneBtn(text) {
	let bgOneDimm = document.querySelector(".bgOneDimm");
	let popOnebtn = document.querySelector(".popOnebtn");
	let btnOneText = document.querySelector(".btnOneText");


	if (bgOneDimm != null && popOnebtn != null) {
		bgOneDimm.style.display = 'block';
		popOnebtn.style.display = 'block';
		btnOneText.textContent = text;
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