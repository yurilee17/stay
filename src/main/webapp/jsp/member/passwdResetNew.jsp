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

<script src="js/passwdReset.js"></script>
<!-- <script src="js/dbQuiz.js"></script> -->
<title>비밀번호 재설정 어때</title>

<link rel="stylesheet preload" href="css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="css/passwdReset.css">
<!-- <link rel="stylesheet" href="css/common.css"> -->
</head>

<body>
	<!-- Wrap -->
	<div class="wrap">
		<!-- Header -->
		<header></header>
		<div class="passwdResetNew layer_unfix pop_login">
			<section>
				<form id="passwdNewForm" action="passwdResetProc" autocomplete="off"
					method="post" novalidate="novalidate">
					<input type="hidden" name="id" value="${id}" id="id"> <input
						type="hidden" name="mobile" value="${mobile}" id="mobile">
					<strong class="sub_title">새 비밀번호 설정</strong>

					<p class="txt_top">
						인증이 완료되었습니다.<br> 새로운 비밀번호를 입력해주세요.
					</p>

					<div class="inp_type_1 ico_pw pw">
						<input type="password" name="password"
							placeholder="새 비밀번호(최소 8자 이상)" id="password" aria-invalid="false">
						<label id="new_pw_msg" class="validate_msg_label"></label>
					</div>
					<div class="inp_type_1 ico_pw confirmPw">
						<input type="password" name="confirm_passwd" id="confirm_passwd"
							placeholder="새 비밀번호 확인"> <label id="new_pw_re_msg"
							class="validate_msg_label" Style="color: red;"></label>
					</div>

					<button type="button" onclick="changePwSubmit();"
						class="btn_link gra_left_right_red btn_user_submit" disabled="">
						<span>비밀번호 변경</span>
					</button>

				</form>
			</section>
		</div>
		<!-- Footer -->
		<footer></footer>
	</div>
	<!-- //Wrap -->
	<script src="js/passwdReset.js"></script>
</body>
</html>