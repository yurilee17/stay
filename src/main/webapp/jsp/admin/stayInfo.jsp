<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.care.stay.motel.MotelDTO" %>    
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>숙소 DB 등록</title>
  <link rel="stylesheet" href="../../resource/css/reset.css" type="text/css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 </head>
 <body>
	<br>
	<div id ="wrap">
		<div class="content">
			<!-- 숙소 탭 -->
			<div class="stay">
				<ul class="top_nav">
					<li><a href="#">메인</a></li>
					<li><a href="#">회원 DB 조회</a></li>
					<li><a href="${context }stayRegister">숙소 DB 등록</a></li>
					<li><a href="${context }stayInfo">숙소 DB 조회</a></li>
					<li><a href="#">예약 DB 조회</a></li>
				</ul>
			</div>
			<br>
			<!-- //숙소 탭 -->
			<br>
			<!-- 설명 -->
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<!-- 설명 -->
			<br>
			<br>						
			<select class="form_w30" name="stayType" id="stayType">
				<option value="모텔">모텔</option>
				<option value="호텔·리조트">호텔·리조트</option>
				<option value="펜션">펜션</option>
				<option value="게스트하우스">게스트하우스</option>												
				<option value="캠핑·글램핑">캠핑·글램핑</option>				
			</select>
			<br>
			<br>						
		<c:choose>
			<c:when test="${empty motels }">
				<h3> 등록된 숙소 DB가 없습니다. </h3>
			</c:when>
			<br>
			<br>						
			<c:otherwise>
			<table class="db_search">
				<colgroup>
					<col width="30%"></col>
					<col width="10%"></col>
					<col width="15%"></col>	
					<col width="*"></col>						
				</colgroup>
				<tr>
					<th>숙소 이름</th>
					<th>종류</th>
					<th>지역</th>
					<th>주소</th>
				</tr>
				
				<c:forEach var="motel" items="${ motels}">
					<tr onclick="location.href='#'" style="cursor:hand">
						<td>${motel.mname }</td>
						<td>모텔</td>
						<td>${motel.mregion }</td>
						<td>${motel.maddress }</td>
					</tr>
				</c:forEach>
			</table>
			</c:otherwise>
		</c:choose>	
			<div class="submit">
				<ul>
					<li><a href="${context }stayRegister">숙소 등록하기</a></li>
				</ul>
			</div>
		</div>
	</div>
 </body>
</html>
