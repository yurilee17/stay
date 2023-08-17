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

<!-- <script src="../../resource/js/myPage.js"></script>
<script src="../../resource/js/alert.js"></script> -->
<title>예약 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/reservationList.css">
<!-- <link rel="stylesheet" href="../../resource/css/alert.css"> -->

</head>
<body>

	<!-- Wrap -->
	<div class="wrap">

		<!-- Header -->
		<c:import url="/header" />

		<!-- Sub Top -->
		<div class="sub_top_wrap">
			<div class="sub_top">
				<h2>예약 내역</h2>
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
					<c:when test="${empty members || empty members || empty members}">
						<tr>
							<td colspan="5">등록된 데이터가 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<div class="reservationList">
							<section>
								<h3>예약 내역</h3>
								<%-- 	<tr>
										<!-- <td onclick="location.href='boardContent?no=${board.no }'">${member.id}</td> -->
										<td>${member.id}</td>
										<td>${member.mobile}</td>
										<td>${member.name}</td>
										<td>${member.nickname}</td>
										<td>${member.authority}</td>
									</tr> --%>
								<ul class="list_wrap">
									<c:forEach var="member" items="${members}">
										<li class="reservation-detail"><div>
												<button type="button" data-order-number="23072414001B62YE1"
													data-target-list="canceledList" class="btn_del">삭제</button>
												<p data-v-27382d40="" class="pic">
													<img loading="lazy"
														srcset="https://image.goodchoice.kr/resize_354x184/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg, https://image.goodchoice.kr/resize_531x276/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg 2x"
														src="./취향대로 머물다 여기어때_files/d511151f0676fbde711c39ffde4d07e5.jpg"
														alt="영등포 플로렌스" class="align">
												</p>
												<a href="#" class="product-title"><i class="bg_w">예약취소</i>
													<strong>영등포 플로렌스</strong> <span> 08.29 화 - 08.29 화 •
														대실 </span> <b>예약 상세 &gt;</b></a>
												<p class="btn_re">
													<a href="#"> 다시 예약 </a>
												</p>
											</div></li>
									</c:forEach>
								</ul>
								<!---->
							</section>
							<section class="list_cancel">
								<h3>이용 내역</h3>
								<ul class="list_wrap">
									<c:forEach var="member" items="${members}">
										<li class="reservation-detail"><div>
												<button type="button" data-order-number="23072414001B62YE1"
													data-target-list="canceledList" class="btn_del">삭제</button>
												<p data-v-27382d40="" class="pic">
													<img loading="lazy"
														srcset="https://image.goodchoice.kr/resize_354x184/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg, https://image.goodchoice.kr/resize_531x276/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg 2x"
														src="./취향대로 머물다 여기어때_files/d511151f0676fbde711c39ffde4d07e5.jpg"
														alt="영등포 플로렌스" class="align">
												</p>
												<a href="#" class="product-title"><i class="bg_w">예약취소</i>
													<strong>영등포 플로렌스</strong> <span> 08.29 화 - 08.29 화 •
														대실 </span> <b>예약 상세 &gt;</b></a>
												<p class="btn_re">
													<a href="#"> 다시 예약 </a>
												</p>
											</div></li>
									</c:forEach>
								</ul>
								<!---->
							</section>
							<section class="list_cancel">
								<h3>취소 내역</h3>
								<ul class="list_wrap">
									<c:forEach var="member" items="${members}">
										<li class="reservation-detail"><div>
												<button type="button" data-order-number="23072414001B62YE1"
													data-target-list="canceledList" class="btn_del">삭제</button>
												<p data-v-27382d40="" class="pic">
													<img loading="lazy"
														srcset="https://image.goodchoice.kr/resize_354x184/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg, https://image.goodchoice.kr/resize_531x276/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/adimg_new/74013/502858/d511151f0676fbde711c39ffde4d07e5.jpg 2x"
														src="./취향대로 머물다 여기어때_files/d511151f0676fbde711c39ffde4d07e5.jpg"
														alt="영등포 플로렌스" class="align">
												</p>
												<a href="#" class="product-title"><i class="bg_w">예약취소</i>
													<strong>영등포 플로렌스</strong> <span> 08.29 화 - 08.29 화 •
														대실 </span> <b>예약 상세 &gt;</b></a>
												<p class="btn_re">
													<a href="#"> 다시 예약 </a>
												</p>
											</div></li>
									</c:forEach>
								</ul>
								<!---->
							</section>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<footer> </footer>
	</div>
</body>
</html>