<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<script src="../../resource/js/dbQuiz.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">

<!-- CSS -->
<title>로그인 어때</title>
<link rel="stylesheet" href="../../resource/css/common.css">
</head>
<body class="pc">
	<!-- Wrap -->
	<div class="wrap show">
		<!-- Header -->
		<header></header>
		<div class="layer_fix layer_unfix pop_login pop_mem_reserve">
			<section>
				<form id="loginForm"
					action="loginProc"
					method="post">
					<div class="fix_title">
						<strong class="logo"><a href="/index">여기어때</a></strong>
					</div>
					<button type="button" id="kakao-login-btn" class="btn_start btn_kakao" data-device-type="W">
						<span><i><img src="../../resource/img/kakao.png" alt="kakao" width="20" height="20" style="vertical-align: middle"></i>카카오톡으로 로그인</span>
					</button>
					<p class="space_or">
						<span>또는</span>
					</p>
					<div class="inp_type_1 ico_email form-errors">
						<input type="email" name="id" placeholder="아이디"
							class="required" data-msg-required="아이디를 입력해 주세요." id="id">
						<button type="button" class="reset_val">초기화</button>
					</div>
					<label id="idError" class="help-block" for="id" style="color: red; display:none;">아이디를 입력해 주세요.</label> 
					<div class="inp_type_1 ico_pw form-errors">
						<input type="password" name="password" placeholder="비밀번호"
							class="required" data-msg-required="비밀번호를 입력해 주세요." id="password">
						<button type="button" class="reset_val">초기화</button>
					</div>
					<label id="pwError" class="help-block" for="password" style="color: red; display:none;">비밀번호를 입력해 주세요.</label>
					<button class="btn_link gra_left_right_red" type="button" onclick="loginCheck()">
						<span>로그인</span>
					</button>
					<div class="link_half">
						<div>
							<a href="/"><span>비밀번호 재설정</span></a>
						</div>
						<div>
							<a href="/register"><span>회원가입</span></a>
						</div>
					</div>
				</form>
			</section>
		</div>
		<!-- Footer -->
		<footer></footer>

	</div>
	<!-- //Wrap -->

</body>
</html>