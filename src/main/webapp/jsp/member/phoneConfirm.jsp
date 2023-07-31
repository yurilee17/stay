<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Google Tag Manager -->
<!--<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/js"></script>
<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/js(1)"></script>
<script async="" src="./회원 가입 _ 여기어때 번호 전송_files/analytics.js.다운로드"></script>
<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/analytics.js.다운로드"></script>
<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/js(2)"></script>
<script async="" src="./회원 가입 _ 여기어때 번호 전송_files/gtm.js.다운로드"></script>
<script>
    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push(
    {'gtm.start': new Date().getTime(),event:'gtm.js'}
    );var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-PF7DJTT');</script>-->
<!-- End Google Tag Manager -->
<!-- <script type="text/javascript" 
	src="./회원 가입 _ 여기어때 번호 전송_files/jquery-1.12.4.min.js"></script> -->

<!-- <script>
var _BASE_URL = 'https://www.goodchoice.kr/';
var _MOBILE = 'W';
var _KAKAOTALK_APP_KEY = 'f6ffb505bb11d7cc3584d443ce35f704';
var _FACEBOOK_APP_ID = '607467975974643';
</script> -->
<!--<script>(function(a,b,c){if(c in b&&b[c]){var d,e=a.location,f=/^(a|html)$/i;a.addEventListener("click",function(a){d=a.target;while(!f.test(d.nodeName))d    =d.parentNode;"href"in d&&(d.href.indexOf("http")||~d.href.indexOf(e.host))&&(a.preventDefault(),e.href=d.href)},!1)}})(document,window.navigator,"standalone")</script>
-->

<!--<script attributionsrc="" type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/f.txt"></script>-->
<!--<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/f(1).txt"></script>-->
<!-- CSS -->
<title>회원가입 어때</title>
<link rel="stylesheet" href="../../resource/css/register.css">
<!--<link rel="stylesheet" href="../../resource/css/common.css"> -->
	<!-- Google Tag Manager (noscript) -->
	<!--<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PF7DJTT"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>-->
	<!-- End Google Tag Manager (noscript) -->
		<!-- Custom Style -->
		<!--	<style type="text/css">
.validate_msg_label {
	margin-top: 20px;
	display: inline-block;
	font-size: 13px;
	color: red;
}

.inp_type_2 {
	padding: 0 10px;
}
</style>
 -->

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<script src="../../resource/js/dbQuiz.js"></script>

</head>
<body>
	<!-- Wrap -->
	<div class="wrap">
		<div class="register layer_fix pop_login pop_mem_reserve">
			<section>
				<div class="fix_title">
					<strong>휴대폰 본인 확인</strong>
				</div>
				<p>원활한 서비스 제공을 위해, 휴대폰 번호를 입력해주세요.</p>
				<div class="phone_confirm">
					<div id="sendCode">
						<strong>휴대폰 번호</strong>
						<section>
							<div class="inp_wrap remove">
								<input type="tel" id="phone" name="phone" maxlength="13">
								<!--<input type="tel" id="mobile" maxlength="13"> -->
								<button type="button" class="btn_checked"
									style="display: inline-block;">확인</button>
							</div>
							<button type="button" class="btn_send btn_confirm" id="nemButton"
								name="nemButton">인증번호 전송</button>
							<button type="button" class="btn_send btn_confirm dbclicked"
								style="display: none;">재전송</button>
							<!-- 활성화 클래스 'active' -->
							<script>
							    phoneNum(); // 함수 호출
							  </script>
						</section>
					</div>
					<div id="verificationCode" style="display: none;">
						<strong>인증번호</strong>
						<section>
							<div class="inp_wrap remove">
								<input type="tel" id="digit" minlength="4" maxlength="4">
								<span class="timer">02:45</span>
							</div>
							<button type="button" class="btn_ok btn_confirm"
								data-verification-type="call"
								data-verification-next="joinTemplate">확인</button>
						</section>
					</div>
					<input type="hidden" id="phone_certification_point" value="SIGINUP"
						style="display: none;">
				</div>
			</section>
		</div>
	</div>
	<!-- //Wrap -->
</body>
</html>