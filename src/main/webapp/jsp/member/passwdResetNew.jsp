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
		<div
			class="passwdResetNew layer_unfix pop_login pop_mem_reserve new-style-form">
			<section>
				<form id="passwdNewForm" action="login" autocomplete="off" method="post"
					novalidate="novalidate">

					<strong class="sub_title">새 비밀번호 설정</strong>

					<p class="txt_top">
						인증이 완료되었습니다.<br> 새로운 비밀번호를 입력해주세요.
					</p>

					<div
						class="inp_type_1 ico_pw form-errors form-password-rule input-pw-div">
						<input type="password" name="passwd"
							placeholder="새 비밀번호(최소 8자 이상)" id="new_pw" aria-invalid="false">
						<label id="new_pw_msg" class="validate_msg_label"
							style="color: red;">사용불가 : 최소 8자 이상 입력해주세요.</label>
						<button type="button" class="reset_val show">초기화</button>
					</div>
					<div class="inp_type_1 ico_pw form-errors">
						<input type="password" name="confirm_passwd" id="new_pw_re"
							placeholder="새 비밀번호 확인"> <label id="new_pw_re_msg"
							class="validate_msg_label"></label>
						<button type="button" class="reset_val">초기화</button>
					</div>

					<button type="button" onclick="changePwSubmit();"
						class="btn_link gra_left_right_red btn_user_submit" disabled=""
						style="background-color: rgb(250, 250, 250); color: rgba(0, 0, 0, 0.16); border: none;">
						<span>비밀번호 변경</span>
					</button>

				</form>
			</section>
		</div>
		<!-- Footer -->
		<footer></footer>
	</div>
	<!-- //Wrap -->
</body>
</html>