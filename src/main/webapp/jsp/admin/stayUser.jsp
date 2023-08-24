<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>회원 DB 조회</title>
<link rel="stylesheet" href="../../resource/css/reset.css"
	type="text/css">
<link rel="stylesheet" href="../../resource/css/stayUser.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
	<div id="wrap" class="stayUser">
		<div class="content">
			<!-- 숙소 탭 -->
			<c:url var="adminHeaderUrl" value="/jsp/admin/adminheader.jsp" />
			<c:import url="${adminHeaderUrl}" />
			<!-- 문구 -->
			<h3>회원 조회</h3>
			<!-- 회원 검색 -->
			<div class="userSearch">
				<!-- <select class="userAuth" id="userAuth"
					onchange="selectAuth(this.value)">
					<option value="">전체</option>
					<option value="user">사용자</option>
					<option value="admin">관리자</option>
				</select> -->
				<c:set var="option2Name" value="${param.option2Name}" />
				<c:set var="option2" value="${param.option2}" />
				<c:choose>
					<c:when test="${empty option2Name}">
						<form id="userSearchForm" class="searchForm">
							<input type="text" id="userSearchInput" placeholder="">
							<button type="button" onclick="searchButton()">검색</button>
						</form>

					</c:when>
					<c:otherwise>
						<input type="hidden" id="paramOption2Name" value="${param.option2Name}">
						<form id="userSearchForm" class="searchForm">
							<input type="text" id="userSearchInput" placeholder=""
								value="${option2}">
							<button type="button" onclick="searchButton()">검색</button>
						</form>
					</c:otherwise>
				</c:choose>
				<select class="userSelet" id="userSelet"
					onchange="infoName(this.value)">
					<option disabled selected value="">검색 조건</option>
					<option value="id">아이디</option>
					<option value="mobile">휴대폰번호</option>
					<option value="name">이름</option>
					<option value="nickname">닉네임</option>
				</select>
			</div>
			<div clss="list">
				<table class="userInfo">
					<colgroup>
						<col width="20%"></col>
						<col width="20%"></col>
						<col width="20%"></col>
						<col width="20%"></col>
						<col width="*"></col>
					</colgroup>
					<tr>
						<th>아이디</th>
						<th>휴대폰번호</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>권한</th>
					</tr>
					<c:choose>
						<c:when test="${empty members}">
							<tr>
								<td colspan="5">등록된 데이터가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="member" items="${members}">
								<tr>
									<!-- <td onclick="location.href='boardContent?no=${board.no }'">${member.id}</td> -->
									<td>${member.id}</td>
									<td>${member.mobile}</td>
									<td>${member.name}</td>
									<td>${member.nickname}</td>
									<td>${member.authority}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<div class="pageNum">${result }</div>
			</div>
			<!-- //등록 양식 -->
		</div>
	</div>
	<script src="../../resource/js/stayUser.js"></script>
</body>
</html>
