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
			<form id="stayTypeForm" action="stayInfo" method="GET">
  			<select class="form_w30" name="stayType" id="stayType" onchange="showStayInfo(this.value);">
				<option value="motel">모텔</option>
				<option value="hotel">호텔·리조트</option>
				<option value="pension">펜션</option>
				<option value="gh">게스트하우스</option>												
				<option value="camping">캠핑·글램핑</option>	
				<input type="submit" value="Submit" style="display: none;">			
			</select>
			</form>	
			<br>
			<br>
			<br>
		<table id="stayList" class="stayList">
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
						<td onclick="location.href='stayContent?no=${motel.no }&stayType=motel'">
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
		<table id="stayList2" class="stayList" style="display: none;">		
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
						<td onclick="location.href='stayContent?no=${hotel.no }&stayType=hotel'">
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
		<table id="stayList3" class="stayList" style="display: none;">
		<c:choose>
			<c:when test="${empty pensions }">
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
						<td onclick="location.href='stayContent?no=${pension.no }&stayType=pension'">
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
		<table id="stayList4" class="stayList" style="display: none;">
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
						<td>${gh.gcode }${gh.no }</td>
						<td onclick="location.href='stayContent?no=${gh.no }&stayType=gh'">
							${gh.gname }
						</td>
						<td>${gh.gregion }</td>
						<td>${gh.gaddress }</td>
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
		<table id="stayList5" class="stayList" style="display: none;">
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
						<td>${camping.ccode }${camping.no }</td>
						<td onclick="location.href='stayContent?no=${camping.no }&stayType=camping'">
							${camping.cname }
						</td>
						<td>${camping.cregion }</td>
						<td>${camping.caddress }</td>
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
 
  <script>
 	 function showStayInfo(stayType) {
		  var stayLists = document.getElementsByClassName("stayList");
	
		  // 모든 서브 메뉴 감추기
		  for (var i = 0; i < stayLists.length; i++) {
		    stayLists[i].style.display = "none";
		  } 

		  // 선택된 값에 따라 해당 서브 메뉴 표시
		  if (stayType === "motel") {
		    document.getElementById("stayList").style.display = "table";
		  } else if (stayType === "hotel") {
		    document.getElementById("stayList2").style.display = "table";
		  } else if (stayType === "pension") {
		    document.getElementById("stayList3").style.display = "table";
		  } else if (stayType === "gh") {
		    document.getElementById("stayList4").style.display = "table";
		  } else if (stayType === "camping") {
		    document.getElementById("stayList5").style.display = "table";
		  }
		  
		  localStorage.setItem("selectedStayType", stayType);
		  
		  submitStayType();
		}
 	 
 	function submitStayType() {
 	    var stayType = document.getElementById("stayType").value;
 	    var form = document.getElementById("stayTypeForm");
 	    
 	    // 선택된 stayType 값을 form에 추가
 	    var stayTypeInput = document.createElement("input");
 	    stayTypeInput.type = "hidden";
 	    stayTypeInput.name = "stayType";
 	    stayTypeInput.value = stayType;
 	    form.appendChild(stayTypeInput);
 	    
 	    var existingStayTypeInput = document.getElementsByName("stayType")[0];
 	    if (existingStayTypeInput) {
 	        form.removeChild(existingStayTypeInput);
 	    }
 	    
 	    // form submit
 	    form.submit();
 	}
 </script>
 
</html>
