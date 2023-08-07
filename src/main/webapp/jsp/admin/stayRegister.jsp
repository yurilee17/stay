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
			<br>
			<!-- //숙소 탭 -->
			<br>
			<!-- 설명 -->
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<!-- 설명 -->

			<!-- 등록 양식 -->
			<div class="stay_register">
				<form id="stayForm" action="stayregisterProc" method="post" enctype="multipart/form-data">
					<table class="stay_table">
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>숙소 이름</th>
							<td><input type="text" class="form_w65" name="name" id="name"></td>
						</tr>

						<tr>
							<th>종류</th>
							<td>	
								<select class="form_w30" name="stayType" id="stayType" onchange="showRegContent(this)">
								 	<option value="">숙소 종류를 선택하세요</option>								
									<option value="모텔">모텔</option>
						            <option value="호텔·리조트">호텔·리조트</option>
						            <option value="펜션">펜션</option>
						            <option value="게스트하우스">게스트하우스</option>
						            <option value="캠핑·글램핑">캠핑·글램핑</option>
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
					</table>	
						
					<table id="regContent" class="regContent">	
						<tr>
							<th>지역</th>
							<td>	
								<select class="form_w40" name="region" id="region" onchange="showSubMenu(this)">
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
							<td><input type="text" id="address" name="address" class="form_w80" placeholder="주소" readonly></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" class="form_w50" placeholder="" id="detailAddress" name="detailAddress"></td>
						</tr>
						<tr>
							<th>이미지 업로드</th>
							<td><input type="file" name="imageupload" id="imageupload" ></td>
						</tr>
						<tr>
							<th>숙소정보</th>
							<td><textarea rows="4" cols="50" id="info" name="info"></textarea></td>
						</tr>

					</table>
					
					<!-- <table id="regContent2" class="regContent" style="display: none;">	
						<tr>
							<th>지역</th>
							<td>	
								<select class="form_w40" name="region" id="region" onchange="showSubMenu(this)">
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
							<td><input type="text" id="address" name="address" class="form_w80" placeholder="주소" readonly></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" class="form_w50" placeholder="" id="detailAddress" name="detailAddress"></td>
						</tr>
						<tr>
							<th>이미지 업로드</th>
							<td><input type="file" name="imageupload" id="imageupload" ></td>
						</tr>
						<tr>
							<th>숙소정보</th>
							<td><textarea rows="4" cols="50" id="info" name="info"></textarea></td>
						</tr>
						<tr>
							<th>체크인시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="checkinTime" name="checkinTime"></td>
						</tr>
						<tr>
							<th>체크아웃시간</th>
							<td><input type="text" class="form_w50" placeholder="" id="checkoutTime" name="checkoutTime"></td>
						</tr>						
					</table> -->
					
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
	  
		
		// 모텔이냐 아니냐에 따른 DB 등록 컨텐츠 전환
/* 	  function showRegContent() {
		  var stayType = document.getElementById("stayType");
		  var regContent = document.getElementsByClassName("regContent");
		  
		  // 모든 서브 메뉴 감추기		  
		  for (var i = 0; i < regContent.length; i++) {
			    regContent[i].style.display = "none";
			  }

		  // 선택된 값에 따라 서브 메뉴 표시
		  if (stayType.value === "모텔") {
			  document.getElementById("regContent").style.display = "table";
		  } else {
			  document.getElementById("regContent2").style.display = "table";
		  }
	  } */
		
		
	  function showRegContent(selectElement) {
		    var selectedValue = selectElement.options[selectElement.selectedIndex].value;

		    var regContent = selectElement.closest("table").querySelector(".detailRegion");

		    // 해당 테이블 내의 모든 detailRegion를 감춥니다.
		    var detailRegionsInTable = selectElement.closest("table").querySelectorAll(".detailRegion");
		    for (var i = 0; i < detailRegionsInTable.length; i++) {
		        detailRegionsInTable[i].style.display = "none";
		    }

		    // 선택된 값에 따라 해당 테이블 내의 detailRegion 표시
		    if (selectedValue === "모텔") {
		        regContent.style.display = "block";
		    }else {
		    	regContent2.style.display = "block";
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
	  
	 /*  function updateDetailRegion() {
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
		} */
		
		
		function updateDetailRegion() {
		    var regionSelect = document.getElementById("region");
		    var selectedRegion = regionSelect.options[regionSelect.selectedIndex].value;
		    
		    // 모든 detailRegion 요소를 숨깁니다.
		    var detailRegionElements = document.querySelectorAll(".detailRegion");
		    for (var i = 0; i < detailRegionElements.length; i++) {
		        detailRegionElements[i].style.display = "none";
		    }

		    // 선택한 지역에 해당하는 detailRegion 요소를 표시합니다.
		    if (selectedRegion === "서울") {
		        var seoulDetailRegion = document.getElementById("detailRegion");
		        seoulDetailRegion.style.display = "block";
		    } else if (selectedRegion === "경기/인천") {
		        var gyInDetailRegion = document.getElementById("detailRegion2");
		        gyInDetailRegion.style.display = "block";
		    } else if (selectedRegion === "충청/강원/제주") {
		        var ccgjDetailRegion = document.getElementById("detailRegion3");
		        ccgjDetailRegion.style.display = "block";
		    } else if (selectedRegion === "경남/경북") {
		        var gngbDetailRegion = document.getElementById("detailRegion4");
		        gngbDetailRegion.style.display = "block";
		    } else if (selectedRegion === "전남/전북") {
		        var jnjbDetailRegion = document.getElementById("detailRegion5");
		        jnjbDetailRegion.style.display = "block";
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
</script>

</html>
