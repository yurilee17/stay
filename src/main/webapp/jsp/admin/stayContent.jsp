<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<c:url var="adminHeaderUrl" value="/jsp/admin/adminheader.jsp" />
			<c:import url="${adminHeaderUrl}" />
			<br>
			<!-- //숙소 탭 -->
			<br>
			<!-- 설명 -->
			<h2>숙소 등록과 관리가 가능한 관리자 페이지입니다.</h2>
			<p>숙소의 종류와 가격, 수량, 설명, 세부사항 등을 관리하실 수 있습니다.</p>
			<!-- 설명 -->
			<form id="staydetailForm" action="" method="post">
			<div class="stayContent_head">
			
					<div class="left">
						<p class="pic_view"><img class="" src=""></p>
					</div>
					<div class="right">
						<div class="info">
							<h2>숙소 이름 : ${motel.mname }</h2>
							<div class="score">평점 : ${motel.mrating }</div>
							<p class="address">주소 : ${motel.maddress }  ${motel.mdetailAddress }</p>
							<span>숙소 코드 : ${motel.mcode }${motel.no }</span>
<%-- 							<div class="submit">
								<ul>
									<li><a href="${context }stayModify">수정하기</a></li>
									<li><a href="#">삭제하기</a></li>
								</ul>
							</div>	 --%>
						</div>
					</div>
			</div>

			<article class="room_info">
				<c:choose>
					<c:when test="${empty motelRooms }">
						<h3>해당 숙소에 등록된 객실 DB가 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<c:forEach var="motelRoom" items="${ motelRooms}">
							<div class="room">
								<p class="pic_view "><img class="lazy" src=""></p>
								<strong class="title">${motelRoom.mroomName }</strong>
								<h4>객실 코드 : ${motelRoom.mroomCode }</h4>
								
								<div class="info">
			                        <div class="half ended">
			                            <div class="price">
			                                <strong>대실</strong>
											<div>
												<p><b style="color: rgba(0,0,0,1)">${motelRoom.mdaesilPrice }원</b> <!-- 표시금액 --></p>                                       
											</div>
											<ul>
												<li><span>마감시간</span>${motel.mdaesilCheckOut }시까지&nbsp;</li>
												<li><span>이용시간</span>${motel.mdaesilTime }&nbsp;</li>
											</ul>
			                            </div>
			                        </div>
			                        <div class="half ended">
										<div class="price">
											<strong>숙박</strong>
											<div>
												<p><b style="color: rgba(0,0,0,1)">${motelRoom.mstayPrice }원</b> <!-- 표시금액 --></p>                                        
											</div>
											<ul>
												<li><span>입실시간</span>${motel.mstayCheckIn }시부터&nbsp;</li>
												<li><span>퇴실시간</span>익일 ${motel.mstayCheckOut }시까지&nbsp;</li>
											</ul>
										</div>
									</div>
									<div class="option">
										<ul>
										<%-- 	<li><span>부대시설 : </span>${motelRoom.moption }</li> --%>
										</ul>
									</div>
			                    </div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</article>


			<div class="submit">
				<button type="button" onclick="location.href='stayDetailRegister?no=${motel.no }'">상세 DB 등록</button>
				<ul>
					<!-- <li><input type="submit" value="등록"></li> 
					<li><a href="${context }stayDetailRegister">상세 DB 등록하기</a></li> -->
					<li><a href="${context }stayInfo">숙소 목록</a></li>
				</ul>
			</div>
			</form>
		</div>
	</div>
 </body>
</html>
