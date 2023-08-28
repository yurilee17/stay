<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
	
<!doctype html>
<html lang="ko">
<head>
    <title> ${hotel.hname} | 저기어때</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">
    
    
    <link rel="shortcut icon" href="img/favicon_170822.ico" type="image/x-icon">
    <link rel="stylesheet preload" href="css/font.css" as="style" type="text/css" crossorigin="">

	<!-- CSS -->
    <link rel="stylesheet" href="css/common.css">
    <!-- <link rel="canonical" href="#"> -->
   <!--  <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script> -->
    
    <!-- (중요) 달력 외부 css -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  	<script type="text/javascript" src="js/hotel.js"></script>
    
    
    <style>
    	
    </style>
</head>
<body class="pc">

<!-- Wrap -->
<div class="wrap main_wrap show">

    <!-- Header -->
    <c:import url="/header"/>
    <!-- CSS -->
    <link rel="stylesheet" href="css/swiper.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/hotel.css">
	<link rel="stylesheet" href="css/hotelP.css">

</div>

<!-- //Wrap -->

<!-- Script -->
<!-- Library -->
<script type="text/javascript" src="js/hotel.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.lazyload.js"></script>
<script type="text/javascript" src="js/iscroll.js"></script>

<!-- Service -->
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/geolocation.js"></script>

<!-- Module -->
<!-- <script type="text/javascript" src="./여행할때 여기어때_files/dialogPopup.js"></script> -->

<!-- Page Script -->
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/swiper.min.js"></script>
<script type="text/javascript" src="js/iscroll.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/reservation.js"></script>




<div class="visual">
	<div class="hpTop">

		<div class="hpTLeft">
			<img alt="호텔이름 | 전경" class="swiper-lazy swiper-lazy-loaded"
			 src="${hotel.himage}"  width="490px" height="348px">
		</div>
		<div class="hpTRight">
			  <td>
               	<h2 class="name">${hotel.hname}</h2>
                <p>${hotel.haddress}</p>
               	<br>
               <!-- 	<span>***** (별점평균이 들어가야함)</span> -->
              </td>
		</div>
	</div>
		<div class="hpNav">
				<div class="inner">
						 <button type="button" class="reserBtn selected" onclick="reserBtn_show()">객실안내/예약</button>
						 <button type="button" class="infoBtn" onclick="inforBtn_show()">숙소정보</button>
						 <button type="button" class="revBtn" onclick="revBtn_show()">리뷰</button>
				</div>
		</div>
		
		
		

<script>		

 // hpNav script  (혹 나중에 js로 넣을 수 있으면 보내버리기)
			
		
		//객실안내/예약
		 function reserBtn_show(){
		   var reservationP = document.getElementById("reservationP");   
		
		   if (reservationP.style.display === 'none') {   
			   informationP.style.display = 'none';
			   reviewP.style.display = 'none';
			   reservationP.style.display = 'block';
			   // 이전에 선택된 메뉴 아이템에서 'selected' 클래스 제거
			   const previouslySelected = document.querySelector('.hpNav .inner button');
				if (previouslySelected) {
				  previouslySelected.classList.remove('selected');
				}
				
		   } else {
			   informationP.style.display = 'none';
			   reviewP.style.display = 'none';
		   }
		   const btn1 = document.querySelector('.reserBtn');
		    btn1.classList.add('clicked');
		
		   const btn2 = document.querySelector('.infoBtn');
		    btn2.classList.remove('clicked');
		   
		   const btn3 = document.querySelector('.revBtn');
		    btn3.classList.remove('clicked');
		}
		
		 
		
		//숙소정보
		function inforBtn_show(){
		   var informationP = document.getElementById("informationP");   
		   if (informationP.style.display === 'none') { 
			   informationP.style.display = 'block';
			   reservationP.style.display = 'none';
			   reviewP.style.display = 'none';
			  // 이전에 선택된 메뉴 아이템에서 'selected' 클래스 제거
			   const previouslySelected = document.querySelector('.hpNav .inner button');
				if (previouslySelected) {
				  previouslySelected.classList.remove('selected');
				}
				
		   } else {
			   reservationP.style.display = 'none';
			   reviewP.style.display = 'none';
		   }
		   const btn1 = document.querySelector('.reserBtn');
		    btn1.classList.remove('clicked');
		
		   const btn2 = document.querySelector('.infoBtn');
		    btn2.classList.add('clicked');
		   
		   const btn3 = document.querySelector('.revBtn');
		    btn3.classList.remove('clicked');
		}
		
		//리뷰
		function revBtn_show(){
			   var reviewP = document.getElementById("reviewP");   
			   if (reviewP.style.display === 'none') { // 리뷰
				   reviewP.style.display = 'block';
				   reservationP.style.display = 'none';
				   informationP.style.display = 'none';
				   // 이전에 선택된 메뉴 아이템에서 'selected' 클래스 제거
				   const previouslySelected = document.querySelector('.hpNav .inner button');
					if (previouslySelected) {
					  previouslySelected.classList.remove('selected');
					}
				   
			   } else {
				   reservationP.style.display = 'none';
				   informationP.style.display = 'none';
			   }
			   const btn1 = document.querySelector('.reserBtn');
			    btn1.classList.remove('clicked');
			
			   const btn2 = document.querySelector('.infoBtn');
			    btn2.classList.remove('clicked');
			   
			   const btn3 = document.querySelector('.revBtn');
			    btn3.classList.add('clicked');
			}
		

		
</script>	

</div>

	<main class=content>
		<div class="resPage" id="reservationP" >
			
	
	<input type="text" id="calendar" name="calendar" value="" >
			
		<script type="text/javascript">	
			$(function() {
		        // 로컬 스토리지에서 저장된 값을 가져옵니다.
		        var checkindate = localStorage.getItem("checkindate");
		        var checkoutdate = localStorage.getItem("checkoutdate");
		       
		        
		        // 가져온 값을 <input> 요소의 value에 설정합니다.
		        if (${param.checkindate} && ${param.checkoutdate}) {
		            var combinedValue = "${param.checkindate}" + " ~ " + "${param.checkoutdate}";
		            $('#calendar').val(combinedValue);
		        }
		    });
			
			</script>
				
			<!-- <script>

				$(function () {
	         	   $('#calendars').daterangepicker({
	         		  "maxSpan": {"days": 7 },
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
		                "startDate": new Date(),
		                "endDate":new Date(),
		                "drops": "down"
			            }, function (start, end, label) {
			                console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	          		  });
	         	   
	         	   // css 변경가능 
	         	  $("#calendars").on('show.daterangepicker', function (ev, picker) {
	         		   /*  $(".cancelBtn").css("float", "right"); */
	         		});

	         	   
	       		 });
				
				</script>	 -->
	<c:choose>
		<c:when test="${not empty hotelrooms}">
			<c:forEach var="hotelroom" items="${ hotelrooms}">					
                <table>
                	<tr>
                        <td width="300px" height="250px">
                            <img src="${hotelroom.hroomimage}" alt="객실이미지" width="300px" height="250px">>
                        </a></td>
                        <td>
                           <div class=room>
                             <h2 class="name">${hotelroom.hroomname}</h2>                            
	                            <br><br>
	                           <b><span>${hotelroom.hprice}</span></b>	                
                           	</div>
                           	<button type="button"  onclick="location.href='stayReservation?no=${hotel.no}&stayType=hotel&hroomcode=${hotelroom.hroomcode}&hprice=${hotelroom.hprice}&checkindate=${param.checkindate}&checkoutdate=${param.checkoutdate}'" >예약하기</button>
                        </td>
                       
                    </tr>
                </table>
             </c:forEach>
           </c:when>
			<c:otherwise>
				<!-- hotelrooms 변수가 비어있을 때의 처리 -->
				<p>No hotelroom information available.</p>
			</c:otherwise>
		</c:choose>
		
		</div>
		<div id="informationP" style="display:none;">
		
			<div class="basicInfo" onclick="clickshow(this,'infoStory')">기본 정보</div>
   			<div id="infoStory" style="display: none;"> 주변정보
코엑스 인근<br>
삼성역 인근<br>
공지사항<br>
[객실 및 부대시설 이용 정원 안내]<br>
객실 : 최대 3인 (성인 3인 또는 성인2인+소인2인 *만12세 이하)<br>
레스토랑&바 : 최대 6인<br>
클럽 인터컨티넨탈 라운지 : 최대 3인<br>
투숙 시 호텔 규정에 따른 정원을 반드시 준수해 주시기 바라며, 정원 위반 및 개인 주최 파티 진행 시 퇴실 조치되는 점 양지해주시기 바랍니다
기본사항<br>
체크인 : 15:00 | 체크아웃 : 11:00<br>
무료 Wi-Fi<br>
전 객실 금연<br>
Bath Amenity (치약, 칫솔 무료)<br>
무료 주차 (객실 당 1대)<br>
인원 추가 정보<br>
[기준인원 외 추가 시 안내]<br>
※ 엑스트라 베드 사전 요청 필수<br>
기준인원 외 추가 시 엑스트라 베드 추가 비용 84,700원<br>
조식 포함된 패키지 상품에 추가하는 경우 1인당 121,000원 (조식 1인, 엑스트라 베드 포함)<br>
클럽 라운지 이용이 포함된 패키지의 경우 1인 추가 금액 205,700원 (클럽 라운지 1인, 엑스트라 베드 포함)<br>
영유아 인원수 포함 / 최대 인원 초과 불가<br>
현장 결제<br>
투숙객 혜택<br>
24시간 프라이빗 다이닝 서비스<br>
투숙 기간 중 실내 수영장&메트로폴리탄 피트니스 클럽 이용 (사우나 제외)<br>
바이레도 또는 조말론 어메니티 제공<br>
구글 크롬캐스트를 통한 OTT(넷플릭스) 시청 가능<br>
부대시설<br>
레스토랑, 바, 피트니스, 클럽라운지 등<br>
[메트로폴리탄 피트니스 클럽 이용 안내]<br>
장소 및 운영 시간 : 3층 / 06:00~23:00 (매달 세 번째 화요일 정기 휴무)<br>
수영장 : 만 12세 이상 및 신장 150cm 이상 이용 가능 / 수영복, 수영모 개인 지참 필수<br>
체련장 : 만 18세 이상 이용 가능 / 운동화, 양말 개인 지참 필수<br>
라운지 : 이용 가능 / 단, 음식물 섭취 제한<br>
문의 : 02-559-7531<br>
클럽 라운지 이용안내<br>
클럽 인터컨티넨탈 운영 시간이 요일 별로 상이하오니 공식 홈페이지를 참고해주시고 방문 부탁 드립니다<br>
애프터눈 티와 칵테일 아워의 경우는 투숙률에 따라 2부제 또는 3부제로 운영될 수 있습니다<br>
조식 정보<br>
그랜드 키친 / 1층 / 06:30~10:30<br>
1인 70,000원 (만 12세 이상~성인), 35,000원 (만 4세 이상~만 11세 이하), 48개월 미만 무료<br>
현장결제<br>
취사 시설<br>
전 객실 취사 불가<br>
취소 및 환불 규정<br>
최초 1박에만 취소 규정 적용, 이후 일자 100% 환불<br>
체크인일 기준 1일 전 18시까지 : 100% 환불<br>
체크인일 기준 1일 전 18시 ~당일 및 No-show : 환불불가<br>
취소, 환불시 수수료가 발생할 수 있습니다<br>
아래 객실은 별도 취소 규정이 적용되오니 참고 부탁드립니다<br>
[공동구매] 객실 : 체크인 7일 전까지 100% 환불, 이후 환불 불가<br>
[Romantic Moments 패키지] 객실 : 체크인 3일 전까지 100% 환불, 이후 환불 불가<br>
[Book Early & Save-룸온리], [Book Early & Save-조식 2인] 객실 : 예약 후 취소, 변경, 환불 불가
확인사항 및 기타<br>
예약 시, 투숙객 실명으로 예약 진행 필수입니다<br>
체크인 시 Deposit(보증금) 요구할 수 있고, 퇴실 시 전액 환불됩니다<br>
(단, 유료서비스 이용 및 기물파손 시 청구될 수 있음)<br>
최대인원 초과시 입실 불가합니다<br>
미성년자는 보호자 동반없이 이용이 불가합니다<br>
위의 정보는 호텔의 사정에 따라 변경될 수 있습니다<br>
해당 이미지는 실제와 상이 할 수 있습니다<br>
체크인 시 배정 또는 베드타입 미기재 상품은 특정객실과 베드타입을 보장하지 않습니다<br>
해당 객실가는 세금, 봉사료가 포함된 금액입니다<br>
수영장 운영은 날씨 또는 호텔 상황에 따라 변동 될 수 있습니다<br>
애완동물 관련한 별도의 법규 및 규정이 없는 경우, 시각 장애 고객 안내견(보조견)을 제외한 애완 동물 동반 고객은 호텔의 공용 지역 혹은 영업장 출입을 제한 합니다
시각 장애 고객의 안내를 위한 맹인 안내견(보조견)은 호텔의 공용 지역 및 모든 영업장 내 출입이 가능합니다<br>
호텔은 고객과 맹인 안내견(보조견)이 호텔을 이용함에 있어 불편함이 없도록 세심한 배려를 제공합니다</div>
   			
   			<div class="serviceInfo" onclick="clickshow(this,'serviceStory')">편의시설 및 서비스</div>
   			<div id="serviceStory" style="display: none;"> 편의시설 및 서비스 내용이 들어가야겠지.... 이거 할 수 있을까나..... 흑흑</div>
   			
   			<div class="emptyInfo"></div>
   			
		</div>
		
		<script>
		
		 	function clickshow(elem,infoStory) {
				 var menu = document.getElementById(infoStory);
				 if (elem.className !='basicInfo') {
				    elem.className = 'basicInfo';
				    menu.style.display = "none";
				 } else {
				    elem.className ='opened';
				    menu.style.display ="block";
				}} 
			
		 	function clickshow(elem,serviceStory) {
				 var menu = document.getElementById(serviceStory);
				 if (elem.className !='serviceInfo') {
				    elem.className = 'serviceInfo';
				    menu.style.display = "none";
				 } else {
				    elem.className ='opened';
				    menu.style.display ="block";
				}} 
			
		</script>
		
		
		
		<div class="register_individual" id="reviewP"  style="display:none;">
			
	<!-- 		<div class="star-rating">
			  <input type="radio" id="5-stars" name="rating" value="5" />
			  <label for="5-stars" class="star">&#9733;</label>
			  <input type="radio" id="4-stars" name="rating" value="4" />
			  <label for="4-stars" class="star">&#9733;</label>
			  <input type="radio" id="3-stars" name="rating" value="3" />
			  <label for="3-stars" class="star">&#9733;</label>
			  <input type="radio" id="2-stars" name="rating" value="2" />
			  <label for="2-stars" class="star">&#9733;</label>
			  <input type="radio" id="1-star" name="rating" value="1" />
			  <label for="1-star" class="star">&#9733;</label>
			</div>
			
	-->
	
	
			<% for(int i=0; i <= 5; i++ ){ %>
	
			<div class="review-con">
				<strong>여기만한 곳은 어디에도 없을 거예요.(리뷰제목) </strong>
				<%-- 별점 넣는 공간 --%>
				<div class="star-rating">
				  <input type="radio" id="5-stars" name="rating" value="5" />
				  <label for="5-stars" class="star">&#9733;</label>
				  <input type="radio" id="4-stars" name="rating" value="4" />
				  <label for="4-stars" class="star">&#9733;</label>
				  <input type="radio" id="3-stars" name="rating" value="3" />
				  <label for="3-stars" class="star">&#9733;</label>
				  <input type="radio" id="2-stars" name="rating" value="2" />
				  <label for="2-stars" class="star">&#9733;</label>
				  <input type="radio" id="1-star" name="rating" value="1" />
				  <label for="1-star" class="star">&#9733;</label>
	 <!-- 중요중요!!! 여기에서 별점을 선택하는게 아니라 저장되어있는 별점을 가져와야함 // 리뷰페이지에 이 폼 넣어줘야함 -->
				</div>
				<div class="nicname">앙토끼앙 (유저닉네임)</div>
				<div class="roomname_review">[조식&맥주&비어파인트&쿠폰북] 클래식 객실 이용 (객실이름)</div>
				<div class="text_review">남자친구와 생일여행 겸 호캉스로 패키지 상품을 구입했어요. 조식포함 되어있는 패키지라 아침에 일어나서 돌아다닐 필요없이<br> 
				바로 뷔페 이용까지 가능하니까 넘 편하더라구요. 저녁도 그렇고 조식도 뷔페 메뉴들이 정말 맛있었어요. 룸 컨디션도 엄청 좋았는데<br> 
				숙소 예약할때 항상 걱정이었던 머리카락이나 먼지들이 눈에 띄지않아서 마음 편하게 잘잤네요.<br> 
				서비스도 좋고 기억에 남을만한 여행이었어요^^</div>
				<!-- <div class="gallery_review"> 
					<img src="'//image.goodchoice.kr'+ aepimg.aep_imgpath"  alt="item.epilrate_textinfo" />
				 </div> -->
			 </div>
			 
			 <% } %>
			
			
		</div>
	</main>
		



</body>
</html>
