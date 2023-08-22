/*var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	mapOption = {
		center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
		level: 5// 지도의 확대 레벨
	};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



var positions = [
	{
		content: '<div class="wrap">' +
	'    <div class="info">' +
	'        <div class="title">' +
	'            원하는 이름' +
	'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
	'        </div>' +
	'        <div class="body">' +
	'            <div class="img">' +
	'                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
	'           </div>' +
	'            <div class="desc">' +
	'                <div class="ellipsis"></div>' +
	'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
	'                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
	'            </div>' +
	'        </div>' +
	'    </div>' +
	'</div>',
		latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	},
	{
		content: '<div class="wrap">' +
	'    <div class="info">' +
	'        <div class="title">' +
	'            원하는 이름' +
	'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
	'        </div>' +
	'        <div class="body">' +
	'            <div class="img">' +
	'                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
	'           </div>' +
	'            <div class="desc">' +
	'                <div class="ellipsis"></div>' +
	'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
	'                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
	'            </div>' +
	'        </div>' +
	'    </div>' +
	'</div>',
		latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	},
	{
		content: '<div class="wrap">' +
	'    <div class="info">' +
	'        <div class="title">' +
	'            원하는 이름' +
	'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
	'        </div>' +
	'        <div class="body">' +
	'            <div class="img">' +
	'                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
	'           </div>' +
	'            <div class="desc">' +
	'                <div class="ellipsis"></div>' +
	'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
	'                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
	'            </div>' +
	'        </div>' +
	'    </div>' +
	'</div>',
		latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	},
	{
		content: '<div class="wrap">' +
	'    <div class="info">' +
	'        <div class="title">' +
	'            원하는 이름' +
	'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
	'        </div>' +
	'        <div class="body">' +
	'            <div class="img">' +
	'                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
	'           </div>' +
	'            <div class="desc">' +
	'                <div class="ellipsis"></div>' +
	'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
	'                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
	'            </div>' +
	'        </div>' +
	'    </div>' +
	'</div>',
		latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	}
];

for (var i = 0; i < positions.length; i++) {
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map, // 마커를 표시할 지도
		position: positions[i].latlng // 마커의 위치
	});

	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new kakao.maps.CustomOverlay({
		content: positions[i].content ,
		map: map,
		position: marker.getPosition()
	});

}


// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
	overlay.setMap(map);
});

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
	overlay.setMap(null);
}*/