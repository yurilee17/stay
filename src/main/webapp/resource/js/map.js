


// 지도 열기
function openMap() {
	let bgDimmMap = document.querySelector(".bgDimmMap");
	let map = document.getElementById("map");

	if (bgDimmMap != null && map != null) {
		bgDimmMap.style.display = 'block';
		map.style.display = 'block';
	}

}


// 지도 닫기
function closeMap() {
	let bgDimmMap = document.querySelector(".bgDimmMap");
	let map = document.getElementById("map");

	if (bgDimmMap != null && map != null) {
		bgDimmMap.style.display = 'none';
		map.style.display = 'none';
	}

}