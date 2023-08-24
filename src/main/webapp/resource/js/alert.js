
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

function alerTwoBtn2(text, bt, setValue1) {

	let value1 = document.getElementById("value1");
	let bgDimm = document.querySelector(".bgDimm");
	let popTwobtn = document.querySelector(".popTwobtn2");
	let btnText = document.querySelector(".btnText2");
	let colMint = document.querySelector(".colMint2");

	if (bgDimm != null && popTwobtn != null) {
		bgDimm.style.display = 'block';
		popTwobtn.style.display = 'block';
		btnText.textContent = text;
		colMint.textContent = bt;
	}
	if (value1 != null) {
		value1.value = setValue1;
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

// 예약 취소 알림
function resUpdateBtn() {
	let resUpDimm = document.querySelector(".resUpDimm");
	let resUpBtnBtn = document.querySelector(".reserUpdateBtn");


	if (resUpDimm != null && resUpBtnBtn != null) {
		resUpDimm.style.display = 'block';
		resUpBtnBtn.style.display = 'block';
	}
}



// 알림 창 닫기
function closeLayer() {
	let bgDimm = document.querySelector(".bgDimm");
	let resUpDimm = document.querySelector(".resUpDimm");
	let popTwobtn = document.querySelector(".popTwobtn");
	let popTwobtn2 = document.querySelector(".popTwobtn2");
	let resUpBtnBtn = document.querySelector(".reserUpdateBtn");

	if (bgDimm != null && popTwobtn != null) {
		bgDimm.style.display = 'none';
		popTwobtn.style.display = 'none';
	}

	if (bgDimm != null && popTwobtn2 != null) {
		bgDimm.style.display = 'none';
		popTwobtn2.style.display = 'none';
	}

	if (resUpDimm != null && resUpBtnBtn != null) {
		resUpDimm.style.display = 'none';
		resUpBtnBtn.style.display = 'none';
	}
}