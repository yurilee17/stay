<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">

<script src="../../resource/js/passwdReset.js"></script>
<!-- <script src="../../resource/js/dbQuiz.js"></script> -->
<title>비밀번호 재설정 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/passwdReset.css">
<!-- <link rel="stylesheet" href="../../resource/css/common.css"> -->
</head>

<body>
	<!-- Wrap -->
	<div class="wrap">
		<!-- Header -->
		<header></header>
		<div class="passwdPhoneConfirm">
			<section>
				<form id="PhoneConfirmForm" action="passwdResetNew"
					autocomplete="off" method="post" novalidate="novalidate">
					<input type="hidden" name="id" value="${id}" id="id"> <input
						type="hidden" name="mobile" value="${mobile}" id="mobile">

					<strong class="sub_title">인증번호 입력</strong>

					<p class="txt_top">
						등록된 휴대폰 번호로 인증번호가 전송되었습니다.<br> 인증번호를 입력해주세요.
					</p>

					<div class="input-component__type1">
						<strong>인증번호</strong>
						<div class="input-wrap">
							<input type="tel" name="digit" id="digit" maxlength="4"
								placeholder="인증번호를 입력해주세요."> <span class="timer">03:00</span>
						</div>
						<div class="error-wrap">
							<span id="error">입력시간을 초과하였습니다.<br>인증번호를 재전송해주세요.
							</span>
							<button type="button" id="btnSend" onclick="btnSendd()">인증번호
								재전송</button>
						</div>
					</div>

					<button type="button" class="btn_link gra_left_right_red btn_ok"
						disabled="" onclick="btnOk()">
						<span>확인</span>
					</button>

				</form>
			</section>
		</div>
		<!-- Footer -->
		<footer></footer>
		<script src="../../resource/js/passwdReset.js"></script>
	</div>
	<!-- //Wrap -->
</body>
</html>