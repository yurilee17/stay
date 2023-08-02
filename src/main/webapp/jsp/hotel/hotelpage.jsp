<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
	
<!doctype html>
<html lang="ko">
<head>
    <title>호텔이름 | 저기어때</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">
    
    
    <link rel="shortcut icon" href="../../resource/img/favicon_170822.ico" type="image/x-icon">
    <link rel="stylesheet preload" href="../../resource/css/font.css" as="style" type="text/css" crossorigin="">

	<!-- CSS -->
    <link rel="stylesheet" href="../../resource/css/common.css">
    <!-- <link rel="canonical" href="#"> -->
   <!--  <script type="text/javascript" src="../../resource/js/jquery-1.12.4.min.js"></script> -->
    
    <!-- (중요) 달력 외부 css -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  	<script type="text/javascript" src="../../resource/js/hotel.js"></script>
    
    
</head>
<body class="pc">




<!-- Wrap -->
<div class="wrap main_wrap show">

    <!-- Header -->
    <c:import url="/header"/>
    <!-- CSS -->
    <link rel="stylesheet" href="../../resource/css/swiper.css">
	<link rel="stylesheet" href="../../resource/css/main.css">
	<link rel="stylesheet" href="../../resource/css/reset.css">
	<link rel="stylesheet" href="../../resource/css/hotel.css">
	<link rel="stylesheet" href="../../resource/css/hotelP.css">

</div>

<!-- //Wrap -->

<!-- Script -->
<!-- Library -->
<script type="text/javascript" src="../../resource/js/hotel.js"></script>
<script type="text/javascript" src="../../resource/js/jquery.cookie.js"></script>
<script type="text/javascript" src="../../resource/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="../../resource/js/iscroll.js"></script>

<!-- Service -->
<script type="text/javascript" src="../../resource/js/common.js"></script>
<script type="text/javascript" src="../../resource/js/geolocation.js"></script>

<!-- Module -->
<!-- <script type="text/javascript" src="./여행할때 여기어때_files/dialogPopup.js"></script> -->

<!-- Page Script -->
<script type="text/javascript" src="../../resource/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="../../resource/js/swiper.min.js"></script>
<script type="text/javascript" src="../../resource/js/iscroll.js"></script>
<script type="text/javascript" src="../../resource/js/main.js"></script>
<script type="text/javascript" src="../../resource/js/reservation.js"></script>




<div class="visual">
	<div class="hpTop">

		<div class="hpTLeft">
			<img alt="호텔이름 | 전경" class="swiper-lazy swiper-lazy-loaded"
			 src="//image.goodchoice.kr/resize_490x348/affiliate/2020/07/28/5f1fef8232c3e.jpg">
		</div>
		<div class="hpTRight">
			  <td>
               	<h2 class="name">호텔 인 강남</h2>
                <p>서울 강남구 삼성동 91-28 (상세주소)</p>
               	<br>
               	<span>*****</span>
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
		<div class="register_individual" id="reservationP" >
			<h2>첫번째페이지</h2>
		</div>
		<div class="register_individual" id="informationP" style="display:none;">
			<h2>두번째페이지</h2>
		</div>
		<div class="register_individual" id="reviewP"  style="display:none;">
			<h2>세번째페이지</h2>
		</div>
	</main>
		


	



</body>
</html>
