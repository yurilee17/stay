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
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11cc932694fd38ffbe4f68b35d6b9427"></script>
</head>

<body>
	<!-- Bg Dimm -->
	<div class="bgDimmMap" onclick="closeMap();">&nbsp;</div>

	<div id="map" class="mapStyle""></div>

	<script>
	let mapCenter;
	geocoder.addressSearch('강남', function(result, status) {
		 
		 // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        mapCenter = new kakao.maps.LatLng(result[0].y, result[0].x);


	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	
		var mapContainer = document.getElementById('map'), mapOption = {
			center : mapCenter,
			level : 3
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);

		var positions = [
	</script>

	<c:forEach var="dto" items="${dtolist}">
		<script>
		let thisAdd
			geocoder.addressSearch('${dto.get주소}', function(result, status) {
			 
			 // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        thisAdd = new kakao.maps.LatLng(result[0].y, result[0].x);
		    } 
		});
		
			{
						content : '<div class="wrap">'
								+ '    <div class="info">'
								+ '        <div class="title">'
								+ '            카카오 스페이스닷원'
								+ '        </div>'
								+ '        <div class="body">'
								+ '            <div class="img">'
								+ '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">'
								+ '           </div>'
								+ '            <div class="desc">'
								+ '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>'
								+ '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'
								+ '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>'
								+ '            </div>' + '        </div>'
								+ '    </div>' + '</div>',
						latlng : coords
					},
		</script>
	</c:forEach>
	<script>
		{
					content : '<div class="wrap">'
							+ '    <div class="info">'
							+ '        <div class="title">'
							+ '            카카오 스페이스닷원'
							+ '        </div>'
							+ '        <div class="body">'
							+ '            <div class="img">'
							+ '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">'
							+ '           </div>'
							+ '            <div class="desc">'
							+ '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>'
							+ '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'
							+ '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>'
							+ '            </div>' + '        </div>'
							+ '    </div>' + '</div>',
					latlng : new kakao.maps.LatLng(33.451393, 126.570738)
				} ];

		var closeElements = document.querySelectorAll(".close");
		var markers = [];
		var overlays = [];

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
	</script>



</body>
</html>