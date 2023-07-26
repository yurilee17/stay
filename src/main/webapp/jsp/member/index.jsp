<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
    <link rel="stylesheet" href="../../resource/css/common.css">
    <link rel="canonical" href="#">
    <script type="text/javascript" src="../../resource/js/jquery-1.12.4.min.js"></script>
    
    </head>
<body class="pc">

<!-- Wrap -->
<div class="wrap main_wrap show">

    <!-- Header -->
    <header>

        <section>
                        <h1><a class="" href="#" title="여기어때">여기어때</a></h1>
            <button type="button" class="btn_menu nav_open ">메뉴</button>
            <button type="button" class="btn_srch srch_open ">검색</button>
            <ul class="gnb_pc">
                                    <li><a href="#">내주변</a></li>
                    <li><a href="#">예약내역</a></li>
                    <li class="over">
                        <button type="button"><span>더보기</span></button>
                        <ul class="list_03">
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">자주 묻는 질문</a></li>
                            <li><a href="#">1:1 문의</a></li>
                            <li><a href="#">약관 및 정책</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><span>로그인</span></a></li>
                            </ul>

            <!-- Search -->
            <div class="srch_bar">
                <div class="wrap_inp">
                    <input type="text" id="keyword" placeholder="지역, 숙소명" autocomplete="off">
                    <button type="button" class="btn_srch">검색</button>
                </div>
                <button class="btn_cancel" onclick="srch_close()">취소</button>
            </div>
            <!-- //Search -->

        </section>
    </header>

    <!-- Bg Dimm -->
    <div class="bg_dimm" onclick="close_layer();">&nbsp;</div>
    <div class="bg_dimm_prevent">&nbsp;</div>

    <!-- 추천검색어 -->
    <div class="recommend_srch">
        <div class="scroll_srch">
            <div class="scroller">
                <div class="default" style="display:block">
                    <strong>추천 검색어</strong>
                    <ul></ul>
                </div>
                <!-- 연관검색어 -->
                <div class="chain">
                    <ul></ul>
                </div>
            </div>
        </div>
    </div>

        <!-- CSS -->
    <link rel="stylesheet" href="../../resource/css/swiper.css">
	<link rel="stylesheet" href="../../resource/css/main.css">

	<!-- Content  -->
	<div id="content">
		<div class="main_spot"><a href="#">여행할때 여기어때</a></div>

		<!-- Link -->
		<div class="main_link">
			<ul>
				<li><a href="${context }motel" menu-link="1"><span class="ico_01">&nbsp;</span><p>모텔111</p></a></li>
				<li><a href="#" menu-link="2"><span class="ico_02">&nbsp;</span><p>호텔·리조트</p></a></li>
				<li><a href="#" menu-link="3"><span class="ico_03">&nbsp;</span><p>펜션</p></a></li>
				<li><a href="#" menu-link="6"><span class="ico_04">&nbsp;</span><p>게스트하우스</p></a></li>
				<li><a href="#" menu-link="5"><span class="ico_05">&nbsp;</span><p>캠핑·글램핑</p></a></li>
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

</body></html>