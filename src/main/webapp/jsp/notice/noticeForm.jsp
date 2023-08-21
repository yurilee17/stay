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
			        <%
			        try {
			            Class.forName("oracle.jdbc.driver.OracleDriver");
			            String jdbcUrl = "jdbc:oracle:thin:@//localhost:1521/XE"; 
			            String username = "oracle";
			            String password = "oracle";
			            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
			
			            Statement statement = connection.createStatement();
			            String query = "SELECT * FROM noticeForm";
			            ResultSet resultSet = statement.executeQuery(query);
			
			            while (resultSet.next()) {
			                String title = resultSet.getString("ntitle");
			                String date = resultSet.getString("ndate");
			                String content = resultSet.getString("ncontent");
			                boolean isNew = resultSet.getBoolean("nis_new");
			        %>
			        <li>
			            <a href="#" id="notice_tab" class="list_que open">
			                <p><%= title %></p>
			                <span><%= date %>
			                    <% if (isNew) { %>
			                    <i class="ico_new">NEW</i>
			                    <% } %>
			                </span>
			            </a>
			            <div style="display: none;">
			                <div>
			                    <span style="font-family: arial; font-size: 10pt;"><%= content %>&nbsp;</span>
			                </div>
			            </div>
			        </li>
			        <%
			            }
			            resultSet.close();
			            statement.close();
			            connection.close();
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
			        %>
			    </ul>
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