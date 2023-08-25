<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>모텔</title>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
<meta name="csrf-name" content="yeogi_token">

<link rel="shortcut icon" href="../../resource/img/favicon_170822.ico"
	type="image/x-icon">
<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">

<!-- CSS -->
<title>여행할때 여기어때</title>
<link rel="stylesheet" href="../../resource/css/common.css">

<link rel="stylesheet" href="../../resource/css/map.css">
<script src="../../resource/js/map.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11cc932694fd38ffbe4f68b35d6b9427&libraries=services"></script>


<!-- 달력 외부 css -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="../../resource/js/hotel.js"></script>

<link rel="stylesheet" href="../../resource/css/map.css">
<script src="../../resource/js/map.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11cc932694fd38ffbe4f68b35d6b9427&libraries=services"></script>
</head>

</head>

<!-- 파라미터에 넣을 현재 날짜 -->
	<c:set var="currentDate" value="<%= new java.util.Date() %>" />
    <c:set var="dateFormat" value="yyyy-MM-dd" />
    <fmt:formatDate var="formattedDate" pattern="yyyy-MM-dd" value="${currentDate}" />

<body class="pc">
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
		
		geocoder.addressSearch('${param.mdetailregion}', function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				mapCenter = new kakao.maps.LatLng(result[0].y-(-0.05), result[0].x-0.1);
			} 
			
			map.setCenter(mapCenter);
			
		});
		
		let positions = [];
		
		var closeElements = document.querySelectorAll(".close");
		var markers = [];
		var overlays = [];
		
		let thisAdd;
		
		<c:forEach var="motel" items="${motels}" varStatus="status">
		geocoder.addressSearch('${motel.maddress}', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				thisAdd = new kakao.maps.LatLng(result[0].y, result[0].x);
			}
			
			var content = '<div class="mapWrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            '
				+ "${motel.mname}" // JSTL 변수를 JavaScript 변수로 사용
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="' + "${motel.mimage}" + '" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">'
				+ "${motel.maddress}"
				+ '</div>'
				+ '                <div><a href="/motelpage?no=${motel.no}&checkindate=${param.checkindate}&checkoutdate=${param.checkoutdate}" class="link">자세히 보기</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>';

		positions.push({
			content : content,
			latlng : thisAdd
		});
		if(positions.length === ${motels.size()}){
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


		// 지도 열기
		function openMmap() {
			let bgDimmMap = document.querySelector(".bgDimmMap");
			let mapL = document.getElementById("map");

			if (bgDimmMap != null && mapL != null) {
				bgDimmMap.style.display = 'block';
				mapL.style.display = 'block';
				map.relayout();
			}
			
		}
	</script>


	<!-- Wrap -->
	<div class="wrap main_wrap show">

		<!-- Header -->
		<c:import url="/header" /> 
		<c:import url="/motelmap" />
		<!-- CSS -->
		<link rel="stylesheet" href="../../resource/css/reset.css">
		<link rel="stylesheet" href="../../resource/css/hotel.css">

	</div>

	<!-- Script -->
	<!-- Library -->
	<script type="text/javascript" src="../../resource/js/jquery.cookie.js"></script>
	<script type="text/javascript"
		src="../../resource/js/jquery.lazyload.js"></script>
	<script type="text/javascript" src="../../resource/js/iscroll.js"></script>

	<!-- Service -->
	<script type="text/javascript" src="../../resource/js/common.js"></script>
	<script type="text/javascript" src="../../resource/js/geolocation.js"></script>

	<!-- Module -->
	<!-- <script type="text/javascript" src="./여행할때 여기어때_files/dialogPopup.js"></script> -->

	<!-- Page Script -->
	<script type="text/javascript"
		src="../../resource/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="../../resource/js/swiper.min.js"></script>
	<script type="text/javascript" src="../../resource/js/iscroll.js"></script>
	<script type="text/javascript" src="../../resource/js/main.js"></script>
	<script type="text/javascript" src="../../resource/js/reservation.js"></script>




	<main id="product">


		<!-- Area -->
		<!-- hotelheader -->

		<div class="Hheader">
			<div class="area_wrap ">
				<h3>모텔</h3>

				<!-- 지역필터 / 메인지역 -->

				<div class="menu-wrapper">

					<select id="mainMenu" name="mainMenu" onchange="showSubMenu()">
						<!-- <option value="">지역을 선택하세요</option> -->
						<option value="Main1">서울</option>
						<option value="Main2">경기/인천</option>
						<option value="Main3">충청/강원/제주</option>
						<option value="Main4">경남/경북</option>
						<option value="Main5">전남/전북</option>
					</select>

					<!-- 지역필터 / 서브지역 -->

					<select id="subMenu" name="subMenu" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main1_3" name="강남">강남</option>
						<option value="Main1_1" name="강동">강동</option>
						<option value="Main1_2" name="강서">강서</option>
						<option value="Main1_4" name="강북">강북</option>
					</select> <select id="subMenu2" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main2_1" name="경기">경기</option>
						<option value="Main2_2" name="인천">인천</option>
					</select> <select id="subMenu3" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main3_1" name="충청">충청</option>
						<option value="Main3_2" name="강원">강원</option>
						<option value="Main3_3" name="제주">제주</option>
					</select> <select id="subMenu4" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main4_1" name="경남">경남</option>
						<option value="Main4_2" name="경북">경북</option>
					</select> <select id="subMenu5" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main5_1" name="전남">전남</option>
						<option value="Main5_2" name="전북">전북</option>
					</select>
				</div>

			</div>
		</div>

		<script type="text/javascript">
		showSubMenu();
		 		var selectedText = "";
		 		
		
				function getSelectedOption(selectId) {
					var subMenu = document.getElementById(selectId);
					var selectedValue = subMenu.value;
					subMenuSelectId = selectId;
					
					var mainMenu = document.getElementById("mainMenu");
					 sessionStorage.setItem('subMenuId', selectId);
					 sessionStorage.setItem('mainMenuValue', mainMenu.value);
					 sessionStorage.setItem('subMenuValue', subMenu.value);
					 
					selectedText = subMenu.options[subMenu.selectedIndex].text;
					
					/* alert(selectId);
					alert(selectedText); */
					 localStorage.setItem("checkindate", "${formattedDate}");
				     localStorage.setItem("checkoutdate", "${formattedDate}");
					 localStorage.setItem("selectedText", selectedText); //selectedText 값 저장해서 넘겨줌 
					
					selectedTextUrl = "http://localhost/Motel?mdetailregion=" + encodeURIComponent(selectedText)+ "&checkindate=${formattedDate}&checkoutdate=${formattedDate}" + encodeURIComponent("");
					window.location.href = selectedTextUrl;
				}
				// 페이지 로드 시 세션 스토리지에서 값을 가져와 선택합니다.
				window.onload = function() {
				
					var subMenuId = sessionStorage.getItem('subMenuId');
				    var mainMenuValue = sessionStorage.getItem('mainMenuValue');
				    var subMenuValue = sessionStorage.getItem('subMenuValue');
				    
		/* 		 // 현재 URL에서 쿼리 문자열 가져오기
				    var queryString = window.location.search; */

				    // URLSearchParams 객체 생성
				    var urlParams = new URLSearchParams(window.location.search);
				    var mdetailregionV = urlParams.get('mdetailregion');
				    
				if(mdetailregionV === '강남'){
					
					 document.getElementById('mainMenu').value = "Main1";
					 showSubMenu();
					 document.getElementById('subMenu').value = "Main1_3";
					 sessionStorage.setItem('subMenuId', 'subMenu');
					 sessionStorage.setItem('mainMenuValue', 'Main1');
					 sessionStorage.setItem('subMenuValue', 'Main1_3');
				}else{
					 if (mainMenuValue && subMenuValue) {
					        document.getElementById('mainMenu').value = mainMenuValue;
					        showSubMenu();
					    }
					    if (subMenuValue) {
					        document.getElementById(subMenuId).value = subMenuValue;
					    }
				}
				   
				};
			
		</script>


		<!-- //Area -->
		<!-- //hotelheader -->

		<div class=body_wrap>
			<aside>
				<!--   Filter -->

				<div class="filter_wrap">
					<div class="filter_box">
						<section class="date_wrap">
							<h3>날짜</h3>
							<br>
							<div class="btn_date">


								<input type="text" id="calendars" name="calendars" value="" />

								<script>
				
				var checkindate ;
			    var checkoutdate ;	
				
					$(function () {
						
			 var storedStartDate = localStorage.getItem("storedStartDate");
		     var storedEndDate = localStorage.getItem("storedEndDate");

	         var checkindate = storedStartDate || new Date().toISOString().split('T')[0];
		     var checkoutdate = storedEndDate || moment().add(7, 'days').toISOString().split('T')[0];
		     
		     var urlParams = new URLSearchParams(window.location.search);
			    var checkindateV = urlParams.get('checkindate');
			    var checkoutdateV = urlParams.get('checkoutdate');
		     
	         	   $('#calendars').daterangepicker({
	         		  "maxSpan": {"days": 6 },
	                "locale": {
	                    "format": "YYYY-MM-DD",
	                    "separator": " ~ ",
	                    "applyLabel": "확인",
	                    "cancelLabel": "취소",
	                    "fromLabel": "From",
	                    "toLabel": "To",
	                    "customRangeLabel": "Custom",
	                    "weekLabel": "W",
	                    "daysOfWeek": ["일","월", "화", "수", "목", "금", "토" ],
	                    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	                    "firstDay": 1
		                },
		               	"minDate":  new Date(),
		                "maxDate": moment().add(3, 'months').toDate(), 
		                "startDate": checkindateV,
		                "endDate":checkoutdateV,
		                "drops": "down"
			            }, function (start, end, label) {
			                console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
			                
			                checkindate = start.format('YYYY-MM-DD');
			                checkoutdate = end.format('YYYY-MM-DD');
			                
			               /* 선택한 날짜 값을 로컬 스토리지에 저장 */
			                localStorage.setItem("storedStartDate", checkindate);
			                localStorage.setItem("storedEndDate", checkoutdate);
			                
				            
				          /* 선택한 날짜 값을 URL 파라미터로 추가하고 페이지 새로고침 */
				            addDatesToURL(checkindate, checkoutdate);
			            
			            });
	         	   
	         	   // css 변경가능 
	         	  $("#calendars").on('show.daterangepicker', function (ev, picker) {
	         		   /*  $(".cancelBtn").css("float", "right"); */
	         		   
	         		});

	       		 });
				
					<!--  선택한 날짜 값을 URL 파라미터로 추가하고 페이지 새로고침하는 함수 -->
				    function addDatesToURL(checkindate, checkoutdate) {
				        // 현재 페이지 URL 가져오기
				        var currentURL = window.location.href;
				
				        // URL에 시작 날짜와 끝 날짜를 파라미터로 추가
				        
				        localStorage.setItem("checkindate", checkindate);
				        localStorage.setItem("checkoutdate", checkoutdate);
				   var selectedText = localStorage.getItem("selectedText"); // selectedText  지역 값을 가져옴
				        
				   
				   	 var urlParams = new URLSearchParams(window.location.search);
					 var mdetailregionV = urlParams.get('mdetailregion');
				        
				         var updatedURL = "http://localhost/Motel?mdetailregion=" + encodeURIComponent(mdetailregionV) + "&checkindate=" + encodeURIComponent(checkindate) + "&checkoutdate=" + encodeURIComponent(checkoutdate); 
				        // 페이지 새로고침
				        window.location.href = updatedURL;
				    }

		</script>

							</div>
						</section>
						<br>


						<h3>상세조건</h3>
						<br>

						<!-- 초기화, 적용 버튼  -->
						<div class="btn_wrap">
							<button type="button" onclick="location.href='/Motel?mdetailregion=강남&checkindate=${formattedDate}&checkoutdate=${formattedDate}'">초기화</button>
							<button type="button" onclick="comfort()">적용</button>
						</div>
						<br>

						<section>
							<ul>
								<li><input type="checkbox" id="grade_0" name="grade[]"
									class="inp_chk" value="대실 예약" /> <label for="grade_0"
									class="label_chk">대실 예약</label></li>
								<li><input type="checkbox" id="grade_1" name="grade[]"
									class="inp_chk" value="숙박 예약" /> <label for="grade_1"
									class="label_chk">숙박 예약</label></li>
							</ul>
						</section>
						<br>
						
						<section>
							<strong>이색테마</strong><br> <br>
							<ul class="hide_type half">
								<li><input type="checkbox" id="tmino_0" name="tmino[]"
									class="inp_chk" value="무인텔" /> <label for="tmino_0"
									class="label_chk">무인텔</label></li>
								<li><input type="checkbox" id="tmino_1" name="tmino[]"
									class="inp_chk" value="복층룸" /> <label for="tmino_1"
									class="label_chk">복층룸</label></li>
								<li><input type="checkbox" id="tmino_2" name="tmino[]"
									class="inp_chk" value="트윈베드" /> <label for="tmino_2"
									class="label_chk">트윈베드</label></li>
								<li><input type="checkbox" id="tmino_3" name="tmino[]"
									class="inp_chk" value="야외테라스" /> <label for="tmino_3"
									class="label_chk">야외테라스</label></li>
							</ul>
						</section>
						<br>

						<section>
							<strong>스파시설</strong><br> <br>
							<ul class="hide_type half">
								<li><input type="checkbox" id="tmino_24" name="tmino[]"
									class="inp_chk" value="스파" /> <label for="tmino_24"
									class="label_chk">스파</label></li>
								<li><input type="checkbox" id="tmino_25" name="tmino[]"
									class="inp_chk" value="사우나" /> <label for="tmino_25"
									class="label_chk">사우나</label></li>
								<li><input type="checkbox" id="tmino_26" name="tmino[]"
									class="inp_chk" value="마사지베드" /> <label for="tmino_26"
									class="label_chk">마사지베드</label></li>
								<li><input type="checkbox" id="tmino_27" name="tmino[]"
									class="inp_chk" value="히노끼탕" /> <label for="tmino_27"
									class="label_chk">히노끼탕</label></li>
							</ul>
						</section>
						<br>

						<section>
							<strong>기타</strong><br> <br>
							<ul class="hide_type half">
								<li><input type="checkbox" id="tmino_36" name="tmino[]"
									class="inp_chk" value="수영장" /> <label for="tmino_36"
									class="label_chk">수영장</label></li>
								<li><input type="checkbox" id="tmino_37" name="tmino[]"
									class="inp_chk" value="노래방" /> <label for="tmino_37"
									class="label_chk">노래방</label></li>
								<li><input type="checkbox" id="tmino_38" name="tmino[]"
									class="inp_chk" value="당구장" /> <label for="tmino_38"
									class="label_chk">당구장</label></li>
								<li><input type="checkbox" id="tmino_39" name="tmino[]"
									class="inp_chk" value="게임기" /> <label for="tmino_39"
									class="label_chk">게임기</label></li>
							</ul>
						</section>
						<br> <br>


						<script type="text/javascript">
   					  		
   					  // 중복파라미터를 자동으로 제거 
	   					 function removeDuplicateParams(url) {
	   				        var urlParts = url.split('?');
	   				        if (urlParts.length > 1) {
	   				            var baseUrl = urlParts[0];
	   				            var queryParams = urlParts[1].split('&');
	   				            var filteredParams = [];
	   				            var paramNames = [];
	
	   				            queryParams.forEach(function(param) {
	   				                var paramName = param.split('=')[0];
	   				                if (!paramNames.includes(paramName)) {
	   				                    filteredParams.push(param);
	   				                    paramNames.push(paramName);
	   				                }
	   				            });
	
	   				            return baseUrl + '?' + filteredParams.join('&');
	   				        }
	   				        
	   				        return url;
	   				    }
   					  	
   					  
   					  
						    function comfort() {
						    	
						    	
						        /* var values1 = document.getElementsByName("grade[]");
						        var htype = [];        
						        for (var i = 0; i < values1.length; i++) {
						            if (values1[i].checked) {
						            	htype.push(values1[i].value);
						            }
						        } */
						        
						        /* var values2 = document.getElementsByName("bedtype[]");
						        var hbedtype = [];        
						        for (var i = 0; i < values2.length; i++) {
						            if (values2[i].checked) {
						            	hbedtype.push(values2[i].value);
						            }
						        } */
	
						        var values3 = document.getElementsByName("tmino[]");
						        var moption = [];
						        
						        for (var i = 0; i < values3.length; i++) {
						            if (values3[i].checked) {
						            	moption.push(values3[i].value);
						            }
						        }

						        
						         /* 선택한 날짜 값을 URL 파라미터로 추가하고 페이지 새로고침 */
						            addDataToURL(moption);
						         
							       
						          /* var mpeople = document.querySelector('.cnt_people span').textContent; // 인원 수 값을 가져옴   */  
						     	  var selectedText = localStorage.getItem("selectedText"); // selectedText  지역 값을 가져옴
						     	  var checkindate = localStorage.getItem("checkindate"); // checkindate  체크인 값을 가져옴 
					     		  var checkoutdate = localStorage.getItem("checkoutdate"); // checkoutdate  체크아웃 값을 가져옴 
						     	  
						    }  
 
						   	<!--  선택한 날짜 값을 URL 파라미터로 추가하고 페이지 새로고침하는 함수 -->
						     	    function addDataToURL(moption) {
						     	    	
						     	    	 var urlParams = new URLSearchParams(window.location.search);
										 var mdetailregionV = urlParams.get('mdetailregion');
						     		   
						     		  /* var mpeople = document.querySelector('.cnt_people span').textContent; // 인원 수 값을 가져옴     */
						     		  var checkindate = localStorage.getItem("checkindate"); // checkindate  체크인 값을 가져옴 
						     		  var checkoutdate = localStorage.getItem("checkoutdate"); // checkoutdate  체크아웃 값을 가져옴 
						       
							   
						     		  // 현재 페이지 URL 가져오기
								        var currentURL = window.location.href;
									   
								  	   
								        var updatedURL = removeDuplicateParams(currentURL);
								        
								        
								        
							 	        var updatedURL = "http://localhost/Motel?mdetailregion=" + encodeURIComponent(mdetailregionV) +"&checkindate=" + encodeURIComponent(checkindate) + "&checkoutdate=" + encodeURIComponent(checkoutdate);
							 	      
							 	        
							 	        
							 	       /* htype = htype.map(function(value) {
							 	            return value.trim();
							 	        });

							 	        hbedtype = hbedtype.map(function(value) {
							 	            return value.trim();
							 	        }); */

							 	        moption = moption.map(function(value) {
							 	            return value.trim();
							 	        });
							 	        
							 	       // 각 변수가 빈 문자열이 아니면 encodeURIComponent 적용
							 	        /* var htypeParam = htype.length > 0 ? encodeURIComponent(htype.join(',')) : "";
							 	        var hbedtypeParam = hbedtype.length > 0 ? encodeURIComponent(hbedtype.join(',')) : ""; */
							 	        var moptionParam = moption.length > 0 ? encodeURIComponent(moption.join(',')) : "";
							 	        /* var mpeopleParam = mpeople !== null && mpeople !== "" ? encodeURIComponent(mpeople) : ""; */

							 	        // 각 파라미터에 대한 값을 할당하여 URL에 추가
							 	        /* updatedURL += "&htype=" + htypeParam;
							 	        updatedURL += "&hbedtype=" + hbedtypeParam; */
							 	        updatedURL += "&moption=" + moptionParam;
							 	        /* updatedURL += "&mpeople=" + mpeopleParam; */

							 	        // 페이지 새로고침
							 	        window.location.href = updatedURL;
							 	    }
							 	
							 	        
								/*         // 각 파라미터에 대한 값을 할당하여 URL에 추가
								        if (htype.length > 0 ) {
								            updatedURL +="&htype=" + encodeURIComponent(htype.join(','));
								        }
								        if (hbedtype.length > 0 ) {
								            updatedURL +="&hbedtype=" + encodeURIComponent(hbedtype.join(','));
								        }
								        if (hcomfort.length > 0 ) {
								            updatedURL += "&hcomfort=" + encodeURIComponent(hcomfort.join(','));
								        }
								        if (hpeople.length > 0 ) {
								            updatedURL += "&hpeople=" + encodeURIComponent(hpeople);
								        }  
								        // 페이지 새로고침
								        window.location.href = updatedURL;
								    
								    }  */
		     	  </script>

					</div>
				</div>
				<!-- //Filter -->
			</aside>




			<div class="right">
				<ul class="sort">

					<!-- <li><a href="#">낮은 가격 순</a></li>
					<li><a href="#">높은 가격 순</a></li> -->
					<li><a href="#" onclick="openMmap()">지도</a></li>

				</ul>
				<c:choose>
					<c:when test="${not empty motels}">

						<c:forEach var="motel" items="${ motels}">

							<a href="/motelpage?no=${motel.no}&checkindate=${param.checkindate}&checkoutdate=${param.checkoutdate} " class="thumb">
								<table>
									<tr>
										<td width="300px" height="250px"><img
											src="${motel.mimage} " alt="호텔이미지" width="250px"
											height="230px"></td>

										<td>
											<h2 class="name">${motel.mname}</h2>
											<p>${motel.mdetailregion }</p> 
											<!-- <br> <span>*****</span> -->

										</td>
										<td>
											<ul>
												<li class="dis-price">${motel.minprice }</li>
												<li class="dis-price">${motel.mindaesilprice }</li>
											</ul>
										</td>
									</tr>
								</table>
							</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>No motel information available.</p>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</main>
	
<%-- 	<c:import url="/footer" /> --%>
</body>
</html>
