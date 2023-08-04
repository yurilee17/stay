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

<script src="../../resource/js/register.js"></script>
<!-- <script src="../../resource/js/dbQuiz.js"></script> -->
<title>회원가입 어때</title>

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<link rel="stylesheet" href="../../resource/css/register.css">
<!-- <link rel="stylesheet" href="../../resource/css/common.css"> -->
</head>
<body>
	<!-- Wrap -->
	<div class="wrap">
		<!-- Header -->
		<header></header>
		<div class="register pop_login pop_mem_reserve fix_disable">
			<section>
				<form id="regForm" action="regProc" method="post">
					<input type="hidden" name="mobile" id="mobile"
						value="${param.mobile}">
					<div class="fix_title">
						<h1>
							<a href="/index" title="여기어때">여기어때</a>
						</h1>
					</div>
					<%
					String paramId = request.getParameter("id");
					if (paramId == null) {
					%>
					<div class="join">
						<strong class="sub_title">회원가입</strong> <b>아이디</b>
						<div class="inp_type_2 form-errors">
							<!-- focus / err -->
							<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요.">
							<label id="userId_msg" class="validate_msg_label"
								style="color: red;"></label>
						</div>

						<b>비밀번호</b>
						<div class="inp_type_2 form-errors form-password-rule">
							<input type="password" name="password"
								placeholder="비밀번호를 입력해주세요." id="password"> <label
								id="new_pw_msg" class="validate_msg_label"></label>
						</div>

						<b>비밀번호 확인</b>
						<div class="inp_type_2 form-errors">
							<input type="password" name="newPwRe" placeholder="비밀번호를 입력해주세요."
								id="newPwRe"> <label id="new_pw_re_msg"
								class="validate_msg_label"></label>
						</div>

						<b>닉네임</b>
						<div class="inp_type_2 form-errors btn-add">
							<input type="text" id="nickname" name="nickname" class="required"
								data-rule-minlength="2" data-rule-maxlength="14"
								data-rule-spacechar="true" data-rule-specialchar="true">
							<!-- <label id="unick-error" class="error help-block default_label_txt icon-ic_downwards_arrow" for="unick">추천 닉네임이에요!</label>  -->
							<button type="button" class="btn_etc" onclick="changeNickname();">딴거할래요</button>
							<label id="unick-error" class="validate_msg_label"></label>
						</div>

						<button type="button" id="joinBtn" class="btn_link"
							onclick="sendId()">가입하기</button>
					</div>
					<%
					} else {
					%>
					<div class="join">
						<strong class="sub_title">회원가입</strong> <b>아이디</b>
						<div class="inp_type_2 form-errors">
							<!-- focus / err -->
							<input type="text" name="id" id="id" value="${param.id}" readonly>
							<label id="userId_msg" class="validate_msg_label"
								style="color: red;"></label>
						</div>
						<div class="inp_type_2 form-errors form-password-rule"
							style="display: none">
							<input type="hidden" name="password" value="kakao0000"
								id="password"> <label id="new_pw_msg"
								class="validate_msg_label"></label>
						</div>
						<div class="inp_type_2 form-errors" style="display: none">
							<input type="hidden" name="newPwRe" value="kakao0000"
								id="newPwRe"> <label id="new_pw_re_msg"
								class="validate_msg_label"></label>
						</div>

						<b>닉네임</b>
						<div class="inp_type_2 form-errors btn-add">
							<input type="text" id="nickname" name="nickname" class="required"
								data-rule-minlength="2" data-rule-maxlength="14"
								data-rule-spacechar="true" data-rule-specialchar="true">
							<!-- <label id="unick-error" class="error help-block default_label_txt icon-ic_downwards_arrow" for="unick">추천 닉네임이에요!</label>  -->
							<button type="button" class="btn_etc" onclick="changeNickname();">딴거할래요</button>
							<label id="unick-error" class="validate_msg_label"></label>
						</div>

						<button type="button" id="joinBtn" class="btn_link active"
							onclick="sendId()">가입하기</button>
					</div>
					<%
					}
					%>
				</form>
			</section>
		</div>
		<!-- footer -->
		<footer> </footer>
	</div>
	<script>
		
	</script>
	<script src="../../resource/js/register.js"></script>
	<!-- //Wrap -->
</body>
</html>