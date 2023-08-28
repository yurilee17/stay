<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>숙소 DB 수정</title>
  <link rel="stylesheet" href="css/reset.css" type="text/css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 </head>
 
 <body>
	<br>
	<div id ="wrap">
		<div class="content">
			<!-- 숙소 탭 -->
			<c:import url="/jsp/admin/adminheader.jsp" />
			<br>
			<!-- //숙소 탭 -->
			<br>
			<!-- 설명 -->
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<!-- 설명 -->

			<!-- 등록 양식 -->
			<div class="stay_modify">
				<form id="stayForm" action="stayModifyProc" method="post" enctype="multipart/form-data">
					<table class="stay_table">
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>숙소 이름</th>
							<td><c:choose>
							<c:when test="${'motel' eq stayType}"><input type="text" class="form_w65" name="name" id="name" value="${motel.mname }"></c:when>
							<c:when test="${'hotel' eq stayType}"><input type="text" class="form_w65" name="name" id="name" value="${hotel.hname }"></c:when>
							<c:when test="${'pension' eq stayType}"><input type="text" class="form_w65" name="name" id="name" value="${pension.pname }"></c:when>
							<c:when test="${'gh' eq stayType}"><input type="text" class="form_w65" name="name" id="name" value="${gh.gname }"></c:when>
							<c:when test="${'camping' eq stayType}"><input type="text" class="form_w65" name="name" id="name" value="${camping.cname }"></c:when>
							</c:choose></td>
						</tr>

						<tr>
							<th>종류</th>
							<td>	
								<select class="form_w30 select1" name="stayType" id="stayType" onchange="showRegContent()">
								 	<c:choose>	
								 	<c:when test="${'motel' eq stayType}"><option value="motel">모텔</option></c:when>
									<c:when test="${'hotel' eq stayType}"><option value="hotel">호텔·리조트</option></c:when>
									<c:when test="${'pension' eq stayType}"><option value="pension">펜션</option></c:when>
									<c:when test="${'gh' eq stayType}"><option value="gh">게스트하우스</option></c:when>
									<c:when test="${'camping' eq stayType}"><option value="camping">캠핑·글램핑</option></c:when>
									</c:choose>
								</select>
							</td>
						</tr>
						<tr>
							<th>숙소 코드</th>
							<td>	
								 <c:choose>
							        <c:when test="${stayType eq 'motel'}">
										<c:out value="${motel.mcode}"/><c:out value="${motel.no}"/>
							        </c:when>
							        <c:when test="${stayType eq 'hotel'}">
							            <c:out value="${hotel.hcode}"/><c:out value="${hotel.no}"/>
							        </c:when>
							        <c:when test="${stayType eq 'pension'}">
							            <c:out value="${pension.pcode}"/><c:out value="${pension.no}"/>
							        </c:when>
							        <c:when test="${stayType eq 'gh'}">
							            <c:out value="${gh.gcode}"/><c:out value="${gh.no}"/>
							        </c:when>
							        <c:when test="${stayType eq 'camping'}">
							            <c:out value="${camping.ccode}"/><c:out value="${camping.no}"/>
							        </c:when>
							    </c:choose>
							</td>
						</tr>
						<tr>
							<th>지역</th>
							
							<td>	
							    <select class="form_w40 select2" name="region" id="region" onchange="showSubMenu()">
							        <option disabled selected value="">지역을 선택하세요</option>
							        <c:choose>
							            <c:when test="${'motel' eq stayType}">
							                <c:set var="regionValue" value="${motel.mregion}" />
							            </c:when>
							            <c:when test="${'hotel' eq stayType}">
							                <c:set var="regionValue" value="${hotel.hregion}" />
							            </c:when>
							            <c:when test="${'pension' eq stayType}">
							                <c:set var="regionValue" value="${pension.pregion}" />
							            </c:when>
							            <c:when test="${'gh' eq stayType}">
							                <c:set var="regionValue" value="${gh.gregion}" />
							            </c:when>
							            <c:when test="${'camping' eq stayType}">
							                <c:set var="regionValue" value="${camping.cregion}" />
							            </c:when>
							        </c:choose>
							        <option value="서울" <c:if test="${'서울' eq regionValue}">selected</c:if>>서울</option>
							        <option value="경기/인천" <c:if test="${'경기/인천' eq regionValue}">selected</c:if>>경기/인천</option>
							        <option value="충청/강원/제주" <c:if test="${'충청/강원/제주' eq regionValue}">selected</c:if>>충청/강원/제주</option>
							        <option value="경남/경북" <c:if test="${'경남/경북' eq regionValue}">selected</c:if>>경남/경북</option>
							        <option value="전남/전북" <c:if test="${'전남/전북' eq regionValue}">selected</c:if>>전남/전북</option>  
							    </select>
							</td>

						</tr>
						<tr>
							<th>세부지역</th>
							<td>
								<select id="detailregion" name="detailregion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu select3" style="display: none;">
								  <option disabled selected value="">상세지역을 선택하세요</option>
							        <c:choose>
							            <c:when test="${'motel' eq stayType}">
							                <c:set var="detailregionValue" value="${motel.mdetailregion}" />
							            </c:when>
							            <c:when test="${'hotel' eq stayType}">
							                <c:set var="detailregionValue" value="${hotel.hdetailregion}" />
							            </c:when>
							            <c:when test="${'pension' eq stayType}">
							                <c:set var="detailregionValue" value="${pension.pdetailregion}" />
							            </c:when>
							            <c:when test="${'gh' eq stayType}">
							                <c:set var="detailregionValue" value="${gh.gdetailregion}" />
							            </c:when>
							            <c:when test="${'camping' eq stayType}">
							                <c:set var="detailregionValue" value="${camping.cregion}" />
							            </c:when>
							        </c:choose>								  
								  <option value="강동" <c:if test="${'강동' eq detailregionValue}">selected</c:if>>강동</option>
								  <option value="강서" <c:if test="${'강서' eq detailregionValue}">selected</c:if>>강서</option>
								  <option value="강남" <c:if test="${'강남' eq detailregionValue}">selected</c:if>>강남</option>
								  <option value="강북" <c:if test="${'강북' eq detailregionValue}">selected</c:if>>강북</option>
								</select>
								
								<select id="detailregion2" name="detailregion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu select3" style="display: none;">
								  <option disabled selected value="">상세지역을 선택하세요</option>
								  <option value="경기" <c:if test="${'경기' eq detailregionValue}">selected</c:if>>경기</option>
								  <option value="인천" <c:if test="${'인천' eq detailregionValue}">selected</c:if>>인천</option>
								</select>
								
								<select id="detailregion3" name="detailregion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu select3" style="display: none;">
								  <option disabled selected value="">상세지역을 선택하세요</option>
								  <option value="충청" <c:if test="${'충청' eq detailregionValue}">selected</c:if>>충청</option>
								  <option value="강원" <c:if test="${'강원' eq detailregionValue}">selected</c:if>>강원</option>
								  <option value="제주" <c:if test="${'제주' eq detailregionValue}">selected</c:if>>제주</option>
								</select>
								
								<select id="detailregion4" name="detailregion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu select3" style="display: none;">
								  <option disabled selected value="">상세지역을 선택하세요</option>
								  <option value="경남" <c:if test="${'경남' eq detailregionValue}">selected</c:if>>경남</option>
								  <option value="경북" <c:if test="${'경북' eq detailregionValue}">selected</c:if>>경북</option>
								</select>
								
								<select id="detailregion5" name="detailregion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu select3" style="display: none;">
								  <option disabled selected value="">상세지역을 선택하세요</option>
								  <option value="전남" <c:if test="${'전남' eq detailregionValue}">selected</c:if>>전남</option>
								  <option value="전북" <c:if test="${'전북' eq detailregionValue}">selected</c:if>>전북</option>
								</select>
							</td>																											
						</tr>
						<tr>
							<th>우편번호 찾기</th>
							<td><input type="text" id="postcode" class="form_w40" name="postcode" placeholder="우편번호" readonly>
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><c:choose>	
						 	<c:when test="${'motel' eq stayType}"><input type="text" id="address" name="address" class="form_w80" placeholder="주소" value="${motel.maddress }"></c:when>
							<c:when test="${'hotel' eq stayType}"><input type="text" id="address" name="address" class="form_w80" placeholder="주소" value="${hotel.haddress }"></c:when>
							<c:when test="${'pension' eq stayType}"><input type="text" id="address" name="address" class="form_w80" placeholder="주소" value="${pension.paddress }"></c:when>
							<c:when test="${'gh' eq stayType}"><input type="text" id="address" name="address" class="form_w80" placeholder="주소" value="${gh.gaddress }"></c:when>
							<c:when test="${'camping' eq stayType}"><input type="text" id="address" name="address" class="form_w80" placeholder="주소" value="${camping.caddress }"></c:when>
							</c:choose></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><c:choose>	
						 	<c:when test="${'motel' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailaddress" name="detailaddress" value="${motel.mdetailaddress }"></c:when>
							<c:when test="${'hotel' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailaddress" name="detailaddress" value="${hotel.hdetailaddress }"></c:when>
							<c:when test="${'pension' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailaddress" name="detailaddress" value="${pension.pdetailaddress }"></c:when>
							<c:when test="${'gh' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailaddress" name="detailaddress" value="${gh.gdetailaddress }"></c:when>
							<c:when test="${'camping' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailaddress" name="detailaddress" value="${camping.cdetailaddress }"></c:when>
							</c:choose></td>
						</tr>
						<tr>
							<th>이미지 업로드</th>
							<td><c:choose>	
						 	<c:when test="${'motel' eq stayType}"><input type="file" name="imageupload" id="imageupload" >${motel.mimage}</c:when>
							<c:when test="${'hotel' eq stayType}"><input type="file" name="imageupload" id="imageupload" >${hotel.himage}</c:when>
							<c:when test="${'pension' eq stayType}"><input type="file" name="imageupload" id="imageupload" >${pension.pimage}</c:when>
							<c:when test="${'gh' eq stayType}"><input type="file" name="imageupload" id="imageupload" >${gh.gimage}</c:when>
							<c:when test="${'camping' eq stayType}"><input type="file" name="imageupload" id="imageupload" >${camping.cimage}</c:when>
							</c:choose></td>
						</tr>
						<tr>
							<th>숙소정보</th>
							<td><c:choose>
						 	<c:when test="${'motel' eq stayType}"><textarea rows="4" cols="50" id="info" name="info" >${motel.minfo }</textarea></c:when>
							<c:when test="${'hotel' eq stayType}"><textarea rows="4" cols="50" id="info" name="info" >${hotel.hinfo }</textarea></c:when>
							<c:when test="${'pension' eq stayType}"><textarea rows="4" cols="50" id="info" name="info" >${pension.pinfo }</textarea></c:when>
							<c:when test="${'gh' eq stayType}"><textarea rows="4" cols="50" id="info" name="info" >${gh.ginfo }</textarea></c:when>
							<c:when test="${'camping' eq stayType}"><textarea rows="4" cols="50" id="info" name="info" >${camping.cinfo }</textarea></c:when>							
							</c:choose></td>
						</tr>
					</table>	
						
					<table id="regContent" class="regContent">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>					
						<tr>
							<th>대실체크인</th>
							<td>
								<select id="daesilcheckin" name="mdaesilcheckin" class="form_25 right-menu select2">
								    <c:set var="daesilcheckinValue" value="${motel.mdaesilcheckin}" />
								    <option disabled selected value="">시간을 선택하세요</option>
								    <c:forEach var="hour" begin="10" end="21">
								        <c:set var="optionValue" value="${hour}:00" />
								        <option value="${optionValue}" <c:if test="${optionValue eq daesilcheckinValue}">selected</c:if>>${optionValue}</option>
								    </c:forEach>
								</select>
							<%-- <input type="text" class="form_w30" name="mdaesilcheckin" id="mdaesilcheckin" placeholder="" value="${motel.mdaesilcheckin}"> --%>
							
							</td>
						</tr>
						<tr>
							<th>대실체크아웃</th>
							<td>
								<select id="mdaesilcheckout" name="mdaesilcheckout" class="form_25 right-menu select2">
								    <c:set var="daesilcheckout" value="${motel.mdaesilcheckout}" />
								    <option disabled selected value="">시간을 선택하세요</option>
								    <c:forEach var="hour" begin="14" end="24">
								        <c:set var="optionValue" value="${hour}:00" />
								        <option value="${optionValue}" <c:if test="${optionValue eq daesilcheckout}">selected</c:if>>${optionValue}</option>
								    </c:forEach>
								</select>
								<%-- <input type="text" class="form_w30" name="mdaesilcheckout" id="mdaesilcheckout" placeholder="" value="${motel.mdaesilcheckout}"> --%>
							</td>
						</tr>
						<tr>
							<th>대실시간</th>
							<td>
								<select id="mdaesiltime" name="mdaesiltime" class="form_25 select2">
								    <c:set var="daesiltimeValue" value="${motel.mdaesiltime}" />
								    <option disabled selected value="">시간을 선택하세요</option>
								    <c:forEach var="hour" begin="3" end="6">
								        <c:set var="optionValue" value="${hour}" />
								        <option value="${optionValue}" <c:if test="${optionValue eq daesiltimeValue}">selected</c:if>>${optionValue}시간</option>
								    </c:forEach>
								</select>
								<%-- <input type="text" class="form_w30" name="mdaesiltime" id="mdaesiltime" placeholder="" value="${motel.mdaesiltime}"> --%>
							</td>
						</tr>
						<tr>
							<th>숙박체크인</th>
							<td>
								<select id="mstaycheckin" name="mstaycheckin" class="form_25 right-menu select2">
								    <c:set var="staycheckinValue" value="${motel.mstaycheckin}" />
								    <option disabled selected value="">시간을 선택하세요</option>
								    <c:forEach var="hour" begin="13" end="24">
								        <c:set var="optionValue" value="${hour}:00" />
								        <option value="${optionValue}" <c:if test="${optionValue eq staycheckinValue}">selected</c:if>>${optionValue}</option>
								    </c:forEach>
								</select>
								<%-- <input type="text" class="form_w30" name="mstaycheckin" id="mstaycheckin" placeholder="" value="${motel.mstaycheckin}"> --%>
							</td>
						</tr>		
						<tr>
							<th>숙박체크아웃</th>
							<td>
								<select id="mstaycheckout" name="mstaycheckout" class="form_25 right-menu select2">
								    <c:set var="staycheckoutValue" value="${motel.mstaycheckout}" />
								    <option disabled selected value="">시간을 선택하세요</option>
								    <c:forEach var="hour" begin="10" end="14">
								        <c:set var="optionValue" value="${hour}:00" />
								        <option value="${optionValue}" <c:if test="${optionValue eq staycheckoutValue}">selected</c:if>>${optionValue}</option>
								    </c:forEach>
								</select>						
								<%-- <input type="text" class="form_w30" name="mstaycheckout" id="mstaycheckout" placeholder="" value="${motel.mstaycheckout}"> --%>
							</td>
						</tr>
					</table>
					
					<table id="regContent2" class="regContent" style="display: none;">	
						<tr>
							<th>체크인시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="hcheckintime" name="hcheckintime" value="${hotel.hcheckintime }"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="hcheckouttime" name="hcheckouttime" value="${hotel.hcheckouttime }"></td>
						</tr>
						<tr>
							<th>호텔·리조트 유형</th>
							<td>
							<label><input type="radio" name="htype" value="5성급"> 5성급</label>
							<label><input type="radio" name="htype" value="특1급"> 특1급</label>
							<label><input type="radio" name="htype" value="특급"> 특급</label>														
							</td>
						</tr>																			
					</table>
					
					<table id="regContent3" class="regContent" style="display: none;">	
						<tr>
							<th>체크인시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="pcheckintime" name="pcheckintime"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="pcheckouttime" name="pcheckouttime"></td>
						</tr>
						<tr>
							<th>펜션 유형</th>
							<td>
							<label><input type="radio" name="ptype" value="펜션"> 펜션</label>
							<label><input type="radio" name="ptype" value="풀빌라"> 풀빌라</label>													
							</td>
						</tr>													
					</table>					
					
					<table id="regContent4" class="regContent" style="display: none;">	
						<tr>
							<th>체크인시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="gcheckintime" name="gcheckintime"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="gcheckouttime" name="gcheckouttime"></td>
						</tr>																		
					</table>
					
					<table id="regContent5" class="regContent" style="display: none;">	
						<tr>
							<th>체크인시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="ccheckintime" name="ccheckintime"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="ccheckouttime" name="ccheckouttime"></td>
						</tr>
						<tr>
							<th>캠핑 유형</th>
							<td>
							<label><input type="radio" name="ctype" value="오토캠핑"> 오토캠핑</label>
							<label><input type="radio" name="ctype" value="글램핑"> 글램핑</label>
							<label><input type="radio" name="ctype" value="카라반"> 카라반</label>														
							</td>
						</tr>																		
					</table>
								
					<div class="submit">
						<ul>
							<!-- <li><a href="${context }stayInfo" onclick="submitForm()">등록</a></li>-->
							<li><button class="submit_button" type="submit"><span>등록</span></button></li> 
						</ul>
					</div>
				</form>
			</div>

			<!-- //등록 양식 -->
		</div>
	</div>
 </body>
 
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

		// 주소
	  function execDaumPostcode() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	          		if(data.userSelectedType === 'R') {
	          			document.getElementById('address').value= data.roadAddress;
	          		}else{
	          			document.getElementById('address').value= data.jibunAddress;
	          		}
	          		document.getElementById('postcode').value= data.zonecode;
	          }
	      }).open();
	  }
		
	  document.addEventListener("DOMContentLoaded", function() {
		    // 초기 페이지 로드 시 실행될 내용
		    showRegContent();
		});
	  
	  function showRegContent() {
		  var stayType = document.getElementById("stayType");
		  var regContent = document.getElementsByClassName("regContent");
		  
		  for (var i = 0; i < regContent.length; i++) {
			regContent[i].style.display = "none";  
		  }
		  
		  if (stayType.value === "motel") {
		    document.getElementById("regContent").style.display = "table";
		  } else if (stayType.value === "hotel") {
		    document.getElementById("regContent2").style.display = "table";
		  } else if (stayType.value === "pension") {
		    document.getElementById("regContent3").style.display = "table";
		  } else if (stayType.value === "gh") {
		    document.getElementById("regContent4").style.display = "table";
		  } else if (stayType.value === "camping") {
		    document.getElementById("regContent5").style.display = "table";
		  }
		 
	  }
	
	  	// 지역에 따른 세부 지역 버튼 나타내기
	  function showSubMenu() {
		  var region = document.getElementById("region");
		  var detailRegion = document.getElementsByClassName("detailRegion");

		  // 모든 서브 메뉴 감추기
		  for (var i = 0; i < detailRegion.length; i++) {
			  detailRegion[i].style.display = "block";
		  }

		  // 선택된 값에 따라 해당 서브 메뉴 표시
			 if (region.value === "서울") {
		        document.getElementById("detailregion2").style.display = "none";
		        document.getElementById("detailregion3").style.display = "none";
		        document.getElementById("detailregion4").style.display = "none";
		        document.getElementById("detailregion5").style.display = "none";
		    } else if (region.value === "경기/인천") {
		        document.getElementById("detailregion").style.display = "none";
		        document.getElementById("detailregion3").style.display = "none";
		        document.getElementById("detailregion4").style.display = "none";
		        document.getElementById("detailregion5").style.display = "none";
		    } else if (region.value === "충청/강원/제주") {
		        document.getElementById("detailregion").style.display = "none";
		        document.getElementById("detailregion2").style.display = "none";
		        document.getElementById("detailregion4").style.display = "none";
		        document.getElementById("detailregion5").style.display = "none";
		    } else if (region.value === "경남/경북") {
		        document.getElementById("detailregion").style.display = "none";
		        document.getElementById("detailregion2").style.display = "none";
		        document.getElementById("detailregion3").style.display = "none";
		        document.getElementById("detailregion5").style.display = "none";
		    } else if (region.value === "전남/전북") {
		        document.getElementById("detailregion").style.display = "none";
		        document.getElementById("detailregion2").style.display = "none";
		        document.getElementById("detailregion3").style.display = "none";
		        document.getElementById("detailregion4").style.display = "none";
		    }
		}
	  
	// 세부 지역 DB에 등록하기
	  document.addEventListener("DOMContentLoaded", function() {
		  var submitButton = document.getElementById("submitButton");

		  submitButton.addEventListener("click", function(event) {
		    event.preventDefault(); // 기본 폼 제출 동작 방지

		    var selectedDetailRegion = getSelectedDetailRegion();

		    // AJAX 요청을 보내는 부분
		    var xhr = new XMLHttpRequest();
		    xhr.open("POST", "admin/stayInfo", true);
		    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    xhr.onreadystatechange = function() {
		      if (xhr.readyState === XMLHttpRequest.DONE) {
		        if (xhr.status === 200) {
		          console.log("서버로 데이터 전송 완료");
		        } else {
		          console.error("서버로 데이터 전송 실패");
		        }
		      }
		    };
		    xhr.send("detailregion=" + encodeURIComponent(selectedDetailRegion));
		  });
		});
  
	  function submitForm() {
		    // form 요소 가져오기
		    var form = document.getElementById("stayForm");

		    // form submit
		    form.submit();
		}
	  
/* 	  document.getElementById('stayType').addEventListener('change', function() {
		    var selectElement = document.getElementById('stayType');
		    var selectedValue = selectElement.options[selectElement.selectedIndex].value;
		    var stayCodeElement = document.getElementById('stayCode');
		    
		    // 서버로부터 stayCode 값을 가져옴
		    var xhr = new XMLHttpRequest();
		    xhr.open('GET', '/getStayCode?stayType=' + selectedValue, true);
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		            var stayCode = xhr.responseText;
		            stayCodeElement.textContent = stayCode;
		        }
		    };
		    xhr.send();
		}); 
		
		function loadStayCode() {
		    var selectElement = document.getElementById('stayType');
		    var selectedValue = selectElement.options[selectElement.selectedIndex].value;
		    var stayCodeElement = document.getElementById('stayCode');

		    // 서버로부터 stayCode 값을 가져옴
		    var xhr = new XMLHttpRequest();
		    xhr.open('GET', '/currentStayCode?stayType=' + selectedValue, true);
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		            var stayCode = xhr.responseText;
		            stayCodeElement.textContent = stayCode;
		        }
		    };
		    xhr.send();
		}	*/
	  

	  window.onload = function() {
		  showSubMenu();
		  
		  // 서버에서 받아온 stayType 값
		  const stayType = "${stayType}";

		  if (stayType === "hotel") {
		    // 서버에서 받아온 htype 값
		    const htypeValue = "${hotel.htype}";

		    // 라디오 버튼 그룹의 라디오 버튼들을 가져옴
		    const radioButtons = document.getElementsByName("htype");

		    // htype 값에 따라 선택 상태 설정
		    for (const radioButton of radioButtons) {
		      if (radioButton.value === htypeValue) {
		        radioButton.checked = true;
		        break;
		      }
		    }
		  }
		}
	  
	  
</script>

</html>
