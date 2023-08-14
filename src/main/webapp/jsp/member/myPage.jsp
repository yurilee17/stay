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

<script src="../../resource/js/test.js"></script>
<title>내정보 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/test.css">

</head>
<body>

${sessionScope.id}

	<!-- Wrap -->
	<div class="wrap">

		<!-- Header -->
		<c:import url="/header"/>

		<!-- Sub Top -->
		<div class="sub_top_wrap">
			<div class="sub_top bg_kong_2">
				<h2>내정보</h2>
			</div>
		</div>
		<!-- //Sub Top -->
		<!-- Content  -->
		<div id="content" class="sub_wrap my_wrap">
			<p class="sub_title">내 정보 관리</p>

			<!-- Nav -->
			<nav>
				<ul>
					<li><a class="" href="https://www.goodchoice.kr/my/points">포인트</a></li>
					<li><a class="" href="https://www.goodchoice.kr/my/coupon">쿠폰함</a></li>
					<li><a class=""
						href="https://www.goodchoice.kr/my/reserveList">예약 내역</a></li>
					<li><a class="active"
						href="https://www.goodchoice.kr/my/mypage">내 정보 관리</a></li>
					<li><a class=""
						href="https://www.goodchoice.kr/my/notiSetting">알림</a></li>
					<li><a href="https://q.egiftcard.kr/couponstatus/"
						target="_blank"> 여기어때 상품권 잔액 조회 </a></li>
				</ul>
			</nav>
			<div class="align_rt">
				<div class="mypage">
					<form name="form1"
						action="https://www.goodchoice.kr/my/mypageInfoUpdate"
						autocomplete="off" method="post" novalidate="novalidate"
						data-form="unick">
						<!-- 폼전송시 전달되는 data target element -->
						<div class="mypageForm__form-inputs-wrap" aria-hidden="true">
							<input type="hidden" name="uno" value="13689146"> <input
								type="text" name="unick" id="test1" aria-hidden="true"
								value="시끌시끌한우동"> <input type="text" name="uname"
								aria-hidden="true" value="이유리"> <input type="tel"
								name="uphone" aria-hidden="true" value="01091278625">
						</div>

						<input type="hidden" name="yeogi_token"
							value="7e1e577979428842684712e5dcd3690f"> <input
							type="hidden" id="utype" name="utype" value="1"> <input
							type="hidden" name="utype" value="1">
						<!--// 폼전송시 전달되는 data target element -->
						<section class="top_area">
							<strong>내 정보 수정</strong>
							<div class="login_info">
								<div>
									<img src="./여행할때 여기어때_mu_files/ico_21.png" alt="">
								</div>
								<p>ddf310@naver.com</p>
							</div>

							<div class="pw_input">
								<div class="pw_input__title">
									<b>닉네임</b> <span class="title__uinfo">시끌시끌한우동</span>
								</div>
								<section class="modifying-section" style="display: none;">
									<p class="inp_wrap remove form-errors">
										<input type="text" value="시끌시끌한우동"
											placeholder="체크인시 필요한 정보입니다." data-input="unick"
											data-msg-required="닉네임을 입력하세요." data-rule-minlength="2"
											data-rule-maxlength="14" data-rule-spacechar="true"
											data-rule-specialchar="true">
									</p>
									<button type="button" class="btn_etc btn_confirm active"
										onclick="changeNickname();">딴거할래요</button>
									<!-- 활성화 클래스 'active' -->
								</section>
								<div class="pw_input__btns-wrap">
									<button class="btns-wrap__edit-btn" type="button">수정</button>
									<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
									<button class="btns-wrap__cancel-btn" type="button">수정취소</button>
								</div>
							</div>
						</section>
					</form>
					<form name="form2"
						action="https://www.goodchoice.kr/my/mypageInfoUpdate"
						autocomplete="off" method="post" novalidate="novalidate"
						data-form="uname">
						<!-- 폼전송시 전달되는 data target element -->
						<div class="mypageForm__form-inputs-wrap" aria-hidden="true">
							<input type="hidden" name="uno" value="13689146"> <input
								type="text" name="unick" aria-hidden="true" value="시끌시끌한우동">
							<input type="text" name="uname" aria-hidden="true" value="이유리">
							<input type="tel" name="uphone" aria-hidden="true"
								value="01091278625">
						</div>
						<input type="hidden" name="yeogi_token"
							value="7e1e577979428842684712e5dcd3690f"> <input
							type="hidden" name="utype" value="1">

						<section class="top_area">
							<div class="pw_input">
								<div class="pw_input__title">
									<b>예약자 이름</b> <span class="title__uinfo">이유리</span>
								</div>
								<section class="modifying-section" style="display: none;">
									<p class="inp_wrap remove form-errors">
										<input type="text" id="uname" value=""
											placeholder="체크인시 필요한 정보입니다." data-input="uname"
											data-rule-spacechar="true" data-rule-specialchar="true">
									</p>
								</section>
								<div class="pw_input__btns-wrap">
									<button class="btns-wrap__edit-btn" type="button"
										style="android: attr/borderlessButtonStyle">수정</button>
									<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
									<button class="btns-wrap__cancel-btn" type="button"
										style="android: attr/borderlessButtonStyle">수정취소</button>
								</div>
							</div>
						</section>
					</form>

					<form name="form3"
						action="https://www.goodchoice.kr/my/mypageInfoUpdate"
						autocomplete="off" method="post" novalidate="novalidate"
						data-form="uphone">
						<section>
							<!-- 폼전송시 전달되는 data target element -->
							<div class="mypageForm__form-inputs-wrap" aria-hidden="true">
								<input type="hidden" name="uno" value="13689146"> <input
									type="text" name="unick" aria-hidden="true" value="시끌시끌한우동">
								<input type="text" name="uname" aria-hidden="true" value="이유리">
								<input type="tel" name="uphone" aria-hidden="true"
									value="01091278625">
							</div>
							<input type="hidden" name="yeogi_token"
								value="7e1e577979428842684712e5dcd3690f"> <input
								type="hidden" name="utype" value="1">
							<div class="pw_input phone_confirm">
								<div class="pw_input__title">
									<b>휴대폰 번호</b> <span class="title__uinfo">01091278625</span>
									<div class="safety_txt">개인 정보 보호를 위해 내 정보는 모두 안전하게
										암호화됩니다.</div>
								</div>
								<div class="modifying-section" style="display: none;">
									<div id="sendCode">
										<section>
											<div class="inp_wrap remove form-errors">
												<input type="tel" id="phone_number" value=""
													placeholder="체크인시 필요한 정보입니다." maxlength="13"
													data-input="uphone" data-msg-required="휴대폰 번호를 인증받으세요."
													data-rule-phonenumber="true">
												<button type="button" class="btn_checked">확인</button>
											</div>
											<button type="button" class="btn_send btn_confirm">인증번호
												전송</button>
											<!-- 활성화 클래스 'active' -->
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
												data-verification-type="call"
												data-verification-next="mypageVerify">확인</button>
										</section>
									</div>
									<input type="hidden" id="phone_certification_point"
										value="MYPAGE" style="display: none;">
								</div>
								<div class="pw_input__btns-wrap">
									<button class="btns-wrap__edit-btn " type="button">수정</button>
									<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
									<button class="btns-wrap__cancel-btn" type="button">수정취소</button>
								</div>
							</div>
						</section>
					</form>
					<!-- <button class="btn_submit disabled btn_one" type="submit">저장</button>-->

					<p class="bot_link">
						<a href="https://www.goodchoice.kr/my/mypagePwChange">비밀번호 변경</a>
						&gt;
					</p>
				</div>

				<div class="bot_btn">
					<p>여기어때를 이용하고 싶지 않으신가요?</p>
					<button type="button"
						onclick="pop_twobtn(&#39;ell&#39;,&#39;로그아웃 하시겠습니까?&#39;,&#39;취소&#39;,&#39;로그아웃&#39;,&#39;close_layer()&#39;,&#39;logoutPro()&#39;);">로그아웃</button>
					<button type="button">
						<a href="https://www.goodchoice.kr/my/withdraw">회원탈퇴</a>
					</button>
				</div>
			</div>
		</div>
		<!-- //Content  -->

		<!-- Footer -->
		<footer></footer>

	</div>

	<!-- //Wrap -->
</body>
</html>