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

		<link rel="stylesheet" href="../../resource/css/daesil.css">
		<script src="../../resource/js/stayreservation.js"></script>
		<link rel="preload" href="../../resource/css/common.css" as="style">
        <link rel="stylesheet" href="../../resource/css/common.css">
		<link data-n-head="ssr" rel="stylesheet" href="../../resource/js/owl.carousel.css">
		
		<script data-n-head="ssr" src="../../resource/js/stayreservation.js"></script>
		<script data-n-head="ssr" rel="text/javascript" src="../../resource/js/common.js" defer=""></script>
		<script data-n-head="ssr" rel="text/javascript" src="../../resource/js/iscroll.js" defer=""></script>
		<script type="text/javascript" async="" src="../../resource/js"></script>
		<script type="text/javascript" async="" src="../../resource/js/analytics.js"></script>
		<script type="text/javascript" async="" src="../../resource/js/js(1)"></script>
		<script async="" src="../../resource/js/gtm.js"></script>
		<script type="text/javascript" src="../../resource/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="../../resource/js/jquery.cookie.js"></script>
		<script data-n-head="ssr" src="../../resource/js/owl.carousel.min.js"></script>

		
		
   <!-- 
		<script data-n-head="ssr" src="./숙박예약_files/nicepay_tr_utf.js.다운로드"></script>
		<script src="./숙박예약_files/niceUtil.js.다운로드" language="javascript"></script>
		<link rel="preload" href="./숙박예약_files/fca2520.js.다운로드" as="script">
		<link rel="preload" href="./숙박예약_files/8cdc020.js.다운로드" as="script">
		<link rel="preload" href="./숙박예약_files/13b946d.js.다운로드" as="script">
		<link rel="preload" href="./숙박예약_files/9fc1863.js.다운로드" as="script">
		<link rel="preload" href="./숙박예약_files/dde963b.js.다운로드" as="script">
		<link rel="preload" href="./숙박예약_files/a75c032.js.다운로드" as="script">
		<link rel="preload" href="./숙박예약_files/23e777a.js.다운로드" as="script">
		<link rel="preload" href="./숙박예약_files/71f8331.js.다운로드" as="script">
		<link rel="preload" href="./숙박예약_files/271632e.js.다운로드" as="script"> -->
		
		<!-- 결제 관련 JS 라이브러리, 함수 모음 -->
		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	    <!-- jQuery -->
	    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	    <!-- iamport.payment.js -->
	    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

		<!-- 결제 관련 JS 라이브러리 모음 -->		

 </head>
 <body>
 	<c:import url="/header" />
<div id="content">
		<div class="reserve">
	<div class="right">
		<section class="info">
			<p class="name"><strong>숙소이름</strong>${motel.mname}</p> 
			<p><strong>객실타입/기간</strong>${motelroom.mroomname}</p> 
		</section> 	

		<section class="total_price_pc">
			<p>
				<strong><b>총 결제 금액</b>(VAT포함)</strong>
				<span class="in_price">${motel.daesilprice}</span>
			</p> 
			<ul>
				<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li> 
				<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
			</ul>
		</section> <!----> 
		<button type="button" class="btn_pay gra_left_right_red">결제하기</button>
	</div>
  
  
  
  <div class="left">
	<section class="time_drag">
		<h3 style="margin-top:0">이용 정보</h3> 
		<div class="title">
			<strong>이용시간 <em class="use_time"></em> 
				<span>최대<b class="dayuse">4</b> 시간 이용가능</span>
			</strong>
		</div> 
		<div id="usetime" class="owl-carousel owl-loaded owl-drag">
			<div class="owl-stage-outer">
				<div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1234px; padding-left: 16px; padding-right: 16px;">
					<div class="owl-item active" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T11:30:00" class="item enable">11:30</button>
					</div>
					<div class="owl-item active" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T12:00:00" class="item enable">12:00</button>
					</div>
					<div class="owl-item active" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T12:30:00" class="item enable">12:30</button>
					</div>
					<div class="owl-item active" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T13:00:00" class="item enable">13:00</button>
					</div>
					<div class="owl-item active" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T13:30:00" class="item enable">13:30</button>
					</div>
					<div class="owl-item active" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T14:00:00" class="item enable">14:00</button>
					</div>
					<div class="owl-item active" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T14:30:00" class="item enable">14:30</button>
					</div>
					<div class="owl-item active" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T15:00:00" class="item enable">15:00</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T15:30:00" class="item">15:30</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T16:00:00" class="item">16:00</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T16:30:00" class="item">16:30</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T17:00:00" class="item">17:00</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T17:30:00" class="item">17:30</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T18:00:00" class="item">18:00</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T18:30:00" class="item">18:30</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T19:00:00" class="item">19:00</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T19:30:00" class="item">19:30</button>
					</div>
					<div class="owl-item" style="width: 64.75px; margin-right: 2px;">
						<button data-time="2023-08-14T20:00:00" disabled="disabled" class="item disable">20:00</button>	
					</div>
				</div>
			</div>
			
<!-- 			<div class="owl-nav disabled">
				<div class="owl-prev">prev</div>
				<div class="owl-next">next</div>
			</div>
			<div class="owl-dots">
				<div class="owl-dot active">
					<span></span>
				</div>
				<div class="owl-dot">
					<span></span>
				</div>
				<div class="owl-dot">
					<span></span>
				</div>
			</div> -->
		</div>
	</section> 
	<div>
		<section class="info_chkin">
			<h3 style="margin-top:0;">예약자 정보</h3> 
			<strong>예약자 이름</strong> 
			<p class="inp_wrap remove">
				<input type="text" name="userName" placeholder="체크인시 필요한 정보입니다." maxlength="20">
			</p> 
			<p data-show="name" class="alert_txt" style="visibility: hidden">한글, 영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능)</p> 
			<div>
				<strong class="mt_09">휴대폰 번호</strong> 
				<span class="safety_txt">개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</span> 
				<div class="phone_confirm guest-phone">
					<div class="input-box">
						<input type="tel" name="userPhone" placeholder="체크인시 필요한 정보입니다." maxlength="13" value="" class="input validation-required-input">
					</div> 
					<button type="button" class="btn_send btn_confirm phone-auth-btn">인증번호 전송</button> 
					<p data-show="tel" class="alert_txt error-message" style="">휴대폰 번호를 확인해 주세요.</p> 
					<div id="verificationCode" style="display:none; height:48px">
						<strong class="mt_09">인증 번호</strong> 
						<section>
							<div class="input-box">
								<input id="digit" type="tel" name="userPhone" minlength="4" maxlength="4" value="" class="input validation-required-input">
							</div> 
							<button type="button" class="btn_ok btn_confirm phone-auth-btn">확인</button>
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
			<p class="guest_chk_area">
				<input type="checkbox" name="checkOne" class="inp_chk_02">
				<span onclick="pop_agree_04();">
					<i>만 14세 이상 확인</i>
					<b>(필수)</b>
				</span>
			</p>
		</section>
						
						
						
				<button type="button" class="btn_pay gra_left_right_red" data-v-6119f4be="">
                    결제하기
                </button></div></div></div> <div id="pay_background" data-v-6119f4be=""><div id="pay_box" data-v-6119f4be=""><a href="https://reservation.goodchoice.kr/checkout/722704af-829b-43cb-ac90-5bd0c83e8b5f#" data-v-6119f4be="">X</a> <iframe id="pay_frame" style="position: relative; background: #fff; overflow: auto" data-v-6119f4be="" src="./대실예약_files/saved_resource.html"></iframe></div></div> <div data-v-21d32a3a="" data-v-6119f4be=""><div data-v-21d32a3a="" class="layer pop_title reserve_chk"><strong data-v-21d32a3a="">예약내역 확인</strong> <div data-v-21d32a3a="" class="content"><div data-v-21d32a3a=""><p data-v-21d32a3a="" class="name ellip">
                        종로 더 디자이너스
                    </p> <p data-v-21d32a3a="" class="name">
                        Suite(주차불가능)
                        /
                        대실
                    </p> <!----> <!----> <ul data-v-21d32a3a="" id="refund_policy"><li data-v-21d32a3a="" class="dot_txt">
                                [취소 불가 업소]
                                <b data-v-21d32a3a="" class="red">취소/환불이 불가합니다.</b>
                                (단, 아래 상황에 한해서 고객행복센터를 통해
                                취소할 수 있습니다.)
                            </li> <li data-v-21d32a3a="" class="dot_txt">
                                예약/결제 직후 1시간 이내에는 취소가 가능하며,
                                예약 당시 이미 체크인 시간을 넘긴 경우에는 15분
                                이내에만 취소 가능합니다. (예약 직후 1시간
                                이내라 하더라도 입실(체크인)시간 경과 시
                                취소/환불 불가합니다.)
                            </li> <li data-v-21d32a3a="" class="dot_txt">
                            숙소 사정에 의한 취소 시 100% 환불 가능합니다.
                        </li></ul></div></div> <div data-v-21d32a3a="" class="btn"><button data-v-21d32a3a="" onclick="close_layer();">취소</button> <button data-v-21d32a3a="">동의 후 결제</button></div></div> <div data-v-21d32a3a="" class="layer pop_title pop_price"><strong data-v-21d32a3a="">구매 총액</strong> <div data-v-21d32a3a="" class="content"><div data-v-21d32a3a=""><div data-v-21d32a3a="" class="iscroll_price"><ul data-v-21d32a3a="" class="scroller"></ul></div> <p data-v-21d32a3a=""></p></div></div> <div data-v-21d32a3a="" class="btn btn_center"><button data-v-21d32a3a="" onclick="close_layer();">확인</button></div></div> <div data-v-21d32a3a="" class="layer pop_fix pop_agree_01"><div data-v-21d32a3a="" class="fix_title">
                숙소이용규칙 및 취소/환불 규정(필수)
                <button data-v-21d32a3a="" onclick="close_layer();">닫기</button></div> <div data-v-21d32a3a="" class="fix_cont"><div data-v-21d32a3a="" class="scroller"><div data-v-21d32a3a="" class="txt"><strong data-v-21d32a3a="">이용규칙</strong> <ul data-v-21d32a3a="" class="dot_txt"><li data-v-21d32a3a="">
                                객실요금은 2인 기준이며, 파티룸 등 대형객실의
                                경우 입실 인원은 숙소에 문의해주세요. (3인이상
                                혼숙불가)
                            </li> <li data-v-21d32a3a="">
                                미성년자 혼숙은 법적으로 불가하며, 이에 대한
                                숙소의 입실 거부 시 취소/환불이 불가합니다.
                            </li> <li data-v-21d32a3a="">
                                미성년자 예약에 대한 숙소의 입실 거부 시
                                취소/환불이 불가하오니, 예약 전 반드시 숙소에
                                확인하시기 바랍니다.
                            </li> <li data-v-21d32a3a="">
                                업체 현장에서 객실 컨디션 및 서비스로 인해
                                발생된 분쟁은 여기어때에서 책임지지 않습니다.
                            </li></ul> <strong data-v-21d32a3a="">취소/환불규정</strong> <ul data-v-21d32a3a="" class="dot_txt"><li data-v-21d32a3a="">
                                숙소 사정에 의해 취소 발생 시 100% 환불이
                                가능합니다.
                            </li> <li data-v-21d32a3a="">
                                모텔의 경우 예약/결제 직후 1시간 이내에는 100%
                                취소/환불 가능 합니다. 단, 1시간 이내라고
                                하더라도 입실(체크인) 시간을 경과한 경우에는
                                취소 불가 합니다. 만약, 예약 당시 이미 체크인
                                시간을 경과한 경우에는 예약/결제 직후 15분
                                이내에만 취소 가능합니다.
                            </li> <li data-v-21d32a3a="">
                                취소/환불 불가 모텔인 경우, 상기 예약/결제 직후
                                1시간 또는 15분 이내에 취소 가능 정책이 동일하게
                                적용되나, 앱내에서 취소 불가하며 고객행복센터에
                                전화를 통해 취소를 요청할 수 있습니다.
                            </li> <li data-v-21d32a3a="">
                                취소/환불 가능 모텔인지, 불가 모텔인지 여부는
                                숙소의 정책을 따릅니다.
                            </li></ul></div></div></div></div> <div data-v-21d32a3a="" class="layer pop_fix pop_agree_02"><div data-v-21d32a3a="" class="fix_title"><b data-v-21d32a3a="">개인정보 수집 및 이용 동의(필수)</b> <button data-v-21d32a3a="" onclick="close_layer();">닫기</button></div> <div data-v-21d32a3a="" class="fix_cont"><div data-v-21d32a3a="" class="scroller"><div data-v-21d32a3a="" class="txt"><table data-v-21d32a3a="" cellpadding="0" cellspacing="0" class="pop_table"><tbody data-v-21d32a3a=""><tr data-v-21d32a3a=""><th data-v-21d32a3a="">구분</th> <th data-v-21d32a3a="">수집/이용 목적</th> <th data-v-21d32a3a="">수집 항목</th> <th data-v-21d32a3a="">보유·이용기간</th></tr> <tr data-v-21d32a3a=""><td data-v-21d32a3a="">필수</td> <td data-v-21d32a3a="">예약/결제 서비스 이용</td> <td data-v-21d32a3a="">
                                        - 예약서비스이용: <br data-v-21d32a3a="">예약자
                                        이름,휴대폰 번호, CI<br data-v-21d32a3a=""><br data-v-21d32a3a="">
                                        - 결제서비스이용: <br data-v-21d32a3a="">
                                        (카드 결제 시)
                                        <br data-v-21d32a3a="">카드사명,카드번호,유효기간,이메일<br data-v-21d32a3a="">
                                        (휴대폰 결제 시)<br data-v-21d32a3a="">
                                        휴대폰 번호, 통신사, 결제 승인번호<br data-v-21d32a3a="">
                                        (계좌이체 시)<br data-v-21d32a3a="">
                                        은행명, 계좌번호, 예금주<br data-v-21d32a3a="">
                                        (현금 영수증 발급 시)<br data-v-21d32a3a="">
                                        휴대폰 번호, 이메일<br data-v-21d32a3a="">
                                        ( 취소·환불을 위한 대급지급 요청
                                        시)<br data-v-21d32a3a="">
                                        은행명, 계좌번호, 예금주명<br data-v-21d32a3a=""><br data-v-21d32a3a=""> <div data-v-21d32a3a="">
                                            - 서비스 이용: <br data-v-21d32a3a="">
                                            서비스 이용시간/이용기록, 접수로그,
                                            이용컨텐츠, 접속IP정보, 기기모델명,
                                            브라우저 정보
                                        </div></td> <td data-v-21d32a3a=""><b data-v-21d32a3a=""><i data-v-21d32a3a="">전자상거래 상 소비자 보호에
                                                관한 법률에 따라 5년간 보관</i></b></td></tr></tbody></table> <ul data-v-21d32a3a="" class="dot_txt"><li data-v-21d32a3a="">
                                ※ 위 동의 내용을 거부하실 수 있으나, 동의를
                                거부하실 경우 서비스를 이용하실 수 없습니다.
                            </li> <li data-v-21d32a3a="">
                                ※ 개인정보 처리와 관련된 상세 내용은
                                '개인정보처리방침'을 참고
                            </li></ul></div></div></div></div> <div data-v-21d32a3a="" class="layer pop_fix pop_agree_03"><div data-v-21d32a3a="" class="fix_title"><b data-v-21d32a3a="">개인정보 제 3자 제공 동의(필수)</b> <button data-v-21d32a3a="" onclick="close_layer();">닫기</button></div> <div data-v-21d32a3a="" class="fix_cont"><div data-v-21d32a3a="" class="scroller"><div data-v-21d32a3a="" class="txt"><table data-v-21d32a3a="" cellpadding="0" cellspacing="0" class="pop_table"><tbody data-v-21d32a3a=""><tr data-v-21d32a3a=""><th data-v-21d32a3a="" style="width: 25%;">제공받는 자</th> <th data-v-21d32a3a="" style="width: 25%;">제공 목적</th> <th data-v-21d32a3a="" style="width: 25%;">제공하는 항목</th> <th data-v-21d32a3a="" style="width: 25%;">
                                        제공받는 자의 개인정보 보유 및 이용기간
                                    </th></tr> <tr data-v-21d32a3a=""><td data-v-21d32a3a=""><b data-v-21d32a3a="">종로 더 디자이너스</b></td> <td data-v-21d32a3a=""><b data-v-21d32a3a="">숙박예약서비스 이용계약 이행<br data-v-21d32a3a="">(서비스
                                            제공, 확인, 이용자 정보 확인)</b></td> <td data-v-21d32a3a="">
                                        예약한 숙박서비스의 이용자 정보(예약자
                                        이름, 휴대폰번호, 예약번호, 예약한
                                        업체명, 예약한 객실명, 결제금액)
                                    </td> <td data-v-21d32a3a=""><b data-v-21d32a3a="">예약서비스 제공 완료 후 6개월</b></td></tr> <!----> <!----></tbody></table> <ul data-v-21d32a3a="" class="dot_txt"><li data-v-21d32a3a="">
                                ※ 위 동의 내용을 거부하실 수 있으나, 동의를
                                거부하실 경우 서비스를 이용하실 수 없습니다.
                            </li> <li data-v-21d32a3a="">
                                ※ 개인정보 처리와 관련된 상세 내용은
                                '개인정보처리방침'을 참고
                            </li></ul></div></div></div></div> <div data-v-21d32a3a="" class="layer pop_fix pop_agree_04"><div data-v-21d32a3a="" class="fix_title">
                만 14세 이상 확인(필수)
                <button data-v-21d32a3a="" onclick="close_layer();">닫기</button></div> <div data-v-21d32a3a="" class="fix_cont"><div data-v-21d32a3a="" class="scroller"><div data-v-21d32a3a="" class="txt"><strong data-v-21d32a3a="">만 14세 이상 확인</strong> <p data-v-21d32a3a="" class="subtitle">
                            여기어때는 <b data-v-21d32a3a="">만 14세 미만 아동</b>의
                            <b data-v-21d32a3a="">서비스 이용을 제한</b>하고 있습니다.
                        </p> <p data-v-21d32a3a="">
                            정보통신망 이용촉진 및 정보보호 등에 관한 법률에는
                            만 14세 미만 아동의 개인정보 수집 시 법정대리인
                            동의를 받도록 규정하고 있으며,
                            <i data-v-21d32a3a="">만 14세 미만 아동이 법정대리인 동의없이 서비스
                                이용이 확인된 경우 서비스 이용이 제한될 수
                                있음을 알려드립니다.</i></p></div></div></div></div> <div data-v-21d32a3a="" class="layer pop_fix pop_agree_05"><div data-v-21d32a3a="" class="fix_title">
                만 14세 이상 확인(필수)
                <button data-v-21d32a3a="" onclick="close_layer();">닫기</button></div> <div data-v-21d32a3a="" class="fix_cont"><div data-v-21d32a3a="" class="scroller"><div data-v-21d32a3a="" class="txt"><strong data-v-21d32a3a="">만 14세 이상 확인</strong> <p data-v-21d32a3a="" class="subtitle">
                            여기어때는 <b data-v-21d32a3a="">만 14세 미만 아동</b>의
                            <b data-v-21d32a3a="">서비스 이용을 제한</b>하고 있습니다.
                        </p> <p data-v-21d32a3a="">
                            정보통신망 이용촉진 및 정보보호 등에 관한 법률에는
                            만 14세 미만 아동의 개인정보 수집 시 법정대리인
                            동의를 받도록 규정하고 있으며,
                            <i data-v-21d32a3a="">만 14세 미만 아동이 법정대리인 동의없이 서비스
                                이용이 확인된 경우 서비스 이용이 제한될 수
                                있음을 알려드립니다.</i></p></div></div></div></div> <div data-v-21d32a3a="" class="business_pop"><div data-v-21d32a3a="" class="list"><h4 data-v-21d32a3a="">숙박서비스 제공업체 리스트</h4> <button data-v-21d32a3a="" onclick="list_close();" class="btn_close">닫기</button> <div data-v-21d32a3a=""><ul data-v-21d32a3a="" id="ajax_ad_list"></ul> <div data-v-21d32a3a="" id="pagination"></div></div></div></div></div> <!----> <!----></div> 
    


</body>
</html>