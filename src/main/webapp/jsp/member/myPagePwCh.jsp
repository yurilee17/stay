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
				<div class="myPagePwCh">
					<form id="mypageForm" action="newPasswdProc" autocomplete="off" method="post"
						novalidate="novalidate">
						<input type="hidden" name="id" value="${sessionScope.id}" id="id">
						<section>
							<strong>비밀번호 변경</strong>
							<div class="pw_input">
								<b>기존 비밀번호</b>
								<p class="inp_wrap remove form-errors">
									
										<input type="password" name="originalPw" id="originalPw"
										placeholder="기존 비밀번호를 입력해 주세요.">
								</p>
								<label id="original_pw_msg" class="validate_msg_label"></label>


							</div>
							<div class="pw_input1">
								<b>새 비밀번호</b>
								<p class="inp_wrap remove form-errors form-user-password-rule">
									<input type="password" name="password" id="password"
										placeholder="비밀번호(최소 8자 이상)">
								</p>
								<label id="new_pw_msg" class="validate_msg_label"></label>

							</div>
							<div class="pw_input">
								<b>새 비밀번호 확인</b>
								<p class="inp_wrap remove form-errors">
									<input type="password" placeholder="변경할 비밀번호를 재입력해 주세요."
										name="new_pw_re" id="newPwRe">
								</p>
								<label id="new_pw_re_msg" class="validate_msg_label"></label>
							</div>
						</section>

						<p class="bot_link">
							<a href="/myPage">내 정보 수정 </a> &gt;
						</p>

						<button class="btn_red_fill btn_one btn_user_submit" type="button"
							onclick="sendPw();" disabled=""
							>변경</button>
					</form>
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
					<button onclick="alerOne()">확인</button>
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