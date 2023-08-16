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
<title>탈퇴 안하는거 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/myPage.css">
<link rel="stylesheet" href="../../resource/css/alert.css">

</head>
<body>


	<script>
		var deviceWidth = window.innerWidth;
		document.body.className = deviceWidth > 1023 ? "pc" : "mobile"
	</script>
	<div id="__nuxt">
		<!---->
		<div id="__layout">
			<div>
				<div class="withdraw_popup_container" data-v-5a4f86fc=""
					data-v-232f3a7c="">
					<div class="withdraw_popup" data-v-5a4f86fc="">
						<div class="withdraw_popup__header" data-v-5a4f86fc="">
							<div class="withdraw_title" data-v-5a4f86fc="">
								<p data-v-5a4f86fc="">회원탈퇴</p>
								<svg width="20" height="20" fill="none"
									xmlns="http://www.w3.org/2000/svg" data-v-5a4f86fc="" class="">
									<path
										d="M10 8.586l5.657-5.657 1.414 1.414L11.414 10l5.657 5.657-1.414 1.414L10 11.414l-5.657 5.657-1.414-1.414L8.586 10 2.929 4.343 4.343 2.93 10 8.586z"
										fill="#000" fill-opacity=".8" data-v-5a4f86fc=""></path></svg>
							</div>
						</div>

						<form data-v-22fc3129="" class="bottom-section">
							<div data-v-22fc3129="" class="password-area">
								<label data-v-22fc3129="" for="password"
									class="password-area__label">비밀번호 입력</label> <input
									data-v-22fc3129="" id="password" type="password"
									autocomplete="off" placeholder="비밀번호를 입력하세요."
									class="password-area__input">
							</div>
							<div data-v-22fc3129="" class="button-area">
								<button data-v-22fc3129="" disabled="disabled"
									class="button-area__button is-accept">다음 단계로</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>