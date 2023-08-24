<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="../../resource/css/alert.css">
<link rel="stylesheet" href="../../resource/css/header.css">
<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<header>

	<section>
		<h1>
			<a class="" href="index" title="여기어때">저기어때</a>
		</h1>
		<button type="button" class="btn_srch srch_open ">검색</button>
		<ul class="gnb">
			<li><a href="#">내주변</a></li>
			<c:choose>
				<c:when test="${empty sessionScope.id }">
					<li><a href="/login">예약내역</a></li>
				</c:when>
				<c:when test="${'admin' == sessionScope.authority }">
				</c:when>
				<c:otherwise>
					<li><a href="/reservationList">예약내역</a></li>					
				</c:otherwise>
			</c:choose>
			<li class="over">
				<button type="button" id="more">
					<span>더보기</span>
				</button>
				<ul class="list_03">
					<li><a href="${context }noticeForm">공지사항</a></li>
					<li><a href="${context }faqForm">자주 묻는 질문</a></li>
					<li><a href="${context }inquiryForm">1:1 문의</a></li>
					<li><a href="#">약관 및 정책</a></li>
				</ul>
			</li>
			<c:choose>
				<c:when test="${empty sessionScope.id }">
					<li><a href="/login"><span>로그인</span></a></li>
				</c:when>
				<c:when test="${'admin' == sessionScope.authority }">
					<li class="user"><a href="#"><img
							src="../../resource/img/loginUser.png" alt=""></a>
						<ul class="list_04">
							<li><b>${sessionScope.nickname}</b></li>
							<li><a href="/stayIndex">관리하는거 어때</a></li>
							<li><button type="button" class="poplogoutopen"
									onclick="alerTwoBtn('로그아웃 하시겠습니까?','로그아웃');">로그아웃</button></li>
						</ul></li>
				</c:when>
				<c:otherwise>
					<li class="user"><a href="/myPage"><img
							src="../../resource/img/loginUser.png" alt=""></a>
						<ul class="list_04">
							<li><b>${sessionScope.nickname}</b></li>

							<li><a href="/myPage">내정보</a></li>
							<li><a href="/reservationList">예약내역<!-- span>0건</span --></a></li>
							<li><button type="button" class="poplogoutopen"
									onclick="alerTwoBtn('로그아웃 하시겠습니까?','로그아웃');">로그아웃</button></li>
						</ul></li>
				</c:otherwise>
			</c:choose>

		</ul>
		<!-- 알림 -->
		<div class="alert">
			<!-- alert -->
			<div class="popTwobtn">
				<div class="btnText"></div>
				<div class="btn_wrap">
					<button onclick="closeLayer()">취소</button>
					<button onclick="logoutProc()" class="colMint"></button>
				</div>
			</div>
			<!-- Bg Dimm -->
			<div class="bgDimm" onclick="closeLayer();">&nbsp;</div>

		</div>
		<!-- Search 
		<div class="srch_bar">
			<div class="wrap_inp">
				<input type="text" id="keyword" placeholder="지역, 숙소명"
					autocomplete="off">
				<button type="button" class="btn_srch">검색</button>
			</div>
			<button class="btn_cancel" onclick="srch_close()">취소</button>
		</div>-->
	</section>
	<!-- //Search -->
</header>

<!-- alert -->



<!-- 추천검색어 
<div class="recommend_srch">
	<div class="scroll_srch">
		<div class="scroller">
			<div class="default" style="display: block">
				<strong>추천 검색어</strong>
				<ul></ul>
			</div>
			<!-- 연관검색어 
			<div class="chain">
				<ul></ul>
			</div>
		</div>
	</div>
</div>-->
<script src="../../resource/js/header.js"></script>
<script src="../../resource/js/alert.js"></script>