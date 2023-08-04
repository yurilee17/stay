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
	 
     function CheckedCheckboxes() {
         // HTML에서 체크된 모든 체크박스 요소를 선택합니다.
         const checkedCheckboxes = document.querySelectorAll('input[type="checkbox"]:checked');

         // 선택된 체크박스의 값을 저장할 배열을 생성합니다.
         const checkedValues = [];

         // 선택된 체크박스의 값을 배열에 추가합니다.
         checkedCheckboxes.forEach((checkbox) => {
             checkedValues.push(checkbox.labels[0].innerText);
         });
		
         
         // 배열에 추가된 체크박스의 값들을 form action과 함께 전송하기
     }
 </script>
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
			
			<form id="staydetailForm" action="staydetailregisterProc" method="post" enctype="multipart/form-data">
			<div class="stay_registerdetail">
					<table class="stay_detailtable">
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>													
						<tr>
							<th>숙소 이름</th>
							<td><input type="text" class="form_w50" value="${motel.mname}" } readonly></td>
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
							<td><input type="text" class="form_w50" name="mroomname" id="mroomname" placeholder=""></td>
						</tr>
						<tr>
							<th>객실 코드</th>
							<td><input type="text" class="form_w30" name="mroomcode" id="mroomcode" placeholder=""></td>
						</tr>						
						<tr>
							<th>이미지 업로드</th>
							<td><input type="file" name="mroomimage" id="mroomimage" ></td>
						</tr>
						<tr>
							<th>방 개수</th>
							<td><input type="text" class="form_w30" name="mroomnumber" id="mroomnumber" placeholder=""></td>
						</tr>
						<tr>
							<th>대실가격</th>
							<td><input type="text" class="form_w30" name="mdaesilprice" id="mdaesilprice" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" name="mstayprice" id="mstayprice" placeholder=""></td>
						</tr>
						<tr>
							<th>대실체크인</th>
							<td><input type="text" class="form_w30" name="mdaesilcheckin" id="mdaesilcheckin" placeholder=""></td>
						</tr>
						<tr>
							<th>대실체크아웃</th>
							<td><input type="text" class="form_w30" name="mdaesilcheckout" id="mdaesilcheckout" placeholder=""></td>
						</tr>
						<tr>
							<th>대실시간</th>
							<td><input type="text" class="form_w30" name="mdaesiltime" id="mdaesiltime" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박체크인</th>
							<td><input type="text" class="form_w30" name="mstaycheckin" id="mstaycheckin" placeholder=""></td>
						</tr>		
						<tr>
							<th>숙박체크아웃</th>
							<td><input type="text" class="form_w30" name="mstaycheckout" id="mstaycheckout" placeholder=""></td>
						</tr>																																		
						<tr>
							<th>이색테마</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk1" value="무인텔">
										<label for="ex_chk1">무인텔</label>&nbsp;
										<input type="checkbox" id="ex_chk2" value="복층룸">
										<label for="ex_chk2">복층룸</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk3" value="트윈베드">
										<label for="ex_chk3">트윈베드</label>&nbsp;
										<input type="checkbox" id="ex_chk4" value="야외테라스">
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
										<input type="checkbox" id="ex_chk5" value="스파">
										<label for="ex_chk5">스파</label>&nbsp;
										<input type="checkbox" id="ex_chk6" value="사우나">
										<label for="ex_chk6">사우나</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk7" value="마사지베드">
										<label for="ex_chk7">마사지베드</label>&nbsp;
										<input type="checkbox" id="ex_chk8" value="히노끼탕">
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
										<input type="checkbox" id="ex_chk9" value="수영장">
										<label for="ex_chk9">수영장</label>&nbsp;
										<input type="checkbox" id="ex_chk10" value="노래방">
										<label for="ex_chk10">노래방</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk11" value="당구장">
										<label for="ex_chk11">당구장</label>&nbsp;
										<input type="checkbox" id="ex_chk12" value="게임기">
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
										<input type="checkbox" id="ex_chk13" value="수영장">
										<label for="ex_chk13">수영장</label>&nbsp;
										<input type="checkbox" id="ex_chk14" value="골프장">
										<label for="ex_chk14">골프장</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk15" value="스키장">
										<label for="ex_chk15">스키장</label>&nbsp;
										<input type="checkbox" id="ex_chk16" value="사우나">
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
										<input type="checkbox" id="ex_chk17" value="스파">
										<label for="ex_chk17">스파</label>&nbsp;
										<input type="checkbox" id="ex_chk18" value="와이파이">
										<label for="ex_chk18">와이파이</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk19" value="냉장고">
										<label for="ex_chk19">냉장고</label>&nbsp;
										<input type="checkbox" id="ex_chk20" value="에어컨">
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
										<input type="checkbox" id="ex_chk21" value="조식포함">
										<label for="ex_chk21">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk22" value="발렛파킹">
										<label for="ex_chk22">발렛파킹</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk23" value="무료주차">
										<label for="ex_chk23">무료주차</label>&nbsp;
										<input type="checkbox" id="ex_chk24" value="픽업">
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
										<input type="checkbox" id="ex_chk25" value="BBQ">
										<label for="ex_chk25">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk26" value="공용PC">
										<label for="ex_chk26">공용PC</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk27" value="수영장">
										<label for="ex_chk27">수영장</label>&nbsp;
										<input type="checkbox" id="ex_chk28" value="편의점">
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
										<input type="checkbox" id="ex_chk29" value="와이파이">
										<label for="ex_chk29">와이파이</label>&nbsp;
										<input type="checkbox" id="ex_chk30" value="스파">
										<label for="ex_chk30">스파</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk31" value="TV">
										<label for="ex_chk31">TV</label>&nbsp;
										<input type="checkbox" id="ex_chk32" value="세면도구">
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
										<input type="checkbox" id="ex_chk33" value="취사">
										<label for="ex_chk33">취사</label>&nbsp;
										<input type="checkbox" id="ex_chk34" value="무료주차">
										<label for="ex_chk34">무료주차</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk35" value="조식포함">
										<label for="ex_chk35">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk36" value="캠프파이어">
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
										<input type="checkbox" id="ex_chk37" value="BBQ">
										<label for="ex_chk37">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk38" value="공용PC">
										<label for="ex_chk38">공용PC</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk39" value="주차장">
										<label for="ex_chk39">주차장</label>&nbsp;
										<input type="checkbox" id="ex_chk40" value="취사"> 
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
										<input type="checkbox" id="ex_chk41" value="와이파이">
										<label for="ex_chk41">와이파이</label>&nbsp;
										<input type="checkbox" id="ex_chk42" value="개인콘센트">
										<label for="ex_chk42">개인콘센트</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk43" value="에어컨">
										<label for="ex_chk43">에어컨</label>&nbsp;
										<input type="checkbox" id="ex_chk44" value="냉장고">
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
										<input type="checkbox" id="ex_chk45" value="조식포함">
										<label for="ex_chk45">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk46" value="사물함">
										<label for="ex_chk46">사물함</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk47" value="반려견동반">
										<label for="ex_chk47">반려견동반</label>&nbsp;
										<input type="checkbox" id="ex_chk48" value="무료주차">
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
										<input type="checkbox" id="ex_chk49" value="BBQ">
										<label for="ex_chk49">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk50" value="편의점">
										<label for="ex_chk50">편의점</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk51" value="취사">
										<label for="ex_chk51">취사</label>&nbsp;
										<input type="checkbox" id="ex_chk52" value="화장실">
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
										<input type="checkbox" id="ex_chk53" value="샤워실">
										<label for="ex_chk53">샤워실</label>&nbsp;
										<input type="checkbox" id="ex_chk54" value="와이파이">
										<label for="ex_chk54">와이파이</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk55" value="에어컨">
										<label for="ex_chk55">에어컨</label>&nbsp;
										<input type="checkbox" id="ex_chk56" value="냉장고">
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
										<input type="checkbox" id="ex_chk57" value="장비대여">
										<label for="ex_chk57">장비대여</label>&nbsp;
										<input type="checkbox" id="ex_chk58" value="조식포함">
										<label for="ex_chk58">조식포함</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk59" value="반려견동반">
										<label for="ex_chk59">반려견동반</label>&nbsp;
										<input type="checkbox" id="ex_chk60" value="캠프파이어">
										<label for="ex_chk60">캠프파이어</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>																				

			</div>

			<div class="submit">
				<ul>

<!-- 					<li><a href="#">등록</a></li> -->
					<li><a href="${context }stayContent">뒤로가기</a></li>
					<li><input type="submit" value="등록"></li>
				</ul>
			</div>
			</form>
		</div>
	</div>
 </body>
</html>
