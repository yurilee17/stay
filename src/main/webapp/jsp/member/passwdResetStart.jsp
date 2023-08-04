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

<script src="../../resource/js/test.js"></script>
<!-- <script src="../../resource/js/dbQuiz.js"></script> -->
<title>비밀번호 재설정 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/test.css">
<!-- <link rel="stylesheet" href="../../resource/css/common.css"> -->
</head>

<body>
	<!-- Wrap -->
	<div class="wrap">
		<!-- Header -->
		<header></header>
		<!-- 로그인 pop_layer_w('pop_login') -->
		<div
			class="layer_fix layer_unfix pop_login pop_mem_reserve new-style-form">
			<section>
				<form id="loginForm"
					action="https://www.goodchoice.kr/user/passwdResetEmailCheck"
					autocomplete="off" method="post" novalidate="novalidate">
					<input type="hidden" name="returnUrl" value=""> <input
						type="hidden" name="yeogi_token"
						value="d43c07d7e488c19f1eec5f9c4a2f7957"> <strong
						class="sub_title">비밀번호 재설정</strong>
					<p class="txt_top">회원가입 시 등록한 이메일 주소를 입력해 주세요.</p>

					<div class="pop_login_errors">
						<ul>
						</ul>
					</div>

					<div class="inp_type_1 ico_email form-errors">
						<!-- focus / err -->
						<input type="email" name="uid" placeholder="이메일 주소" required=""
							class="required" value="" data-msg-required="이메일 주소를 확인해 주세요.">
						<button type="button" class="reset_val">초기화</button>
					</div>

					<button type="submit" data-js-validate-email=""
						class="btn_link gra_left_right_red" disabled="">
						<span>확인</span>
					</button>
				</form>
			</section>
		</div>
		<!-- Footer -->
		<footer></footer>
	</div>
</body>
</html>