<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
	<div class="withdraw">
		<div class="withdraw_popup__header">
			<div class="withdraw_title">
				<p>회원탈퇴</p>
				<svg onclick="goBack()" width="20" height="20" fill="none"
					xmlns="http://www.w3.org/2000/svg" class="">
									<path
						d="M10 8.586l5.657-5.657 1.414 1.414L11.414 10l5.657 5.657-1.414 1.414L10 11.414l-5.657 5.657-1.414-1.414L8.586 10 2.929 4.343 4.343 2.93 10 8.586z"
						fill="#000" fill-opacity=".8" data-v-5a4f86fc=""></path></svg>
			</div>
		</div>
		<div class="bottom-section">
			<c:choose>
				<c:when test="${fn:contains(sessionScope.id, 'kakao')}">
					<form class="bottom-section-f" id="withdrawForm"
						action="withdrawProc" method="post">
						<input type="hidden" name="id" id="id" value="${sessionScope.id}">
					</form>
					<div class="button-area">
						<button class="button-areaButton"
							onclick="withdrawForm.submit();">진짜 안녕</button>
					</div>
				</c:when>
				<c:otherwise>

					<form class="bottom-section-f" id="withdrawForm"
						action="withdrawProc" method="post">
						<div class="password-area">
							<label for="password" class="password-area__label">비밀번호
								입력</label> <input type="hidden" name="id" id="id"
								value="${sessionScope.id}"> <input id="password"
								name="password" type="password" autocomplete="off"
								placeholder="비밀번호를 입력하세요." class="password-area__input">
						</div>
					</form>
					<div class="button-area">
						<button disabled="disabled" class="button-areaButton"
							onclick="withdrawSendPw();">진짜 안녕</button>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<script src="../../resource/js/myPage.js"></script>
</body>
</html>