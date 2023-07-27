<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>test</title>
   
    
<link rel="stylesheet" href="../../resource/css/hotel.css">
<link rel="stylesheet" href="../../resource/css/reset.css">

</head>
<body class="pc">

    <!DOCTYPE html>
<!-- saved from url=(0026)https://www.goodchoice.kr/ -->
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">

    <link rel="shortcut icon" href="../../resource/img/favicon_170822.ico" type="image/x-icon">
    <link rel="stylesheet preload" href="../../resource/css/font.css" as="style" type="text/css" crossorigin="">

	<!-- CSS -->
    <title>여행할때 여기어때</title>
    <link rel="stylesheet" href="../../resource/css/common.css">
    <link rel="canonical" href="#">
    <script type="text/javascript" src="../../resource/js/jquery-1.12.4.min.js"></script>
    
    </head>
<body class="pc">

<!-- Wrap -->
<div class="wrap main_wrap show">

    <!-- Header -->
    	<c:import url="/header"/>
        <!-- CSS -->
    <link rel="stylesheet" href="../../resource/css/swiper.css">
	<link rel="stylesheet" href="../../resource/css/main.css">

</div>

<!-- //Wrap -->

<!-- Script -->
<!-- Library -->
<script type="text/javascript" src="../../resource/js/jquery.cookie.js"></script>
<script type="text/javascript" src="../../resource/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="../../resource/js/iscroll.js"></script>

<!-- Service -->
<script type="text/javascript" src="../../resource/js/common.js"></script>
<script type="text/javascript" src="../../resource/js/geolocation.js"></script>

<!-- Module -->
<!-- <script type="text/javascript" src="./여행할때 여기어때_files/dialogPopup.js"></script> -->

<!-- Page Script -->
<script type="text/javascript" src="../../resource/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="../../resource/js/swiper.min.js"></script>
<script type="text/javascript" src="../../resource/js/iscroll.js"></script>
<script type="text/javascript" src="../../resource/js/main.js"></script>
<script type="text/javascript" src="../../resource/js/reservation.js"></script>


</body>
 <main id="product">
 
 <!-- hotelheader -->
 
 <div class="Hheader">
				<h3>호텔·리조트</h3>
				
 <!-- 지역필터 (리조트/캠핑/한옥 클래스추가 area_etc)-->

         <div class="area_wrap ">
       	   <select class="form_w30">
             <div class="iscroll_01 depth_01">
                 <div class="scroller">
                    <ul class="city"><!-- 지역 고정 클래스 fix / 오버시 on -->
                     <li>
                        <a href="https://www.goodchoice.kr/product/search/2/2012" class="fix on">
                            서울                        </a>
                    </li>
                     <li>
                        <a href="https://www.goodchoice.kr/product/search/2/2061" >
                            경기/인천                    </a>
                    </li>
                    <li>
                        <a href="https://www.goodchoice.kr/product/search/2/2051" >
                            충청/강원/제주                </a>
                    </li>
                   
					<li>
                        <a href="https://www.goodchoice.kr/product/search/2/2101" >
                            경남/경북                        </a>
                    </li>
                                    <li>
                        <a href="https://www.goodchoice.kr/product/search/2/2112" >
                            전남/전북                        </a>
                    </li>
                    </ul>
                  </div>
              </div>
              </select>
              
              
              <div class="iscroll_02">
                            <div class="scroller">
                                <ul class="city_child">
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2012" >강동</a></li>
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2019" >강서</a></li>
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2016" >강남</a></li>
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2014" >강북</a></li>
                                </ul>
                                
                                <ul class="city_child">
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2041" >경기</a></li>
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2043" >인천</a></li>
                              	</ul>
                                
                                <ul class="city_child">
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2051" >충청</a></li>
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2053" >강원</a></li>
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2054" >제주</a></li>
                                </ul>
                                
                                <ul class="city_child">
                               		<li><a href="https://www.goodchoice.kr/product/search/2/2081" >경남</a></li>
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2084" >경북</a></li>
                                </ul>
                                
                                <ul class="city_child">
                                	<li><a href="https://www.goodchoice.kr/product/search/2/2061" >전남</a></li>
                               		<li><a href="https://www.goodchoice.kr/product/search/2/2062" >전북</a></li>
                                </ul>                    
							 </div>
                        </div>
                    </div>

                </div>
				<!-- //Area -->

 
 	
 	
 	
 	 	<aside>
                <!-- Filter -->
				<div class="filter_wrap">
					<div class = filter_box">
					<section class="date_wrap">
						<h3>날짜</h3>
						<div class="btn_date">
						<span class="date_view">
				!!!!!!!!<b>날짜</b>
						<em>&nbsp;·&nbsp;1박</em>
						</span>
				!!!!!!!!아이콘 애프터
						</div>
					</section>

					<h3>상세조건</h3>
					<div class="btn_wrap">
						<button type="button" onclick="localhost:/hotellist">초기화</button>
						<button type="submit">적용</button>
					</div>
					<br>
                    	
                    	<section>
                    		<strong>호텔·리조트 유형</strong>
                    	<ul>
                    		<li>
                    			<input type="checkbox" id="grade_0" name="grade[]"  class="inp_chk" value="STAR5" />
                    			<label for="grade_0" class="label_chk">5성급</label>
                    		</li>
                    		<li>
                    			<input type="checkbox" id="grade_1" name="grade[]"  class="inp_chk" value="S1" />
                    			<label for="grade_1" class="label_chk">특1급</label>
                    		</li>
                    		<li>
                    			<input type="checkbox" id="grade_2" name="grade[]"  class="inp_chk" value="S" />
                    			<label for="grade_2" class="label_chk">특급</label>
                    		</li>
                    	</ul>
                    	</section>
                    	
                    	<section>
                    		<input type="hidden" id="persons" name="persons" value="">
                    		<strong>인원</strong>
                    		<div class="cnt_people" data-min="2" data-max="10" data-def="2">                    		
                    			<button type="button" class="disable dn">-</button>
                    			<span>2</span>
                    			<button type="button" class=" up">+</button>
                    		</div>
                    		<br>
                    	</section>
                    	
                    	<section>
                    		<strong>베드 타입</strong>
                    		<div class="room_type">
                    			<p><input type="checkbox" class="inp_room_01" name="bed_type[0]" id="bed_type_S" value="S" />
                    			<label for="bed_type_S" class="label_room_01">싱글</label></p>
                    			<p><input type="checkbox" class="inp_room_02" name="bed_type[1]" id="bed_type_D" value="D" />
                    			<label for="bed_type_D" class="label_room_02">더블</label></p>
                    			<p><input type="checkbox" class="inp_room_03" name="bed_type[2]" id="bed_type_T" value="T" />
                    			<label for="bed_type_T" class="label_room_03">트윈</label></p>
                    			<p><input type="checkbox" class="inp_room_04" name="bed_type[3]" id="bed_type_O" value="O" />
                    			<label for="bed_type_O" class="label_room_04">온돌</label></p>
                    		</div>
                    		</section>
                    		
                    		<section>
                    			<strong>공용시설</strong>
                    			<ul class="hide_type half">
                    				<li> <input type="checkbox" id="tmino_0" name="tmino[]"  class="inp_chk" value="41" />
                    					<label for="tmino_0" class="label_chk">피트니스</label>
                    				</li>
                    				<li> <input type="checkbox" id="tmino_1" name="tmino[]"  class="inp_chk" value="42" />
                    					<label for="tmino_1" class="label_chk">수영장</label></li>
                    				<li> <input type="checkbox" id="tmino_2" name="tmino[]"  class="inp_chk" value="44" />
                    					<label for="tmino_2" class="label_chk">사우나</label></li>
                    				<li><input type="checkbox" id="tmino_3" name="tmino[]"  class="inp_chk" value="45" />
                    					<label for="tmino_3" class="label_chk">골프장</label></li>
                    			</ul>
                    		</section>
                    		
                    		<section>
                    			<strong>객실 내 시설</strong>
                    			<ul class="hide_type half">
                    				<li> <input type="checkbox" id="tmino_24" name="tmino[]"  class="inp_chk" value="43" />
                    					<label for="tmino_24" class="label_chk">객실스파</label></li>
                    				<li><input type="checkbox" id="tmino_25" name="tmino[]"  class="inp_chk" value="50" />
                    					<label for="tmino_25" class="label_chk">미니바</label></li>
                    				<li><input type="checkbox" id="tmino_26" name="tmino[]"  class="inp_chk" value="47" />
                    					<label for="tmino_26" class="label_chk">와이파이</label></li>
                    				<li><input type="checkbox" id="tmino_27" name="tmino[]"  class="inp_chk" value="49" />
                    					<label for="tmino_27" class="label_chk">욕실용품</label></li>
                    			</ul>
                    		</section>
                    		
                    		<section>
                    			<strong>기타</strong>
                    			<ul class="hide_type half">
                    				<li><input type="checkbox" id="tmino_36" name="tmino[]"  class="inp_chk" value="54" />
                    					<label for="tmino_36" class="label_chk">반려견동반</label></li>
                    				<li><input type="checkbox" id="tmino_37" name="tmino[]"  class="inp_chk" value="51" />
                    					<label for="tmino_37" class="label_chk">조식포함</label></li>
                    				<li><input type="checkbox" id="tmino_38" name="tmino[]"  class="inp_chk" value="52" />
                    					<label for="tmino_38" class="label_chk">객실내흡연</label></li>
                    				<li><input type="checkbox" id="tmino_39" name="tmino[]"  class="inp_chk" value="53" />
                    					<label for="tmino_39" class="label_chk">발렛파킹</label></li>
                    			</ul>
                    		</section>				
                    	</div>			
                   </div>
				<!-- //Filter -->

				<!-- List -->
				<div class="list_wrap">
					<div class="top_sort">
            </aside>
       
       
       
       
 	<div class="right">
 		 <ul class="sort">
                    <li>
                        <a href="#">낮은 가격 순</a>
                    </li>
                    <li>
                        <a href="#">높은 가격 순</a>
                    </li>
                     <li>
                        <a href="#">지도</a>
                    </li>
                </ul>
            <%   for(int i =0; i<5; i++){     %>
                <table>
                	<tr>
                        <td><a href="#" class="thumb">
                            <img src="	https://via.placeholder.com/280x300" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">호텔명</h3>
                            <p>호텔간략설명</p>
                           	<br>
                           	<span>별점</span>
                        </td>
                        <td>
                            <ul>
                            	<li>
                                    <del class="org-price">30,000</del>
                                    <span class="discount">10%</span>
                                </li>
                                <li><ins class="dis-price">27,000</ins></li>
                                
                                
                            </ul>
                        </td>
                    </tr>
                </table>
             <%   } %>
             
             </div>
                  
              </main>
             </body>
            </html>
