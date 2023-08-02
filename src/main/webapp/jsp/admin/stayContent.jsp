<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>숙소 DB 등록</title>
  <link rel="stylesheet" href="../../resource/css/reset.css" type="text/css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 </head>
 <body>
	<br>
	<div id ="wrap">
		<div class="content">
			<!-- 숙소 탭 -->
			<div class="stay">
				<ul class="top_nav">
					<li><a href="${context }index">메인</a></li>
					<li><a href="#">회원 DB 조회</a></li>
					<li><a href="${context }stayRegister">숙소 DB 등록</a></li>
					<li><a href="${context }stayInfo">숙소 DB 조회</a></li>
					<li><a href="#">예약 DB 조회</a></li>
				</ul>
			</div>
			<br>
			<!-- //숙소 탭 -->
			<br>
			<!-- 설명 -->
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<!-- 설명 -->

			<div class="stayContent_head">
				<p class="pic_view"><img class="" src="C:\javas\upload\20230802133307-noname01.jpg"></p>
				<div class="right">
					<div class="info">
						<h2>숙소 이름</h2>
						<div class="score">평점 / 리뷰</div>
						<p class="address">주소(주소 + 상세주소)</p>
						<span>숙소 코드</span>
					</div>
				</div>
			</div>

			<article class="room_info">
				<div class="room">
					<p class="pic_view "><img class="lazy" src="C:\Users\hi\Desktop\Motel\명동 밀리오레호텔 _ 여기어때_files/list_none.png"></p>
					<strong class="title">객실 이름</strong>
					
					<div class="info">
                        <div class="half ended">
                            <div class="price">
                                <strong>대실</strong>
								<div>
									<p class="through_none" style="text-decoration: inherit; visibility: hidden;">0</p>
									<p><b style="color: rgba(0,0,0,1)">30,000원</b> <!-- 표시금액 --></p>                                       
								</div>
								<ul>
									<li><span>마감시간</span>22시까지&nbsp;</li>
										<span>이용시간</span>최대 5시간&nbsp;</li>
								</ul>
                            </div>
                        </div>

                        <div class="half ended">
							<div class="price">
								<strong>숙박</strong>
								<div>
									<p class="through_none" style="text-decoration: inherit; visibility: hidden;">0</p>
									<p><b style="color: rgba(0,0,0,1)">135,000원</b> <!-- 표시금액 --></p>                                        
								</div>
								<ul><li>
									<span>입실시간</span>15시부터&nbsp;
									</li>
									<li>
									<span>퇴실시간</span>익일11시&nbsp;
									</li>
								</ul>
							</div>
						</div>

                    </div>
				</div>
			</article>

			<div class="submit">
				<ul>
					<li><a href="${context }stayDetailRegister">상세 DB 등록하기</a></li>
					<li><a href="${context }stayInfo">숙소 목록</a></li>
				</ul>
			</div>
		</div>
	</div>
 </body>
</html>
