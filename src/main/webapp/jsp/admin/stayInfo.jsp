<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 <script>
	 function showStayInfo() {
		  var stayType = document.getElementById("stayType");
		  var stayInfo = document.getElementsByClassName("stayInfo");
	
		  // 모든 서브 메뉴 감추기
		  for (var i = 0; i < stayInfo.length; i++) {
		    stayInfo[i].style.display = "none";
		  }
	
		  // 선택된 값에 따라 해당 서브 메뉴 표시
		  if (stayType.value === "모텔") {
		    document.getElementById("stayInfo").style.display = "table";
		  } else if (stayType.value === "호텔·리조트") {
		    document.getElementById("stayInfo2").style.display = "table";
		  } else if (stayType.value === "펜션") {
		    document.getElementById("stayInfo3").style.display = "table";
		  } else if (stayType.value === "게스트하우스") {
		    document.getElementById("stayInfo4").style.display = "table";
		  } else if (stayType.value === "캠핑·글램핑") {
		    document.getElementById("stayInfo5").style.display = "table";
		  }
		}
 
 </script>
 <body>
	<br>
	<div id ="wrap">
		<div class="content">
			<!-- 숙소 탭 -->
			<c:url var="adminHeaderUrl" value="/jsp/admin/adminheader.jsp" />
			<c:import url="${adminHeaderUrl}" />
			<!-- //숙소 탭 -->
			<!-- 설명 -->
			<br><br>
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<br>
			<!-- 설명 -->					
			<select class="form_w30" name="stayType" id="stayType" onchange="showStayInfo()">
				<option value="모텔">모텔</option>
				<option value="호텔·리조트">호텔·리조트</option>
				<option value="펜션">펜션</option>
				<option value="게스트하우스">게스트하우스</option>												
				<option value="캠핑·글램핑">캠핑·글램핑</option>				
			</select>	
			<br>
			<br>
			<br>
		<table id="stayInfo" class="stayInfo">
		<c:choose>
			<c:when test="${empty motels }">
				<h3>등록된 숙소 DB가 없습니다. </h3>
			</c:when>						
			<c:otherwise>
			<table class="db_search">
				<colgroup>
					<col width="10%"></col>
					<col width="10%"></col>					
					<col width="30%"></col>
					<col width="15%"></col>	
					<col width="*"></col>						
				</colgroup>
				<tr>
					<th>No.</th>
					<th>숙소 코드</th>
					<th>숙소 이름</th>
					<th>지역</th>
					<th>주소</th>
				</tr>
				<c:forEach var="motel" items="${ motels}">
					<tr>
						<td>${motel.no }</td>
						<td>${motel.mcode }${motel.no }</td>
						<td onclick="location.href='stayContent?no=${motel.no }'">
							${motel.mname }
						</td>
						<td>${motel.mregion }</td>
						<td>${motel.maddress }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						${result }
					</td>
				</tr>
			</table>
			</c:otherwise>
		</c:choose>	
		</table>
		<table id="stayInfo2" class="stayInfo" style="display: none;">		
		<c:choose>
			<c:when test="${empty hotels }">
				<h3>등록된 숙소 DB가 없습니다. </h3>
			</c:when>						
			<c:otherwise>
			<table class="db_search">
				<colgroup>
					<col width="10%"></col>
					<col width="10%"></col>					
					<col width="30%"></col>
					<col width="15%"></col>	
					<col width="*"></col>						
				</colgroup>
				<tr>
					<th>No.</th>
					<th>숙소 코드</th>
					<th>숙소 이름</th>
					<th>지역</th>
					<th>주소</th>
				</tr>
				<c:forEach var="hotel" items="${ hotels}">
					<tr>
						<td>${hotel.no }</td>
						<td>${hotel.hcode }${hotel.no }</td>
						<td onclick="location.href='stayContent?no=${hotel.no }'">
							${hotel.hname }
						</td>
						<td>${hotel.hregion }</td>
						<td>${hotel.haddress }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						${result }
					</td>
				</tr>
			</table>
			</c:otherwise>
		</c:choose>	
		</table>
		<table id="stayInfo3" class="stayInfo" style="display: none;">
		<c:choose>
			<c:when test="${empty pension }">
				<h3>등록된 숙소 DB가 없습니다. </h3>
			</c:when>						
			<c:otherwise>
			<table class="db_search">
				<colgroup>
					<col width="10%"></col>
					<col width="10%"></col>					
					<col width="30%"></col>
					<col width="15%"></col>	
					<col width="*"></col>						
				</colgroup>
				<tr>
					<th>No.</th>
					<th>숙소 코드</th>
					<th>숙소 이름</th>
					<th>지역</th>
					<th>주소</th>
				</tr>
				<c:forEach var="pension" items="${ pensions}">
					<tr>
						<td>${pension.no }</td>
						<td>${pension.pcode }${pension.no }</td>
						<td onclick="location.href='stayContent?no=${pension.no }'">
							${pension.pname }
						</td>
						<td>${pension.pregion }</td>
						<td>${pension.paddress }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						${result }
					</td>
				</tr>
			</table>
			</c:otherwise>
		</c:choose>			
		</table>
		<table id="stayInfo4" class="stayInfo" style="display: none;">
		<c:choose>
			<c:when test="${empty ghs }">
				<h3>등록된 숙소 DB가 없습니다. </h3>
			</c:when>						
			<c:otherwise>
			<table class="db_search">
				<colgroup>
					<col width="10%"></col>
					<col width="10%"></col>					
					<col width="30%"></col>
					<col width="15%"></col>	
					<col width="*"></col>						
				</colgroup>
				<tr>
					<th>No.</th>
					<th>숙소 코드</th>
					<th>숙소 이름</th>
					<th>지역</th>
					<th>주소</th>
				</tr>
				<c:forEach var="gh" items="${ ghs}">
					<tr>
						<td>${gh.no }</td>
						<td>${gh.mcode }${gh.no }</td>
						<td onclick="location.href='stayContent?no=${gh.no }'">
							${gh.mname }
						</td>
						<td>${gh.mregion }</td>
						<td>${gh.maddress }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						${result }
					</td>
				</tr>
			</table>
			</c:otherwise>
		</c:choose>			
		</table>
		<table id="stayInfo5" class="stayInfo" style="display: none;">
		<c:choose>
			<c:when test="${empty campings }">
				<h3>등록된 숙소 DB가 없습니다. </h3>
			</c:when>						
			<c:otherwise>
			<table class="db_search">
				<colgroup>
					<col width="10%"></col>
					<col width="10%"></col>					
					<col width="30%"></col>
					<col width="15%"></col>	
					<col width="*"></col>						
				</colgroup>
				<tr>
					<th>No.</th>
					<th>숙소 코드</th>
					<th>숙소 이름</th>
					<th>지역</th>
					<th>주소</th>
				</tr>
				<c:forEach var="camping" items="${ campings}">
					<tr>
						<td>${camping.no }</td>
						<td>${camping.mcode }${camping.no }</td>
						<td onclick="location.href='stayContent?no=${camping.no }'">
							${camping.mname }
						</td>
						<td>${camping.mregion }</td>
						<td>${camping.maddress }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						${result }
					</td>
				</tr>
			</table>
			</c:otherwise>
		</c:choose>			
		</table>		
			<div class="submit">
				<ul>
					<li><a href="${context }stayRegister">숙소 등록하기</a></li>
				</ul>
			</div>
		</div>
	</div>
 </body>
</html>
