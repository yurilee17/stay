<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Google Tag Manager -->
<!--<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/js"></script>
<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/js(1)"></script>
<script async="" src="./회원 가입 _ 여기어때 번호 전송_files/analytics.js.다운로드"></script>
<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/analytics.js.다운로드"></script>
<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/js(2)"></script>
<script async="" src="./회원 가입 _ 여기어때 번호 전송_files/gtm.js.다운로드"></script>
<script>
    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push(
    {'gtm.start': new Date().getTime(),event:'gtm.js'}
    );var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-PF7DJTT');</script>-->
<!-- End Google Tag Manager -->

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">
<script src="../../resource/js/dbQuiz.js"></script>

<!-- CSS -->
<title>회원가입 어때</title>
<link rel="stylesheet" href="../../resource/css/common.css">
<!-- <script type="text/javascript"
	src="./회원 가입 _ 여기어때 번호 전송_files/jquery-1.12.4.min.js"></script> -->

<!-- <script>
var _BASE_URL = 'https://www.goodchoice.kr/';
var _MOBILE = 'W';
var _KAKAOTALK_APP_KEY = 'f6ffb505bb11d7cc3584d443ce35f704';
var _FACEBOOK_APP_ID = '607467975974643';
</script> -->
<!--<script>(function(a,b,c){if(c in b&&b[c]){var d,e=a.location,f=/^(a|html)$/i;a.addEventListener("click",function(a){d=a.target;while(!f.test(d.nodeName))d    =d.parentNode;"href"in d&&(d.href.indexOf("http")||~d.href.indexOf(e.host))&&(a.preventDefault(),e.href=d.href)},!1)}})(document,window.navigator,"standalone")</script>
-->

<!--<script attributionsrc="" type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/f.txt"></script>-->
<!--<script type="text/javascript" async=""
	src="./회원 가입 _ 여기어때 번호 전송_files/f(1).txt"></script>-->
</head>
<body class="pc">
	<!-- Google Tag Manager (noscript) -->
	<!--<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PF7DJTT"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>-->
	<!-- End Google Tag Manager (noscript) -->

	<!-- Wrap -->
	<div class="wrap show">

		<!-- Custom Style -->
		<!--	<style type="text/css">
.validate_msg_label {
	margin-top: 20px;
	display: inline-block;
	font-size: 13px;
	color: red;
}

.inp_type_2 {
	padding: 0 10px;
}
</style>
 -->
		<div class="layer_fix pop_login pop_mem_reserve">
			<section>
				<div class="fix_title">
					<strong>휴대폰 본인 확인</strong>
				</div>

				<p>원활한 서비스 제공을 위해, 휴대폰 번호를 입력해주세요.</p>

				<div class="phone_confirm">
					<div id="sendCode">
						<strong>휴대폰 번호</strong>
						<section>
							<div class="inp_wrap remove">
								<input type="tel" id="phone" name="phone" maxlength="13">
								<!--<input type="tel" id="mobile" maxlength="13"> -->
								<button type="button" class="btn_checked"
									style="display: inline-block;">확인</button>
							</div>
							<button type="button" class="btn_send btn_confirm" id="nemButton"
								name="nemButton">인증번호 전송</button>
							<button type="button" class="btn_send btn_confirm dbclicked"
								style="display: none;">재전송</button>
							<!-- 활성화 클래스 'active' -->
							<script>
							    phoneNum(); // 함수 호출
							  </script>
						</section>
					</div>
					<div id="verificationCode" style="display: none;">
						<strong>인증번호</strong>
						<section>
							<div class="inp_wrap remove">
								<input type="tel" id="digit" minlength="4" maxlength="4">
								<span class="timer">02:45</span>
							</div>
							<button type="button" class="btn_ok btn_confirm"
								data-verification-type="call"
								data-verification-next="joinTemplate">확인</button>
						</section>
					</div>
					<input type="hidden" id="phone_certification_point" value="SIGINUP"
						style="display: none;">
				</div>
			</section>



		</div>



		<template id="joinFormTemplate"></template>

		<template id="nicknameFormTemplate"></template>

	</div>
	n>

	<!-- //Wrap -->

	<!-- Script -->
	<!-- Library -->
	<script type="text/javascript" src="../../resource/js/join.js"></script>
	<script type="text/javascript"
		src="../../resource/js/phone-verification.js.다운로드"></script>
	<script type="text/javascript" src="../../resource/js/validate.js.다운로드"></script>
	<script type="text/javascript"
		src="../../resource/js/user-validate.js.다운로드"></script>


	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/jquery.cookie.js.다운로드"></script>
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/jquery.lazyload.js.다운로드"></script>
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/iscroll.js.다운로드"></script>

	<!-- Service -->
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/common.js.다운로드"></script>
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/geolocation.js.다운로드"></script>

	<!-- Module -->
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/dialogPopup.js.다운로드"></script>

	<!-- Page Script -->
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/kakao.min.js.다운로드"></script>
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/jquery.validate.js.다운로드"></script>
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/messages_ko.js.다운로드"></script>
	<script type="text/javascript"
		src="./회원 가입 _ 여기어때 번호 전송_files/additional-methods.js.다운로드"></script>




	<!-- Body Spinner -->
	<div class="spinner show" style="display: none;">
		<span></span>
	</div>

	<div style="display: none;">
		<!-- 네이버 프리미엄 로그 분석(https://yeogirnd.atlassian.net/browse/SD-320)-->
		<script type="text/javascript"
			src="./회원 가입 _ 여기어때 번호 전송_files/wcslog.js.다운로드"></script>

		<script>

        const appsflyer = (function() {

            // 마케팅서비스
            const marketingServices = {
                yeogi: { number: 1, code: 'ye', },
                activity: { number: 2, code: 'ac', },
                daumDA: { number: 3, code: 'du', },
                channelingCPC: { number: 4, code: 'ns', },
                yeogiWebCPS: { number: 5,  code: 'yp', },
            }

            // 대그룹
            const largeGroups = {
                channelingEvent: { number: 56, code: 'ce', },
                kakaoShopping: { number: 49, code: 'ke', },
                mangoPlate: { number: 44, code: 'mp', },
                naverShopping: { number: 17,  code: 'ne', },
                quizMedia: { number: 58, code: 'qu', },
                testGroup: { number: 45, code: 'te', },
                tmap: { number: 32, code: 'tm', },
                triple: { number: 33, code: 'tr', },
            }

            const outCode = {
                naverShopping: 'ne_'
            }

            const adSet = {
                top : 'top',
                bottom: 'bottom',
            }

            const targetUrls = {
                baseURL: 'https://goodchoice.onelink.me/C4wC/',
                species: {
                    channeling: {
                        top: {
                            pathVariable: '2a0cfe91',
                            match: function(marketingServiceNumber, marketingCodesTrailingUnderscore) {
                                return marketingServiceNumber === marketingServices.channelingCPC.number &&
                                    containsMarketingCodeAndLargeCode(
                                        [largeGroups.channelingEvent, largeGroups.mangoPlate, largeGroups.tmap, largeGroups.triple],
                                        marketingCodesTrailingUnderscore,
                                        marketingServices.channelingCPC.code
                                    )
                            },
                        }
                    },
                    kakaoShopping: {
                        top: {
                            pathVariable: '873b4fab',
                            match: function(marketingServiceNumber, marketingCodesTrailingUnderscore) {
                                return marketingServiceNumber === marketingServices.channelingCPC.number &&
                                    containsMarketingCodeAndLargeCode(
                                        [largeGroups.kakaoShopping],
                                        marketingCodesTrailingUnderscore,
                                        marketingServices.channelingCPC.code
                                    )
                            }
                        },
                    },
                    naverShopping: {
                        top: {
                            pathVariable: '79261d0c',
                            match: function(marketingServiceNumber, marketingCodesTrailingUnderscore) {
                                return marketingCodesTrailingUnderscore.includes(outCode.naverShopping) ||
                                    (marketingServiceNumber === marketingServices.channelingCPC.number &&
                                        containsMarketingCodeAndLargeCode(
                                            [largeGroups.naverShopping],
                                            marketingCodesTrailingUnderscore,
                                            marketingServices.channelingCPC.code
                                        )
                                    )
                            }
                        },
                    },
                    etc: {
                        top: {
                            pathVariable: 'dcc68a19',
                            match: function(marketingServiceNumber, marketingCodesTrailingUnderscore, isBottomPopup) {
                                return !isBottomPopup;
                            }
                        },
                        bottom: {
                            pathVariable: '307f137',
                            match: function(marketingServiceNumber, marketingCodesTrailingUnderscore, isBottomPopup) {
                                return isBottomPopup;
                            }
                        }
                    },
                }
            }

			function getTopOrBottomKey(isBottomPopup) {
				return isBottomPopup ? adSet.bottom : adSet.top;
			}

			function getMatchedInfo(species, marketingServiceNumber, marketingCodesTrailingUnderscore, isBottomPopup) {
				return Object.keys(species)
						.map(function(species) { return targetUrls.species[species][getTopOrBottomKey(isBottomPopup)]; })
						.filter(function(type) { return !!type })
						.filter(function(type) { return type.match(marketingServiceNumber, marketingCodesTrailingUnderscore, isBottomPopup) })[0];
			}

			function containsMarketingCodeAndLargeCode(largeGroups, marketingCodesTrailingUnderscore, marketingServiceCode,) {
				return largeGroups.some(function(largeGroup) {
					return marketingCodesTrailingUnderscore.indexOf(marketingServiceCode + '_' + largeGroup.code + '_') != -1;
				})
			}

			return {
				marketingServices: marketingServices,
				largeGroups: largeGroups,
				targetUrls: targetUrls,
				getTopOrBottomKey: getTopOrBottomKey,
				getMatchedInfo: getMatchedInfo,
			}
		})();

		/**
		 * 앱스플라이어 마케팅 url
		 */
		function goAppStore(dialogCheck) {
			const isBottomPopup = !!dialogCheck;
			const kcode = getCookie('k_code');
			const kcodeSplit = kcode.split('^'); // 2.0: mkt_code^msid^device_type , 1.0: mkt_code only
			const marketingCodesTrailingUnderscore = kcodeSplit[0]; // ex: ns_ce_... ns(마케팅 서비스 code)_ce(대그룹 code)
			const marketingServiceNumber = Number(kcodeSplit[1]); // 마케팅 서비스 number

			location.href = appsflyer.targetUrls.baseURL +
						appsflyer.getMatchedInfo(
							appsflyer.targetUrls.species,
							marketingServiceNumber,
							marketingCodesTrailingUnderscore,
							isBottomPopup
						).pathVariable;
		}

		// 쿠키 생성
		function setCookie(cName, cValue, cDay){
			var expire = new Date();
			expire.setDate(expire.getDate() + cDay);
			cookies = cName + '=' + escape(cValue) + '; path=/ ';
			if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
			document.cookie = cookies;
		}

		// 쿠키 가져오기
		function getCookie(cName) {
			cName = cName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cName);
			var cValue = '';
			if(start != -1){
				start += cName.length;
				var end = cookieData.indexOf(';', start);
				if(end == -1)end = cookieData.length;
				cValue = cookieData.substring(start, end);
			}
			return unescape(cValue);
		}

		if (getCookie('marketing_type') != '') {
			if (getCookie('marketing_type') == 'pay') {
				var _nasa={};
				_nasa["cnv"] = wcs.cnv("1",getCookie('marketing_price')); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
			} else {
				var _nasa={};
				_nasa["cnv"] = wcs.cnv("2","1"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
			}

			//쿠키 삭제
			setCookie('marketing_price', '', -1);
			setCookie('marketing_type', '', -1);
		}
	</script>
		<script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-77719807-2', 'auto');
        ga('send', 'pageview');
    </script>

		<!-- Daum  중요 용도가 아니라면 주석처리 여부 결정 문제 없을시 삭제
    <script type="text/javascript">
        var roosevelt_params = {
            retargeting_id:'iaYgM3OBV.Uv.QOMJv.bqg00',
            tag_label:'BTecd8srQJ2G5hhOmZIanw'
        };
    </script>
    <script type="text/javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async></script -->

		<!-- Google Code for &#50668;&#44592;&#50612;&#46412;_&#50937; Conversion Page -->
		<script type="text/javascript">
        /* <![CDATA[ */
        var google_conversion_id = 964418007;
        var google_conversion_language = "en";
        var google_conversion_format = "3";
        var google_conversion_color = "ffffff";
        var google_conversion_label = "6YMHCM_i81wQ17PvywM";
        var google_remarketing_only = false;
        /* ]]> */
    </script>
		<script type="text/javascript"
			src="./회원 가입 _ 여기어때 번호 전송_files/f(2).txt"></script>

		<noscript>
			<div style="display: inline;">
				<img height="1" width="1" style="border-style: none;" alt=""
					src="//www.googleadservices.com/pagead/conversion/964418007/?label=6YMHCM_i81wQ17PvywM&amp;guid=ON&amp;script=0" />
			</div>
		</noscript>

		<!-- <script type="text/javascript">
		if (!wcs_add) var wcs_add={};
		wcs_add["wa"] = "s_4540c185467c";
		if (!_nasa) var _nasa={};
		wcs.inflow("goodchoice.kr");
		wcs_do(_nasa);
	</script> -->

		<!-- Global site tag (gtag.js) - Google AdWords: 802163829 -->
		<script async="" src="./회원 가입 _ 여기어때 번호 전송_files/js(3)"></script>
		<!--<script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'AW-802163829');

        // Event snippet for WEB_다운로드_버튼 conversion page In your html page, add the snippet and call gtag_report_conversion when someone clicks on the chosen link or button.
        
        $(function(){
            $('.appdown_link').on('click',function(){
                gtag('event', 'conversion', {
                    'send_to': 'AW-802163829/jxc6CN22x4MBEPWYwP4C'
                });
            });
        });
	</script> -->

		<!-- 채널제출 -->
		<span itemscope="" itemtype="http://schema.org/Organization">
			<link itemprop="url" href="https://www.goodchoice.kr/"> <a
			itemprop="sameAs" href="https://www.facebook.com/goodchoiceofficial"></a>
			<a itemprop="sameAs"
			href="https://play.google.com/store/apps/details?id=kr.goodchoice.abouthere"></a>
			<a itemprop="sameAs"
			href="https://itunes.apple.com/kr/app/id884043462"></a> <a
			itemprop="sameAs" href="https://post.naver.com/withinnovation"></a> <a
			itemprop="sameAs"
			href="https://www.youtube.com/channel/UCLI1HOVJdhWdVl9pT__g2Zw"></a>
		</span>
	</div>
	<script>
	let sessionUno = sessionStorage.getItem("uno");
	if(sessionUno) {
		sessionStorage.removeItem("uno");
	}
</script>


</body>
</html>