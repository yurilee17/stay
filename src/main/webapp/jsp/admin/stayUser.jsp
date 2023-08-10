<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="stay">
				<ul class="top_nav">
					<li><a href="${context }index">메인</a></li>
					<li><a href="/stayUser">회원 DB 조회</a></li>
					<li><a href="${context }stayRegister">숙소 DB 등록</a></li>
					<li><a href="${context }stayInfo">숙소 DB 조회</a></li>
					<li><a href="#">예약 DB 조회</a></li>
				</ul>
			</div>
			<!-- 문구 -->
			<h3>
				<span></span>
				<p>회원 조회</p>
			</h3>
			<!-- 회원 검색 -->
			<div class="userSearch">
				<select class="userAuth" name="userAuth" id="userAuth">
					<option>전체</option>
					<option>사용자</option>
					<option>관리자</option>
				</select>
				<form id="userSearchForm" class="searchForm">
					<input type="text" id="userSearchInput" placeholder="">
					<button type="submit">검색</button>
				</form>
				<select class="userSelet" name="userSelet" id="userSelet">
					<option>아이디</option>
					<option>휴대폰번호</option>
					<option>닉네임</option>
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
					<tr>
						<td>아이디</td>
						<td>휴대폰번호</td>
						<td>이름</td>
						<td>닉네임</td>
						<ttdh>권한
						</td>
					</tr>
				</table>
			</div>
			<!-- //등록 양식 -->
		</div>
	</div>
</body>
</html>
