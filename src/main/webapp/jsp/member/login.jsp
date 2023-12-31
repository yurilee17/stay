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

<script src="js/login.js"></script>
<!-- <script src="js/dbQuiz.js"></script> -->
<title>로그인 어때</title>

<link rel="stylesheet preload" href="css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="css/login.css">
<!-- <link rel="stylesheet" href="css/common.css"> -->
</head>

<body>
	<!-- Wrap -->
	<div class="wrap">
		<!-- Header -->
		<header></header>
		<!-- 로그인 여부 확인을 위한 부분 삭제 필요 -->
		<h3>${sessionScope.id}</h3>
		<script>
			showAlert("${alert}");
		</script>
		<div class="login">
			<section>
				<form id="loginForm" action="loginProc" method="post">
					<div class="fix_title">
						<strong class="logo"><a href="index">저기어때</a></strong>
					</div>
					<button type="button" id="kakao-login-btn"
						class="btn_start btn_kakao" onclick="goToKakao()">
						<span><i><img src="img/kakao.png"
								alt="kakao" width="20" height="20"
								style="vertical-align: middle"></i>카카오톡으로 로그인</span>
					</button>
					<p class="space_or">
						<span>또는</span>
					</p>
					<div class="inp_type_1 ico_email">
						<!-- 선택 시 inp_focus 추가/에러 발생 시 inp_error 추가-->
						<input type="text" name="id" placeholder="아이디" id="id"> <label
							id="idError" class="help-block"
							style="color: red; display: none;">아이디를 입력해 주세요.</label>
						<button type="button" class="reset_val">초기화</button>
						<!-- 입력 받으면 show 추가-->
					</div>

					<div class="inp_type_1 ico_pw">
						<!-- 선택 시 inp_focus 추가/에러 발생 시 inp_error 추가-->
						<input type="password" name="password" placeholder="비밀번호"
							id="password"> <label id="pwError" class="help-block"
							style="color: red; display: none;">비밀번호를 입력해 주세요.</label>
						<button type="button" class="reset_val">초기화</button>
						<!-- 입력 받으면 show 추가-->
					</div>

					<button class="btn_link gra_left_right_red" type="button"
						onclick="loginCheck()">
						<span>로그인</span>
					</button>
					<div class="link_half">
						<div>
							<a href="passwdResetStart"><span>비밀번호 재설정</span></a>
						</div>
						<div>
							<a href="phoneConfirm"><span>회원가입</span></a>
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