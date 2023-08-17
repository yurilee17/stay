<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">

<script src="../../resource/js/myPage.js"></script>
<script src="../../resource/js/alert.js"></script>
<title>내정보 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/myPage.css">
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
		<!-- Content  -->
		<div id="content" class="sub_wrap">

			<!-- Nav -->
			<nav>
				<ul>
					<li><a class="" href="#">예약 내역</a></li>
					<li><a class="active" href="/myPage">내 정보 관리</a></li>
				</ul>
			</nav>
			<div class="align_rt">
				<div class="myPage">
					<form id="form1" action="updateNicknameProc" method="post">
						<section class="top_area">
							<strong>내 정보 수정</strong>
							<div class="login_info">
								<div>
									<img src="https://image.goodchoice.kr/profile/ico/ico_21.png"
										alt="">
								</div>
								<p>${sessionScope.id}</p>
							</div>

							<div class="pw_input">
								<div class="pw_input__title">
									<b>닉네임</b> <span class="title__uinfo">${sessionScope.nickname}</span>
								</div>
								<section id="section1" class="modifying-section"
									style="display: none;">
									<p class="inp_wrap inp_wrap1">
										<input type="hidden" name="id" value="${sessionScope.id}">
										<input type="hidden" id="infoNickname"
											value="${sessionScope.nickname}"> <input type="text"
											id="nickname" name="nickname"
											value="${sessionScope.nickname}"
											placeholder="체크인시 필요한 정보입니다." data-input="unick"
											data-rule-minlength="2" data-rule-maxlength="14"
											data-rule-spacechar="true" data-rule-specialchar="true">
										<label id="error1" class="error" for=""></label>
									</p>
									<!-- 		<button type="button" class="btn_confirm active"
										onclick="changeNickname();">딴거할래요</button> -->
									<!-- 활성화 클래스 'active' -->
								</section>
								<div class="pw_input__btns-wrap">
									<button id="edit1" class="btns-wrap__edit-btn" type="button"
										onclick="edit1Bt()">수정</button>
									<button id="submit1" class="btns-wrap__submit-btn"
										type="button" onclick="sendNickname()">수정완료</button>
									<button id="cancel1" class="btns-wrap__cancel-btn"
										type="button" onclick="cancel1Bt()">수정취소</button>
								</div>
							</div>
						</section>
					</form>
					<form name="form2" action="updateNameProc" autocomplete="off"
						method="post" novalidate="novalidate" data-form="uname">
						<section class="top_area">
							<div class="pw_input">
								<div class="pw_input__title">
									<b>예약자 이름</b> <span class="title__uinfo">${sessionScope.name}</span>
								</div>
								<section id="section2" class="modifying-section"
									style="display: none;">
									<p class="inp_wrap inp_wrap2">
										<input type="hidden" name="id" value="${sessionScope.id}">
										<input type="hidden" id="infoName"
											value="${sessionScope.name}"> <input type="text"
											id="name" name="name" value="" placeholder="체크인시 필요한 정보입니다."
											data-input="uname" data-rule-spacechar="true"
											data-rule-specialchar="true"> <label id="error2"
											class="error help-block" for=""></label>
									</p>
								</section>
								<div class="pw_input__btns-wrap">
									<button id="edit2" class="btns-wrap__edit-btn" type="button"
										onclick="edit2Bt()">수정</button>
									<button id="submit2" class="btns-wrap__submit-btn"
										type="button" onclick="updateName()">수정완료</button>
									<button id="cancel2" class="btns-wrap__cancel-btn"
										type="button" onclick="cancel2Bt()">수정취소</button>
								</div>
							</div>
						</section>
					</form>

					<form name="form3" action="updateMobileProc" autocomplete="off"
						method="post" novalidate="novalidate" data-form="uphone">
						<section class="bord">
							<div class="pw_input phone_confirm">
								<div class="pw_input__title">
									<b>휴대폰 번호</b> <span class="title__uinfo">${sessionScope.mobile}</span>
									<div class="safety_txt">개인 정보 보호를 위해 내 정보는 모두 안전하게
										암호화됩니다.</div>
								</div>
								<div id="section3" class="modifying-section"
									style="display: none;">
									<div id="sendCode">
										<section>
											<div class="inp_wrap inp_wrap3 remove form-errors">
												<input type="hidden" name="id" value="${sessionScope.id}">
												<input type="tel" id="mobile" name="mobile" value=""
													placeholder="체크인시 필요한 정보입니다." maxlength="13"
													data-input="uphone" data-msg-required="휴대폰 번호를 인증받으세요."
													data-rule-phonenumber="true"> <label id="error3"
													class="error help-block" for=""></label>
											</div>
											<button type="button" class="btn_send btn_confirm"
												onclick="btnSend()">인증번호 전송</button>
										</section>
									</div>
									<div id="verificationCode" style="display: none;">
										<b>인증 번호</b>
										<section>
											<div class="inp_wrap remove">
												<input type="tel" id="digit" minlength="4" maxlength="4">
												<span class="timer">&nbsp;</span>
											</div>
											<button type="button" class="btn_ok btn_confirm"
												onclick="btnOk()">확인</button>
										</section>
									</div>
									<input type="hidden" id="phone_certification_point"
										value="MYPAGE" style="display: none;">
								</div>
								<div class="pw_input__btns-wrap">
									<button id="edit3" class="btns-wrap__edit-btn " type="button"
										onclick="edit3Bt()">수정</button>
									<button id="submit3" class="btns-wrap__submit-btn"
										type="submit">수정완료</button>
									<button id="cancel3" class="btns-wrap__cancel-btn"
										type="button" onclick="cancel3Bt()">수정취소</button>
								</div>
							</div>
						</section>
					</form>
					<!-- <button class="btn_submit disabled btn_one" type="submit">저장</button>-->
					<c:choose>
						<c:when test="${fn:contains(sessionScope.id, 'kakao')}"></c:when>
						<c:otherwise>
							<p class="bot_link">
								<a href="/myPagePwCh">비밀번호 변경</a> &gt;
							</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="bot_btn">
					<p>여기어때를 이용하고 싶지 않으신가요?</p>
					<button type="button" onclick="alerTwoBtn('로그아웃 하시겠습니까?','로그아웃');">로그아웃</button>
					<button type="button">
						<a href="/withdraw">회원탈퇴</a>
					</button>
				</div>
			</div>
		</div>
		<!-- //Content  -->

		<!-- Footer -->
		<footer></footer>
		<!-- 알림 -->
		<div class="alert">
			<!-- alert -->
			<div class="popOnebtn">
				<div class="btnOneText"></div>
				<div class="btn_wrap">
					<button onclick="reset()">확인</button>
				</div>
			</div>
			<!-- Bg Dimm -->
			<div class="bgOneDimm" onclick="">&nbsp;</div>

		</div>
	</div>
	<script src="../../resource/js/myPage.js"></script>
	<!-- //Wrap -->
</body>
</html>