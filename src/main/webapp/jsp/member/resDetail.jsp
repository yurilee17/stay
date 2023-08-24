<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.temporal.ChronoUnit"%>

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

	<!-- 날짜 계산기 -->
	<c:set var="date1" value="${LocalDate.parse(detail.checkindate)}" />
	<c:set var="date2" value="${LocalDate.parse(detail.checkoutdate)}" />

	<c:set var="daysDifference"
		value="${ChronoUnit.DAYS.between(date1, date2)}" />
	<!-- //날짜 계산기 -->

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
						<c:when test="${detail.status == '예약취소'}">
							<div class="info"">
								<div>
									<i class="bg_w"> ${detail.status} </i> <strong>${detail.stayname}</strong>
									<c:choose>
										<c:when test="${detail.checkindate == detail.checkoutdate}">
											<span>${detail.checkindate} ~ ${detail.checkoutdate},
												대실 </span>
										</c:when>
										<c:otherwise>
											<span>${detail.checkindate} ~ ${detail.checkoutdate},
												${daysDifference}박</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="info"">
								<div>
									<i> ${detail.status} </i> <strong>${detail.stayname}</strong>
									<c:choose>
										<c:when test="${detail.checkindate == detail.checkoutdate}">
											<span>${detail.roomname} • 대실 </span>
										</c:when>
										<c:otherwise>
											<span>${detail.roomname} • ${daysDifference}박</span>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<section>
								<div>
									<p>
										<strong>체크인</strong>${detail.checkindate}
										${detail.checkintime}
									</p>
									<p>
										<strong>체크아웃</strong>${detail.checkoutdate}
										${detail.checkouttime}
									</p>
								</div>
							</section>
						</c:otherwise>
					</c:choose>
					<section>
						<div>
							<p>
								<strong>예약번호</strong>${detail.no}
							</p>
							<p>
								<strong>예약자 이름</strong>${detail.name}
							</p>
							<p>
								<strong>안심번호</strong>050240178960 <span class="safety_txt_2">휴대폰
									번호 ${detail.mobile}은(는)<br>안심번호로 숙소에 전송되며, 퇴실 후 7일간 보관됩니다.
								</span>
							</p>
						</div>
						<div class="total">
							<div class="payment-info-pc">
								<div class="payment-info-pc__top">
									<div class="title-container">
										<p class="payment-info-pc__title">결제정보</p>
									</div>
									<div class="payment-info-pc__receipt">
										<button type="button" class="base-button">영수증</button>
									</div>
								</div>
								<div class="payment-info-pc__bottom">
									<p>
										<strong>총 결제 금액</strong>
									</p>
									<p>
										<b>${price}원</b>
									</p>
								</div>
							</div>
						</div>
					</section>
					<section>
						<c:choose>
							<c:when test="${detail.status == '예약확정'}">
								<p class="reservationCancel">
									체크인 시간 이후에는 취소가 불가합니다.
									<button type="button" class="reservationCancelBT"
										onclick="resUpdateBtn()">예약취소</button>
								</p>
							</c:when>
							<c:when test="${detail.status == '이용완료'}">
								<p class="reservationCancel">
									<button type="button" class="base-button"
										onclick="reserDelete(${detail.no})">삭제</button>
								</p>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>


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

	<!-- 예약 취소 알림 -->
	<div class="alert">
		<!-- alert -->
		<div class="reserUpdateBtn">
			<div class="resUpBtnText">
				<h1>취소내용 확인</h1>
				<p>
					총 환불금액 및 환불 내용을 확인하신 후<br>정말 예약취소를 원하시면 취소 진행을 해주세요.
				</p>
			</div>
			<div class="resUpBtn_wrap">
				<h2>환불 예정 정보</h2>
				<p>
					<b>결제금액</b> <span>${price}원</span>
				</p>
				<p>
					<b>환불방법</b> <span>${detail.paymethod} 환불</span>
				</p>
				<p class="reserUpRe">
					<b>최종 환불금액</b> <span>${price}원</span>
				</p>
			</div>
			<div class="resUpBtn_btn">
				<button onclick="closeLayer()">취소</button>
				<button onclick="resUpdateProc()" class="colMint2">예약취소</button>
				<input type="hidden" id="noValue" value="${detail.no}">
			</div>
		</div>
		<!-- Bg Dimm -->
		<div class="resUpDimm">&nbsp;</div>
	</div>
	<footer> </footer>
</body>
</html>