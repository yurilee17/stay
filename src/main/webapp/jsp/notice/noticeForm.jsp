<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!DOCTYPE html>
	<html lang="ko">
 	<link rel="stylesheet" href="resource/css/common.css" />
	<c:import url="/header" />
	<script type="text/javascript" src="/resource/js/jquery-1.12.4.min.js"></script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">

    <meta name="description" content="여기어때 회원 가입 | 전국 호텔, 펜션, 모텔부터 워터파크, 놀이공원, 아쿠아리움까지 최저가 할인 예약">

    <link rel="shortcut icon" href="/img/images/web_v3/favicon_170822.ico" type="image/x-icon">

    <!-- CSS -->
    <title>더보기 - 공지사항 | 저기어때</title>
    <link rel="stylesheet" href="/resource/css/more.css" />
    <!-- <link rel="canonical" href="https://www.goodchoice.kr/more/notice"> -->
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>

    <script>(function (a, b, c) { if (c in b && b[c]) { var d, e = a.location, f = /^(a|html)$/i; a.addEventListener("click", function (a) { d = a.target; while (!f.test(d.nodeName)) d = d.parentNode; "href" in d && (d.href.indexOf("http") || ~d.href.indexOf(e.host)) && (a.preventDefault(), e.href = d.href) }, !1) } })(document, window.navigator, "standalone")</script>
</head>

<body>

    <!-- Wrap -->
    <div class="wrap">
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
                                    <li><a href="/gesthouse">게스트하우스</a></li>
                                    <li><a href="/koreanhouse">한옥 </a></li>
                                </ul>
                            </li>
                            <li><a href="/around">내주변</a></li>
                        </ul>
                        <ul>
                            <li><a href="reservations">예약 내역</a></li>
                            <li><a href="mypage">내 정보 관리</a></li>
                        </ul>
                        <ul>
                            <li class="depth_2"><button type="button" class="has_ul"><span>더보기</span></button>
                                <ul>
                                    <li><a href="/userindex/notice">공지사항</a></li>
                                    
                                    <li><a href="/userindex/project">혁신 프로젝트</a></li>
                                    <li><a href="/userindex/faq">고객문의</a></li>
                                    <li><a href="/userindex/terms">약관 및 정책</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                 </div>
            </div>
        </div>
        <!-- //Mobile Menu -->

        <!-- CSS -->
        <link rel="stylesheet" href="/resource/css/more.css" />

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
                    <li><a class="active" href="/noticeForm">공지사항</a></li>
                    <li><a class="" href="/userindex/faq">자주 묻는 질문</a></li>
                    <li><a class="" href="/inquiryForm">1:1 문의</a></li>
                </ul>
            </nav>
            <div class="align_rt">

			<!-- Notice -->
            <div class="notice">

				<div class="mobile_top">공지사항</div>

				<!-- Tab -->
				<div class="tab">
					<span class="tab_btn active">서비스 공지사항 <i class="ico_new">NEW</i></span>
					<!-- <span class="tab_btn">여기어때 언론보도 <i class="ico_new">NEW</i></span> -->
				</div>

				<!-- 공지사항  -->
				<div class="tab_each">
					<ul id="notices" class="show_list open_list"><li><a href="#" id="notive_tab" class="list_que open"><p>[발표] 1조 저기어때 공지사항</p> <span>2023.08.04
                                    <i class="ico_new">NEW</i></span></a> <div style="display: none;"><div><span style="font-family: arial; font-size: 10pt;">안녕하세요.&nbsp;</span><span style="font-family: arial; font-size: 10pt;">파이널 프로젝트&nbsp;</span><span style="font-family: arial; font-size: 10pt;">1조 저기어때입니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">8월 4일</span><span style="font-family: arial; font-size: 10pt;">감사합니다.</span></div><div><span style="font-family: arial; font-size: 10pt;"><br></span></div><div><google-sheets-html-origin><table xmlns="http://www.w3.org/1999/xhtml" cellspacing="0" cellpadding="0" dir="ltr" style="table-layout: fixed; font-size: 10pt; font-family: arial, sans, sans-serif; width: 0px;"><colgroup><col width="104"><col width="120"><col width="132"></colgroup><tbody><tr style="height: 21px;"><td style="overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td><td style="overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td><td style="overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td></tr><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;■ 이벤트 당첨자&quot;}" style="border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; font-weight: bold;">■ 이벤트 당첨자</td><td style="border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td><td style="border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td></tr><tr style="height: 44px;"><td rowspan="5" colspan="1" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;숙박\n무료\n초대권\n(9명)&quot;}" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); border-left: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; background-color: rgb(102, 102, 102); font-family: Arial; font-size: 9pt; color: rgb(255, 255, 255); text-align: center;"><div style="max-height: 220px;">숙박<br>무료<br>초대권<br>(9명)</div></td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 예거메드먼&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 예거메드먼</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 소상한기름밥&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 소상한기름밥</td></tr><tr style="height: 44px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 백두산천지요정&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 백두산천지요정</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 지둥등&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 지둥등</td></tr><tr style="height: 44px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 민우아들&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 민우아들</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 블루트리한이사&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 블루트리한이사</td></tr><tr style="height: 44px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 오밀조밀한귀리&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 오밀조밀한귀리</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· Queenline&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· Queenline</td></tr><tr style="height: 44px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 민진팡팡&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 민진팡팡</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· &quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">·</td></tr><tr style="height: 44px;"><td rowspan="4" colspan="1" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;대실\n무료\n초대권\n(8명)&quot;}" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); border-left: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; background-color: rgb(102, 102, 102); font-family: Arial; font-size: 9pt; color: rgb(255, 255, 255); text-align: center;"><div style="max-height: 176px;">대실<br>무료<br>초대권<br>(8명)</div></td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 이따구로살거야&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 이따구로살거야</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 리제네리니&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 리제네리니</td></tr><tr style="height: 44px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 빅토리아첼시&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 빅토리아첼시</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 용미&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 용미</td></tr><tr style="height: 44px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 휘휮&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 휘휮</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 서귀포잠수함수박&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 서귀포잠수함수박</td></tr><tr style="height: 44px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 전갈자리캘빈&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 전갈자리캘빈</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 냥냥왕왕왕&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 냥냥왕왕왕</td></tr><tr style="height: 21px;"><td style="overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td><td style="overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td></tr></tbody></table></google-sheets-html-origin></div><div><br></div><div><div><span style="font-family: arial; font-size: 13.3333px;"><b><span style="font-size: 10pt;">※ 참고하세요.</span></b></span><b><span style="font-size: 10pt; font-family: arial;">&nbsp; &nbsp;</span></b></div><div><p><google-sheets-html-origin></google-sheets-html-origin></p><p><google-sheets-html-origin></google-sheets-html-origin></p><div><div><span style="font-family: arial; font-size: 10pt;">- 지급된 무료초대권은 쿠폰함에서 확인 가능합니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 무료초대권 사용 시 최소 3일 전 해당 숙소 프런트에 문의해 주세요.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 무료초대권은 타인에게 양도하거나 재 판매 할 수 없습니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 숙소 사정(광고제휴 종료, 업주변경 등)에 의해 무료초대권 사용이 불가능할 수 있으며, 여기어때에서 대체해 드리지 않습니다.</span></div><p style="font-size: medium;"><google-sheets-html-origin></google-sheets-html-origin></p><p style="font-size: medium;"><google-sheets-html-origin></google-sheets-html-origin></p><p style="font-size: medium;"><google-sheets-html-origin></google-sheets-html-origin></p><p style="font-size: medium;"><google-sheets-html-origin></google-sheets-html-origin></p><p><google-sheets-html-origin></google-sheets-html-origin></p><p><google-sheets-html-origin></google-sheets-html-origin></p><div><span style="font-family: arial; font-size: 10pt;">- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</span></div></div></div></div></div></li><li><a href="https://www.goodchoice.kr/more/notice#notive_tab" id="notive_tab" class="list_que open open"><p>[발표] 8월 4차 여기어때 응원하기 이벤트</p> <span>2021.08.23
                                    <i class="ico_new">NEW</i></span></a> <div style="display: none;"><div><span style="font-family: arial; font-size: 10pt;">안녕하세요. 취향대로 머물다 여기어때입니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">8월 4차 '여기어때 응원하기' 이벤트 당첨자를 발표합니다.</span></div><div><br></div><div><google-sheets-html-origin style="font-size: medium;"></google-sheets-html-origin></div><div><div><div><span style="font-family: arial; font-size: 10pt;">■ 이벤트 당첨자</span></div><div><google-sheets-html-origin style="font-size: medium;"></google-sheets-html-origin></div><div><google-sheets-html-origin style="font-size: medium;"><table xmlns="http://www.w3.org/1999/xhtml" cellspacing="0" cellpadding="0" dir="ltr" style="table-layout: fixed; font-size: 10pt; font-family: arial, sans, sans-serif; width: 0px;"><colgroup><col width="113"><col width="169"></colgroup><tbody><tr style="height: 26px;"><td rowspan="5" colspan="1" data-sheets-value="{" 1":2,"2":"5만원="" 포인트\n(5명)"}"="" style="border-width: 1px; border-style: solid; border-color: rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; background-color: rgb(102, 102, 102); font-family: Arial; font-size: 9pt; overflow-wrap: break-word; color: rgb(255, 255, 255); text-align: center;"><div style="max-height: 130px;"><span style="font-family: arial; font-size: 10pt;">여기어때</span></div><div style="max-height: 130px;"><span style="font-family: arial; font-size: 10pt;">5만원 포인트</span><br><span style="font-family: arial; font-size: 10pt;">(5명)</span></div></td><td data-sheets-value="{" 1":2,"2":"·="" uare112"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-top: 1px solid rgb(153, 153, 153); border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><span style="font-family: arial; font-size: 9pt;">·&nbsp;</span><font face="arial"><span style="font-size: 12px;">홍사범님</span></font></td></tr><tr style="height: 26px;"><td data-sheets-value="{" 1":2,"2":"·="" 바티칸개살구"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><font face="Arial"><span style="font-size: 9pt; font-family: arial;">·&nbsp;</span></font><font face="arial"><span style="font-size: 12px;">분명한달마시안</span></font></td></tr><tr style="height: 26px;"><td data-sheets-value="{" 1":2,"2":"·="" jennniiiooo"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><p><font face="Arial"><span style="font-size: 9pt; font-family: arial;">·&nbsp;</span></font><font face="arial"><span style="font-size: 12px;">섬강유원지가공철도</span></font></p></td></tr><tr style="height: 26px;"><td data-sheets-value="{" 1":2,"2":"·="" lljbresisll"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><p><span style="font-family: arial; font-size: 9pt;">·&nbsp;</span><font face="arial"><span style="font-size: 12px;">젼지연</span></font></p></td></tr><tr style="height: 26px;"><td data-sheets-value="{" 1":2,"2":"·="" 유성온천지구비유"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(102, 102, 102); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><p><font face="Arial"><span style="font-size: 9pt; font-family: arial;">·&nbsp;</span></font><font face="arial"><span style="font-size: 12px;">짤빵입니당</span></font></p></td></tr></tbody></table></google-sheets-html-origin></div></div><div><span style="font-family: arial; font-size: 10pt;"><br></span></div><div><span style="font-family: arial; font-size: 10pt;">※ 참고하세요.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 포인트는 당첨 발표일에 당첨자 회원 계정으로 지급됩니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 지급된 포인트는 지급일로부터 30일 이내 사용 가능합니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</span></div></div></div></li><li><a href="https://www.goodchoice.kr/more/notice#notive_tab" id="notive_tab" class="list_que open"><p>[발표] 8월 3주차 무료초대권 이벤트</p> <span>2021.08.17
                                    
                    <div id="notice_pagination"><div class="paging"><!----><button class="on">1</button><button>2</button><button>3</button><button>4</button><button>5</button><button class="next">다음</button></div></div>
				</div>


        </div>
        <!-- //Content  -->

		<footer>
			

		</footer>

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
    <script type="text/javascript" src="/resource/js/common2.js"></script>
    <script type="text/javascript" src="/resource/js/geolocation.js"></script>

    <!-- Module -->
    <script type="text/javascript" src="/resource/js/dialogPopup.js"></script>

    <!-- Page Script -->
    <script type="text/javascript" src="/resource/js/vue.min.js"></script>
    <script type="text/javascript" src="/resource/js/more.js"></script>

	<!-- Body Spinner -->
	<div class="spinner show"><span></span></div>

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


    <!-- Page Script -->
    <script type="text/javascript" src="/resource/js/vue.min.js"></script>
    <script type="text/javascript" src="/resource/js/more.js"></script>

    <!-- Body Spinner -->
    <div class="spinner show"><span></span></div>

    
</body>

</html>