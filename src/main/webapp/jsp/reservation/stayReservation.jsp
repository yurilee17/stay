<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>취향대로 머물다 저기어때</title>

		<link rel="stylesheet" href="../../resource/css/reservation.css">
<!-- 		<script src="../../resource/js/stayreservation.js"></script> -->
		<link rel="preload" href="../../resource/css/common.css" as="style">
        <link rel="stylesheet" href="../../resource/css/common.css">
		<link data-n-head="ssr" rel="stylesheet" href="../../resource/js/owl.carousel.css">
		
		<script data-n-head="ssr" rel="text/javascript" src="../../resource/js/common.js" defer=""></script>
		<script data-n-head="ssr" rel="text/javascript" src="../../resource/js/iscroll.js" defer=""></script>
		<script type="text/javascript" async="" src="../../resource/js"></script>
		<script type="text/javascript" async="" src="../../resource/js/analytics.js"></script>
		<script type="text/javascript" async="" src="../../resource/js/js(1)"></script>
		<script async="" src="../../resource/js/gtm.js"></script>
		<script type="text/javascript" src="../../resource/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="../../resource/js/jquery.cookie.js"></script>
		<script data-n-head="ssr" src="../../resource/js/owl.carousel.min.js"></script>
	
		<!-- 결제 관련 JS 라이브러리, 함수 모음 -->
		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	    <!-- jQuery -->
	    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	    <!-- iamport.payment.js -->
	    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		<!-- 결제 관련 JS 라이브러리 모음 -->		
		
<script>
	// 페이지가 로드되면 실행될 함수
	document.addEventListener("DOMContentLoaded", function() {
		
		const checkAll = document.querySelector('input[name="checkAll"]');
		
		const checkOneList = document.querySelectorAll('input[name="checkOne"]');
		
		checkAll.addEventListener("click", function() {
			checkOneList.forEach(function(checkOne) {
				checkOne.checked = checkAll.checked;
			});
		});

		checkOneList.forEach(function(checkOne) {
			checkOne.addEventListener("click", function() {
				const allChecked = Array.from(checkOneList).every(function(checkOne) {
					return checkOne.checked;
				});
				checkAll.checked = allChecked;
			});
		});
	});
</script>

 </head>
 <body>
 	<c:import url="/header" />
<div class="reserve">
	<form id="reservationForm" action="reservationProc" method="post">
	<div class="right">
		<c:choose>
			<c:when test="${'motel' eq stayType }">
			<section class="info">
				<p class="name"><strong>숙소이름</strong><span class="stayname">${motel.mname}</span></p> 
				<p><strong>객실타입/기간</strong><span class="roomname">${motelroom.mroomname}</span> / </p> 
				<p><strong>체크인</strong>${motel.mstaycheckin}</p> 
				<p><strong>체크아웃</strong>${motel.mstaycheckout}</p>
			</section> 	
			<section class="total_price_pc">
				<p>
					<strong><b>총 결제 금액</b>(VAT포함)</strong>
					<span class="in_price" name="price">${motelroom.mstayprice}</span>
				</p> 
				<ul>
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li> 
					<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
					<input type="hidden" name="stayno" value="${motel.no }">					
					<input type="hidden" name="code" value="${motel.mcode }">
					<input type="hidden" name="roomcode" value="${motelroom.mroomcode }">
					<input type="hidden" name="roomimage" value="${motelroom.mroomimage }">
					<input type="hidden" name="stayname" value="${motel.mname}">
					<input type="hidden" name="roomname" value="${motelroom.mroomname}">
					<input type="hidden" name="checkindate" value="">
					<input type="hidden" name="checkoutdate" value="">
					<input type="hidden" name="checkintime" value="${motel.mstaycheckin}">
					<input type="hidden" name="checkouttime" value="${motel.mstaycheckout}">
					<input type="hidden" name="id" value="${sessionScope.id}">
					<input type="hidden" name="price" value="${motelroom.mstayprice}">
					<input type="hidden" name="paymethod" value="kakaopay">
				</ul>
			</section>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${'hotel' eq stayType }">
			<section class="info">
				<p class="name"><strong>숙소이름</strong><span class="stayname">${hotel.hname}</p> 
				<p><strong>객실타입/기간</strong><span class="roomname">${hotelroom.hbedtype}</span> / </p> 
				<p><strong>체크인</strong>${hotel.hcheckintime}</p> 
				<p><strong>체크아웃</strong>${hotel.hcheckouttime}</p>
			</section> 	
	
			<section class="total_price_pc">
				<p>
					<strong><b>총 결제 금액</b>(VAT포함)</strong>
					<span class="in_price">${hotelroom.hprice}</span>
				</p> 
				<ul>
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li> 
					<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
					<input type="hidden" name="stayno" value="${hotel.no }">					
					<input type="hidden" name="code" value="${hotel.hcode }">
					<input type="hidden" name="roomcode" value="${hotelroom.hroomcode }">
					<input type="hidden" name="roomimage" value="${hotelroom.hroomimage }">
					<input type="hidden" name="stayname" value="${hotel.hname}">
					<input type="hidden" name="roomname" value="${hotelroom.hroomname}">
					<input type="hidden" name="checkindate" value="">
					<input type="hidden" name="checkoutdate" value="">
					<input type="hidden" name="checkintime" value="${hotel.hcheckintime}">
					<input type="hidden" name="checkouttime" value="${hotel.hcheckouttime}">
					<input type="hidden" name="id" value="${sessionScope.id}">
					<input type="hidden" name="price" value="${hotelroom.hprice}">
					<input type="hidden" name="paymethod" value="kakaopay">					
				</ul>
			</section>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${'camping' eq stayType }">
			<section class="info">
				<p class="name"><strong>숙소이름</strong><span class="stayname">${camping.cname}</p> 
				<p><strong>객실타입/기간</strong><span class="roomname">${campingroom.croomname}</span> / </p> 
				<p><strong>체크인</strong>${camping.ccheckintime}</p> 
				<p><strong>체크아웃</strong>${camping.ccheckouttime}</p>
			</section> 	
	
			<section class="total_price_pc">
				<p>
					<strong><b>총 결제 금액</b>(VAT포함)</strong>
					<span class="in_price">${campingroom.cprice}</span>
				</p> 
				<ul>
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li> 
					<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
					<input type="hidden" name="stayno" value="${camping.no }">					
					<input type="hidden" name="code" value="${camping.ccode }">
					<input type="hidden" name="roomcode" value="${campingroom.croomcode }">
					<input type="hidden" name="roomimage" value="${campingroom.croomimage }">
					<input type="hidden" name="stayname" value="${camping.cname}">
					<input type="hidden" name="roomname" value="${campingroom.croomname}">
					<input type="hidden" name="checkindate" value="">
					<input type="hidden" name="checkoutdate" value="">
					<input type="hidden" name="checkintime" value="${camping.ccheckintime}">
					<input type="hidden" name="checkouttime" value="${camping.ccheckouttime}">
					<input type="hidden" name="id" value="${sessionScope.id}">
					<input type="hidden" name="name" value="${sessionScope.name}">
					<input type="hidden" name="price" value="${campingroom.cprice}">
					<input type="hidden" name="paymethod" value="kakaopay">								
				</ul>
			</section>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${'gh' eq stayType }">
			<section class="info">
				<p class="name"><strong>숙소이름</strong><span class="stayname">${gh.gname}</p> 
				<p><strong>객실타입/기간</strong><span class="roomname">${ghroom.gbedtype}</span> / </p> 
				<p><strong>체크인</strong>${gh.gcheckintime}</p> 
				<p><strong>체크아웃</strong>${gh.gcheckouttime}</p>
			</section> 	
	
			<section class="total_price_pc">
				<p>
					<strong><b>총 결제 금액</b>(VAT포함)</strong>
					<span class="in_price">${ghroom.gprice}</span>
				</p> 
				<ul>
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li> 
					<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
					<input type="hidden" name="stayno" value="${gh.no }">					
					<input type="hidden" name="code" value="${gh.gcode }">
					<input type="hidden" name="roomcode" value="${gh.groomcode }">
					<input type="hidden" name="roomimage" value="${ghroom.groomimage }">
					<input type="hidden" name="stayname" value="${gh.gname}">
					<input type="hidden" name="roomname" value="${ghroom.groomname}">
					<input type="hidden" name="checkindate" value="">
					<input type="hidden" name="checkoutdate" value="">
					<input type="hidden" name="checkintime" value="${gh.gcheckintime}">
					<input type="hidden" name="checkouttime" value="${gh.gcheckouttime}">
					<input type="hidden" name="id" value="${sessionScope.id}">
					<input type="hidden" name="name" value="${sessionScope.name}">
					<input type="hidden" name="price" value="${ghroom.gprice}">
					<input type="hidden" name="paymethod" value="kakaopay">								
				</ul>
			</section>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${'pension' eq stayType }">
			<section class="info">
				<p class="name"><strong>숙소이름</strong><span class="stayname">${pension.pname}</p> 
				<p><strong>객실타입/기간</strong><span class="roomname">${pentionroom.proomname}</span> / </p> 
				<p><strong>체크인</strong>${pention.pcheckintime}</p> 
				<p><strong>체크아웃</strong>${pention.pcheckouttime}</p>
			</section> 	
	
			<section class="total_price_pc">
				<p>
					<strong><b>총 결제 금액</b>(VAT포함)</strong>
					<span class="in_price">${pentionroom.pprice}</span>
				</p> 
				<ul>
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li> 
					<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
					<input type="hidden" name="stayno" value="${pension.no }">					
					<input type="hidden" name="code" value="${pension.pcode }">
					<input type="hidden" name="roomcode" value="${pensionroom.proomcode }">
					<input type="hidden" name="roomimage" value="${pensionroom.proomimage }">
					<input type="hidden" name="stayname" value="${pension.pname}">
					<input type="hidden" name="roomname" value="${pensionroom.proomname}">
					<input type="hidden" name="checkindate" value="">
					<input type="hidden" name="checkoutdate" value="">
					<input type="hidden" name="checkintime" value="${pension.pcheckintime}">
					<input type="hidden" name="checkouttime" value="${pension.pcheckouttime}">
					<input type="hidden" name="id" value="${sessionScope.id}">
					<input type="hidden" name="name" value="${sessionScope.name}">
					<input type="hidden" name="price" value="${pensionroom.pprice}">
					<input type="hidden" name="paymethod" value="kakaopay">								
				</ul>
			</section>
			</c:when>
		</c:choose> <!----> 
		<button type="button" onclick="payment_confirm()" class="btn_pay gra_left_right_red">결제하기</button>
	</div>
	<!-- onclick="requestPay()" -->

	<div class="left">
		<section class="info_chkin">
			<h3 style="margin-top:0;">예약자 정보</h3> 
			<strong>예약자 이름</strong> 
			<p class="inp_wrap remove">
				<input type="text" class="userName" name="userName" placeholder="체크인시 필요한 정보입니다." maxlength="20" value="${sessionScope.name}">
			</p> 
			<p data-show="name" class="alert_txt" style="visibility: hidden">한글, 영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능)</p> 
			<div>
				<strong class="mt_09">휴대폰 번호</strong> 
				<span class="safety_txt">개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</span> 
				<div class="phone_confirm guest-phone">
					<div class="input-box remove">
						<input type="tel" id="userPhone" name="userPhone" placeholder="체크인시 필요한 정보입니다." maxlength="13" value="${sessionScope.mobile}" class="input validation-required-input userPhone">
					</div> 
					<button type="button" class="btn_send btn_confirm phone-auth-btn" onclick="btnSend()">인증번호 전송</button>
					<p data-show="tel" class="alert_txt error-message" style="">휴대폰 번호를 확인해 주세요.</p>
					<div id="verificationCode" style="display:none; height:48px">
						<strong class="mt_09">인증번호</strong> 
						<section>
							<div class="input-box remove">
								<input id="digit" type="tel" minlength="4" maxlength="4" class="input validation-required-input">
								<span class="timer">03:00</span>								
							</div> 
							<button type="button" onclick="btnOk()" class="btn_ok btn_confirm phone-auth-btn">확인</button>
						</section>
					</div>
				</div>
			</div> 
		</section>
		 
		 <section class="pay_select"><h3>결제수단 선택</h3> 
			 <select id="payment-select" class="select_type_1">
				 <option data-minprice="0" selected="selected" value="KAKAO">카카오페이</option>
				 <option data-minprice="0" value="TOSS">토스페이</option>
				 <option data-minprice="0" value="CARD" >신용/체크 카드</option>
				 <option data-minprice="0" value="NAVER">네이버페이</option>
				 <option data-minprice="0" value="PAYCO">페이코</option>
				 <option data-minprice="0" value="CARD_BIZ">법인 카드</option>
				 <option data-minprice="0" value="CELLPHONE">휴대폰 결제</option>
			 </select>
		 </section> 
		 
		<section class="agree">
			<p class="all_check">
				<label>
					<input type="checkbox" name="checkAll" class="inp_chk_02">
					<span>전체 동의</span>
				</label>
			</p> 
			<p>
				<input type="checkbox" name="checkOne" class="inp_chk_02">
				<span onclick="pop_agree_01();">
					<i>숙소이용규칙 및 취소/환불규정 동의</i>
					<b>(필수)</b>
				</span>
			</p> 
			<p>
				<input type="checkbox" name="checkOne" class="inp_chk_02">
				<span onclick="pop_agree_02();">
					<i>개인정보 수집 및 이용 동의</i>
					<b>(필수)</b>
				</span>
			</p> 
			<p>
				<input type="checkbox" name="checkOne" class="inp_chk_02">
				<span onclick="pop_agree_03();">
					<i>개인정보 제 3자 제공 동의</i>
					<b> (필수)</b>
				</span>
			</p> 
		</section> 

	</div>
	</form>
		
<!-- 		<div id="pay_background">
			<div id="pay_box">
				<a href="https://reservation.goodchoice.kr/checkout/535ce80a-a6ec-4238-9795-3015a628a40b#">X</a> 
				<iframe id="pay_frame" style="position: relative; background: #fff; overflow: auto" src="./숙박예약_files/saved_resource.html"></iframe>
			</div>
		</div>  -->
			
		<div>
			<div class="layer pop_title reserve_chk">
				<strong>예약내역 확인</strong> 
				<div class="content">
					<div>
						<c:choose>
							<c:when test="${'motel' eq stayType }">
								<p class="name ellip">${motel.mname}</p> 
								<p class="reservname">${motelroom.mroomname}/1박</p> 
							</c:when>
							<c:when test="${'hotel' eq stayType }">
								<p class="name ellip">${hotel.hname}</p> 
								<p class="reservname">${hotelroom.hroomname}/1박</p> 
							</c:when>
							<c:when test="${'pension' eq stayType }">
								<p class="name ellip">${pension.pname}</p> 
								<p class="reservname">${pensionroom.proomname}/1박</p> 
							</c:when>
							<c:when test="${'gh' eq stayType }">
								<p class="name ellip">${gh.gname}</p> 
								<p class="reservname">${ghroom.groomname}/1박</p> 
							</c:when>
							<c:when test="${'camping' eq stayType }">
								<p class="name ellip">${camping.cname}</p> 
								<p class="reservname">${campingroom.croomname}/1박</p> 
							</c:when>														
						</c:choose>

						<p id="chkin_print_date" class="date mt_align"><span>체크인</span><b>08.14</b></p> 
						<p id="chkout_print_date" class="date"><span>체크아웃</span><b>08.15</b></p> 
						<ul id="refund_policy" class="policy01">
							<li class="dot_txt">
								[취소 불가 업소]
								<b  class="red">취소/환불이 불가합니다.</b>
								(단, 아래 상황에 한해서 고객행복센터를 통해
								취소할 수 있습니다.)
							</li> 
							<li class="dot_txt">
								예약/결제 직후 1시간 이내에는 취소가 가능하며,
								예약 당시 이미 체크인 시간을 넘긴 경우에는 15분
								이내에만 취소 가능합니다. (예약 직후 1시간
								이내라 하더라도 입실(체크인)시간 경과 시
								취소/환불 불가합니다.)
							</li> 
							<li class="dot_txt">
								숙소 사정에 의한 취소 시 100% 환불 가능합니다.
							</li>
						</ul>
					</div>
				</div>
					
				<div class="btn">
					<button onclick="close_layer();">취소</button> 
					<button class="agreePayment" onclick="requestKakao()">동의 후 결제</button>
				</div>
			</div> 
				
			<div class="layer pop_title pop_price">
				<strong>구매 총액</strong> 
				<div class="content">
					<div>
						<div class="iscroll_price">
							<ul class="scroller"></ul>
						</div> 
					<p></p>
					</div>
				</div> 
				<div class="btn btn_center">
					<button onclick="close_layer();">확인</button>
				</div>
			</div> 

			<div class="layer pop_fix pop_agree_01">
				<div class="fix_title">숙소이용규칙 및 취소/환불 규정(필수)
					<button onclick="close_layer();">닫기</button>
				</div> 
				<div class="fix_cont">
					<div class="scroller">
						<div class="txt">
							<strong>이용규칙</strong> 
							<ul class="dot_txt">
								<li>객실요금은 2인 기준이며, 파티룸 등 대형객실의 경우 입실 인원은 숙소에 문의해주세요. (3인이상 혼숙불가)</li> 
								<li>미성년자 혼숙은 법적으로 불가하며, 이에 대한숙소의 입실 거부 시 취소/환불이 불가합니다.</li> 
								<li>미성년자 예약에 대한 숙소의 입실 거부 시 취소/환불이 불가하오니, 예약 전 반드시 숙소에 확인하시기 바랍니다.</li> 
								<li>업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 저기어때에서 책임지지 않습니다.</li>
							</ul> 
							<strong>취소/환불규정</strong> 
							<ul class="dot_txt">
								<li>숙소 사정에 의해 취소 발생 시 100% 환불이 가능합니다.</li> 
								<li>
								모텔의 경우 예약/결제 직후 1시간 이내에는 100%
								취소/환불 가능 합니다. 단, 1시간 이내라고
								하더라도 입실(체크인) 시간을 경과한 경우에는
								취소 불가 합니다. 만약, 예약 당시 이미 체크인
								시간을 경과한 경우에는 예약/결제 직후 15분
								이내에만 취소 가능합니다.
								</li> 
								<li>
								취소/환불 불가 모텔인 경우, 상기 예약/결제 직후
								1시간 또는 15분 이내에 취소 가능 정책이 동일하게
								적용되나, 앱내에서 취소 불가하며 고객행복센터에
								전화를 통해 취소를 요청할 수 있습니다.
								</li> 
								<li>취소/환불 가능 모텔인지, 불가 모텔인지 여부는 숙소의 정책을 따릅니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div> 
				
			<div class="layer pop_fix pop_agree_02">
				<div class="fix_title">
					<b>개인정보 수집 및 이용 동의(필수)</b> 
					<button onclick="close_layer();">닫기</button>
				</div> 
				<div class="fix_cont">
					<div class="scroller">
						<div class="txt">
							<table cellpadding="0" cellspacing="0" class="pop_table">
								<tbody>
								<tr>
								<th>구분</th> 
								<th>수집/이용 목적</th> 
								<th>수집 항목</th> 
								<th>보유·이용기간</th>
								</tr> 
								<tr>
								<td>필수</td> 
								<td>예약/결제 서비스 이용</td> 
								<td>- 예약서비스이용: <br>예약자 이름,휴대폰 번호, CI<br><br>
									- 결제서비스이용: <br>(카드 결제 시)<br>카드사명,카드번호,유효기간,이메일<br>(휴대폰 결제 시)<br>
									휴대폰 번호, 통신사, 결제 승인번호<br>(계좌이체 시)<br>은행명, 계좌번호, 예금주<br>
									(현금 영수증 발급 시)<br>휴대폰 번호, 이메일<br>( 취소·환불을 위한 대급지급 요청시)<br>
									은행명, 계좌번호, 예금주명<br><br> 
									<div>- 서비스 이용: <br>
										서비스 이용시간/이용기록, 접수로그,
										이용컨텐츠, 접속IP정보, 기기모델명,
										브라우저 정보
									</div>
								</td> 
								<td ><b><i>전자상거래 상 소비자 보호에 관한 법률에 따라 5년간 보관</i></b></td>
								</tr>
								</tbody>
							</table> 
							
							<ul class="dot_txt">
								<li>※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.</li> 
								<li data-v-21d32a3a="">※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고</li>
							</ul>
						</div>
					</div>
				</div>
			</div> 
				
			<div class="layer pop_fix pop_agree_03">
				<div class="fix_title">
					<b>개인정보 제 3자 제공 동의(필수)</b> 
					<button onclick="close_layer();">닫기</button>
				</div> 
				<div class="fix_cont">
					<div class="scroller">
					<div class="txt">
						<table cellpadding="0" cellspacing="0" class="pop_table">
						<tbody>
							<tr>
								<th style="width: 25%;">제공받는 자</th> 
								<th style="width: 25%;">제공 목적</th> 
								<th style="width: 25%;">제공하는 항목</th> 
								<th style="width: 25%;">제공받는 자의 개인정보 보유 및 이용기간</th>
							</tr> 
							<tr>
							<td><b>
							<c:choose>
								<c:when test="${'motel' eq stayType }">
									${motel.mname}
								</c:when>
								<c:when test="${'hotel' eq stayType }">
									${hotel.hname}
								</c:when>
								<c:when test="${'pension' eq stayType }">
									${pension.pname}
								</c:when>
								<c:when test="${'gh' eq stayType }">
									${gh.gname}
								</c:when>
								<c:when test="${'camping' eq stayType }">
									${camping.cname}
								</c:when>
							</c:choose>
							</b></td> 							
								<td><b>숙박예약서비스 이용계약 이행<br>(서비스 제공, 확인, 이용자 정보 확인)</b></td> 
								<td>예약한 숙박서비스의 이용자 정보(예약자 이름, 휴대폰번호, 예약번호, 예약한 업체명, 예약한 객실명, 결제금액)</td> 
								<td><b>예약서비스 제공 완료 후 6개월</b></td>
							</tr> <!----> <!---->
						</tbody>
						</table> 
						<ul class="dot_txt">
							<li>※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.</li> 
							<li>※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고</li>
						</ul>
					</div>
					</div>
				</div>
			</div> 
		</div>
	</div>
</div>
			<script src="../../resource/js/payment.js"></script>
			<script src="../../resource/js/reservation.js"></script> 

 </body>
</html>
