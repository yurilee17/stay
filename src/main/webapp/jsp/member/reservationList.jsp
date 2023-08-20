<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.temporal.ChronoUnit"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

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
<title>예약 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/reservationList.css">
<link rel="stylesheet" href="../../resource/css/alert.css">

</head>
<body>
	<!-- 현재 날짜 -->
	<c:set var="currentDate" value="<%=new Date()%>" />
	<c:set var="sdf" value='<%=new SimpleDateFormat("yyyy-MM-dd")%>' />
	<c:set var="today" value="${sdf.format(currentDate)}" />

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
		<!-- Content  -->
		<div id="content" class="sub_wrap">

			<!-- Nav -->
			<nav>
				<ul>
					<li><a class="active" href="/reservationList">예약 내역</a></li>
					<li><a class="" href="/myPage">내 정보 관리</a></li>
				</ul>
			</nav>
			<div class="align_rt">
				<c:choose>
					<c:when
						test="${empty resConfirmeds && empty resCompleteds && empty resCancellations}">
						<div class="list_none">
							예약 내역이 없습니다. <b>최저가로 예약 가능한<br>숙소들을 지금 만나세요!
							</b>
							<p>
								<a href="/index" class="btn_red">다양한 숙소 보러가기</a>
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="reservationList">
							<section>
								<h3>예약 내역</h3>
								<c:if test="${not empty resConfirmeds}">
									<ul class="list_wrap">
										<c:forEach var="resConfirmed" items="${resConfirmeds}">

											<!-- 날짜 계산기 -->
											<c:set var="date1"
												value="${LocalDate.parse(resConfirmed.checkindate)}" />
											<c:set var="date2"
												value="${LocalDate.parse(resConfirmed.checkoutdate)}" />

											<c:set var="daysDifference"
												value="${ChronoUnit.DAYS.between(date1, date2)}" />
											<!-- //날짜 계산기 -->

											<li class="reservation-detail"><div>
													<p class="pic">
														<!-- src="${resConfirmed.roomimage}" -->
														<img loading="lazy"
															src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/04/17/5e994464f3d0d.jpg"
															alt="${resConfirmed.stayname}" class="align">
													</p>
													<a href="/resDetail?no=${resConfirmed.no}"
														class="product-title"><i>${resConfirmed.status}</i> <strong>${resConfirmed.stayname}</strong>
														<c:choose>
															<c:when
																test="${resConfirmed.checkindate == resConfirmed.checkoutdate}">
																<span> 체크인: ${resConfirmed.checkindate}
																	${resConfirmed.checkintime} • 대실 </span>
															</c:when>
															<c:otherwise>
																<span> 체크인: ${resConfirmed.checkindate}
																	${resConfirmed.checkintime} • ${daysDifference}박</span>
															</c:otherwise>
														</c:choose> <b>예약 상세 &gt;</b></a>
												</div></li>
										</c:forEach>
									</ul>
								</c:if>
								<!---->
							</section>
							<section class="list_cancel">
								<h3>이용 내역</h3>
								<c:if test="${not empty resCompleteds}">
									<ul class="list_wrap">
										<c:forEach var="resCompleted" items="${resCompleteds}">

											<!-- 날짜 계산기 -->
											<c:set var="date1"
												value="${LocalDate.parse(resCompleted.checkindate)}" />
											<c:set var="date2"
												value="${LocalDate.parse(resCompleted.checkoutdate)}" />

											<c:set var="daysDifference"
												value="${ChronoUnit.DAYS.between(date1, date2)}" />
											<!-- //날짜 계산기 -->

											<c:set var="differenceInMilliseconds"
												value="${currentDate.time - sdf.parse(resCompleted.checkoutdate).time}" />
											<c:set var="differenceInDays"
												value="${differenceInMilliseconds / (24 * 60 * 60 * 1000)}" />


											<li class="reservation-detail"><div>
													<button type="button" class="btn_del"
														onclick="reserDelete(${resCompleted.no})">삭제</button>
													<p class="pic">
														<!-- src="${resCompleted.roomimage}" -->
														<img loading="lazy"
															src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/04/17/5e994464f3d0d.jpg"
															alt="${resCompleted.stayname}" class="align">
													</p>
													<a href="/resDetail?no=${resCompleted.no}"
														class="product-title"><i class="bg_w">${resCompleted.status}</i>
														<strong>${resCompleted.stayname}</strong> <c:choose>
															<c:when
																test="${resCompleted.checkindate == resCompleted.checkoutdate}">
																<span> ${resCompleted.checkindate} ~
																	${resCompleted.checkoutdate} • 대실 </span>
															</c:when>
															<c:otherwise>
																<span> ${resCompleted.checkindate} ~
																	${resCompleted.checkoutdate} • ${daysDifference}박</span>
															</c:otherwise>
														</c:choose> <b>예약 상세 &gt;</b></a>
													<p class="btn_re">
														<c:if test="${differenceInDays <= 7}">
															<a href="##" class="review"> 리뷰 쓰기 </a>
														</c:if>
														<a href="#"> 다시 예약 </a>
													</p>
												</div></li>
										</c:forEach>
									</ul>
								</c:if>
								<!---->
							</section>
							<section class="list_cancel">
								<h3>취소 내역</h3>
								<c:if test="${not empty resCancellations}">
									<ul class="list_wrap">
										<c:forEach var="resCancellation" items="${resCancellations}">

											<!-- 날짜 계산기 -->
											<c:set var="date1"
												value="${LocalDate.parse(resCancellation.checkindate)}" />
											<c:set var="date2"
												value="${LocalDate.parse(resCancellation.checkoutdate)}" />

											<c:set var="daysDifference"
												value="${ChronoUnit.DAYS.between(date1, date2)}" />
											<!-- //날짜 계산기 -->


											<li class="reservation-detail"><div>
													<button type="button" class="btn_del" onclick="reserDelete(${resCancellation.no})">삭제</button>
													<p class="pic">
														<!-- src="${resCancellation.roomimage}" -->
														<img loading="lazy"
															src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/04/17/5e994464f3d0d.jpg"
															alt="${resCancellation.stayname}" class="align">
													</p>
													<a href="/resDetail?no=${resCancellation.no}"
														class="product-title"><i class="bg_w">${resCancellation.status}</i>
														<strong>${resCancellation.stayname}</strong> <c:choose>
															<c:when
																test="${resCancellation.checkindate == resCancellation.checkoutdate}">
																<span> ${resCancellation.checkindate} ~
																	${resCancellation.checkoutdate} • 대실 </span>
															</c:when>
															<c:otherwise>
																<span> ${resCancellation.checkindate} ~
																	${resCancellation.checkoutdate} • ${daysDifference}박</span>
															</c:otherwise>
														</c:choose> <b>예약 상세 &gt;</b></a>
													<p class="btn_re">
														<a href="#"> 다시 예약 </a>
													</p>
												</div></li>
										</c:forEach>
									</ul>
								</c:if>
								<!---->
							</section>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
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
	</div>
</body>
</html>