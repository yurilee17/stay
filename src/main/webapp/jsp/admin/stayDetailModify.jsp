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
  <title>Document</title>
  <link rel="stylesheet" href="../../resource/css/reset.css" type="text/css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 </head>
 <script>
	 function showSubMenu() {
		  var stayType = document.getElementById("stayType");
		  var showDetail = document.getElementsByClassName("showDetail");

		  // 모든 서브 메뉴 감추기
		  for (var i = 0; i < showDetail.length; i++) {
		    showDetail[i].style.display = "none";
		  }

		  // 선택된 값에 따라 해당 서브 메뉴 표시
		  if (stayType.value === "모텔") {
		    document.getElementById("showDetail").style.display = "table";
		  } else if (stayType.value === "호텔·리조트") {
		    document.getElementById("showDetail2").style.display = "table";
		  } else if (stayType.value === "펜션") {
		    document.getElementById("showDetail3").style.display = "table";
		  } else if (stayType.value === "게스트하우스") {
		    document.getElementById("showDetail4").style.display = "table";
		  } else if (stayType.value === "캠핑·글램핑") {
		    document.getElementById("showDetail5").style.display = "table";
		  }
		}
</script>
 
 <body>
	<div id ="wrap">
		<div class="content">
			<div class="stay">
				<ul class="top_nav">
					<li><a href="${context }index">메인</a></li>
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

			<div class="stay_registerdetail">
				<form action="">
					<table class="stay_table">
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>숙소 이름</th>
							<td><input type="text" class="form_w50" placeholder=""></td>
						</tr>						
						<tr>
							<th>종류</th>
							<td>
								<select class="form_w30" id="stayType" onchange="showSubMenu()">
									<option>모텔</option>
									<option>호텔·리조트</option>
									<option>펜션</option>
									<option>게스트하우스</option>
									<option>캠핑·글램핑</option>
								</select>
							</td>
						</tr>
					</table>
					<table id ="showDetail" class="showDetail right-menu">
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>					
						<tr>
							<th>객실 이름</th>
							<td><input type="text" class="form_w50" placeholder=""></td>
						</tr>
						<tr>
							<th>방 개수</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>대실가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>						
						<tr>
							<th>이색테마</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk1">
										<label for="ex_chk1">무인텔</label>&nbsp;
										<input type="checkbox" id="ex_chk2">
										<label for="ex_chk2">복층룸</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk3">
										<label for="ex_chk3">트윈베드</label>&nbsp;
										<input type="checkbox" id="ex_chk4">
										<label for="ex_chk4">야외테라스</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>스파시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk5">
										<label for="ex_chk5">스파</label>&nbsp;
										<input type="checkbox" id="ex_chk6">
										<label for="ex_chk6">사우나</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk7">
										<label for="ex_chk7">마사지베드</label>&nbsp;
										<input type="checkbox" id="ex_chk8">
										<label for="ex_chk8">히노끼탕</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>놀이시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk9">
										<label for="ex_chk9">수영장</label>&nbsp;
										<input type="checkbox" id="ex_chk10">
										<label for="ex_chk10">노래방</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk11">
										<label for="ex_chk11">당구장</label>&nbsp;
										<input type="checkbox" id="ex_chk12">
										<label for="ex_chk12">게임기</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>
					<table id ="showDetail2" class="showDetail right-menu" style="display: none;">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>객실 이름</th>
							<td><input type="text" class="form_w50" placeholder=""></td>
						</tr>
						<tr>
							<th>객실타입</th>
							<td>
								<div class="room_type">
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">5성급</label>
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">특1급</label>
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">특급</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>베드타입</th>
							<td>
								<div class="bed_type">
									<div>
										<input type="radio" id="bedtype_rds2" name="roomtype_rds2">
										<label for="roomtype_rds1">싱글</label>
										<input type="radio" id="bedtype_rds2" name="roomtype_rds2">
										<label for="roomtype_rds1">더블</label>
										<input type="radio" id="bedtype_rds2" name="roomtype_rds2">
										<label for="roomtype_rds1">트윈</label>
										<input type="radio" id="bedtype_rds2" name="roomtype_rds2">
										<label for="roomtype_rds1">온돌</label>
									</div>
								</div>
							</td>
						</tr>						
						<tr>
							<th>방 개수</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>						
						<tr>
							<th>공용시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk13">
										<label for="ex_chk13">수영장</label>&nbsp;
										<input type="checkbox" id="ex_chk14">
										<label for="ex_chk14">골프장</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk15">
										<label for="ex_chk15">스키장</label>&nbsp;
										<input type="checkbox" id="ex_chk16">
										<label for="ex_chk16">사우나</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>객실내시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk17">
										<label for="ex_chk17">스파</label>&nbsp;
										<input type="checkbox" id="ex_chk18">
										<label for="ex_chk18">와이파이</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk19">
										<label for="ex_chk19">냉장고</label>&nbsp;
										<input type="checkbox" id="ex_chk20">
										<label for="ex_chk20">에어컨</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>기타</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk21">
										<label for="ex_chk21">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk22">
										<label for="ex_chk22">발렛파킹</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk23">
										<label for="ex_chk23">무료주차</label>&nbsp;
										<input type="checkbox" id="ex_chk24">
										<label for="ex_chk24">픽업</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>
					<table id ="showDetail3" class="showDetail right-menu" style="display: none;">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>객실 이름</th>
							<td><input type="text" class="form_w50" placeholder=""></td>
						</tr>
						<tr>
							<th>객실타입</th>
							<td>
								<div class="room_type">
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">펜션</label>
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">풀빌라</label>
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">럭셔리</label>
								</div>
							</td>
						</tr>						
						<tr>
							<th>방 개수</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>대실가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>						
						<tr>
							<th>공용시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk25">
										<label for="ex_chk25">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk26">
										<label for="ex_chk26">공용PC</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk27">
										<label for="ex_chk27">수영장</label>&nbsp;
										<input type="checkbox" id="ex_chk28">
										<label for="ex_chk28">편의점</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>객실내시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk29">
										<label for="ex_chk29">와이파이</label>&nbsp;
										<input type="checkbox" id="ex_chk30">
										<label for="ex_chk30">스파</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk31">
										<label for="ex_chk31">TV</label>&nbsp;
										<input type="checkbox" id="ex_chk32">
										<label for="ex_chk32">세면도구</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>기타</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk33">
										<label for="ex_chk33">취사</label>&nbsp;
										<input type="checkbox" id="ex_chk34">
										<label for="ex_chk34">무료주차</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk35">
										<label for="ex_chk35">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk36">
										<label for="ex_chk36">캠프파이어</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>
					<table id ="showDetail4" class="showDetail right-menu" style="display: none;">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>객실 이름</th>
							<td><input type="text" class="form_w50" placeholder=""></td>
						</tr>
						<tr>
							<th>베드타입</th>
							<td>
								<div class="bed_type">
									<div>
										<input type="radio" id="bedtype_rds2" name="roomtype_rds2">
										<label for="roomtype_rds1">싱글</label>
										<input type="radio" id="bedtype_rds2" name="roomtype_rds2">
										<label for="roomtype_rds1">더블</label>
										<input type="radio" id="bedtype_rds2" name="roomtype_rds2">
										<label for="roomtype_rds1">트윈</label>
										<input type="radio" id="bedtype_rds2" name="roomtype_rds2">
										<label for="roomtype_rds1">온돌</label>
									</div>
								</div>
							</td>
						</tr>						
						<tr>
							<th>방 개수</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>대실가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>						
						<tr>
							<th>공용시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk37">
										<label for="ex_chk37">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk38">
										<label for="ex_chk38">공용PC</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk39">
										<label for="ex_chk39">주차장</label>&nbsp;
										<input type="checkbox" id="ex_chk40">
										<label for="ex_chk40">취사</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>객실내시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk41">
										<label for="ex_chk41">와이파이</label>&nbsp;
										<input type="checkbox" id="ex_chk42">
										<label for="ex_chk42">개인콘센트</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk43">
										<label for="ex_chk43">에어컨</label>&nbsp;
										<input type="checkbox" id="ex_chk44">
										<label for="ex_chk44">냉장고</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>기타</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk45">
										<label for="ex_chk45">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk46">
										<label for="ex_chk46">사물함</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk47">
										<label for="ex_chk47">반려견동반</label>&nbsp;
										<input type="checkbox" id="ex_chk48">
										<label for="ex_chk48">무료주차</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>
					<table id ="showDetail5" class="showDetail right-menu" style="display: none;">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>객실 이름</th>
							<td><input type="text" class="form_w50" placeholder=""></td>
						</tr>
						<tr>
							<th>캠핑유형</th>
							<td>
								<div class="room_type">
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">오토캠핑</label>
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">글램핑</label>
									<input type="radio" id="roomtype_rds1" name="roomtype_rds1">
									<label for="roomtype_rds1">카라반</label>
								</div>
							</td>
						</tr>						
						<tr>
							<th>방 개수</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>대실가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" placeholder=""></td>
						</tr>						
						<tr>
							<th>공용시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk49">
										<label for="ex_chk49">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk50">
										<label for="ex_chk50">편의점</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk51">
										<label for="ex_chk51">취사</label>&nbsp;
										<input type="checkbox" id="ex_chk52">
										<label for="ex_chk52">화장실</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>객실내시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk53">
										<label for="ex_chk53">샤워실</label>&nbsp;
										<input type="checkbox" id="ex_chk54">
										<label for="ex_chk54">와이파이</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk55">
										<label for="ex_chk55">에어컨</label>&nbsp;
										<input type="checkbox" id="ex_chk56">
										<label for="ex_chk56">냉장고</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>기타</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk57">
										<label for="ex_chk57">장비대여</label>&nbsp;
										<input type="checkbox" id="ex_chk58">
										<label for="ex_chk58">조식포함</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk59">
										<label for="ex_chk59">반려견동반</label>&nbsp;
										<input type="checkbox" id="ex_chk60">
										<label for="ex_chk60">캠프파이어</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>																				
				</form>
			</div>

			<div class="submit">
				<ul>
					<li><a href="#">수정</a></li>
					<li><a href="#">뒤로가기</a></li>
				</ul>
			</div>
		</div>
	</div>
 </body>
</html>
