
/*삭제 페이지*/
function reserDelete(no) {
	alerTwoBtn2("예약 내역에서 삭제하시겠습니까?", "삭제", no);
}

function reserDeleteProc() {
	let num =  document.getElementById("value1");
	window.location.href = "http://localhost/reserDeleteProc?no=" + num.value;
}