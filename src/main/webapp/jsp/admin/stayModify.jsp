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
			<br>
			<!-- //숙소 탭 -->
			<br>
			<!-- 설명 -->
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<!-- 설명 -->

			<!-- 등록 양식 -->
			<div class="stay_modify">
				<form id="stayForm" action="staymodifyProc" method="post" enctype="multipart/form-data">
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
								<select class="form_w30" name="stayType" id="stayType" onchange="showRegContent()">
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
								<span id="stayCode"></span>
								<%-- M${nextNo} --%>
							</td>
						</tr>
						<tr>
							<th>지역</th>
							<td>	
								<select class="form_w40" name="region" id="region" onchange="showSubMenu()">
								  <option value="">지역을 선택하세요</option>
								  <option value="서울">서울</option>
								  <option value="경기/인천">경기/인천</option>
								  <option value="충청/강원/제주">충청/강원/제주</option>
								  <option value="경남/경북">경남/경북</option>
								  <option value="전남/전북">전남/전북</option>  
								</select>
							</td>
						</tr>
						<tr>
							<th>세부지역</th>
							<td>
								<select id="detailRegion" name="detailRegion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="강동">강동</option>
								  <option value="강서">강서</option>
								  <option value="강남">강남</option>
								  <option value="강북">강북</option>
								</select>
								
								<select id="detailRegion2" name="detailRegion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="경기">경기</option>
								  <option value="인천">인천</option>
								</select>
								
								<select id="detailRegion3" name="detailRegion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="충청">충청</option>
								  <option value="강원">강원</option>
								  <option value="제주">제주</option>
								</select>
								
								<select id="detailRegion4" name="detailRegion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="경남">경남</option>
								  <option value="경북">경북</option>
								</select>
								
								<select id="detailRegion5" name="detailRegion" onchange="updateDetailRegion()" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="전남">전남</option>
								  <option value="전북">전북</option>
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
						 	<c:when test="${'motel' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailAddress" name="detailAddress" value="${motel.mdetailAddress }"></c:when>
							<c:when test="${'hotel' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailAddress" name="detailAddress" value="${hotel.hdetailAddress }"></c:when>
							<c:when test="${'pension' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailAddress" name="detailAddress" value="${pension.pdetailAddress }"></c:when>
							<c:when test="${'gh' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailAddress" name="detailAddress" value="${gh.gdetailAddress }"></c:when>
							<c:when test="${'camping' eq stayType}"><input type="text" class="form_w50" placeholder="" id="detailAddress" name="detailAddress" value="${camping.cdetailAddress }"></c:when>
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
						<tr>
							<th>대실체크인</th>
							<td><input type="text" class="form_w30" name="mdaesilcheckin" id="mdaesilcheckin" placeholder="" value="${motel.mdaesilCheckIn}"></td>
						</tr>
						<tr>
							<th>대실체크아웃</th>
							<td><input type="text" class="form_w30" name="mdaesilcheckout" id="mdaesilcheckout" placeholder="" value="${motel.mdaesilCheckOut}"></td>
						</tr>
						<tr>
							<th>대실시간</th>
							<td><input type="text" class="form_w30" name="mdaesiltime" id="mdaesiltime" placeholder="" value="${motel.mdaesilTime}"></td>
						</tr>
						<tr>
							<th>숙박체크인</th>
							<td><input type="text" class="form_w30" name="mstaycheckin" id="mstaycheckin" placeholder="" value="${motel.mstayCheckIn}"></td>
						</tr>		
						<tr>
							<th>숙박체크아웃</th>
							<td><input type="text" class="form_w30" name="mstaycheckout" id="mstaycheckout" placeholder="" value="${motel.mstayCheckOut}"></td>
						</tr>
					</table>
					
					<table id="regContent2" class="regContent" style="display: none;">	
						<tr>
							<th>체크인시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="hcheckinTime" name="hcheckinTime" value="${hotel.hcheckInTime }"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="hcheckoutTime" name="hcheckoutTime" value="${hotel.hcheckOutTime }"></td>
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
							<td><input type="text" class="form_w50" placeholder="" id="pcheckinTime" name="pcheckinTime"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="pcheckoutTime" name="pcheckoutTime"></td>
						</tr>
						<tr>
							<th>펜션 유형</th>
							<td>
							<label> <input type="radio" name="ptype" value="펜션"> 펜션</label>
							<label><input type="radio" name="ptype" value="풀빌라"> 풀빌라</label>													
							</td>
						</tr>													
					</table>					
					
					<table id="regContent4" class="regContent" style="display: none;">	
						<tr>
							<th>체크인시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="gcheckinTime" name="gcheckinTime"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="gcheckoutTime" name="gcheckoutTime"></td>
						</tr>																		
					</table>
					
					<table id="regContent5" class="regContent" style="display: none;">	
						<tr>
							<th>체크인시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="ccheckinTime" name="ccheckinTime"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="ccheckoutTime" name="ccheckoutTime"></td>
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
			  detailRegion[i].style.display = "none";
		  }

		  // 선택된 값에 따라 해당 서브 메뉴 표시
		  if (region.value === "서울") {
		    document.getElementById("detailRegion").style.display = "block";
		  } else if (region.value === "경기/인천") {
		    document.getElementById("detailRegion2").style.display = "block";
		  } else if (region.value === "충청/강원/제주") {
		    document.getElementById("detailRegion3").style.display = "block";
		  } else if (region.value === "경남/경북") {
		    document.getElementById("detailRegion4").style.display = "block";
		  } else if (region.value === "전남/전북") {
		    document.getElementById("detailRegion5").style.display = "block";
		  }
		}
	  
	 function updateDetailRegion() {
		    var regionSelect = document.getElementById("region");
		    var detailRegionSelect = document.getElementsByName("detailRegion");
		    var selectedRegion = regionSelect.options[regionSelect.selectedIndex].value;
		    var selectedDetailRegion = detailRegionSelect.options[detailRegionSelect.selectedIndex].value;
		    
		    var motelDetailRegionSelect = document.getElementById("detailRegion" + selectedRegion);
		    var selectedMotelDetailRegion = motelDetailRegionSelect.options[motelDetailRegionSelect.selectedIndex].value;
		    
		    if (selectedDetailRegion !== "") {
		        motel.setMdetailRegion(selectedDetailRegion);
		    } else if (selectedMotelDetailRegion !== "") {
		        motel.setMdetailRegion(selectedMotelDetailRegion);
		    }
		} 
  
	  function submitForm() {
		    // form 요소 가져오기
		    var form = document.getElementById("stayForm");

		    // form submit
		    form.submit();
		}
	  
	  document.getElementById('stayType').addEventListener('change', function() {
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
	  
	  
	  window.onload = function() {
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
