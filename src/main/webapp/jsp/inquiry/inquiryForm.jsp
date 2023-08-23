<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
	<link rel="stylesheet" href="resource/css/common.css" />
	<c:import url="/header" />
	<script type="text/javascript" src="/resource/js/jquery-1.12.4.min.js"></script>


<link rel="stylesheet" href="../../resource/css/alert.css">
<link rel="stylesheet" href="../../resource/css/header.css">
    <link rel="stylesheet preload" href="../../resource/css/font.css" as="style" type="text/css" crossorigin="">
<header>

	<section>
		<h1>
			<a class="" href="index" title="여기어때">저기어때</a>
		</h1>
		<button type="button" class="btn_srch srch_open ">검색</button>
		<ul class="gnb">
			<li><a href="#">내주변</a></li>
			<li><a href="#">예약내역</a></li>
			<li class="over">
				<button type="button" id="more">
					<span>더보기</span>
				</button>
				<ul class="list_03">
					<li><a href="noticeForm">공지사항</a></li>
					<li><a href="faqForm">자주 묻는 질문</a></li>
					<li><a href="inquiryForm">1:1 문의</a></li>
					<li><a href="#">약관 및 정책</a></li>
				</ul>
			</li>
			
				
					<li><a href="/login"><span>로그인</span></a></li>
				
				
				
			

		</ul>
		<!-- 알림 -->
		<div class="alert">
			<!-- alert -->
			<div class="popTwobtn">
				<div class="btnText"></div>
				<div class="btn_wrap">
					<button onclick="closeLayer()">취소</button>
					<button onclick="logoutProc()" class="colMint"></button>
				</div>
			</div>
			<!-- Bg Dimm -->
			<div class="bgDimm" onclick="closeLayer();">&nbsp;</div>
			
		</div>
		<!-- Search 
		<div class="srch_bar">
			<div class="wrap_inp">
				<input type="text" id="keyword" placeholder="지역, 숙소명"
					autocomplete="off">
				<button type="button" class="btn_srch">검색</button>
			</div>
			<button class="btn_cancel" onclick="srch_close()">취소</button>
		</div>-->
	</section>
	<!-- //Search -->
</header>

<!-- alert -->



<!-- 추천검색어 
<div class="recommend_srch">
	<div class="scroll_srch">
		<div class="scroller">
			<div class="default" style="display: block">
				<strong>추천 검색어</strong>
				<ul></ul>
			</div>
			<!-- 연관검색어 
			<div class="chain">
				<ul></ul>
			</div>
		</div>
	</div>
</div>-->
<script src="../../resource/js/header.js"></script>
<script src="../../resource/js/alert.js"></script>
	<script type="text/javascript" src="/resource/js/jquery-1.12.4.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">

    <meta name="description" content="여기어때 회원 가입 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">

   <!-- <link rel="shortcut icon" href="/img/images/web_v3/favicon_170822.ico" type="image/x-icon"> --> 

	<!-- CSS -->
	<title>저기어때</title>
	<link rel="stylesheet" href="/resource/css/common.css" />
	<!-- <link rel="canonical" href="https://www.goodchoice.kr/"> -->
    <script type="text/javascript" src="/resource/js/jquery-1.12.4.min.js"></script>

	<script>(function (a, b, c) { if (c in b && b[c]) { var d, e = a.location, f = /^(a|html)$/i; a.addEventListener("click", function (a) { d = a.target; while (!f.test(d.nodeName)) d = d.parentNode; "href" in d && (d.href.indexOf("http") || ~d.href.indexOf(e.host)) && (a.preventDefault(), e.href = d.href) }, !1) } })(document, window.navigator, "standalone")</script>
</head>
<!-- 오른쪽 예약 내역  -->
<style>
	.content{
		border-radius: 2px 2px 0 0;
		border: 1px solid rgba(0, 0, 0, 0.08);
		clear:both;
		margin-bottom: 100px;


	}
	.history{
		font-weight: bold;
		display: block;
		padding: 0 0 20px 0;
		font-size: 18px;

	}
	.info1{ box-shadow: rgba(0, 0, 0, 0.1) 0px 20px 25px -5px, rgba(0, 0, 0, 0.04) 0px 10px 10px -5px;}
	.info2{
		/* float: left; */
		/* width: 354px; */
		height: auto;
		margin: 0 0px 16px 0;
	}
	.img1{

		border: 1px solid rgba(0, 0, 0, 0.08);
		/* background: rgba(107, 80, 80, 0.38); */
		z-index: 100;
	}

	.img3{
		z-index: 101;
	}
	/* 이미지 크기 조정 */
	.ahn_zzim_img1 img{
		max-height: 1000px;
		max-width: 100%;
	}

	.info3{
		display: block;
		position: relative;
		top: 0;
		left: 0;
		z-index: 10;
		width: 100%;
		height: auto;
		padding: 0 0;
		border: 1px solid rgba(0, 0, 0, 0.08);
		border-top: none;
		border-radius: 0 0 2px 2px;
		background: none;
		color: rgba(0, 0, 0, 0.87);
		text-align: center;
		box-sizing: border-box;

	}
	.title{
		padding-top: 16px;
		padding-bottom: 16px;
		font-weight: bold;
		font-size: 20px;
	}

	.btn1{
		padding-bottom: 10px;
	}

	.btn2 {

		width: 144px;
		height: 48px;
		display: inline-block;
		border: none;
		border-radius: 4px;
		font-size: 16px;
		color: #fff;
		text-align: center;
		box-sizing: border-box;
		vertical-align: top;
		background: linear-gradient(to bottom, #ff0055 0%, #e62243 100%);
	}

	.inquiry{
		background-color: white !important;
	}


</style>
<body>

	<!-- Wrap -->
	<div class="wrap">

		<!-- Header -->
             <!-- 헤더 -->
        <div th:replace="login :: login"></div>
        <!--헤더 끝 -->

        <!-- Bg Dimm -->
        <div class="bg_dimm" onclick="close_layer();">&nbsp;</div>
        <div class="bg_dimm_prevent">&nbsp;</div>

        <!-- 추천검색어 -->
        <div class="recommend_srch">
            <div class="scroll_srch">
                <div class="scroller">
                    <div class="default" style="display:block">
                        <strong>추천 검색어</strong>
                        <ul></ul>
                    </div>
                    <!-- 연관검색어 -->
                    <div class="chain">
                        <ul></ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div class="gnb_opacity"><button class="btn_close">닫기</button></div>
        <div class="menu_wrap">

            <div class="menu">
                <div class="top">
                    <!-- 회원 -->
                    <div class="member">
                        <div class="mem">
                            <span class="pic"
                                style="background:url('/img/profile/ico/ico_22.png') 50% 50% no-repeat;"></span>
                            <p class="info">사과색깔</p>
                        </div>
                    </div>
                </div>
                <!-- Iscroll -->
                <div class="scroll_nav">
                    <div class="scroller">
                        <ul>
                            <li><a href="/index">홈</a></li>
                            <li class="depth_2">
                                <button type="button" class="has_ul"><span>숙소유형</span></button>
                                <ul>
                                    <li><a href="/motel">모텔</a></li>
                                    <li><a href="/hotel">호텔/리조트</a></li>
                                    <li><a href="/pension">펜션</a></li>
                                    <li><a href="/resort">리조트</a></li>
                                    <li><a href="/camp">캠핑·글램핑</a></li>
                                    <li><a href="/gestHouse">게스트하우스</a></li>
                                    <li><a href="/koreanHouse">한옥 </a></li>
                                </ul>
                            </li>
                            <li><a href="/userindex/8">내주변</a></li>
                        </ul>
                        <ul>
                            <li><a href="/userindex/reservations">예약 내역</a></li>
                            <li><a href="/userindex/mypage">내 정보 관리</a></li>
                        </ul>
                        <ul>
                            <li class="depth_2"><button type="button" class="has_ul"><span>더보기</span></button>
                                <ul>
                                   <!-- <li><a href="/userindex/notice">공지사항</a></li> -->
                                    <li><a href="/userindex/faq">고객문의</a></li>
                                </ul>
                            </li>
                        </ul>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- //Mobile Menu -->

		<!-- CSS -->
		<link rel="stylesheet" href="resource/css/more.css" />

		<!-- Sub Top -->
		<div class="sub_top_wrap">
			<div class="sub_top bg_kong_3">
				<h2>더보기</h2>
			</div>
		</div>
		<!-- //Sub Top -->

		<!-- Content  -->
		<div id="content" class="sub_wrap more_wrap">

			<!-- Nav -->
            <nav>
                <ul>
                    <li><a class="" href="noticeForm">공지사항</a></li>                    
                    <li><a class="" href="faqForm">자주 묻는 질문</a></li>
                    <li><a class="active" href="inquiryForm">1:1 문의</a></li>
                </ul>
            </nav>
			<div class="align_rt">
		<!-- Inquiry -->
		<div class="inquiry">

			<div class="mobile_top">1:1문의<button class="top_btn" onclick="$('.tab .tab_btn').eq(1).trigger('click');">새 문의 작성</button></div>

			<!-- Tab -->
			<div class="tab">
				<span class="tab_btn active">나의 문의 내역</span>
				<span class="tab_btn ">새 문의 작성</span>
			</div>

			<!-- 리스트 -->
			<div class="tab_each" style="display:block">

									<!-- 리스트 없을때 -->
					<div class="list_none" style="display: block;">
						등록된 1:1 문의가 없습니다.
						<b>여기어때는 회원님들의 소중한 의견에 귀기울여<br/>신속하고 정확하게 답변드리도록 하겠습니다.</b>
					</div>
							</div>

			<!-- 작성 -->
			<div class="tab_each" >
				<form id="submitForm" name="inq-form" method="post" action="/more/inquiry_submit">
					<div class="alert_top">
						<p>여기어때 이용 중 불편하신 점을 문의주시면 <em>최대한 빠른 시일내에 답변 드리겠습니다.</em></p>
					</div>

					<section class="info_wrap">
						<b>카테고리유형</b>
						<select name="room_type" id="" class="select_type_2"  >
							<option value="">카테고리유형을 선택하세요</option>
															<option value="1"  >모텔</option>
															<option value="2"  >호텔·리조트</option>
															<option value="3"  >펜션</option>
															<option value="6"  >게스트하우스</option>
															<option value="5"  >캠핑/글램핑</option>
															<option value="7"  >한옥</option>
															<option value="10"  >액티비티</option>
															<option value="11"  >현금성(유상)포인트</option>
													</select>

						<!-- <b>문의유형</b>
						<select name="inq_type" id="inq_type" class="select_type_2"  >
							<option value="">문의유형을 선택하세요</option>
															<option value="8"  >이벤트</option>
															<option value="7"  >예약/결제</option>
															<option value="9"  >취소/환불</option>
															<option value="2"  >혜택받기</option>
															<option value="1"  >이용문의</option>
															<option value="4"  >회원정보</option>
															<option value="3"  >리뷰</option>
															<option value="10"  >환불신청</option>
															<option value="99"  >기타</option>
													</select> -->
	
						<div class="phone-block">
							<b>휴대폰 번호</b>
							<p class="inp_wrap"><input class="js-phone-number" data-type="phoneNumber" type="tel" maxlength="11" name="uphone" value="" placeholder="선택사항입니다."/></p>
						</div>

						<div class="email-block">
							<b>이메일</b>
							<p class="inp_wrap"><input data-email-validate class="js-email-string" type="email" value="" name="uemail" placeholder="선택사항입니다."/></p>
						</div>

						<!-- 환불받을 계좌정보 등록 -->
						<!-- <div class="account-block" data-account-select  >
							<b>환불받을 계좌정보 등록</b>
							<select name="accountBank" data-account-bank class="select_type_2" >
								<option value="none">은행선택</option>
																	<option value="우리은행">우리은행</option>
																	<option value="국민은행">국민은행</option>
																	<option value="기업은행">기업은행</option>
																	<option value="농협은행">농협은행</option>
																	<option value="신한은행">신한은행</option>
																	<option value="하나은행">하나은행</option>
																	<option value="한국씨티은행">한국씨티은행</option>
																	<option value="SC제일은행">SC제일은행</option>
																	<option value="경남은행">경남은행</option>
																	<option value="광주은행">광주은행</option>
																	<option value="대구은행">대구은행</option>
																	<option value="도이치은행">도이치은행</option>
																	<option value="부산은행">부산은행</option>
																	<option value="비엔피파리바은행">비엔피파리바은행</option>
																	<option value="산림조합">산림조합</option>
																	<option value="산업은행">산업은행</option>
																	<option value="새마을금고">새마을금고</option>
																	<option value="수출입은행">수출입은행</option>
																	<option value="수협은행">수협은행</option>
																	<option value="신협">신협</option>
																	<option value="우체국">우체국</option>
																	<option value="저축은행">저축은행</option>
																	<option value="전북은행">전북은행</option>
																	<option value="제주은행">제주은행</option>
																	<option value="중국건설은행">중국건설은행</option>
																	<option value="중국공상은행">중국공상은행</option>
																	<option value="카카오뱅크">카카오뱅크</option>
																	<option value="케이뱅크">케이뱅크</option>
																	<option value="BOA(뱅크오브아프리카)">BOA(뱅크오브아프리카)</option>
																	<option value="HSBC은행">HSBC은행</option>
																	<option value="JP모간체이스은행">JP모간체이스은행</option>
															</select>
							<p class="inp_wrap">
								<input name="accountNumber" data-account-number type="number" placeholder="계좌번호를 입력하세요.">
							</p>
							<p class="inp_wrap">
								<input name="accountName" data-account-name type="text" placeholder="예금주를 입력하세요." maxlength="10">
							</p>
						</div> -->
						<!-- //환불받을 계좌정보 등록 -->
					</section>

					<section class="text_wrap">
						<b>문의내용</b>
						<div>
							<textarea name="content" id="questionTextarea"></textarea>
							<ul class="placeholder_txt">
								<li>문의하실 내용을 10자 이상 입력해 주세요.</li>
								<li>문의하시는 제휴점 이름과 예약정보를 남겨주시면 보다 빠른 상담이 가능합니다.</li>
								<li>문의 내용 작성 시 개인정보가 입력되지 않도록 주의 부탁드립니다.</li>
							</ul>
						</div>
					</section>

					<section class="agree_wrap">
						<div>
							<input type="checkbox" id="info_agree" name="checkOne" class="inp_chk_04" disabled>
							<label for="info_agree">개인정보수집. 이용동의</label>
							<btn class="view_contents">[내용보기]</btn>
						</div>
					</section>

					<section class="btn_wrap ">
					</form>
						<button id="submitBtn" class="btn_red_fill" type="button">작성 완료</button>
					</section>
			</div>

			<!-- 개인정보처리방침동의 팝업 -->
			<div class="box_shadow" id="common_popup_agree">
				<div class="msg popup_cont">
					<div class="text">
						<div><strong class="privacy_title">개인정보 수집&middot;이용 동의하십니까? </strong></div>
						<div class="privacy-bill">
							<p>동의 하세요!!!</p>
							
						</div>
					</div>
					<div class="btns-wrap">
						<button class="btn disagree">닫기</button>
					</div>
				</div>
			</div>
			<!--// 개인정보처리방침동의 팝업 -->

			<!-- 개인정보처리방침동의 팝업2 -->
			<div class="box_shadow" id="common_popup_agree2">
				<div class="msg popup_cont">
					<div class="text">
						<div class="privacy-bill">
							작성하신 문의를 여기어때 고객행복센터로<br/>
							보내시겠습니까?
						</div>
					</div>
					<div class="btns-wrap">
						<button class="btn disagree2">취소</button>
						<button class="btn send-form" data-type="privacyAgree">보내기</button>
					</div>
				</div>
			</div>
			<!--// 개인정보처리방침동의 팝업2 -->

		</div>
		<!-- //Notice -->

	</div>

</div>


		<!-- //Content  -->

		<script>
/*			var phoneInput = document.querySelector('input[data-type="phoneNumber"]');
			var inquiryText = document.querySelector('textarea[name=content]');
			var emailInput = $('.q_emailcheck');
			var speed_fade = 150;
			var phoneReg = /^(01[0-1,6-9][0-9]{6,7}[0-9]$)/;
			var privacyAgreeButton = document.querySelector('button[data-type="privacyAgree"]');
			var emailFlag = null;

			$(document).ready(function () {

				$('select[name=room_type]').change(function () {// 카테고리유형 선택
					var key = $(this).find('option:selected').val();

					switch (key) {
						case '1':
							$('select[name=inq_type] option[value=2]').show();
							$('select[name=inq_type] option[value=99]').hide();
							break;
						case '10':
							$('select[name=inq_type] option[value=2]').hide();
							$('select[name=inq_type] option[value=99]').show();
							break;

						default:
							$('select[name=inq_type] option[value=2]').hide();
							$('select[name=inq_type] option[value=99]').hide();
					}
					checkFormComplete();
				});

				// $('select[name=inq_type]').change(function () { // 문의유형
				// 	var key = $(this).find('option:selected').val();
				//
				// 	if ($('[data-account-select]').is(':visible')) $('.account-block').hide();
				//
				// 	switch (key) {
				// 		case '2':
				// 			$('select[name=room_type] option:not(:first)').hide();
				// 			$('select[name=room_type] option[value=1]').show();
				// 			break;
				// 		case '9':
				// 			$('.account-block').show();
				// 			break;
				// 		case '10':
				// 			$('.account-block').show();
				// 			break;
				// 		case '99':
				// 			$('select[name=room_type] option:not(:first)').hide();
				// 			$('select[name=room_type] option[value=10]').show();
				// 			break;
				//
				// 		default:
				// 			$('select[name=room_type] option').show();
				// 	}
				// 	checkFormComplete();
				// });

				// 계좌번호 Max Length
				var accountNumberMaxLength = 20;
				$('[data-account-number]').on('input', function (e) {
					if (e.target.value.length >= accountNumberMaxLength) {
						var sliceString = e.target.value.slice(0, 20);
						e.target.value = sliceString;
						$('[accountNumber]').val(sliceString);
					}
				});


				setTimeout(function () {// 엘리먼트가 붙고 난 다음 이벤트리스너를 추가시켜주기 위해 3초 후 실행됨.
					$('.reset_val').on('click', function () {
						checkTelNumber($('input[data-type="phoneNumber"]').val())
					});
				}, 3000);

			});

			function openPrivacyAgreeModal(e) {
				$(e.target).blur();
				$('#common_popup_agree').fadeIn(speed_fade);
			}

			$('.view_contents').click(function () {
				var checkFag = $(this).parent('div').hasClass('active');
				if (checkFag == true) {
					$('#common_popup_agree').fadeIn(speed_fade);

				}

			});

			$('.disagree', '#common_popup_agree').click(function () {
				$('#common_popup_agree').fadeOut(speed_fade);
			});

			$('.disagree2', '#common_popup_agree2').click(function () {
				$('#common_popup_agree2').fadeOut(speed_fade);
				//카테고리 유형




			});

			privacyAgreeButton.addEventListener('click', function () {
				$('#common_popup_agree').fadeOut(speed_fade);
				phoneInput.removeEventListener('click', openPrivacyAgreeModal);
				setTimeout(function () {
					phoneInput.focus();
				}, speed_fade);
			});

			$('.js-phone-number').blur(function () {

				var thisValue = $(this).val();
				var mailValue = $('.js-email-string').val();

				if (thisValue == "" && mailValue == "") {
					$('.agree_wrap > div').removeClass('active');
					$('.agree_wrap > div input').attr('disabled', true);
				} else {
					$('.agree_wrap > div').addClass('active');
					$('.agree_wrap > div input').attr('disabled', false);
				}
			});

			$('.js-email-string').blur(function () {

				var thisValue = $(this).val();
				var phoneValue = $('.js-phone-number').val();

				if (thisValue == "" && phoneValue == "") {
					$('.agree_wrap > div').removeClass('active');
					$('.agree_wrap > div input').attr('disabled', true);
				} else {
					$('.agree_wrap > div').addClass('active');
					$('.agree_wrap > div input').attr('disabled', false);
				}
			});

			$.inqSubmit = function () {

				$("select[name=room_type]").removeAttr('disabled');
				$("select[name=inq_type]").removeAttr('disabled');

				if ($('select[name=room_type] option:selected').val() === '') {
					alert_Msg("숙소유형을 선택해주세요.");
					return false;
				}

				// if ($('select[name=inq_type] option:selected').val() === '') {
				// 	alert_Msg("문의유형을 선택해주세요.");
				// 	return false;
				// }

				if (phoneInput.value.length > 0 && !phoneReg.test(phoneInput.value)) {
					alert_Msg("휴대폰 번호를 확인해주세요");
					return false;
				}

				if (emailInput.value().length > 0 && !emailValueIdate(emailInput.value())) {
					alert_Msg("이메일주소를 확인해주세요");
					return false;
				}

				// 계좌 정보 validate
				if ($('[data-account-select]').is(':visible')) {
					var isSelected = $('[data-account-bank] option:selected').val();
					var accountArr = ['data-account-number', 'data-account-name'];
					var isCount = 0;

					for (var i = 0; i < accountArr.length; i++) {
						var targetValue = $('[' + accountArr[i] + ']').val();
						if (targetValue !== '') isCount++;
					}

					if (isSelected !== 'none' && isCount !== 2) {
						alert_Msg("환불받을 계좌정보를 확인해주세요");
						return false;
					}

					if (isSelected === 'none' && isCount !== 0) {
						alert_Msg("환불받을 계좌정보를 확인해주세요");
						return false;
					}
				}

				if ($('textarea[name=content]').val().length <= 10) {
					alert_Msg("문의내용은 10자 이상 입력해주세요.");
					return false;
				}

				if ($('input[name=checkOne]').is(":checked") === false && (phoneInput.value.length > 0 || emailInput.val().length > 0)) {
					alert_Msg("휴대폰번호 또는 이메일 입력 시<br>개인정보수집 이용에 동의해주셔야<br>문의 가능 합니다.");
					return false;
				}

				$('#common_popup_agree2').fadeIn(speed_fade);
				//$('form[name=inq-form]').submit(); //폼전송
			};
*/

			//axios 보내기 (팝업창 수락시뜸)
			/* $('.send-form').click(function () {
				// $('form[name=inq-form]').submit(); //폼전송
				const qCategory = $("select[name=room_type]").val();
				console.log('카테고리 유형:' + qCategory);
				//문의 이름
				const qName = $('.qName').val();
				console.log('이름:' + qName);
				//문의 휴대폰번호
				const qHp = $('.qHp').val();
				console.log('휴대폰번호:' + qHp);
				//문의 이메일
				const qEmail = $('.qEmail').val();
				console.log('이메일:' + qEmail);
				//문의내용
				const qContent = $('.getqContent').val();
				console.log('문의내용:' + qContent);

				console.log("memid : "+ sessionId)


				axios.request({
					method: 'POST',
					url: '/api/ques/regi/',
					headers: {'Content-type':'application/json'},
					data: {
						transaction_time:"2019-10-01",
						resultCode:"OK",
						description:"OK",
						data:{
							qcategory: qCategory,
							qname: qName,
							qhp: qHp,
							qemail: qEmail,
							qcontent: qContent,
							//이게 미답변이란 값이 나오면 값을숨길까?
							// qanswer: "미답변",
							tbMemId: sessionId
						}
					}
				}).then(
						alert('문의가 등록되었습니다')

				)
				location.href='/userindex/inquiry'


			});

			$.inqReadPro = function (uiqno) {// 문의내역 읽음처리
				$.ajax({
					type: 'POST',
					async: false,
					cache: false,
					url: '/more/inquiry_showpro_non',
					dataType: 'json',
					data: { 'uiqno': uiqno },
					success: function (data) {
						console.log(data);
					},
					error: function (request, status, error) {
						alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
			};

			$('input[data-type="phoneNumber"]').on('input', function () {//번호 입력시 동의구하기
				var this_val = $(this).val();
				checkTelNumber(this_val);
			});

			function checkTelNumber(target) { //휴대폰번호 길이 체크
				switch (true) {
					case (target.length == 0):
						$('.privacy_agree').removeClass("show");
						$('.privacy-bill').removeClass('show');
						break;
					case (target.length < 10 || !phoneReg.test(target)):
						$('.privacy_agree').removeClass("show");
						$('.privacy-bill').removeClass('show');
						break;
					default:  // this_val.length >= 10
						$('.privacy_agree').addClass("show");
						checkFormComplete();
						break;
				}
			}

			$('.q_emailcheck').on('keyup paste copy', function (e) { //이메일 체크
				var inputValue = e.currentTarget.value;
				var isEmailCheck = emailValidate(inputValue);
				if (isEmailCheck === true) {
					emailFlag = true;
				} else {
					emailFlag = false;
				}
			});

			function emailValidate(value) { //이메일 체크 정규식
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				return regExp.test(value);
			}

			function checkFormComplete() { // 전체 폼 체크해서 버튼 활성화
				if (phoneInput.value.length >= 10 && !phoneReg.test(phoneInput.value)) {
					return false;
				}

				if ($('textarea[name=content]').val().length < 10) {
					return false;
				}
				if (!$('select[name=room_type] option:selected').val()) {
					return false;
				}

				if (!$('select[name=inq_type] option:selected').val()) {
					return false; 
				}*/










			//}

		</script>


        <!-- 푸터 -->
        <div th:replace="userthy/user-footer :: user-footer"></div>
        <!--푸터 끝 -->


	</div>

	<!-- 상단으로 -->
	<button class="btn_go_top" onclick="moveTop();">상단으로</button>

	<!-- //Wrap -->

	<!-- Script -->
	<!-- Library -->
    <script type="text/javascript" src="/resource/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="/resource/js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="/resource/js/iscroll.js"></script>

    <!-- Service -->
    <script type="text/javascript" src="/resource/js/common.js"></script>
    <script type="text/javascript" src="/resource/js/geolocation.js"></script>


    <!-- Page Script -->
    <script type="text/javascript" src="/resource/js/vue.js"></script>
    <script type="text/javascript" src="/resource/js/more.js"></script>

	<!-- Body Spinner -->
	<div class="spinner show"><span></span></div>
	

	<!-- <script src="https://unpkg.com/axios/dist/axios.min.js"></script>-->

	<script type="text/javascript" src="/resource/js/submitHandler.js"></script>
		<!--  -->


</body>

</html>