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

<script src="../../resource/js/reservationList.js"></script>
<script src="../../resource/js/alert.js"></script>
<title>예약 상세 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/reservationList.css">
<link rel="stylesheet" href="../../resource/css/alert.css">

</head>
<body>
	<!-- Wrap -->
	<div class="wrap">

		<!-- Header -->
		<c:import url="/header" />

		<!-- Sub Top -->
		<div class="sub_top_wrap">
			<div class="sub_top">
				<h2>내정보</h2>
			</div>
		</div>
		<!-- //Sub Top -->
		<div id="content" class="sub_wrap">
			<!-- Nav -->
			<nav>
				<ul>
					<li><a class="active" href="/reservationList">예약 내역</a></li>
					<li><a class="" href="/myPage">내 정보 관리</a></li>
				</ul>
			</nav>
			<div class="align_rt">
				<div class="resDetail">
					<c:choose>
						<c:when test="">
							<div class="info"">
								<div>
									<i> 이용완료 </i> <strong>구월 HOTEL BAY 204</strong> <span>베이
										써클룸(기가지니/넷플릭스/스타일러/2인원형욕조) • 1박</span>
								</div>
							</div>
							<section>
								<div>
									<p>
										<strong>체크인</strong>2022.12.24 토 19:00
									</p>
									<p>
										<strong>체크아웃</strong>2022.12.25 일 12:00
									</p>
								</div>
						</c:when>
						<c:when test="">
							<div class="info"">
								<div>
									<i> 이용완료 </i> <strong>구월 HOTEL BAY 204</strong> <span>베이
										써클룸(기가지니/넷플릭스/스타일러/2인원형욕조) • 1박</span>
								</div>
							</div>
							<section>
								<div>
									<p>
										<strong>체크인</strong>2022.12.24 토 19:00
									</p>
									<p>
										<strong>체크아웃</strong>2022.12.25 일 12:00
									</p>
								</div>
						</c:when>
						<c:otherwise>
							<div class="info"">
								<div>
									<i> 이용완료 </i> <strong>구월 HOTEL BAY 204</strong> <span>베이
										써클룸(기가지니/넷플릭스/스타일러/2인원형욕조) • 1박</span>
								</div>
							</div>
							<section>
								<div>
									<p>
										<strong>체크인</strong>2022.12.24 토 19:00
									</p>
									<p>
										<strong>체크아웃</strong>2022.12.25 일 12:00
									</p>
								</div>
						</c:otherwise>
					</c:choose>
					<div>
						<p>
							<strong>예약번호</strong>2212051400DCA5YE1
						</p>
						<p>
							<strong></strong>(112356406)
						</p>
						<p>
							<strong>예약자 이름</strong>이*리
						</p>
						<p>
							<strong>안심번호</strong>050240178960 <span class="safety_txt_2">휴대폰
								번호 0109127****은(는)<br>안심번호로 숙소에 전송되며, 퇴실 후 7일간 보관됩니다.
							</span>
						</p>
					</div>
					<div class="total" style="border-bottom: none;">
						<div class="payment-info-pc">
							<div class="payment-info-pc__top">
								<div class="title-container">
									<p class="payment-info-pc__title">결제정보</p>
									<p class="payment-info-pc__caption">* 거래내역서는 예약 확정 후 제공돼요.</p>
								</div>
								<div class="payment-info-pc__receipt">
									<button type="button" class="base-button">영수증</button>
									<button type="button" class="base-button">거래내역서</button>
								</div>
							</div>
							<div class="payment-info-pc__bottom">
								<p>
									<strong data-v-3c130066="">총 결제 금액</strong>
								</p>
								<p>
									<b data-v-3c130066="">220,000원</b>
								</p>
							</div>
						</div>
						<div class="payment-info-mobile">
							<div class="payment-info-mobile__top">
								<p>
									<strong data-v-3c130066="">총 결제 금액</strong>
								</p>
								<p>결제정보</p>
							</div>
							<div class="payment-info-mobile__middle">
								<p>
									<b>220,000원</b>
								</p>
							</div>
							<div class="payment-info-mobile__bottom">
								<div class="payment-info-mobile__buttons">
									<button type="button" class="base-button-mobile">영수증</button>
									<button type="button" class="base-button-mobile">거래내역서</button>
								</div>
								<div data-v-3c130066="" class="payment-info-mobile__caption">*
									거래내역서는 예약 확정 후 제공돼요.</div>
							</div>
						</div>
					</div>
					</section>
					<a href="tel:050440650188" class="btn_call">전화문의하기</a>
					<section>
						<!---->
						<p>
							<button type="button" class="base-button">삭제</button>
						</p>
					</section>
				</div>
			</div>
		</div>
		<!---->
		<!---->
	</div>
	<!-- 알림 -->
	<div class="alert">
		<!-- alert -->
		<div class="popTwobtn2">
			<div class="btnText2"></div>
			<div class="btn_wrap">
				<button onclick="closeLayer()">취소</button>
				<button onclick="reserDeleteProc()" class="colMint2"></button>
				<input type="hidden" id="value1" value="">
			</div>
		</div>
		<!-- Bg Dimm -->
		<div class="bgDimm" onclick="closeLayer();">&nbsp;</div>
	</div>
	<footer> </footer>
</body>
</html>