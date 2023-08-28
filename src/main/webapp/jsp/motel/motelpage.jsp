<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
	
<!doctype html>
<html lang="ko">
<head>
    <title> ${motel.mname} | 저기어때</title>
    
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
	<link rel="stylesheet" href="css/motelP.css">

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
			<img alt="모텔이름 | 전경" class="swiper-lazy swiper-lazy-loaded"
			 src="${motel.mimage}">
		</div>
		<div class="hpTRight">
			  <td>
               	<h2 class="name">${motel.mname }</h2>
                <p>${motel.maddress } ${motel.mdetailaddress }</p>
               	<br>
               	<%-- <span>***** ${motel.mrating }</span> --%>
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
			
			<input type="text" id="calendars" name="calendars" value="" />
			
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
				
				</script> -->	
          <article class="room_info">             
             <c:choose>
                  <c:when test="${empty motelrooms }">
                    <h3>No motelroom information available.</h3>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="motelroom" items="${ motelrooms}">
                      <div class="room">
                        <p class="pic_view ">
                          <img class="lazy" src="${motelroom.mroomimage}" width="300px" height="250px">
                        </p>
                        <strong class="title">${motelroom.mroomname } &nbsp; &nbsp;</strong>
                        
                        <div class="info">
                          <div class="half ended">
                            <div class="price">
                              <strong>대실</strong>
                              <div>
                                <p>
                                  <b style="color: rgba(0,0,0,1)">${motelroom.mdaesilprice }원</b>
                                  <!-- 표시금액 -->
                                </p>
                              </div>
                              <ul>
                                <li>
                                  <span>마감시간</span>${motel.mdaesilcheckout }시까지&nbsp;
                                </li>
                                <li>
                                  <span>이용시간</span>${motel.mdaesiltime }시간&nbsp;
                                </li>
                              </ul>
								<button type="button" onclick="location.href='daesilReservation?no=${motel.no}&stayType=motel&mroomcode=${motelroom.mroomcode}&price=${motelroom.mdaesilprice}'">대실 예약</button>                              
                            </div>
                          </div>
                          <div class="half ended">
                            <div class="price">
                              <strong>숙박</strong>
                              <div>
                                <p>
                                  <b style="color: rgba(0,0,0,1)">${motelroom.mstayprice }원</b>
                                  <!-- 표시금액 -->
                                </p>
                              </div>
                              <ul>
                                <li>
                                  <span>입실시간</span>${motel.mstaycheckin }시부터&nbsp;
                                </li>
                                <li>
                                  <span>퇴실시간</span>익일 ${motel.mstaycheckout }시까지&nbsp;
                                </li>
                              </ul>
								<button type="button" onclick="location.href='stayReservation?no=${motel.no}&stayType=motel&mroomcode=${motelroom.mroomcode}&price=${motelroom.mstayprice}&checkindate=${param.checkindate}&checkoutdate=${param.checkoutdate}'">숙박 예약</button>                          
                            </div>
                          </div>
                        </div>                      
                      </div>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
                </article>
		</div>
		<div id="informationP" style="display:none;">
		
			<div class="basicInfo" onclick="clickshow(this,'infoStory')">기본 정보</div>
   			<div id="infoStory" style="display: none;"> 
				${motel.minfo }
			</div>
   			
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
				<div class="gallery_review"> 
					<img src="'//image.goodchoice.kr'+ aepimg.aep_imgpath"  alt="item.epilrate_textinfo" />
				 </div>
			 </div>
			 
			 <% } %>
			
			
		</div>
	</main>
		



</body>
</html>
