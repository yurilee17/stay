<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
	


<!DOCTYPE html>
<html lang="ko">
<head>
    <title>서울/강동</title>
    
 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type">
    <meta name="csrf-name" content="yeogi_token">

    <link rel="shortcut icon" href="resource/img/favicon_170822.ico" type="image/x-icon">
    <link rel="stylesheet preload" href="resource/css/font.css" as="style" type="text/css" crossorigin="">

	<!-- CSS -->
    <title>여행할때 여기어때</title>
    <link rel="stylesheet" href="resource/css/common.css">
    <link rel="canonical" href="#">
    <script type="text/javascript" src="resource/js/jquery-1.12.4.min.js"></script>
    
    <!-- 달력 외부 css -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  	<script type="text/javascript" src="resource/js/hotel.js"></script>
</head>



<body class="pc">


<!-- Wrap -->
<div class="wrap main_wrap show">

    <!-- Header -->
    <c:import url="/header"/>
    <!-- CSS -->
    <link rel="stylesheet" href="resource/css/swiper.css">
	<link rel="stylesheet" href="resource/css/main.css">
	<link rel="stylesheet" href="resource/css/reset.css">
	<link rel="stylesheet" href="resource/css/hotel.css">

</div>

<!-- //Wrap   여기에서 검색버튼빼고 지우는게 좋겠지?  -->

<!-- Script -->
<!-- Library -->
<script type="text/javascript" src="resource/js/jquery.cookie.js"></script>
<script type="text/javascript" src="resource/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="resource/js/iscroll.js"></script>

<!-- Service -->
<script type="text/javascript" src="resource/js/common.js"></script>
<script type="text/javascript" src="resource/js/geolocation.js"></script>

<!-- Module -->
<!-- <script type="text/javascript" src="./여행할때 여기어때_files/dialogPopup.js"></script> -->

<!-- Page Script -->
<script type="text/javascript" src="resource/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="resource/js/swiper.min.js"></script>
<script type="text/javascript" src="resource/js/iscroll.js"></script>
<script type="text/javascript" src="resource/js/main.js"></script>
<script type="text/javascript" src="resource/js/reservation.js"></script>




 <main id="product">
 

 <!-- Area -->
 <!-- hotelheader -->
 
 <div class="Hheader">
 	 <div class="area_wrap ">
				<h3>호텔·리조트</h3>
				
 <!-- 지역필터 / 메인지역 -->

<div class="menu-wrapper">
  <select id="mainMenu" name="mainMenu" onchange="showSubMenu()">
  <option value="">지역을 선택하세요</option>
  <option value="Main1">서울</option>
  <option value="Main2">경기/인천</option>
  <option value="Main3">충청/강원/제주</option>
  <option value="Main4">경남/경북</option>
  <option value="Main5">전남/전북</option> 
</select>

 <!-- 지역필터 / 서브지역 -->
<select id="subMenu" name="subMenu" class="subMenu right-menu"  onchange="if(this.value) location.href=(this.value);" style="display: none;">
  <option value="">상세지역을 선택하세요</option>
  <option value="Main1_2">강동</option>
  <option value="Main1_2">강서</option>
  <option value="Main1_3">강남</option>
  <option value="Main1_4">강북</option>
</select>

<select id="subMenu2" class="subMenu right-menu" style="display: none;">
  <option value="">상세지역을 선택하세요</option>
  <option value="Main2_1">경기</option>
  <option value="Main2_2">인천</option>
</select>

<select id="subMenu3" class="subMenu right-menu" style="display: none;">
  <option value="">상세지역을 선택하세요</option>
  <option value="Main3_1">충청</option>
  <option value="Main3_2">강원</option>
  <option value="Main3_3">제주</option>
</select>

<select id="subMenu4" class="subMenu right-menu" style="display: none;">
  <option value="">상세지역을 선택하세요</option>
  <option value="Main4_1">경남</option>
  <option value="Main4_2">경북</option>
</select>

<select id="subMenu5" class="subMenu right-menu" style="display: none;">
  <option value="">상세지역을 선택하세요</option>
  <option value="Main5_1">전남</option>
  <option value="Main5_2">전북</option>
</select>
</div>
	</div>
</div>
<!-- //Area -->
<!-- //hotelheader -->
 	
 	  <div class= body_wrap>
 	 	<aside>
 			  <!--   Filter -->
 			
				<div class="filter_wrap">
					<div class = "filter_box">
					<section class="date_wrap">
						<h3>날짜</h3><br>
						<div class="btn_date">
					

				<input type="text" id="calendars" name="calendars" value="" />
				
				
			<script>

				$(function () {
	         	   $('#calendars').daterangepicker({
	         		  "maxSpan": {"days": 6 },
	                "locale": {
	                    "format": "YYYY-MM-DD",
	                    "separator": " ~ ",
	                    "applyLabel": "확인",
	                    "cancelLabel": "취소",
	                    "fromLabel": "From",
	                    "toLabel": "To",
	                    "customRangeLabel": "Custom",
	                    "weekLabel": "W",
	                    "daysOfWeek": ["일","월", "화", "수", "목", "금", "토" ],
	                    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	                    "firstDay": 1
		                },
		               	"minDate":  new Date(),
		                "maxDate": moment().add(3, 'months').toDate(), 
		                "startDate": new Date(),
		                "endDate":new Date(),
		                "drops": "down"
			            }, function (start, end, label) {
			                console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	          		  });
	         	   
	         	   // css 변경가능 
	         	  $("#calendars").on('show.daterangepicker', function (ev, picker) {
	         		   /*  $(".cancelBtn").css("float", "right"); */
	         		});

	         	   
	       		 });
				
				</script>	
					

				
						
						<!-- <em>&nbsp;·&nbsp;1박!!!!!!!!!!!!!!!!</em> -->
						</div> 
					</section><br>


					<h3>상세조건</h3><br>
					<div class="btn_wrap">
						<button type="button" onclick="localhost:/hotellist">초기화</button>
						<button type="submit">적용</button>
					</div>
					<br>
                    	
                    	<section><br>
                    		<strong>호텔·리조트 유형</strong><br><br>
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
                    	</section><br>
                    	
                    	<section>
                    		<input type="hidden" id="persons" name="persons" value="">
                    		<strong>인원</strong><br><br>
                    		<div class="cnt_people" data-min="2" data-max="10" data-def="2">                    		
                    			<button type="button" class="down">-</button>
                    			<span>2</span>
                    			<button type="button" class=" up">+</button>
                    		</div>
                    	</section><br>
                    	
                    	<section>
                    		<strong>베드 타입</strong><br><br>
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
                    		</section><br>
                    		
                    		<section>
                    			<strong>공용시설</strong><br><br>
                    			<ul class="hide_type half">
                    				<li> <input type="checkbox" id="tmino_0" name="tmino[]"  class="inp_chk" value="41" />
                    					<label for="tmino_0" class="label_chk">피트니스</label></li>
                    				<li> <input type="checkbox" id="tmino_1" name="tmino[]"  class="inp_chk" value="42" />
                    					<label for="tmino_1" class="label_chk">수영장</label></li>
                    				<li> <input type="checkbox" id="tmino_2" name="tmino[]"  class="inp_chk" value="44" />
                    					<label for="tmino_2" class="label_chk">사우나</label></li>
                    				<li><input type="checkbox" id="tmino_3" name="tmino[]"  class="inp_chk" value="45" />
                    					<label for="tmino_3" class="label_chk">골프장</label></li>
                    			</ul>
                    		</section><br>
                    		
                    		<section>
                    			<strong>객실 내 시설</strong><br><br>
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
                    		</section><br>
                    		
                    		<section>
                    			<strong>기타</strong><br><br>
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
                    		</section><br><br>				
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
          <c:choose>
    	<c:when test="${not empty hotels}">
    	
            <c:forEach var="hotel" items="${ hotels}"> 
            
          <%--   <% for(int i=0; i<=5; i++){   %>  --%>
          	
          	<a href="#" class="thumb">
               <table>
                	<tr>
                        <td  width="300px" height="250px">
                            <img src= "${hotel.himage} " alt="상품이미지" width="250px" height="230px">
                        </td>
                        
                        <td>
                            <h2 class="name">${hotel.hname}</h2>
                            <p>${hotel.hdetailregion }</p>
                           	<br>
                           	<span>*****</span>
                           	
                        </td>
                        <td>
                            <ul>
                            <!-- 	<li>
                                    <del class="org-price">30,000</del>
                                    <span class="discount">10%</span>
                                </li> -->
                                <li class="dis-price">27,000</li>
                                
                                
                            </ul>
                        </td>
                    </tr>
                </table>
                 </a>
        <%--     <%  }  %>  --%>   
          </c:forEach> 
            </c:when>
          <c:otherwise>
      		  <!-- hotels 변수가 비어있을 때의 처리 -->
        		<p>No hotel information available.</p>
    	  </c:otherwise>
    	  </c:choose>
             
             </div>
            </div>
                  
              </main>
             </body>
            </html>
