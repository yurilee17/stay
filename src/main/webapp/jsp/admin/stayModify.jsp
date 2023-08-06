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
 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	  function execDaumPostcode() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	          		if(data.userSelectedType === 'R') {
	          			document.getElementById('address').value= data.roadAddress;
	          		}else{
	          			document.getElementById('address').value= data.jibunAddress;
	          		}
	          		document.getElementById('postcode').value= data.zonecode;
						/* 				
						console.log(data.userSelectedType)
						console.log(data.roadAddress)
						console.log(data.jibunAddress)
						console.log(data.zonecode)
						*/
	          }
	      }).open();
	  }
	  
	  function showSubMenu() {
		  var mainMenu = document.getElementById("mainMenu");
		  var subMenu = document.getElementsByClassName("subMenu");

		  // 모든 서브 메뉴 감추기
		  for (var i = 0; i < subMenu.length; i++) {
		    subMenu[i].style.display = "none";
		  }

		  // 선택된 값에 따라 해당 서브 메뉴 표시
		  if (mainMenu.value === "Main1") {
		    document.getElementById("subMenu").style.display = "block";
		  } else if (mainMenu.value === "Main2") {
		    document.getElementById("subMenu2").style.display = "block";
		  } else if (mainMenu.value === "Main3") {
		    document.getElementById("subMenu3").style.display = "block";
		  } else if (mainMenu.value === "Main4") {
		    document.getElementById("subMenu4").style.display = "block";
		  } else if (mainMenu.value === "Main5") {
		    document.getElementById("subMenu5").style.display = "block";
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
			<br>
			<!-- //숙소 탭 -->
			<br>
			<!-- 설명 -->
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<!-- 설명 -->

			<!-- 등록 양식 -->
			<div class="stay_register">
				<form action="stayregisterProc" method="post">
					<table class="stay_table">
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>숙소 이름</th>
							<td><input type="text" class="form_w65" id="name"></td>
						</tr>
						<tr>
							<th>종류</th>
							<td>	
								<select class="form_w30">
									<option>모텔</option>
									<option>호텔·리조트</option>
									<option>펜션</option>
									<option>게스트하우스</option>
									<option>캠핑·글램핑</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>지역</th>
							<td>	
								<select class="form_w40" id="mainMenu" onchange="showSubMenu()">
								  <option value="">지역을 선택하세요</option>
								  <option value="Main1">서울</option>
								  <option value="Main2">경기/인천</option>
								  <option value="Main3">충청/강원/제주</option>
								  <option value="Main4">경남/경북</option>
								  <option value="Main5">전남/전북</option>  
								</select>
							</td>
						</tr>
						<tr>
							<th>세부지역</th>
							<td>
								<select id="subMenu" class="form_w40 subMenu right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Main1_1">강동</option>
								  <option value="Main1_2">강서</option>
								  <option value="Main1_3">강남</option>
								  <option value="Main1_4">강북</option>
								</select>
								
								<select id="subMenu2" class="form_w40 subMenu right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Main2_1">경기</option>
								  <option value="Main2_2">인천</option>
								</select>
								
								<select id="subMenu3" class="form_w40 subMenu right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Main3_1">충청</option>
								  <option value="Main3_2">강원</option>
								  <option value="Main3_3">제주</option>
								</select>
								
								<select id="subMenu4" class="form_w40 subMenu right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Main4_1">경남</option>
								  <option value="Main4_2">경북</option>
								</select>
								
								<select id="subMenu5" class="form_w40 subMenu right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Main5_1">전남</option>
								  <option value="Main5_2">전북</option>
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
							<td><input type="text" class="form_w50" placeholder="" id="detailAddress"></td>
						</tr>
						<tr>
							<th>이미지 업로드</th>
							<td><input type="file" name="imageupload" ></td>
						</tr>
						<tr>
							<th>숙소정보</th>
							<td><textarea rows="4" cols="50" id="info"></textarea></td>
						</tr>

					</table>
				</form>
			</div>

			<div class="submit">
				<ul>
					<li><a href="#">수정</a></li>
				</ul>
			</div>
			<!-- //등록 양식 -->
		</div>
	</div>
 </body>
</html>
