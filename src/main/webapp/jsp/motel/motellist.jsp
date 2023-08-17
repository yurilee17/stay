<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>test</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <!-- 달력 외부 css -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script type="text/javascript" src="../../resource/js/motel.js"></script>
  </head>
  <body class="pc">
    <!-- Wrap -->
    <div class="wrap main_wrap show">
      <!-- Header -->
      <c:import url="/header" />
      <!-- CSS -->
      <link rel="stylesheet" href="../../resource/css/swiper.css">
      <link rel="stylesheet" href="../../resource/css/main.css">
      <link rel="stylesheet" href="../../resource/css/reset.css">
      <link rel="stylesheet" href="../../resource/css/motel.css">
    </div>
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
    <main id="product">
      <!-- Area -->
      <!-- hotelheader -->
      <div class="Hheader">
        <div class="area_wrap ">
          <h3>모텔</h3>
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
            <select id="subMenu" name="subMenu" class="subMenu right-menu" onchange="getSelectedOption(this.id)" style="display: none;">
              <option value="">상세지역을 선택하세요</option>
              <option value="Main1_1" name="강동">강동</option>
              <option value="Main1_2" name="강서">강서</option>
              <option value="Main1_3" name="강남">강남</option>
              <option value="Main1_4" name="강북">강북</option>
            </select>
            <select id="subMenu2" class="subMenu right-menu" onchange="getSelectedOption(this.id)" style="display: none;">
              <option value="">상세지역을 선택하세요</option>
              <option value="Main2_1" name="경기">경기</option>
              <option value="Main2_2" name="인천">인천</option>
            </select>
            <select id="subMenu3" class="subMenu right-menu" onchange="getSelectedOption(this.id)" style="display: none;">
              <option value="">상세지역을 선택하세요</option>
              <option value="Main3_1" name="충청">충청</option>
              <option value="Main3_2" name="강원">강원</option>
              <option value="Main3_3" name="제주">제주</option>
            </select>
            <select id="subMenu4" class="subMenu right-menu" onchange="getSelectedOption(this.id)" style="display: none;">
              <option value="">상세지역을 선택하세요</option>
              <option value="Main4_1" name="경남">경남</option>
              <option value="Main4_2" name="경북">경북</option>
            </select>
            <select id="subMenu5" class="subMenu right-menu" onchange="getSelectedOption(this.id)" style="display: none;">
              <option value="">상세지역을 선택하세요</option>
              <option value="Main5_1" name="전남">전남</option>
              <option value="Main5_2" name="전북">전북</option>
            </select>
          </div>
        </div>
      </div>
      <script type="text/javascript">
        var selectedText = "";

        function getSelectedOption(selectId) {
          var subMenu = document.getElementById(selectId);
          var selectedValue = subMenu.value;
          selectedText = subMenu.options[subMenu.selectedIndex].text;
          alert(selectId);
          alert(selectedText);
          localStorage.setItem("selectedText", selectedText); //selectedText 값 저장해서 넘겨줌 
          selectedTextUrl = "http://localhost/Main?hdetailregion=" + encodeURIComponent(selectedText);
          window.location.href = selectedTextUrl;
        }
      </script>
      <!-- //Area -->
      <!-- //hotelheader -->
      <div class=body_wrap>
        <aside>
          <!--   Filter -->
          <div class="filter_wrap">
            <div class="filter_box">
              <section class="date_wrap">
                <h3>날짜</h3>
                <br>
                <div class="btn_date">
                  <input type="text" id="calendars" name="calendars" value="" />
                  <script>
                    $(function() {
                      $('#calendars').daterangepicker({
                        "maxSpan": {
                          "days": 6
                        },
                        "locale": {
                          "format": "YYYY-MM-DD",
                          "separator": " ~ ",
                          "applyLabel": "확인",
                          "cancelLabel": "취소",
                          "fromLabel": "From",
                          "toLabel": "To",
                          "customRangeLabel": "Custom",
                          "weekLabel": "W",
                          "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                          "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                          "firstDay": 1
                        },
                        "minDate": new Date(),
                        "maxDate": moment().add(3, 'months').toDate(),
                        "startDate": new Date(),
                        "endDate": new Date(),
                        "drops": "down"
                      }, function(start, end, label) {
                        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
                      });
                      // css 변경가능 
                      $("#calendars").on('show.daterangepicker', function(ev, picker) {
                        /*  $(".cancelBtn").css("float", "right"); */
                      });
                    });
                  </script>
                  <!-- <em>&nbsp;·&nbsp;1박!!!!!!!!!!!!!!!!</em> -->
                </div>
              </section>
              <br>
              <h3>상세조건</h3>
              <br>
              <!-- 초기화, 적용 버튼  -->
              <div class="btn_wrap">
                <button type="button" onclick="location.href='motellist'">초기화</button>
                <button type="button" onclick="comfort()">적용</button>
              </div>
              <br>
              <section>
                <br>
                <ul>
                  <li>
                    <input type="checkbox" id="reserve_0" name="daesil" class="inp_chk" value="1" />
                    <label for="reserve_0" class="label_chk">대실 예약</label>
                  </li>
                  <li>
                    <input type="checkbox" id="reserve_1" name="stay" class="inp_chk" value="2" />
                    <label for="reserve_1" class="label_chk">숙박 예약</label>
                  </li>
                </ul>
              </section>
              <br>
              <section>
                <strong>이색테마</strong>
                <br>
                <br>
                <ul class="hide_type half">
                  <li>
                    <input type="checkbox" id="tmino_0" name="tmino[]" class="inp_chk" value="피트니스" />
                    <label for="tmino_0" class="label_chk">무인텔</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_1" name="tmino[]" class="inp_chk" value="수영장" />
                    <label for="tmino_1" class="label_chk">복층룸</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_2" name="tmino[]" class="inp_chk" value="사우나" />
                    <label for="tmino_2" class="label_chk">트윈베드</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_3" name="tmino[]" class="inp_chk" value="골프장" />
                    <label for="tmino_3" class="label_chk">야외테라스</label>
                  </li>
                </ul>
              </section>
              <br>
              <section>
                <strong>스파시설</strong>
                <br>
                <br>
                <ul class="hide_type half">
                  <li>
                    <input type="checkbox" id="tmino_4" name="tmino[]" class="inp_chk" value="객실스파" />
                    <label for="tmino_4" class="label_chk">스파</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_5" name="tmino[]" class="inp_chk" value="미니바" />
                    <label for="tmino_5" class="label_chk">사우나</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_6" name="tmino[]" class="inp_chk" value="와이파이" />
                    <label for="tmino_6" class="label_chk">마사지베드</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_7" name="tmino[]" class="inp_chk" value="욕실용품" />
                    <label for="tmino_7" class="label_chk">히노끼탕</label>
                  </li>
                </ul>
              </section>
              <br>
              <section>
                <strong>놀이시설</strong>
                <br>
                <br>
                <ul class="hide_type half">
                  <li>
                    <input type="checkbox" id="tmino_8" name="tmino[]" class="inp_chk" value="반려견동반" />
                    <label for="tmino_8" class="label_chk">수영장</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_9" name="tmino[]" class="inp_chk" value="조식포함" />
                    <label for="tmino_9" class="label_chk">노래방</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_10" name="tmino[]" class="inp_chk" value="객실내흡연" />
                    <label for="tmino_10" class="label_chk">당구장</label>
                  </li>
                  <li>
                    <input type="checkbox" id="tmino_11" name="tmino[]" class="inp_chk" value="발렛파킹" />
                    <label for="tmino_11" class="label_chk">게임기</label>
                  </li>
                </ul>
              </section>
              <br>
              <br>
              <script type="text/javascript">
                function comfort() {
                  var values1 = document.getElementsByName("reserve[]");
                  var selectedValues1 = [];
                  for (var i = 0; i < values1.length; i++) {
                    if (values1[i].checked) {
                      selectedValues1.push(values1[i].value);
                    }
                  }
                  var values2 = document.getElementsByName("tmino[]");
                  var selectedValues2 = [];
                  for (var i = 0; i < values2.length; i++) {
                    if (values3[i].checked) {
                      selectedValues3.push(values2[i].value);
                    }
                  }
                  var personCount = document.querySelector('.cnt_people span').textContent;
                  var selectedText = localStorage.getItem("selectedText"); // selectedText 값을 가져옴 
                  var url = "http://localhost/Main?mdetailregion=" + encodeURIComponent(selectedText) + "&mtype=" + encodeURIComponent(selectedValues1.join(',')) + "&moption=" + encodeURIComponent(selectedValues2.join(','))
                  /* 				                  +
                  				                  "&hcomfort=" + encodeURIComponent(selectedValues3.join(',')) + 
                  				                  "&hpeople=" + encodeURIComponent(personCount) */
                  ;
                  window.location.href = url;
                }
              </script>
            </div>
          </div>
          <!-- //Filter -->
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
            <c:when test="${not empty motels}">
              <c:forEach var="motel" items="${ motels}"><%--   <% for(int i=0; i<=5; i++){   %> --%> <a href="#" class="thumb">
                  <table>
                    <tr>
                      <td width="300px" height="250px">
                        <img src="${motel.mimage} " alt="호텔이미지" width="250px" height="230px">
                      </td>
                      <td>
                        <h2 class="name">${motel.mname}</h2>
                        <p>${motel.mdetailregion }</p>
                        <br>
                        <span>*****</span>
                      </td>
                      <td>
                        <ul>
                          <!-- 	<li><del class="org-price">30,000</del><span class="discount">10%</span></li> -->
                          <li class="dis-price">27,000</li>
                        </ul>
                      </td>
                    </tr>
                  </table>
                </a><%--     <%  }  %> --%> </c:forEach>
            </c:when>
            <c:otherwise>
              <!-- hotels 변수가 비어있을 때의 처리 -->
              <p>No motel information available.</p>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </main>
  </body>
</html>

