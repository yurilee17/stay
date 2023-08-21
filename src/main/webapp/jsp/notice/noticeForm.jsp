<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                                    <li><a href="noticeForm">공지사항</a></li>
                                    <li><a href="${context }inquiryForm">1대1문의</a></li>
                                    <li><a href="${context }faqForm">고객문의</a></li>
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
                    <li><a class="" href="/faqForm">자주 묻는 질문</a></li>
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
			    <ul id="notices" class="show_list open_list">
			    <div align="center">
	<!-- <h1>게시글 목록</h1>
		<c:choose>
			<c:when test="${empty notices }">
				<h1> 등록된 공지가 존재하지 않습니다. </h1>
			</c:when>
			<c:otherwise>
				<table border=1>
					<tr>
						<th width="50">No.</th>
						<th width="250">제목</th>
						<th width="100">작성자</th>
						<th width="100">작성일</th>
						<th width="60">조회수</th>
					</tr>
					
					<c:forEach var="notice" items="${ notices}">
						<tr>
							<td>${notice.no }</td>
							<td onclick="location.href='noticeContent?no=${notice.no }'">
								${notice.title }
							</td>
							<td>${notice.id }</td>
							<td>${notice.writeDate }</td>
							<td>${notice.hits }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">
							${result }
						</td>
						<td><button type="button" onclick="location.href='noticeWrite'">글쓰기</button></td>
					</tr>
				</table>
		</c:otherwise>
	</c:choose> -->
</div>










	</span></a> <div style="display: none;"><div><span style="font-family: arial; font-size: 10pt;">저기어때!.&nbsp;</span><span style="font-family: arial; font-size: 10pt;">취향대로 머물다&nbsp;</span><span style="font-family: arial; font-size: 10pt;">여기어때입니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">8월 3</span><span style="font-family: arial; font-size: 10pt;">차 '모텔 리얼리뷰 무료초대권' 이벤트 당첨자를 발표합니다.</span></div><div><span style="font-family: arial; font-size: 10pt;"><br></span></div><div><span style="font-family: arial; font-size: 10pt;"><br></span></div><div><google-sheets-html-origin><table xmlns="http://www.w3.org/1999/xhtml" cellspacing="0" cellpadding="0" dir="ltr" style="table-layout: fixed; font-size: 10pt; font-family: arial, sans, sans-serif; width: 0px;"><colgroup><col width="104"><col width="120"><col width="132"></colgroup><tbody><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;■ 이벤트 당첨자&quot;}" style="border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; font-weight: bold;">■ 이벤트 당첨자</td><td style="border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td><td style="border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td></tr><tr style="height: 33px;"><td rowspan="4" colspan="1" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;숙박\n무료\n초대권\n(7명)&quot;}" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); border-left: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; background-color: rgb(102, 102, 102); font-family: Arial; font-size: 9pt; color: rgb(255, 255, 255); text-align: center;"><div style="max-height: 132px;">숙박<br>무료<br>초대권<br>(7명)</div></td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 춘천사랑몽&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 춘천사랑몽</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 촵촵촵촤&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 촵촵촵촤</td></tr><tr style="height: 33px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 김뜐뜐&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 김뜐뜐</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 네덜란드카멜레온&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 네덜란드카멜레온</td></tr><tr style="height: 33px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 난완전예뻐&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 난완전예뻐</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 파이어볼러챔피언&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 파이어볼러챔피언</td></tr><tr style="height: 33px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 둥글넓적한가을배추&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 둥글넓적한가을배추</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· &quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">·</td></tr><tr style="height: 49px;"><td rowspan="2" colspan="1" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;대실\n무료\n초대권\n(4명)&quot;}" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); border-left: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; background-color: rgb(102, 102, 102); font-family: Arial; font-size: 9pt; color: rgb(255, 255, 255); text-align: center;"><div style="max-height: 98px;">대실<br>무료<br>초대권<br>(4명)</div></td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 굿러브&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 굿러브</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 춐쉨&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 춐쉨</td></tr><tr style="height: 49px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 껌정흑설탕&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 껌정흑설탕</td><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;· 일루절루&quot;}" data-sheets-formula="=&quot;·&quot;&amp;&quot; &quot;&amp;R[0]C[-3]" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 일루절루</td></tr><tr style="height: 21px;"><td style="font-size: 13.3333px; overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td><td style="font-size: 13.3333px; overflow: hidden; padding: 2px 3px; vertical-align: middle;"></td></tr></tbody></table></google-sheets-html-origin></div><div><span style="font-family: arial; font-size: 10pt;"><br></span></div><div><span style="font-family: arial; font-size: 10pt;"><br></span></div><div><span style="font-family: arial; font-size: 13.3333px;"><b><span style="font-size: 10pt;">※ 참고하세요.</span></b></span><b><span style="font-size: 10pt; font-family: arial;">&nbsp; &nbsp;</span></b></div><div><div><p><google-sheets-html-origin></google-sheets-html-origin></p><p><google-sheets-html-origin></google-sheets-html-origin></p><div><div><span style="font-family: arial; font-size: 10pt;">- 지급된 무료초대권은 쿠폰함에서 확인 가능합니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 무료초대권 사용 시 최소 3일 전 해당 숙소 프런트에 문의해 주세요.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 무료초대권은 타인에게 양도하거나 재 판매 할 수 없습니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 숙소 사정(광고제휴 종료, 업주변경 등)에 의해 무료초대권 사용이 불가능할 수 있으며, 여기어때에서 대체해 드리지 않습니다.</span></div><p style="font-size: medium;"><google-sheets-html-origin></google-sheets-html-origin></p><p style="font-size: medium;"><google-sheets-html-origin></google-sheets-html-origin></p><p style="font-size: medium;"><google-sheets-html-origin></google-sheets-html-origin></p><p style="font-size: medium;"><google-sheets-html-origin></google-sheets-html-origin></p><p><google-sheets-html-origin></google-sheets-html-origin></p><p><google-sheets-html-origin></google-sheets-html-origin></p><div><span style="font-family: arial; font-size: 10pt;">- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</span></div></div></div></div></div></li><li><a href="https://www.goodchoice.kr/more/notice#notive_tab" id="notive_tab" class="list_que open"><p>[발표] 8월 3차 여기어때 응원하기 이벤트</p> <span>2023.08.21
                                    <!-- </span></a> <div style="display: none;"><div><span style="font-family: arial; font-size: 10pt;"></span></div><div><span style="font-family: arial; font-size: 10pt;">8월 3차 '여기어때 응원하기' 이벤트 당첨자를 발표합니다.</span></div><div><br></div><div><google-sheets-html-origin style="font-size: medium;"></google-sheets-html-origin></div><div><div><div><span style="font-family: arial; font-size: 10pt;">■ 이벤트 당첨자</span></div><div><google-sheets-html-origin style="font-size: medium;"></google-sheets-html-origin></div><div><google-sheets-html-origin style="font-size: medium;"><table xmlns="http://www.w3.org/1999/xhtml" cellspacing="0" cellpadding="0" dir="ltr" style="table-layout: fixed; font-size: 10pt; font-family: arial, sans, sans-serif; width: 0px;"><colgroup><col width="113"><col width="169"></colgroup><tbody><tr style="height: 26px;"><td rowspan="5" colspan="1" data-sheets-value="{" 1":2,"2":"5만원="" 포인트\n(5명)"}"="" style="border-width: 1px; border-style: solid; border-color: rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; background-color: rgb(102, 102, 102); font-family: Arial; font-size: 9pt; overflow-wrap: break-word; color: rgb(255, 255, 255); text-align: center;"><div style="max-height: 130px;"><span style="font-family: arial; font-size: 10pt;">여기어때</span></div><div style="max-height: 130px;"><span style="font-family: arial; font-size: 10pt;">5만원 포인트</span><br><span style="font-family: arial; font-size: 10pt;">(5명)</span></div></td><td data-sheets-value="{" 1":2,"2":"·="" uare112"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-top: 1px solid rgb(153, 153, 153); border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><span style="font-family: arial; font-size: 9pt;">·&nbsp;</span><font face="arial"><span style="font-size: 12px;">79세감자</span></font></td></tr><tr style="height: 26px;"><td data-sheets-value="{" 1":2,"2":"·="" 바티칸개살구"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><font face="Arial"><span style="font-size: 9pt; font-family: arial;">·&nbsp;</span></font><font face="arial"><span style="font-size: 12px;">지겨운취침</span></font></td></tr><tr style="height: 26px;"><td data-sheets-value="{" 1":2,"2":"·="" jennniiiooo"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><p><font face="Arial"><span style="font-size: 9pt; font-family: arial;">·&nbsp;</span></font><font face="arial"><span style="font-size: 12px;">엔젤으</span></font></p></td></tr><tr style="height: 26px;"><td data-sheets-value="{" 1":2,"2":"·="" lljbresisll"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(255, 255, 255); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><p><span style="font-family: arial; font-size: 9pt;">·&nbsp;</span><font face="arial"><span style="font-size: 12px;">뿡앵1</span></font></p></td></tr><tr style="height: 26px;"><td data-sheets-value="{" 1":2,"2":"·="" 유성온천지구비유"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(102, 102, 102); overflow: hidden; padding: 2px 3px; vertical-align: middle;"><p><font face="Arial"><span style="font-size: 9pt; font-family: arial;">·&nbsp;</span></font><font face="arial"><span style="font-size: 12px;">두번째별의밤</span></font></p></td></tr></tbody></table></google-sheets-html-origin></div></div><div><span style="font-family: arial; font-size: 10pt;"><br></span></div><div><span style="font-family: arial; font-size: 10pt;">※ 참고하세요.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 포인트는 당첨 발표일에 당첨자 회원 계정으로 지급됩니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 지급된 포인트는 지급일로부터 30일 이내 사용 가능합니다.</span></div><div><span style="font-family: arial; font-size: 10pt;">- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</span></div></div></div></li><li><a href="https://www.goodchoice.kr/more/notice#notive_tab" id="notive_tab" class="list_que open"><p>[발표] 여름광고 On-Air 공감 댓글 이벤트</p> <span>2023.08.16 -->
                                    <!--</span></a> <div style="display: none;"><p><span style="font-family: arial; font-size: 10pt;">안<span style="font-size: 10pt;">녕하세요.&nbsp;</span></span><span style="font-family: arial; font-size: 10pt;">취향대로 머물다 여기어때입니다.</span></p><p><font face="arial"><span style="font-size: 13.3333px;">'여름광고 On-Air 공감 댓글 이벤트' 당첨자를 발표합니다.</span></font></p><p>&nbsp;</p><p><span style="font-size: 13.3333px; font-family: arial;"><b>■ 호텔 숙박권 (10명)</b></span></p><p><span style="font-size: 13.3333px; font-family: arial;">-&nbsp;</span><span style="font-family: arial; font-size: 13.3333px;">당첨자 발표일로부터</span><span style="font-size: 13.3333px; font-family: arial;">&nbsp;7일 이내 쿠폰함 자동 지급 /&nbsp;</span><span style="font-family: arial; font-size: 13.3333px;">100% 할인쿠폰 (최대 50만원)</span></p><p><google-sheets-html-origin style="font-size: medium;"></google-sheets-html-origin></p><table xmlns="http://www.w3.org/1999/xhtml" cellspacing="0" cellpadding="0" dir="ltr" style="table-layout: fixed; font-size: 10pt; font-family: arial, sans, sans-serif; width: 0px;"><colgroup><col width="104"><col width="120"><col width="132"></colgroup><tbody><tr style="height: 30px;"><td rowspan="5" colspan="1" data-sheets-value="{" 1":2,"2":"당첨자"}"="" style="border-width: 1px; border-style: solid; border-color: rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; background-color: rgb(102, 102, 102); font-family: Arial; font-size: 9pt; overflow-wrap: break-word; color: rgb(255, 255, 255); text-align: center;"><div style="max-height: 150px;">당첨자</div></td><td data-sheets-value="{" 1":2,"2":"·="" y*nagy="" (5545)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-top: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· y*nagy (5545)</td><td data-sheets-value="{" 1":2,"2":"·="" 찡*자="" (7553)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-top: 1px solid rgb(153, 153, 153); border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 찡*자 (7553)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 유*윤이v="" (2008)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 유*윤이v (2008)</td><td data-sheets-value="{" 1":2,"2":"·="" 반*회적인쿠키="" (3131)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 반*회적인쿠키 (3131)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" h*angyh="" (3845)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· H*angYH (3845)</td><td data-sheets-value="{" 1":2,"2":"·="" 친*해진갈대="" (8997)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 친*해진갈대 (8997)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" s*sony="" (4753)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· s*sony (4753)</td><td data-sheets-value="{" 1":2,"2":"·="" 꺼*색쟈스민="" (2373)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 꺼*색쟈스민 (2373)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 신*쿠캘빈="" (0551)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt;">· 신*쿠캘빈 (0551)</td><td data-sheets-value="{" 1":2,"2":"·="" 편*한장어덮밥="" (1379)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 편*한장어덮밥 (1379)</td></tr></tbody></table><div><p><span style="font-size: 13.3333px; font-family: arial;"><b><br></b></span></p><p><span style="font-size: 13.3333px; font-family: arial;"><b>■&nbsp;</b></span><font face="arial"><span style="font-size: 13.3333px;"><b>5만원 할인쿠폰 (20명 )&nbsp;</b></span></font></p><p><font face="arial"><span style="font-size: 13.3333px;">&nbsp;-&nbsp;</span></font><span style="font-family: arial; font-size: 13.3333px;">당첨자 발표일로부터</span><font face="arial"><span style="font-size: 13.3333px;">&nbsp;3일 이내 쿠폰함 자동 지급 /&nbsp;</span></font><span style="font-family: arial; font-size: 13.3333px;">100% 할인쿠폰 (최대 5만원)</span></p><p><google-sheets-html-origin style="font-size: medium;"></google-sheets-html-origin></p><table xmlns="http://www.w3.org/1999/xhtml" cellspacing="0" cellpadding="0" dir="ltr" style="table-layout: fixed; font-size: 10pt; font-family: arial, sans, sans-serif; width: 0px;"><colgroup><col width="104"><col width="120"><col width="132"></colgroup><tbody><tr style="height: 30px;"><td rowspan="10" colspan="1" data-sheets-value="{" 1":2,"2":"당첨자"}"="" style="border-width: 1px; border-style: solid; border-color: rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; background-color: rgb(102, 102, 102); font-family: Arial; font-size: 9pt; overflow-wrap: break-word; color: rgb(255, 255, 255); text-align: center;"><div style="max-height: 300px;">당첨자</div></td><td data-sheets-value="{" 1":2,"2":"·="" 동*이9="" (3697)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-top: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 동*이9 (3697)</td><td data-sheets-value="{" 1":2,"2":"·="" 곰*ㅡㅅ="" (2248)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-top: 1px solid rgb(153, 153, 153); border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 곰*ㅡㅅ (2248)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 궁*매라="" (0324)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 궁*매라 (0324)</td><td data-sheets-value="{" 1":2,"2":"·="" 은*이네="" (1672)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 은*이네 (1672)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" n*ohij="" (8140)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· N*ohij (8140)</td><td data-sheets-value="{" 1":2,"2":"·="" 설*흔들바위규화="" (1441)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 설*흔들바위규화 (1441)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 겐*="" (4201)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 겐* (4201)</td><td data-sheets-value="{" 1":2,"2":"·="" m*ntapeach="" (3720)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· M*ntApeach (3720)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 라*니라니="" (7834)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 라*니라니 (7834)</td><td data-sheets-value="{" 1":2,"2":"·="" 서*대공원홈피="" (0597)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 서*대공원홈피 (0597)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 왕*렁유튜버="" (3495)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 왕*렁유튜버 (3495)</td><td data-sheets-value="{" 1":2,"2":"·="" 비*한대학생="" (6304)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 비*한대학생 (6304)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 시*부자경제적자유="" (9172)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 시*부자경제적자유 (9172)</td><td data-sheets-value="{" 1":2,"2":"·="" 빨*라면="" (4594)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 빨*라면 (4594)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 달*한호박고구마="" (2839)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 달*한호박고구마 (2839)</td><td data-sheets-value="{" 1":2,"2":"·="" 산*적인카네이션="" (0974)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 산*적인카네이션 (0974)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 주*주굴한살쾡이="" (3145)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 주*주굴한살쾡이 (3145)</td><td data-sheets-value="{" 1":2,"2":"·="" 피*체83="" (9127)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 피*체83 (9127)</td></tr><tr style="height: 30px;"><td data-sheets-value="{" 1":2,"2":"·="" 박*="" (0726)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 박* (0726)</td><td data-sheets-value="{" 1":2,"2":"·="" 산*한이빨="" (5001)"}"="" data-sheets-formula="=" ·"&"="" "&r[0]c[-3]"="" style="border-right: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153); overflow: hidden; padding: 2px 3px; vertical-align: middle; font-family: Arial; font-size: 9pt; overflow-wrap: break-word;">· 산*한이빨 (5001)</td></tr></tbody></table><p><font face="arial"><span style="font-size: 13.3333px;"><br></span></font></p></div><div><p><font face="arial"><span style="font-size: 13.3333px;"><b>■&nbsp; 치킨 교환권(50명) / 피자 교환권(50명) / 커피 교환권 (200명)&nbsp;</b></span></font></p><p><span style="font-size: 13.3333px; font-family: arial;">&nbsp;- 당첨자 발표일로부터 3일 이내 LMS로 발송 예정</span></p><p><span style="font-size: 13.3333px; font-family: arial;">&nbsp;</span></p><div><span style="font-family: arial; font-size: 10pt;">※ 참고하세요.&nbsp;</span></div><div><font face="arial"><span style="font-size: 13.3333px;">- 당첨자 정보는 닉네임 일부와 연락처 뒷자리로 표시됩니다.</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">- 숙박권과 할인쿠폰은 여기어때 쿠폰으로 지급되며, 쿠폰함에서 확인 가능합니다.</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">- 숙박권과 할인쿠폰의 사용기간은 지급일로부터 30일이며, 사용기간 만료 전 해당 쿠폰을 사용한 예약 건의 취소 시&nbsp;</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">&nbsp; 쿠폰은 자동으로 복구됩니다.(사용기간 만료 시 복구 불가)</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">- 5만원 초과 경품(숙박권)은 제세공과금 22%가 부여되며, 당사가 100% 부담합니다.</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">- 제세공과금 처리를 위하여 호탤 숙박권 당첨자 전원에게 신분증 사본을 요청, 수집 거부 시 당첨에서 제외됩니다.</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">- 제세공과금 처리를 위하여 여기어때 고객행복센터(1670-6250)에서 당첨자에게 유선으로 연락드릴 예정이며, 8/18(수)까지 유선연락이 불가한 당첨자는&nbsp;</span></font><span style="font-size: 13.3333px; font-family: arial;">당첨에서 제외됩니다. (내정보 내 휴대폰 번호 미등록, 오류 등 포함)</span></div><div><font face="arial"><span style="font-size: 13.3333px;">- 치킨/피자/커피 교환권은 당첨자의 휴대폰 LMS로 발송됩니다.</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">- 기 당첨자가 개인정보 수집 또는 당첨 거부 시 당첨자를 재선정하지 않습니다.</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">- 휴대폰 번호 오기재, 경품의 훼손, 개인 과실에 의한 경품 미수령 건에 대하여 재지급, 재발송은 불가합니다.</span></font></div><div><font face="arial"><span style="font-size: 13.3333px;">- 경품 별 사용기간은 상이하며 교환, 환불, 기간 연장은 불가합니다.</span></font></div></div><div><br></div></div></li><li><a href="https://www.goodchoice.kr/more/notice#notive_tab" id="notive_tab" class="list_que open"><p>[발표] 랜덤여행 럭키백 3차 이벤트</p> <span>2023.08.13 -->
                                    




			    

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