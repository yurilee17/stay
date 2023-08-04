<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<link rel="stylesheet" href="../../resource/css/common.css">

<header>
<section>
	<h1>
		<a class="" href="#" title="여기어때">여기어때</a>
	</h1>
	<button type="button" class="btn_menu nav_open ">메뉴</button>
	<button type="button" class="btn_srch srch_open ">검색</button>
	<ul class="gnb_pc">
		<li><a href="#">내주변</a></li>
		<li><a href="#">예약내역</a></li>
		<li class="over">
			<button type="button">
				<span>더보기</span>
			</button>
			<ul class="list_03">
				<li><a href="#">공지사항</a></li>
				<li><a href="#">자주 묻는 질문</a></li>
				<li><a href="#">1:1 문의</a></li>
				<li><a href="#">약관 및 정책</a></li>
			</ul>
		</li>
		<li><a href="/login"><span>로그인</span></a></li>
	</ul>

	<!-- Search -->
	<div class="srch_bar">
		<div class="wrap_inp">
			<input type="text" id="keyword" placeholder="지역, 숙소명"
				autocomplete="off">
			<button type="button" class="btn_srch">검색</button>
		</div>
		<button class="btn_cancel" onclick="srch_close()">취소</button>
	</div>
	</section>
	<!-- //Search -->
	</header>
	
	
		<!-- Bg Dimm -->
		<div class="bg_dimm" onclick="close_layer();">&nbsp;</div>
		<div class="bg_dimm_prevent">&nbsp;</div>

		<!-- 추천검색어 -->
		<div class="recommend_srch">
			<div class="scroll_srch">
				<div class="scroller">
					<div class="default" style="display: block">
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
