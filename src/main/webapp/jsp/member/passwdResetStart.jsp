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
<link rel="stylesheet" href="../../resource/css/passwdResetStrat.css">
<!-- <link rel="stylesheet" href="../../resource/css/common.css"> -->
</head>

<body>
	<!-- Wrap -->
	<div class="wrap">
		<!-- Header -->
		<header></header>
		<!-- 로그인 pop_layer_w('pop_login') -->
		<div class="passwdResetStrat">
			<section>
				<form id="idSearchForm" action="passwdPhoneConfirm"
					autocomplete="off" method="post" novalidate="novalidate">
					<strong class="sub_title">비밀번호 재설정</strong>
					<p class="txt_top">회원가입 시 등록한 아이디를 입력해 주세요.</p>
					<div class="inp_type_1 ico_email">
						<!-- focus / err -->
						<input type="text" name="id" placeholder="아이디" required=""
							class="required" id="id"> <label id="id-error"
							class="error" for="id" style="color: red; display: none;">아이디를
							확인해주세요.</label>
					</div>

					<button type="button" data-js-validate-email=""
						class="btn_link gra_left_right_red" disabled=""
						onclick="idCheck()">
						<span>확인</span>
					</button>
				</form>
			</section>
		</div>
		<!-- Footer -->
		<footer></footer>
	</div>
	<script src="../../resource/js/passwdReset.js"></script>
</body>
</html>