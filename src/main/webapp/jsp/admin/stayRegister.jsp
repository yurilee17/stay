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
		  var region = document.getElementById("region");
		  var detailRegion = document.getElementsByClassName("detailRegion");

		  // 모든 서브 메뉴 감추기
		  for (var i = 0; i < detailRegion.length; i++) {
			  detailRegion[i].style.display = "none";
		  }

		  // 선택된 값에 따라 해당 서브 메뉴 표시
		  if (region.value === "Region1") {
		    document.getElementById("detailRegion").style.display = "block";
		  } else if (region.value === "Region2") {
		    document.getElementById("detailRegion2").style.display = "block";
		  } else if (region.value === "Region3") {
		    document.getElementById("detailRegion3").style.display = "block";
		  } else if (region.value === "Region4") {
		    document.getElementById("detailRegion4").style.display = "block";
		  } else if (region.value === "Region5") {
		    document.getElementById("detailRegion5").style.display = "block";
		  }
		}
	  
	    function submitForm() {
	        var form = document.getElementById("stayForm");
	        form.submit();
	    }
</script>

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

			<!-- 등록 양식 -->
			<div class="stay_register">
				<form id="stayregisterProc" action="stayregisterProc" method="post" enctype="multipart/form-data">
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
								<select class="form_w40" id="region" onchange="showSubMenu()">
								  <option value="">지역을 선택하세요</option>
								  <option value="Region1">서울</option>
								  <option value="Region2">경기/인천</option>
								  <option value="Region3">충청/강원/제주</option>
								  <option value="Region4">경남/경북</option>
								  <option value="Region5">전남/전북</option>  
								</select>
							</td>
						</tr>
						<tr>
							<th>세부지역</th>
							<td>
								<select id="detailRegion" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Region1_1">강동</option>
								  <option value="Region1_2">강서</option>
								  <option value="Region1_3">강남</option>
								  <option value="Region1_4">강북</option>
								</select>
								
								<select id="detailRegion2" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Region2_1">경기</option>
								  <option value="Region2_2">인천</option>
								</select>
								
								<select id="detailRegion3" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Region3_1">충청</option>
								  <option value="Region3_2">강원</option>
								  <option value="Region3_3">제주</option>
								</select>
								
								<select id="detailRegion4" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Region4_1">경남</option>
								  <option value="Region4_2">경북</option>
								</select>
								
								<select id="detailRegion5" class="form_w40 detailRegion right-menu" style="display: none;">
								  <option value="">상세지역을 선택하세요</option>
								  <option value="Region5_1">전남</option>
								  <option value="Region5_2">전북</option>
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
					
					<div class="submit">
						<ul>
							<li><a href="${context }stayIndex" onclick="submitForm()">등록</a></li>
						</ul>
					</div>
					
				</form>
			</div>


			<!-- //등록 양식 -->
		</div>
	</div>
 </body>
</html>
