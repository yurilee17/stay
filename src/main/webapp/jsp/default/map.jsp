<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
<script src="../../resource/js/map.js"></script>

<title>지도로 보는거 어때</title>

<link rel="stylesheet" href="../../resource/css/map.css">
<script src="../../resource/js/map.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11cc932694fd38ffbe4f68b35d6b9427&libraries=services"></script>
</head>

<body>
	${hotels}
	<!-- Bg Dimm -->
	<div class="bgDimmMap" onclick="closeMap();">&nbsp;</div>

	<div id="map" class="mapStyle"></div>

	<script>
		// 주소-좌표 변환 객체를 생성합니다
		
		var mapContainer = document.getElementById('map'), mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 7
		};
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.addressSearch('강남', function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				mapCenter = new kakao.maps.LatLng(result[0].y, result[0].x);
			} 
			map.setCenter(mapCenter);
			
		});
		
		
	/* 	<c:forEach var="hotel" items="${hotels}">
		geocoder.addressSearch('${hotel.haddress}', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				let thisAdd = new kakao.maps.LatLng(result[0].y, result[0].x);
			}
			thisAdds.push(thisAdd);
		});
		
		</c:forEach> */
		
		
		
		
		let positions = [];
		
		var closeElements = document.querySelectorAll(".close");
		var markers = [];
		var overlays = [];
		
		let thisAdd;
		
		<c:forEach var="hotel" items="${hotels}" varStatus="status">
		geocoder.addressSearch('${hotel.haddress}', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				thisAdd = new kakao.maps.LatLng(result[0].y, result[0].x);
			}
			
			var content = '<div class="mapWrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            '
				+ "${hotel.hname}" // JSTL 변수를 JavaScript 변수로 사용
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="' + "${hotel.himage}" + '" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">'
				+ "${hotel.haddress}"
				+ '</div>'
				+ '                <div><a href="#" class="link">자세히 보기</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>';

		positions.push({
			content : content,
			latlng : thisAdd
		});
		if(positions.length === ${hotels.size()}){
			for (var i = 0; i < positions.length; i++) {

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : positions[i].latlng
				});
				markers.push(marker);

				// 마커에 표시할 오버레이를 생성합니다 
				var overlay = new kakao.maps.CustomOverlay({
					content : positions[i].content,
					map : map,
					position : positions[i].latlng
				});
				overlays.push(overlay);
				overlay.setMap(null);
			}
			// 마커 선택시 오버레이 나타내며 나머지 닫기
			for (var i = 0; i < markers.length; i++) {
				(function(index) {
					kakao.maps.event.addListener(markers[index], 'click',
							function() {
								for (var j = 0; j < overlays.length; j++) {
									overlays[j].setMap(null);
								}
								overlays[index].setMap(map);
							});
				})(i);
			}
		}
		
	
		// thisAdd 배열에서 해당 위치를 가져옴
		});
		</c:forEach>

		
	</script>



</body>
</html>