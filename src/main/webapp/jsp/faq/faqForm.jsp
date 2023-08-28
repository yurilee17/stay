<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="ko">
		<link rel="stylesheet" href="css/common.css" />
 	    <link rel="stylesheet" href="css/more.css" />
	
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">

    <meta name="description" content="여기어때 회원 가입 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">

    <link rel="shortcut icon" href="img/images/web_v3/favicon_170822.ico" type="image/x-icon">

    <!-- CSS -->
    <title>TOP7 - 자주 묻는 질문 | 여기어때</title>
<!--     <link rel="stylesheet" href="/resource/css/common.css" /> -->
    <!-- <link rel="canonical" href="https://www.goodchoice.kr/faq"> -->
   <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>

    <script>(function (a, b, c) { if (c in b && b[c]) { var d, e = a.location, f = /^(a|html)$/i; a.addEventListener("click", function (a) { d = a.target; while (!f.test(d.nodeName)) d = d.parentNode; "href" in d && (d.href.indexOf("http") || ~d.href.indexOf(e.host)) && (a.preventDefault(), e.href = d.href) }, !1) } })(document, window.navigator, "standalone")</script>
</head>

<body>
<c:import url="/header" />
    <!-- Wrap -->
    <div class="wrap show">

        <!-- 헤더 -->
        <div th:replace="userthy/user-headerlogin :: user-headerlogin"></div>
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
                    <li><a class="active" href="faqForm">자주 묻는 질문</a></li>
                    <li><a class="" href="inquiryForm">1:1 문의</a></li>
                </ul>
            </nav>
            <div class="align_rt">

                <!-- Faq -->
                <div class="faq">

                    <div class="mobile_top">고객문의<a href="inquiryForm" class="top_btn">1:1문의</a></div>

                    <!-- 상단 탭 버튼 -->
                    <div class="top_link">
                        <li>
                            <a href="userindex/faq" class="on">TOP7</a>
                        </li>
                    </div>
                    <!-- //상단 탭 버튼 -->

                    <!-- List -->
                    <div class="faq_list">
                        <strong class="title">자주 묻는 질문</strong>
                        <div class="list" style="display:block">
                            <ul>
                                <li>
                                    <p class="link"><span>[숙박] 예약을 취소하고 싶어요.</span></p>
                                    <div class="ans">
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;">예약취소는&nbsp; 앱/웹 &gt; 내정보 &gt;
                                                    예약/구매내역에서 직접 가능합니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">예약/결제
                                                    진행 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우 취소수수료를 차감한 금액으로 환불
                                                    처리됩니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">일부
                                                    숙소에 한해 취소가 가능한 시점이나 앱/웹에서 취소가 불가할 수 있으니 이 경우에는 고객행복센터로 요청해 주시길
                                                    바랍니다.</span></font>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <p class="link"><span>[숙박] 천재지변으로 인한 예약취소는 어떻게 하나요?</span></p>
                                    <div class="ans">
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;">천재지변(기상악화)으로 숙소 이용이 불가할 경우 고객행복센터로
                                                    예약내역 및 증빙서류(결항확인서, e-티켓 등)를 보내주시면 확인 후 예약취소 여부를 안내해 드립니다.</span>
                                            </font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">다만,
                                                    상황에 따라 취소가 어려울 수 있는 점 참고 부탁드립니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;">[접수방법]</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">※ 이메일
                                                    : help@goodchoice.kr (예약자명, 숙소명, 체크인 날짜 필수)</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">※
                                                    카카오톡 : 카카오톡 내 플러스 친구 &gt; 여기어때 고객행복센터 추가</span></font>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <p class="link"><span>[숙박] 예약대기 건 예약취소하고 싶어요.</span></p>
                                    <div class="ans">
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">예약
                                                    대기중에는 여기어때 고객행복센터에 예약취소 요청해주시길 바랍니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">단,
                                                    예약확정이 될 경우 수수료가 발생하거나 예약취소가 불가할 수 있습니다.</span></font>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <p class="link"><span>[숙박] 체크인날짜/객실타입을 변경하고 싶어요.</span></p>
                                    <div class="ans">
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">예약 결제
                                                    완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">예약취소와
                                                    동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 예약취소 후 재결제 하셔서 이용
                                                    부탁드립니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">만약,
                                                    예약취소가 불가하거나 수수료가 발생하는 경우라면 고객행복센터로 문의해주시길 바랍니다.</span></font>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <p class="link"><span>[공통] 현금영수증 발급받고 싶어요.</span></p>
                                    <div class="ans">
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;">현금영수증은 현금성 결제수단으로 결제 시 발급이
                                                    가능합니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">결제
                                                    단계에서 현금영수증을 신청하면 자동으로 발행되지만,</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">신청을
                                                    누락했거나 발행받지 못한 경우라면 영수증 확인 후 국세청에서 자진발급분을 등록해 주시길 바랍니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;">[네이버페이]</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">- 결제
                                                    단계에서 현금영수증 신청하면 자동으로 발행 (19년 12월 26일 시행)</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">-
                                                    자진발급 : 네이버페이 &gt; 결제내역 &gt; 주문건 &gt; 주문상세정보 &gt; 영수증 발급내역 &gt; 현금영수증
                                                    확인</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">- 단,
                                                    19년 12월 26일 10시 이전 결제 건은 여기어때 고객행복센터로 요청</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;">[간편계좌이체 / TOSS / PAYCO]</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">- 결제
                                                    단계에서 현금영수증 신청하면 자동으로 발행</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">- 단,
                                                    간편계좌이체의 경우 신청 누락 시 여기어때 고객행복센터로 요청</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;">[카카오페이]&nbsp;</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">-
                                                    카카오페이머니 결제 시 자동으로 발행</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">-
                                                    자진발급 : 카카오톡 &gt; pay &gt; 우측톱니바퀴(나의 카카오페이) &gt; 이용내역 &gt; 결제 &gt; 개별
                                                    상세내역 &gt; 현금영수증 확인</span></font>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <p class="link"><span>[공통] 영수증(거래내역서) 발급받고 싶어요.</span></p>
                                    <div class="ans">
                                        <p>
                                            <font face="Arial"><span
                                                    style="font-size: 13px; white-space: pre-wrap;">예약정보와 결제정보가 기재되어 있는
                                                    영수증(거래내역서)은 여기어때 고객행복센터로 문의하시면 발급이 가능합니다.

                                                    예약내역, 영수증을 받으실 이메일 주소(또는 FAX번호)를 1:1문의 또는 카카오 상담톡으로 남겨주시길 바라며, 발급
                                                    완료까지는 영업일 기준 최대 1~2일 소요되오니 시간 양해 부탁드립니다.</span></font>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <p class="link"><span>[공통] 엘리트 적립이 안돼요.</span></p>
                                    <div class="ans">
                                        <div>
                                            <font color="#252525" face="arial"><span style="font-size: 13.3333px;">엘리트는
                                                    여기어때를 통해 숙소/모바일티켓 상관없이 실 결제금액 3만원 이상 예약한 경우에만 적용되며 숙소는 체크아웃(퇴실),
                                                    모바일티켓은 이용 완료 후 자동 적립됩니다.</span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;"><br></span></font>
                                        </div>
                                        <div>
                                            <font color="#252525" face="arial"><span
                                                    style="font-size: 13.3333px;">쿠폰/포인트 사용 후 실 결제금액이 3만원 미만일 경우 적립이
                                                    불가하오니 결제금액을 확인해주시길 바랍니다.</span></font>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //List -->

                </div>
                <!-- //Faq -->

            </div>

        </div>
        <!-- //Content  -->

        <!-- 푸터 -->
        <div th:replace="userthy/user-footer :: user-footer"></div>
        <!--푸터 끝 -->


    </div>


	<!-- //Wrap -->

	<!-- Script -->
	<!-- Library -->
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="js/iscroll.js"></script>

    <!-- Service -->
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/geolocation.js"></script>


    <!-- Page Script -->
    <script type="text/javascript" src="js/vue.js"></script>
    <script type="text/javascript" src="js/more.js"></script>
	



</body>

</html>