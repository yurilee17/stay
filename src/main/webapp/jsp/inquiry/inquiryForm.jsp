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

    <link rel="shortcut icon" href="/img/images/web_v3/favicon_170822.ico" type="image/x-icon">
   <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
   <script>(function (a, b, c) { if (c in b && b[c]) { var d, e = a.location, f = /^(a|html)$/i; a.addEventListener("click", function (a) { d = a.target; while (!f.test(d.nodeName)) d = d.parentNode; "href" in d && (d.href.indexOf("http") || ~d.href.indexOf(e.host)) && (a.preventDefault(), e.href = d.href) }, !1) } })(document, window.navigator, "standalone")</script>
   
</head>
<!-- <link rel="stylesheet" href="../../resource/css/alert.css">
<link rel="stylesheet" href="../../resource/css/header.css"> -->
    <link rel="stylesheet preload" href="../../resource/css/font.css" as="style" type="text/css" crossorigin="">
<header>
 <c:import url="/header" />
</header>

<!-- alert -->



<!-- 추천검색어 
<div class="recommend_srch">
   <div class="scroll_srch">
      <div class="scroller">
         <div class="default" style="display: block">
            <strong>추천 검색어</strong>
            <ul></ul>
         </div>
         <!-- 연관검색어 
         <div class="chain">
            <ul></ul>
         </div>
      </div>
   </div>
</div>-->
<script src="js/header.js"></script>
<script src="js/alert.js"></script>
   <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>

<!-- 오른쪽 예약 내역  -->
<style>
   .content{
      border-radius: 2px 2px 0 0;
      border: 1px solid rgba(0, 0, 0, 0.08);
      clear:both;
      margin-bottom: 100px;


   }
   .history{
      font-weight: bold;
      display: block;
      padding: 0 0 20px 0;
      font-size: 18px;

   }
   .info1{ box-shadow: rgba(0, 0, 0, 0.1) 0px 20px 25px -5px, rgba(0, 0, 0, 0.04) 0px 10px 10px -5px;}
   .info2{
      /* float: left; */
      /* width: 354px; */
      height: auto;
      margin: 0 0px 16px 0;
   }
   .img1{

      border: 1px solid rgba(0, 0, 0, 0.08);
      /* background: rgba(107, 80, 80, 0.38); */
      z-index: 100;
   }

   .img3{
      z-index: 101;
   }
   /* 이미지 크기 조정 */
   .ahn_zzim_img1 img{
      max-height: 1000px;
      max-width: 100%;
   }

   .info3{
      display: block;
      position: relative;
      top: 0;
      left: 0;
      z-index: 10;
      width: 100%;
      height: auto;
      padding: 0 0;
      border: 1px solid rgba(0, 0, 0, 0.08);
      border-top: none;
      border-radius: 0 0 2px 2px;
      background: none;
      color: rgba(0, 0, 0, 0.87);
      text-align: center;
      box-sizing: border-box;

   }
   .title{
      padding-top: 16px;
      padding-bottom: 16px;
      font-weight: bold;
      font-size: 20px;
   }

   .btn1{
      padding-bottom: 10px;
   }

   .btn2 {

      width: 144px;
      height: 48px;
      display: inline-block;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      color: #fff;
      text-align: center;
      box-sizing: border-box;
      vertical-align: top;
      background: linear-gradient(to bottom, #ff0055 0%, #e62243 100%);
   }

   .inquiry{
      background-color: white !important;
   }


</style>
<body>
   <link rel="stylesheet" href="css/more.css" />
   <!-- Wrap -->
   <div class="wrap show">

      <!-- Header -->
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


      <!-- CSS -->
      <link rel="stylesheet" href="css/more.css" />

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
                    <li><a class="" href="faqForm">자주 묻는 질문</a></li>
                    <li><a class="active" href="inquiryForm">1:1 문의</a></li>
                </ul>
            </nav>
         <div class="align_rt">
      <!-- Inquiry -->
      <div class="inquiry">

         <div class="mobile_top">1:1문의<button class="top_btn" onclick="$('.tab .tab_btn').eq(1).trigger('click');">새 문의 작성</button></div>

         <!-- Tab -->
         <div class="tab">
            <span class="tab_btn active">나의 문의 내역</span>
            <span class="tab_btn ">새 문의 작성</span>
         </div>

         <!-- 리스트 -->
         <div class="tab_each" style="display:block">

                           <!-- 리스트 없을때 -->
               <div class="list_none" style="display: block;">
                  등록된 1:1 문의가 없습니다.
                  <b>여기어때는 회원님들의 소중한 의견에 귀기울여<br/>신속하고 정확하게 답변드리도록 하겠습니다.</b>
               </div>
                     </div>

         <!-- 작성 -->
         <div class="tab_each" >
            <form id="submitForm" name="inq-form" method="post" action="/more/inquiry_submit">
               <div class="alert_top">
                  <p>여기어때 이용 중 불편하신 점을 문의주시면 <em>최대한 빠른 시일내에 답변 드리겠습니다.</em></p>
               </div>

               <section class="info_wrap">
                  <b>카테고리유형</b>
                  <select name="room_type" id="" class="select_type_2"  >
                     <option value="">카테고리유형을 선택하세요</option>
                                             <option value="1"  >모텔</option>
                                             <option value="2"  >호텔·리조트</option>
                                             <option value="3"  >펜션</option>
                                             <option value="6"  >게스트하우스</option>
                                             <option value="5"  >캠핑/글램핑</option>
                                             <option value="7"  >한옥</option>
                                       </select>

                  <!-- <b>문의유형</b>
                  <select name="inq_type" id="inq_type" class="select_type_2"  >
                     <option value="">문의유형을 선택하세요</option>
                                             <option value="8"  >이벤트</option>
                                             <option value="7"  >예약/결제</option>
                                             <option value="9"  >취소/환불</option>
                                             <option value="2"  >혜택받기</option>
                                             <option value="1"  >이용문의</option>
                                             <option value="4"  >회원정보</option>
                                             <option value="3"  >리뷰</option>
                                             <option value="10"  >환불신청</option>
                                             <option value="99"  >기타</option>
                                       </select> -->
   
                  <div class="phone-block">
                     <b>휴대폰 번호</b>
                     <p class="inp_wrap"><input class="js-phone-number" data-type="phoneNumber" type="tel" maxlength="11" name="uphone" value="" placeholder="선택사항입니다."/></p>
                  </div>

                  <div class="email-block">
                     <b>이메일</b>
                     <p class="inp_wrap"><input data-email-validate class="js-email-string" type="email" value="" name="uemail" placeholder="선택사항입니다."/></p>
                  </div>

                  <!-- 환불받을 계좌정보 등록 -->
                  <!-- <div class="account-block" data-account-select  >
                     <b>환불받을 계좌정보 등록</b>
                     <select name="accountBank" data-account-bank class="select_type_2" >
                        <option value="none">은행선택</option>
                                                   <option value="우리은행">우리은행</option>
                                                   <option value="국민은행">국민은행</option>
                                                   <option value="기업은행">기업은행</option>
                                                   <option value="농협은행">농협은행</option>
                                                   <option value="신한은행">신한은행</option>
                                                   <option value="하나은행">하나은행</option>
                                                   <option value="한국씨티은행">한국씨티은행</option>
                                                   <option value="SC제일은행">SC제일은행</option>
                                                   <option value="경남은행">경남은행</option>
                                                   <option value="광주은행">광주은행</option>
                                                   <option value="대구은행">대구은행</option>
                                                   <option value="도이치은행">도이치은행</option>
                                                   <option value="부산은행">부산은행</option>
                                                   <option value="비엔피파리바은행">비엔피파리바은행</option>
                                                   <option value="산림조합">산림조합</option>
                                                   <option value="산업은행">산업은행</option>
                                                   <option value="새마을금고">새마을금고</option>
                                                   <option value="수출입은행">수출입은행</option>
                                                   <option value="수협은행">수협은행</option>
                                                   <option value="신협">신협</option>
                                                   <option value="우체국">우체국</option>
                                                   <option value="저축은행">저축은행</option>
                                                   <option value="전북은행">전북은행</option>
                                                   <option value="제주은행">제주은행</option>
                                                   <option value="중국건설은행">중국건설은행</option>
                                                   <option value="중국공상은행">중국공상은행</option>
                                                   <option value="카카오뱅크">카카오뱅크</option>
                                                   <option value="케이뱅크">케이뱅크</option>
                                                   <option value="BOA(뱅크오브아프리카)">BOA(뱅크오브아프리카)</option>
                                                   <option value="HSBC은행">HSBC은행</option>
                                                   <option value="JP모간체이스은행">JP모간체이스은행</option>
                                             </select>
                     <p class="inp_wrap">
                        <input name="accountNumber" data-account-number type="number" placeholder="계좌번호를 입력하세요.">
                     </p>
                     <p class="inp_wrap">
                        <input name="accountName" data-account-name type="text" placeholder="예금주를 입력하세요." maxlength="10">
                     </p>
                  </div> -->
                  <!-- //환불받을 계좌정보 등록 -->
               </section>

               <section class="text_wrap">
                  <b>문의내용</b>
                  <div>
                     <textarea name="content" id="questionTextarea"></textarea>
                     <ul class="placeholder_txt">
                        <li>문의하실 내용을 10자 이상 입력해 주세요.</li>
                        <li>문의하시는 제휴점 이름과 예약정보를 남겨주시면 보다 빠른 상담이 가능합니다.</li>
                        <li>문의 내용 작성 시 개인정보가 입력되지 않도록 주의 부탁드립니다.</li>
                     </ul>
                  </div>
               </section>

               <section class="agree_wrap">
                  <div>
                     <input type="checkbox" id="info_agree" name="checkOne" class="inp_chk_04" disabled>
                     <label for="info_agree">개인정보수집. 이용동의</label>
                     <btn class="view_contents">[내용보기]</btn>
                  </div>
               </section>

               <section class="btn_wrap ">
               </form>
                  <button id="submitBtn" class="btn_red_fill" type="button">작성 완료</button>
               </section>
         </div>

         <!-- 개인정보처리방침동의 팝업 -->
         <div class="box_shadow" id="common_popup_agree">
            <div class="msg popup_cont">
               <div class="text">
                  <div><strong class="privacy_title">개인정보 수집&middot;이용 동의하십니까? </strong></div>
                  <div class="privacy-bill">
                     <p>동의 하세요!!!</p>
                     
                  </div>
               </div>
               <div class="btns-wrap">
                  <button class="btn disagree">닫기</button>
               </div>
            </div>
         </div>
         <!--// 개인정보처리방침동의 팝업 -->

         <!-- 개인정보처리방침동의 팝업2 -->
         <div class="box_shadow" id="common_popup_agree2">
            <div class="msg popup_cont">
               <div class="text">
                  <div class="privacy-bill">
                     작성하신 문의를 여기어때 고객행복센터로<br/>
                     보내시겠습니까?
                  </div>
               </div>
               <div class="btns-wrap">
                  <button class="btn disagree2">취소</button>
                  <button class="btn send-form" data-type="privacyAgree">보내기</button>
               </div>
            </div>
         </div>
         <!--// 개인정보처리방침동의 팝업2 -->

      </div>
      <!-- //Notice -->

   </div>

</div>


      <!-- //Content  -->

      <script>

  
      </script>


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


   <script type="text/javascript" src="js/submitHandler.js"></script>
      <!--  -->


</body>

</html>
