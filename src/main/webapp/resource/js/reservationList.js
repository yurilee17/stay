
/*삭제 페이지*/
function reserDelete() {
	alerTwoBtn("예약 내역에서 삭제하시겠습니까?", "삭제");
}

function reserDeleteProc(no) {
	window.location.href = "http://localhost/reserDeleteProc?no=" + no;
}