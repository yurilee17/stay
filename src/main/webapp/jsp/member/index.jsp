<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0026)https://www.goodchoice.kr/ -->
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">

    <link rel="shortcut icon" href="../../resource/img/favicon_170822.ico" type="image/x-icon">
    <link rel="stylesheet preload" href="../../resource/css/font.css" as="style" type="text/css" crossorigin="">

	<!-- CSS -->
    <title>여행할때 여기어때</title>
    <!-- <link rel="stylesheet" href="../../resource/css/common.css"> -->
    <script type="text/javascript" src="../../resource/js/jquery-1.12.4.min.js"></script>
    
    </head>
<body class="pc">
 	<c:set var="currentDate" value="<%= new java.util.Date() %>" />
    <c:set var="dateFormat" value="yyyy-MM-dd" />
    <fmt:formatDate var="formattedDate" pattern="yyyy-MM-dd" value="${currentDate}" />
    
   
</body>
<!-- Wrap -->
<div class="wrap main_wrap show">
    <!-- Header -->
    
	<c:import url="/header"/>
        <!-- CSS -->
    <link rel="stylesheet" href="../../resource/css/swiper.css">
	<link rel="stylesheet" href="../../resource/css/main.css">

	<!-- Content  -->
	<div id="content">
		<div class="main_spot"><a href="#">여행할때 여기어때</a></div>

		<!-- Link -->
		<div class="main_link">
			<ul>

				<li><a href="${context }motellist" menu-link="1"><span class="ico_01">&nbsp;</span><p>모텔</p></a></li>
				<li><a href="${context }Main?hdetailregion=강남&checkindate=${formattedDate}&checkoutdate=${formattedDate}" menu-link="2"><span class="ico_02">&nbsp;</span><p>호텔·리조트</p></a></li>

				<li><a href="#" menu-link="3"><span class="ico_03">&nbsp;</span><p>펜션</p></a></li>
				<li><a href="#" menu-link="6"><span class="ico_04">&nbsp;</span><p>게스트하우스</p></a></li>
				<li><a href="${context }campinglist?cdetailregion=강남&checkindate=${formattedDate}&checkoutdate=${formattedDate}" menu-link="5"><span class="ico_05">&nbsp;</span><p>캠핑·글램핑</p></a></li>
				<li><a href="#"><span class="ico_09">&nbsp;</span><p>지역별 관광정보</p></a></li>
			</ul>
		</div>
		<!-- //Link -->

	</div>
	<!-- //Content  -->

</div>

<!-- //Wrap -->

<!-- Script -->
<!-- Library -->
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


<c:import url="/footer" /> 
</body></html>