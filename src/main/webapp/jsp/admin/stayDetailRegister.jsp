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
	 /* function showSubMenu() {
		  var stayType = document.getElementById("stayType");
		  var showDetail = document.getElementsByClassName("showDetail");

		  // 모든 서브 메뉴 감추기
		  for (var i = 0; i < showDetail.length; i++) {
		    showDetail[i].style.display = "none";
		  }

		  // 선택된 값에 따라 해당 서브 메뉴 표시
		  if (stayType.value === "motel") {
		    document.getElementById("showDetail").style.display = "table";
		  } else if (stayType.value === "hotel") {
		    document.getElementById("showDetail2").style.display = "table";
		  } else if (stayType.value === "pension") {
		    document.getElementById("showDetail3").style.display = "table";
		  } else if (stayType.value === "gh") {
		    document.getElementById("showDetail4").style.display = "table";
		  } else if (stayType.value === "camping") {
		    document.getElementById("showDetail5").style.display = "table";
		  }
		}
	 	
	 
	 	document.addEventListener('DOMContentLoaded', function() {
		    var stayCodeElement = document.getElementById('mroomcode');

		    var xhr = new XMLHttpRequest();
		    xhr.open('GET', '/getMotelRoomCount', true);
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		            var dataCount = xhr.responseText;
		            stayCodeElement.textContent = dataCount;
		        }
		    };
		    xhr.send();
		}); */
</script>
 
 <body>
	<div id ="wrap">
		<div class="content">
			<c:url var="adminHeaderUrl" value="/jsp/admin/adminheader.jsp" />
			<c:import url="${adminHeaderUrl}" />
			<br>
			<!-- //숙소 탭 -->
			<br>
			<!-- 설명 -->
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<!-- 설명 -->
			
			<form id="staydetailForm" action="staydetailregisterProc" method="post" enctype="multipart/form-data">
			<input type="hidden" name="stayType" value="${stayType}">
			<div class="stay_registerdetail">
				<table class="stay_detailtable" id="stay_detailtable">
					<colgroup>
						<col width="25%"></col>
						<col width="*"></col>							
					</colgroup>													
					<tr>
						<th>숙소 이름</th>
						<td><c:choose>
						<c:when test="${'motel' eq stayType}"><input type="text" class="form_w50" value="${motel.mname}" readonly></c:when>
						<c:when test="${'hotel' eq stayType}"><input type="text" class="form_w50" value="${hotel.hname}" readonly></c:when>
						<c:when test="${'pension' eq stayType}"><input type="text" class="form_w50" value="${pension.pname}" readonly></c:when>
						<c:when test="${'gh' eq stayType}"><input type="text" class="form_w50" value="${gh.gname}" readonly></c:when>
						<c:when test="${'camping' eq stayType}"><input type="text" class="form_w50" value="${camping.cname}" readonly></c:when> 	
						</c:choose></td>
					</tr>						
					<tr>
						<th>종류</th>
						<td><c:choose>
						<c:when test="${'motel' eq stayType}"><input type="text" class="form_w50" value="모텔" readonly></c:when>
						<c:when test="${'hotel' eq stayType}"><input type="text" class="form_w50" value="호텔·리조트" readonly></c:when>
						<c:when test="${'pension' eq stayType}"><input type="text" class="form_w50" value="펜션" readonly></c:when>
						<c:when test="${'gh' eq stayType}"><input type="text" class="form_w50" value="게스트하우스" readonly></c:when>
						<c:when test="${'camping' eq stayType}"><input type="text" class="form_w50" value="캠핑·글램핑" readonly></c:when> 	
						</c:choose></td>
					</tr>
			
					<tr>
						<th>객실 이름</th>
						<td><input type="text" class="form_w50" name="roomname" id="roomname" placeholder=""></td>
					</tr>
					<tr>
						<th>객실 코드</th> <!-- <input type="text" class="form_w30" name="mroomcode" id="mroomcode" placeholder=""> -->
						<td><c:choose>
						<c:when test="${'motel' eq stayType}"><span id="mroomcode">${mroomcode}</span></c:when>
						<c:when test="${'hotel' eq stayType}"><span id="hroomcode">${hroomcode}</span></c:when>
						<c:when test="${'pension' eq stayType}"><span id="proomcode">${proomcode}</span></c:when>
						<c:when test="${'gh' eq stayType}"><span id="groomcode">${groomcode}</span></c:when>
						<c:when test="${'camping' eq stayType}"><span id="croomcode">${croomcode}</span></c:when>
						</c:choose></td>
					</tr>		
					<tr>
						<th>이미지 업로드</th>
						<td><input type="file" name="roomimage" id="roomimage" ></td>
					</tr>
					<tr>
						<th>방 개수</th>
						<td><input type="text" class="form_w30" name="roomnumber" id="roomnumber" placeholder=""></td>
					</tr>
					</table>
					
					<c:choose><c:when test="${'motel' eq stayType}">
					<table id ="showDetail" class="showDetail right-menu">
					<colgroup>
						<col width="25%"></col>
						<col width="*"></col>							
					</colgroup>							
					<tr>
						<th>대실가격</th>
						<td><input type="text" class="form_w30" name="mdaesilprice" id="mdaesilprice" placeholder=""></td>
					</tr>
					<tr>
						<th>숙박가격</th>
						<td><input type="text" class="form_w30" name="mstayprice" id="mstayprice" placeholder=""></td>
					</tr>																																		
					<tr>
						<th>이색테마</th>
						<td>
							<div class="checks small">
								<div>
									<input type="checkbox" id="ex_chk1" name="check1" value="무인텔">
									<label for="ex_chk1">무인텔</label>&nbsp;
									<input type="checkbox" id="ex_chk2" name="check1" value="복층룸">
									<label for="ex_chk2">복층룸</label>&nbsp;
								</div>
								<div>
									<input type="checkbox" id="ex_chk3" name="check1"" value="트윈베드">
									<label for="ex_chk3">트윈베드</label>&nbsp;
									<input type="checkbox" id="ex_chk4" name="check1" value="야외테라스">
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
									<input type="checkbox" id="ex_chk5" name="check2" value="스파">
									<label for="ex_chk5">스파</label>&nbsp;
									<input type="checkbox" id="ex_chk6" name="check2" value="사우나">
									<label for="ex_chk6">사우나</label>&nbsp;
								</div>
								<div>
									<input type="checkbox" id="ex_chk7" name="check2" value="마사지베드">
									<label for="ex_chk7">마사지베드</label>&nbsp;
									<input type="checkbox" id="ex_chk8" name="check2" value="히노끼탕">
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
									<input type="checkbox" id="ex_chk9" name="check3" value="수영장">
									<label for="ex_chk9">수영장</label>&nbsp;
									<input type="checkbox" id="ex_chk10" name="check3" value="노래방">
									<label for="ex_chk10">노래방</label>&nbsp;
								</div>
								<div>
									<input type="checkbox" id="ex_chk11" name="check3" value="당구장">
									<label for="ex_chk11">당구장</label>&nbsp;
									<input type="checkbox" id="ex_chk12" name="check3" value="게임기">
									<label for="ex_chk12">게임기</label>&nbsp;
								</div>
							</div>
						</td>
					</tr>
				</table>
				</c:when>
				<c:when test="${'hotel' eq stayType}">
					<table id ="showDetail2" class="showDetail right-menu">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>인원</th>
							<td><input type="text" class="form_w30" id="hpeople" name="hpeople" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" id="hprice" name="hprice" placeholder=""></td>
						</tr>						
						<tr>
							<th>베드타입</th>
							<td>
								<div>
									<label><input type="radio" name="hbedtype" value="싱글"> 싱글</label>
									<label><input type="radio" name="hbedtype" value="터블"> 더블</label>
									<label><input type="radio" name="hbedtype" value="트윈"> 트윈</label>	
									<label><input type="radio" name="hbedtype" value="온돌"> 온돌</label>																		
								</div>
							</td>
						</tr>												
						<tr>
							<th>공용시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk13" name="check1" value="수영장">
										<label for="ex_chk13">수영장</label>&nbsp;
										<input type="checkbox" id="ex_chk14" name="check1" value="골프장">
										<label for="ex_chk14">골프장</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk15" name="check1" value="스키장">
										<label for="ex_chk15">스키장</label>&nbsp;
										<input type="checkbox" id="ex_chk16" name="check1" value="사우나">
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
										<input type="checkbox" id="ex_chk17" name="check2" value="스파">
										<label for="ex_chk17">스파</label>&nbsp;
										<input type="checkbox" id="ex_chk18" name="check2" value="와이파이">
										<label for="ex_chk18">와이파이</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk19" name="check2" value="냉장고">
										<label for="ex_chk19">냉장고</label>&nbsp;
										<input type="checkbox" id="ex_chk20" name="check2" value="에어컨">
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
										<input type="checkbox" id="ex_chk21" name="check3"value="조식포함">
										<label for="ex_chk21">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk22" name="check3" value="발렛파킹">
										<label for="ex_chk22">발렛파킹</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk23" name="check3" value="무료주차">
										<label for="ex_chk23">무료주차</label>&nbsp;
										<input type="checkbox" id="ex_chk24" name="check3" value="픽업">
										<label for="ex_chk24">픽업</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>
					</c:when>
					<c:when test="${'pension' eq stayType}">
					<table id ="showDetail3" class="showDetail right-menu">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>				
						<tr>
							<th>인원</th>
							<td><input type="text" class="form_w30" id="ppeople" name="ppeople" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" id="pprice" name="pprice" placeholder=""></td>
						</tr>							
						<tr>
							<th>공용시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk25" name="check1" value="BBQ">
										<label for="ex_chk25">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk26" name="check1" value="공용PC">
										<label for="ex_chk26">공용PC</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk27" name="check1" value="수영장">
										<label for="ex_chk27">수영장</label>&nbsp;
										<input type="checkbox" id="ex_chk28" name="check1" value="편의점">
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
										<input type="checkbox" id="ex_chk29" name="check2" value="와이파이">
										<label for="ex_chk29">와이파이</label>&nbsp;
										<input type="checkbox" id="ex_chk30" name="check2" value="스파">
										<label for="ex_chk30">스파</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk31" name="check2" value="TV">
										<label for="ex_chk31">TV</label>&nbsp;
										<input type="checkbox" id="ex_chk32" name="check2" value="세면도구">
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
										<input type="checkbox" id="ex_chk33" name="check3" value="취사">
										<label for="ex_chk33">취사</label>&nbsp;
										<input type="checkbox" id="ex_chk34" name="check3" value="무료주차">
										<label for="ex_chk34">무료주차</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk35" name="check3" value="조식포함">
										<label for="ex_chk35">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk36" name="check3" value="캠프파이어">
										<label for="ex_chk36">캠프파이어</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>
					</c:when>
					<c:when test="${'gh' eq stayType}">
					<table id ="showDetail4" class="showDetail right-menu">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>인원</th>
							<td><input type="text" class="form_w30" id="gpeople" name="gpeople" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" id="gprice" name="gprice" placeholder=""></td>
						</tr>	
						<tr>
							<th>베드타입</th>
							<td>
								<div>
									<label><input type="radio" name="gbedtype" value="싱글"> 싱글</label>
									<label><input type="radio" name="gbedtype" value="더블"> 더블</label>
									<label><input type="radio" name="gbedtype" value="트윈"> 트윈</label>	
									<label><input type="radio" name="gbedtype" value="온돌"> 온돌</label>																		
								</div>
							</td>
						</tr>												
						<tr>
							<th>공용시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk37" name="check1" value="BBQ">
										<label for="ex_chk37">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk38" name="check1" value="공용PC">
										<label for="ex_chk38">공용PC</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk39" name="check1" value="주차장">
										<label for="ex_chk39">주차장</label>&nbsp;
										<input type="checkbox" id="ex_chk40" name="check1" value="취사"> 
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
										<input type="checkbox" id="ex_chk41" name="check2" value="와이파이">
										<label for="ex_chk41">와이파이</label>&nbsp;
										<input type="checkbox" id="ex_chk42" name="check2" value="개인콘센트">
										<label for="ex_chk42">개인콘센트</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk43" name="check2" value="에어컨">
										<label for="ex_chk43">에어컨</label>&nbsp;
										<input type="checkbox" id="ex_chk44" name="check2" value="냉장고">
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
										<input type="checkbox" id="ex_chk45" name="check3" value="조식포함">
										<label for="ex_chk45">조식포함</label>&nbsp;
										<input type="checkbox" id="ex_chk46" name="check3" value="사물함">
										<label for="ex_chk46">사물함</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk47" name="check3" value="반려견동반">
										<label for="ex_chk47">반려견동반</label>&nbsp;
										<input type="checkbox" id="ex_chk48" name="check3" value="무료주차">
										<label for="ex_chk48">무료주차</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>
					</c:when>
					
					<c:when test="${'camping' eq stayType}">
					<table id ="showDetail5" class="showDetail right-menu">	
						<colgroup>
							<col width="25%"></col>
							<col width="*"></col>							
						</colgroup>
						<tr>
							<th>인원</th>
							<td><input type="text" class="form_w30" id="cpeople" name="cpeople" placeholder=""></td>
						</tr>
						<tr>
							<th>숙박가격</th>
							<td><input type="text" class="form_w30" id="cprice" name="cprice" placeholder=""></td>
						</tr>							
						<tr>
							<th>공용시설</th>
							<td>
								<div class="checks small">
									<div>
										<input type="checkbox" id="ex_chk49" name="check1" value="BBQ">
										<label for="ex_chk49">BBQ</label>&nbsp;
										<input type="checkbox" id="ex_chk50" name="check1" value="편의점">
										<label for="ex_chk50">편의점</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk51" name="check1" value="취사">
										<label for="ex_chk51">취사</label>&nbsp;
										<input type="checkbox" id="ex_chk52" name="check1" value="화장실">
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
										<input type="checkbox" id="ex_chk53" name="check2" value="샤워실">
										<label for="ex_chk53">샤워실</label>&nbsp;
										<input type="checkbox" id="ex_chk54" name="check2" value="와이파이">
										<label for="ex_chk54">와이파이</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk55" name="check2" value="에어컨">
										<label for="ex_chk55">에어컨</label>&nbsp;
										<input type="checkbox" id="ex_chk56" name="check2" value="냉장고">
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
										<input type="checkbox" id="ex_chk57" name="check3" value="장비대여">
										<label for="ex_chk57">장비대여</label>&nbsp;
										<input type="checkbox" id="ex_chk58" name="check3" value="조식포함">
										<label for="ex_chk58">조식포함</label>&nbsp;
									</div>
									<div>
										<input type="checkbox" id="ex_chk59" name="check3" value="반려견동반">
										<label for="ex_chk59">반려견동반</label>&nbsp;
										<input type="checkbox" id="ex_chk60" name="check3" value="캠프파이어">
										<label for="ex_chk60">캠프파이어</label>&nbsp;
									</div>
								</div>
							</td>
						</tr>
					</table>	
					</c:when>																			
					</c:choose>
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
