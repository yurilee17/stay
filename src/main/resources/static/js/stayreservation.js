/* 연박구매총액 팝업 */
var iscroll_price;

function iscroll_run_price () {
	iscroll_price = new IScroll('.iscroll_price',{
		mouseWheel:true,
		interactiveScrollbars:true,
		shrinkScrollbars:'scale',
		fadeScrollbars:true,
		click:true
	});
}

function pop_price(){
	var cnt = $('.pop_price ul li').length;

	if (cnt < 3){ // 2개 이하일때
		$('.pop_price .content').addClass('height_align');
	}else{
		null;
	}
	prevent_scroll();
	$('.pop_price').fadeIn(150);
	$('.bg_dimm').fadeIn(150);
	iscroll_run_price(); // iscroll
	$('.fix_title').bind('touchmove',function(i){i.preventDefault()}); // 타이틀 터치 방지
	align_verticalAll('pop_price');
}

// Main ---------------------------------------------------------------------------------------------------------------S
$(function(){

	/* 이용정보 숙박일때 숨김 */
	var time_drag = $('.time_drag #usetime').length;
	if (time_drag !== 1){
		$('.time_drag').hide();
		$('.info_chkin h3').css('margin-top','0');
	}

    if ($('.alert_msg_content').length > 0) {
        alert_Msg($('.alert_msg_content').html());
    }

	/* 이용시간 */
    var idx = 0;
    var start_hash = '';
    //for(var i = Number($('input[name=use_start_time]').val());i<Number($('input[name=use_end_time]').val());i++){
    for(var i = Number($('input[name=use_start_time]').val());i<Number($('input[name=use_end_time]').val());i++){
        if(Number($('input[name=server_time]').val())==i)start_hash=idx;
        idx++;
    }

	$('#usetime').owlCarousel({
		dragEndSpeed:300,
		stagePadding: 16,
		loop:false,
		margin:0,
		nav:false,
		responsive:{
			0:{
				items:4
			},
			360:{
				items:5
			},
			412:{
				items:6
			},
			480:{
				items:7
			},
			520:{
				items:8
			},
			768:{
				items:10
			},
			1024:{
				items:8
			}
		},
        startPosition:start_hash
	});

	// TODO: 입실시간 클릭
    $(".time_drag").on('click', '.owl-carousel button.item', function(e){
        e.preventDefault();
        if($(this).hasClass("disable")) return false;

        $(".owl-carousel button.item").removeClass("enable");	//초기화
        $item_obj = $(this).parent();

        var use_stime = $item_obj.find('.item').attr("times");
        var use_etime = $item_obj.next().find('.item').attr("times");

        // 무한대실 이용?일 경우 시간 늘리기
        var unlimit_msg = '';
        if(Number($('#maxUnlimitedRentHour').val())>0){
            if(Number($('#availableUnlimitedRentEndHour').val()) >= Number($item_obj.find('.item').attr("times"))){
                Number($('input[name=dayuse_time]').val($('#maxUnlimitedRentHour').val()));
                unlimit_msg = '(무한대실) ';
            }else{
                Number($('input[name=dayuse_time]').val($('input[name=old_dayuse_time]').val()));
            }
        }

        var $button_length = $('.owl-carousel button.item').length;
        var $current_index = $('.owl-carousel button.item').index($(this));

        // 이용시간 활성화
        for(var i=0;i<Number($('input[name=dayuse_time]').val());i++){
            if(i==0)use_stime = Number($item_obj.find('.item').attr("times"));
            if ($current_index + i >= $button_length - 1) continue;

            $item_obj.find('.item').addClass('enable');

            use_etime = Number($item_obj.find('.item').attr("times"))+1;

            $item_obj = $item_obj.next();
        }

        $('.use_time').text(use_stime+":00 - "+use_etime+":00");
        $('.title rol').eq(0).text('');
        $('.title rol').eq(1).text('이용');
        $('.dayuse').text(unlimit_msg+$(".owl-carousel button.enable").length);
        if(Number($(".owl-carousel button.enable").length) < Number($('input[name=dayuse_time]').val())){
            alert_Msg(use_stime+"시에 입실하시면<br>"+$(".owl-carousel button.enable").length+"시간 이용하실 수 있습니다.");
        }

        //var last_chkin_date = new Date($('#checkin_date').val());
        var last_chkin_date =safariDate($('#checkin_date').val());
        last_chkin_date.setHours(use_stime);
        var last_etime = Number(use_etime)>24 ? Math.floor(Number(use_etime)/13) : use_etime;
        //var last_chkout_date = new Date($('#order_form').find('input[name=checkin_date]').val());
        var last_chkout_date = safariDate($('#checkin_date').val());

        last_chkout_date.setHours((last_etime));
        if(last_etime<9 && last_etime>3) last_chkout_date.setDate(last_chkin_date.getDate()+1);

        //var refund_can_date = new Date($('#order_form').find('input[name=checkin_date]').val());
        var refund_can_date = safariDate($('#checkin_date').val());
        refund_can_date.setHours(last_chkin_date.getHours()-3);
        var agree = $('#order_config_form input[name=agree]').val();
        var agree_reserve_keep = $('#order_config_form input[name=agree_reserve_keep]').val();
        var join = $('#order_form input[name=uno]').val();
        var room_service_type = $('#order_config_form input[name=room_service_type]').val();
        var nowtime = new Date().getTime();
        var body_text = chkinDateFormat('YMDPERIOD',refund_can_date)+"까지<b>취소 및 환불 가능 (1일 1회)</b>";
        // 취소시간 불가
        if(refund_can_date.getTime() < nowtime){
            body_text = chkinDateFormat('YMDPERIOD',refund_can_date)+"이후 <br>취소 및 환불 불가합니다.";
            //if(agree_reserve_keep=='Y')body_text = chkinDateFormat('YMDPERIOD',refund_can_date)+"이후 <br>취소 시 쿠폰 교환 가능(1일1회).";		//예약연기
        }
        
        
        // 당일,미리예약 체크
        var alReady = false;
        var nowDate = new Date();
        nowDate.setHours( nowDate.getHours() - 3);
        if( last_chkin_date.getDate() > nowDate.getDate() ){
            alReady = true;
        }

        // 환불 미동의
        if(agree=='N'){
            body_text = "<b>취소 및 환불이 불가한 숙소입니다.</b>";
        }

        // 페이백
        if(room_service_type==2)body_text = "<b>취소 및 환불이 불가한 숙소입니다.</b>";

				$('#order_form').find('input[name=rentTime]').val($(".owl-carousel button.enable").length);

        body_text = "<span id='chkin_cancel_date'>"+body_text+"</span>";
        $('span[name=useText]').text('');
        $("#rentCheckinHour").val(use_stime);
        $("#rentCheckoutHour").val(use_etime);
        var nowHour = new Date().getHours();
        $('#chkin_print_date').html("<span>체크인</span> <b> "+ ( !alReady && Number(nowHour) < 3 ? "지금 체크인 하셔야 합니다." : chkinDateFormat('MDKR',last_chkin_date))+"</b>");
        $('#chkout_print_date').html("<span>체크아웃</span> <b> "+chkinDateFormat('MDKR',last_chkout_date)+"</b>");
        $('#chkin_cancel_date').html(body_text);
        $('#dayuse_select').val("Y");
    });

    // 결제수단 선택
    $('.pay_select select').change(function(){
        $('#order_form input[name=pay_type]').val($(this).val());
    });

    // TODO: 카카오페이 결제페이지 리사이즈처리
    $(window).resize(function(){
        if($('#kakaopay_layer').length > 0){
            $('#kakaopay_layer').css({position:'absolute'}).css({
                left: ($(window).width() - $('#kakaopay_layer').outerWidth())/2
            });
        }
    });

});







// Main ---------------------------------------------------------------------------------------------------------------E

// #1.결제하기
function payment_confirm(){
    var regName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
    var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    var buyer = $('input[name=userName]');
    var buyer_phone = $('input[name=userPhone]');

    if(!buyer.val()) {
        alert_Msg('예약자 이름을 입력해주세요.');
        return false;
    }
    if(regName.test(buyer.val())==false){
        alert_Msg('예약자 이름은 한글,영문,숫자만 입력이 가능합니다.');
        return false;
    }
    if(Number(buyer.val().length)>20){
        $('.inp_info_02 .from_name').show();
        alert_Msg('예약자 이름은 20자 이하로 입력해주세요.');
        return false;
    }
/*    if(!buyer_phone.val()){
        alert_Msg('휴대폰 번호를 입력해 주세요.');
        return false;
    }

    if(regPhone.test(buyer_phone.val())==false){
        alert_Msg('휴대폰 번호를 확인해 주세요.');
        return false;
    }

    if ($('#verificationCode').length > 0) {
        if(buyer_phone.data('phoneverify') != 'Y'
            || buyer_phone.data('phoneverify') === undefined) {
            alert_Msg('휴대폰 번호 미인증 되었습니다.');
            return false;
        }
    }*/

    if($('#order_form').find('input[name=checkin_type]').val()==1){
        if($('input[name=dayuse_select]').val()=="N"){
            alert_Msg('이용시간을 선택해주세요.');
            return false;
        }
    }

    buyer_phone.val(buyer_phone.val().replace(/\-/ig, ''));


    // 약관 체크
	if($('.agree input[name=checkOne]:checked').length !== 3){
            alert_Msg('필수 이용 동의 항목에 동의(체크)해주세요.');
            return false;
		}


    // 예약내역 확인 팝업
    pop_reserve('reserve_chk');
}

// #2. 결제진행
function payment_run(){

    var buyer = $('input[name=userName]').val();
    var buyer_phone = $('input[name=userPhone]').val();
    var oneDay1stCancel = $('input[name=oneDay1stCancel]').val();
    var pay_type_array = [2,5,6,10,11,12,14];						// payment type 2 : 이니시스, 5 : 모빌리언스, 6 : 포인트/쿠폰, 10 : 카카오페이, 11 : 나이스페이, 12 : PAYCO, 14 : 네이버페이
    $('#order_form input[name=buyer]').val(buyer);
    $('#order_form input[name=buyer_phone]').val(buyer_phone);

    if($("input[name=pay_process]").val() == "Y"){
        close_layer();
        alert_Msg('결제 진행중 입니다.');
        return false;
    }
// console.log($("#order_form").serialize());
    // 임시
    $("input[name=pay_process]").val("Y");
    $.ajax({
        type: 'POST'
        , async: true
        , cache: false
        , url: '/reservation/setReservationReady_non'
        , dataType: 'json'
        , data: $("#order_form").serialize()
        , success: function(data) {
            if(data.rtv.code != "0000"){
                $("input[name=pay_process]").val("N");

                alert_Msg(data.rtv.msg);

                if(data.rtv.code=="9998"){
                    close_layer();
                }else{
                    //history.back();
                }
                //common_popup('원인을 알수 없는 오류입니다. 고객행복센터에 문의바랍니다.');
                return false;
            }
            var ele = data.params;
            if($.inArray(Number(ele.do_pay_type),pay_type_array)!=undefined){
                payment_submit(data);
                return false;
            }
        }
        , error: function(jqXHR, textStatus, errorThrown) {
            var errorMsg = 'status(code) : ' + jqXHR.status + '\n';
            errorMsg += 'statusText : ' + jqXHR.statusText + '\n';
            errorMsg += 'responseText : ' + jqXHR.responseText + '\n';
            errorMsg += 'textStatus : ' + textStatus + '\n';
            errorMsg += 'errorThrown : ' + errorThrown;
            alert_Msg(errorMsg);
            return false;
        }
    });

}

// #3. PG 사 오픈 결제 시작
function payment_submit(data){
    $("input[name=pay_process]").val("N");

    var pay_type_array = [2,5,6,10,11,12,14];						// payment type 2 : 이니시스, 5 : 모빌리언스, 6 : 포인트/쿠폰, 10 : 카카오페이, 11 : 나이스페이, 12 : PAYCO, 14 : 네이버페이
    var pay_type_form = {2:'inicis_pay',5:'mobilians_pay', 6:'pay_form',10:'kakao_pay_form',11:'nice_card_pay_form',12:'payco_pay_form',13:'pay_form',14:'naver_pay_form'};						// payment type 2 : 이니시스, 5 : 모빌리언스, 10 : 카카오페이, 11 : 나이스페이, 12 : PAYCO, 14 : 네이버페이

    if(data.rtv.code != "0000")
        return false;

    var formObj = pay_type_form[data.params.do_pay_type];

    $.each(data.params,function(formName,formValue){
        $("#"+formObj+" input[name='"+formName+"']").val(formValue);
    });

    // 웹 전용
	var os_type = $('input[name=escrow_os_type]').val();
	if(os_type){
		$("#order_form input[name='payment_price']").val($("#order_form input[name='fix_payment_price']").val());
		$("#order_form input[name='do_use_point']").val(0);
		$("#order_form input[name='do_use_mileage']").val(0);
		$("#order_form input[name='do_use_coupon']").val(0);
		$("#order_form input[name='do_cpnis_no']").val('');
		$("#order_form input[name='stamp_coupon']").val('N');
	}
    // 웹 전용

    switch(Number(data.params.PAYMENT_TYPE)){
        case 2 :		// 이니시스
            fnInicisSubmit(data.params.ORDER_URL + data.params.P_PAY_METHOD + "/");
            break;
        case 5 :		// 휴대폰 결제
            // alert_Msg('휴대폰 결제는 점검중입니다. <br>다른 결제수단을 이용해 주세요.');
            fnMobiliansSubmit();
            break;
        case 10 :		// 카카오페이
            getTxnId();
            break;
        case 11 :		// 나이스페이
            if(isWebMobile()=='W'){
                nicepayStart(); // PC
            }else{
                fnNiceCardSubmit(); // MOBILE
            }
            break;
        case 12 :		// PAYCO
            if($('#order_url').val()){
                payCoUpdateNo();
            }else{
                payCoSubmit();
            }
            break;
        case 14 :		// 네이버 페이
            naverPaySubmit(data.params);
            break;
        case 6 :
        case 13 :
            // 결제
            $("#"+formObj).submit();
            break;
    }
}

function validate(){
	//var regName =  /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	var regName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
	var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var buyer = $('input[name=do_user_name]');
	var buyer_phone = $('input[name=do_user_tel]');
	var login_on = $('#order_form input[name=uno]').val() ? true : false;
	var parkingChk = $('.visit .parking_type_btn.on').hasClass('on');
	var adcno = $('#order_form input[name=adcno]').val();
	//var parkingUse = $('input[name=park_access]').val();

	/*if(Number($('.select_type_1').val()) == 5) {
  alert_Msg('휴대폰 결제는 점검중입니다. <br>다른 결제수단을 이용해 주세요.');
  return false;
  }*/

	if($('#reservationType').val()=='RENT'){
		if($('#dayuse_select').val()=="N"){
			alert_Msg('이용시간을 선택해주세요.');
			return false;
		}
	}

	if(!buyer.val()) {
		alert_Msg('예약자 이름을 입력해주세요.');
		return false;
	}
	if(regName.test(buyer.val())==false){
		alert_Msg('예약자 이름은 한글,영문,숫자만 입력이 가능합니다.');
		return false;
	}
	if(Number(buyer.val().length)>20){
		$('.inp_info_02 .from_name').show();
		alert_Msg('예약자 이름은 20자 이하로 입력해주세요.');
		return false;
	}
/*	if(!buyer_phone.val()){
		alert_Msg('휴대폰 번호를 입력해 주세요.');
		return false;
	}

	if(regPhone.test(buyer_phone.val())==false){
		alert_Msg('휴대폰 번호를 확인해 주세요.');
		return false;
	}

	if ($('#verificationCode').length > 0) {
		if(buyer_phone.data('phoneverify') != 'Y'  || buyer_phone.data('phoneverify') === undefined) {
			alert_Msg('휴대폰 번호 미인증 되었습니다.');
			return false;
		}
	}*/

	buyer_phone.val(buyer_phone.val().replace(/\-/ig, ''));

	var payTypeOption = $("section.pay_select select option[value=" + $('#order_form #reqPayment_paymentType').val() + "]");
	if(payTypeOption.attr("minPirce") > $("#reqAmount_paymentAmount")) {
		alert_Msg(payTypeOption.text() + ' 최소 결제금액은 ' + payTypeOption.attr("minPirce") + "원 이상부터 가능합니다.");
		return false;
	}

	// 약관 체크
	if($('.agree input[name=checkOne]:checked').length !== 3){
			alert_Msg('필수 이용 동의 항목에 동의(체크)해주세요.');
			return false;
		}

	$("#reqUser_phone").val(buyer_phone.val());

	$.ajax({
		type: 'POST'
		, async: true
		, cache: false
		, url: $("#order_form").attr("action")
		, dataType: 'json'
		, data: $("#order_form").serialize()
		, success: function(data) {


				if(data.code == 'SUCCESS') {
					var response = data.result,
							resValidOrder = response.resValidOrder,
							refundMessage = "";
						$("#orderAttemptKey").val(response.orderAttemptKey);
						if($("#reqPayment_paymentType").val() == 'POINT') {
							redirectUrl = '/reservation/pointProcess/' + response.orderAttemptKey;
						} else {
							redirectUrl = response.nextRedirectUrl;
						}

						$("#refund_policy *").remove();

					if($("#facilityCategory").val() == 'MOTEL') {
						if(resValidOrder.isCancelableFacility) {
							if($("#inAdvance").val() == '1') {
								refundMessage += "<li class='dot_txt'>미리예약은 체크인 기준 1일 전까지 취소 가능합니다.</li>";
							} else {
								refundMessage += "<li class='dot_txt'>당일예약은 체크인 시간 기준 3시간 전까지 취소 가능합니다.</li>";
							}
						} else {
							refundMessage += "<li class='dot_txt'><b style='color: red;'>취소 및 환불이 불가</b>합니다.</li>";
						}
						refundMessage += "<li class='dot_txt'>예약 후 15분 이내 고객행복센터로 취소 요청 시 100% 환불 가능합니다.</li>";
					} else {
						if(resValidOrder.confirmationType > 0) {
							refundMessage += "<li class='dot_txt'>해당 예약은 예약대기 상태 입니다. <b style='color: red;'>예약대기</b> 상태에서는 객실을 이용할 수 없으며, 예약이 완료되면 문자로 발송됩니다.</li>";
						}
						refundMessage += "<li class='dot_txt'>미성년자는 보호자 동반 시 투숙이 가능합니다.</li>";
						if(resValidOrder.isCancelableProduct) {
							refundMessage += "<li class='dot_txt'><b style='color: red;'>취소 및 환불 규정</b>에 따라 취소수수료 부과 및 취소불가 될 수 있습니다.</li>";
						} else {
							refundMessage += "<li class='dot_txt'><b style='color: red;'>취소 및 환불이 불가</b>합니다.</li>";
						}
					}

						$("#refund_policy").append(refundMessage);
						$('#chkin_print_date').html("<span>체크인</span> <b> "+ chkinDateFormat('MDKR',new Date(data.result.resValidOrder.checkinDate.replace('T', ' ').replace(/-/g, '/')))+"</b>");
						$('#chkout_print_date').html("<span>체크아웃</span> <b> "+chkinDateFormat('MDKR',new Date(data.result.resValidOrder.checkoutDate.replace('T', ' ').replace(/-/g, '/')))+"</b>");
						pop_reserve('reserve_chk');

				} else {
						if (data.errorMessage) {
							if (data.errorMessage.goOut == true) {
									alert_Msg(data.message, 1, '/');
							} else if (data.errorMessage.pageReload == true) {
									alert_Msg(data.message, 2, '', true);
							} else {
									alert_Msg(data.message);
							}
						} else {
								alert_Msg(data.message);
						}
				}
				return false;
		}
		, error: function(jqXHR, textStatus, errorThrown) {
				return false;
		}
		, beforeSend: function() {
			$("#pay_background").show();
			spinner_show();
		}
		, complete: function () {
			$("#pay_background").hide();
			spinner_hide();
		}

	});

// 예약내역 확인 팝업
// pop_reserve('reserve_chk');
}

var redirectUrl = "";
function auth_payment() {
	switch($("#reqPayment_paymentType").val()) {
		case "POINT" :
			spinner_show();
			$("#pay_frame").attr("src", redirectUrl);
			break;
		default :
			if($(document.body).hasClass('mobile')) {
				//$("#pay_mobile_frame").attr("src", redirectUrl);
				spinner_show();
				location.replace(redirectUrl);
				return;
			} else {
				if($("#reqPayment_paymentType").val() == 'NAVER') {
					openPaymentWindow(740,800);
					return;
				} else {
					$("#pay_frame").attr("src", redirectUrl);
				}
			}
			open_payment();
	}
}

var paymentWindow;
function openPaymentWindow(width, height) {
	$("#pay_background").show();
	// 새창에 대한 세팅(옵션)
	var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=1,resizable=no,height=' + height + 'px,width=' + width + 'px,left=100,top=100';
	paymentWindow = window.open(redirectUrl, "newWindow", settings);
	if(paymentWindow == null || paymentWindow.closed) {
		alert_msg("팝업 차단을 해제 해주세요.");
	} else {
		setTimeout(closePaymentWindow, 1000);
	}
}

function closePaymentWindow() {
	if(paymentWindow == null || paymentWindow.closed) {
		$("#pay_background").hide();
	} else {
		setTimeout(closePaymentWindow, 1000);
	}
}


function open_payment() {
	if($(document.body).hasClass('mobile')) {
		$("#pay_mobile_box").show();
	} else {
		var payWidth = "100%";
		var payHeight = "100%";
		var payBoxMargin = "100px auto";
		var payFrameBackground = "#fff";

		switch ($("#reqPayment_paymentType").val()) {
			case "PAYCO" :
				payWidth = "660px";
				payHeight = "505px";
				break;
			case "NAVER" :
				payWidth = "740px";
				payHeight = "800px";
				break;
			case "CELLPHONE" :
				payWidth = "660px";
				payHeight = "610px";
				break;
			case "CARD" :
			case "CARD_BIZ" :
				payBoxMargin = "0";
				payFrameBackground = "none";
				break;
		}

		$("#pay_box").css("width", payWidth);
		$("#pay_box").css("height", payHeight);
		$("#pay_box").css("margin", payBoxMargin);
		$("#pay_frame").css("width", payWidth);
		$("#pay_frame").css("height", payHeight);
		$("#pay_frame").css("background", payFrameBackground);
		$("#pay_background").show();
		$("#pay_box").show();
		// 카드 결제사 페이지 사이즈 오류로 추가
		setTimeout(function(){
			$("#pay_frame").css("width", (parseInt($("#pay_frame").css("width").replace('px', '')) + 1) + 'px');
		}, 1000);
		setTimeout(function(){
			$("#pay_frame").css("width", (parseInt($("#pay_frame").css("width").replace('px', '')) - 1) + 'px');
		}, 2000);
	}
}

function close_payment() {
	if($(document.body).hasClass('mobile')) {
		$("#pay_mobile_box").hide();
		$("#pay_mobile_frame").attr("src", "#");
	} else {
		$("#pay_box").css("width", "0px");
		$("#pay_box").css("height", "0px");
		$("#pay_frame").css("width", "0px");
		$("#pay_frame").css("height", "0px");
		$("#pay_background").hide();
		$("#pay_box").hide();
		$("#pay_frame").attr("src", "about:blank");
	}
}

function cancel_payment() {
	close_payment();
	spinner_hide();
	alert_Msg("결제를 취소했습니다.");
}

function fail_payment(message) {
	close_payment();
	spinner_hide();
	alert_Msg(message,2,'',true);
}

function success_payment() {
	close_payment();
	if($("#userType").val() == 'GUEST') {
		alert_Msg("정상 예약되었습니다.", 1, '/user/guestReservation')
	} else {
		alert_Msg("정상 예약되었습니다.", 1, '/my/reserveList')
	}
}

function payment_change(obj) {
	$('#order_form #reqPayment_paymentType').val($(obj).children(":selected").val());
}

// 예약자이름, 휴대폰 번호 체크
function reserveVadlidationCheck(mode){
    var regName =  /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    regName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
    var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    var buyer = $('input[name=do_user_name]');
    var buyer_phone = $('input[name=do_user_tel]');

    if(mode=='name'){
        //console.log(regName.test(buyer.val()));
        if(regName.test(buyer.val())==false){
            $('.alert_txt[data-show=name]').css('visibility', '');
            $('.alert_txt[data-show=name]').text('한글,영문,숫자만 입력이 가능합니다.');
            return false;
        }else{
            $('.inp_info_02 .from_name').hide();
        }
        if(Number(buyer.val().length)>20){
            $('.alert_txt[data-show=name]').css('visibility', '');
            $('.alert_txt[data-show=name]').text('20자 이하로 입력해주세요.');
            return false;
        }else{
            $('.alert_txt[data-show=name]').css('visibility', 'hidden');
        }
        $("#reqUser_visitorName").val(buyer.val());
    }

    if(mode=='tel'){
        if(regPhone.test(buyer_phone.val())==false){
            $('.alert_txt[data-show=tel]').css('visibility', '');
            $('.alert_txt[data-show=tel]').text('휴대폰 번호를 확인해 주세요.');
            return false;
        }else{
            $('.alert_txt[data-show=tel]').css('visibility', 'hidden');
        }
				$("#reqUser_phone").val(buyer_phone.val());
    }
}

function categorySaleTimeCheck(){
    var category = $('#order_form input[name=adcno]').val();
    var chkindate = $('#order_config_form input[name=chkindate]').val();
    var hotel_category = ['3','4','5'];
    if($.inArray(category,hotel_category)>=0)category = 2;
    var check = true;
    var saleTime = {1:3,2:2,6:10};
    var chkin = new Date(chkindate);
    var nowTime = new Date();
    // 모텔 3시, 호텔 2시, 게스트하우스 10시
    if (nowTime.getTime() > chkin.getTime() && nowTime.getHours() > Number(saleTime[category]) && nowTime.getHours() < 9 ) {
        check = false;
    }
    var return_date = (chkin.getMonth()+1)+"월"+chkin.getDate()+"일";
    if(!check)alert(return_date+"예약이 마감되었습니다.\n다른 날짜로 변경해주세요.");
    return check;
}

function setUseTimeHTML(param){
    var use_time = '';		//이용시간 text
    var dayuse = '';		//대실이용시간
    var server_time = '';	//now
    var target_html = $('#usetime');	//append tag
    var chkin = '';
    var chkout = '';
    var chkin_time = '';
    var chkout = '';
    var currentdate = new Date();
    var datetime = currentdate.getTime() ;
    var chkinTime = new Date(param.dpod_chkin_date);
    chkinTime = chkinTime.setMonth(chkinTime.getMonth()+1);
    if(param.dpod_chkin_date==undefined || param.dpod_chkout_date==undefined || param.dpod_dayuse_time==undefined){
        alert_Msg('필수값 에러 입니다. 고객행복센터에 문의하세요.');
        return false;
    }

    if(chkinTime>datetime)param.server_time=9;

    chkin = new Date(param.dpod_chkin_date);
    chkout = new Date(param.dpod_chkout_date);

    chkin_time = chkin.getHours();
    chkout_time = chkout.getHours();
    if(Number(chkin_time)>Number(chkout_time)) chkout_time = chkout_time+24;


    $('.dayuse').text(param.dpod_dayuse_time);

    owl.trigger('destroy.owl.carousel').empty();

    $('#usetime').children().remove();
    var idx = 0;
    var start_hash = '';
    for(var i = Number(chkin_time);i<Number(chkout_time);i++){
        var enable = "disable";
        if(Number(param.server_time) < i && i <= (chkout_time-2)) enable = "";
        $('#usetime').append("<button class='item "+enable+"' times="+i+" dpod_no="+param.dpod_no+" uno="+$('#order_form').find('input[name=uno]').val()+">"+i+":00</button>");
        if(Number(param.server_time)==i)start_hash=idx;
        idx++;
    }
    owl_option.startPosition = start_hash;
    owl.owlCarousel(owl_option);
}

function safariDate(sel_date){
    var date = sel_date,
        values = date.split(/[^0-9]/),
        year = parseInt(values[0], 10),
        month = parseInt(values[1], 10) - 1, // Month is zero based, so subtract 1
        day = parseInt(values[2], 10),
        hours = parseInt(values[3] ?  values[3] : 0, 10),
        minutes = parseInt(values[4] ?  values[4] : 0, 10),
        seconds = parseInt(values[5] ?  values[5] : 0, 10),
        formattedDate;

    formattedDate = new Date(year, month, day, hours, minutes, seconds);
    return formattedDate;
}

// 요일 구하기 (한글)
function weekKr(week){
    if(week<0) return false;
    var week_string = {0:"일",1:"월",2:"화",3:"수",4:"목",5:"금",6:"토"};
    return week_string[week];
}

// 체크인 날짜 format
function chkinDateFormat(format,date) {
    if(!date) return false;
    var dates = new Date(date);
    var dataStr;
    switch(format){
        case 'MDKR' :
            dateStr = str_pad(dates.getMonth()+1,2)+"월"+str_pad(dates.getDate(),2)+"일"+"("+weekKr(dates.getDay())+") "+str_pad(dates.getHours(),2)+":"+str_pad(dates.getMinutes(),2);
            break;
        case 'YMDPERIOD' :
            dateStr = dates.getFullYear()+"."+str_pad(dates.getMonth()+1,2)+"."+str_pad(dates.getDate(),2)+"."+" ("+weekKr(dates.getUTCDay())+") "+str_pad(dates.getHours(),2)+":"+str_pad(dates.getMinutes(),2);
            break;
    }

    return dateStr;
}

// 적립카드 팝업
function saveCardPopup(ano, uno){
    var popUrl = "https://api3.goodchoice.kr/my/saveCardDetail?ano="+ano+"&uno="+uno;
    var popOption = "width=530, height=590, resizable=no, scrollbars=yes, status=no, location=no, menubar=no, directories=no;";
    var savecardWindow = window.open(popUrl, "",popOption);

    //savecardWindow.document.write('<iframe src="'+popUrl+'" frameborder="0" width="530" height="590" marginwidth="0" marginheight="0" scrolling="yes">');
}

/* php STR_PAD  */
function str_pad(n, width, z) {
    z = z || '0';
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}


//3자리 콤마
function cust_number_format(x){
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function paymentCheck() {
		if($("#reqAmount_paymentAmount").val() == '0') {
				$("section.pay_select").hide();
				$("#reqPayment_paymentType").val("POINT");
		} else {
				$("section.pay_select").show();
				$('#reqPayment_paymentType').val($("section.pay_select > select.select_type_1 > option:selected").val());
		}

}

function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}



/*카카오페이 submit */
var submitFunc = function cnspaySubmit(data){
    if(data.RESULT_CODE === '00') {

        // 부인방지토큰은 기본적으로 name="NON_REP_TOKEN"인 input박스에 들어가게 되며, 아래와 같은 방법으로 꺼내서 쓸 수도 있다.
        // 해당값은 가군인증을 위해 돌려주는 값으로서, 가맹점과 카카오페이 양측에서 저장하고 있어야 한다.
        // var temp = data.NON_REP_TOKEN;

        document.kakao_pay_form.submit();

    } else if(data.RESULT_CODE === 'KKP_SER_002') {
        // X버튼 눌렀을때의 이벤트 처리 코드 등록
        //alert_Msg(data.RESULT_MSG);
        //location.href = $('input[name=cancel_url]').val();
        $("input[name=pay_process]").val("N");
    } else {
        if(data.RESULT_CODE == '557') alert_Msg('카카오페이 인증완료 후 다시 시도해 주세요.');
        else{
            alert(data.RESULT_MSG);
        }
        //location.href = $('input[name=cancel_url]').val();
    }
};

/*카카오페이 인증요청 */
function getTxnId() {
    // form에 iframe 주소 세팅
    document.kakao_pay_form.target = "txnIdGetterFrame";
    document.kakao_pay_form.action = "/reservation/getTxnId_non";
    document.kakao_pay_form.acceptCharset = "utf-8";
    if (document.kakao_pay_form.canHaveHTML) { // detect IE
        document.charset = kakao_pay_form.acceptCharset;
    }

    if(isWebMobile() == 'W') {
        document.kakao_pay_form.prType.value = "WPM";
        document.kakao_pay_form.channelType.value = "4";
    } else {
        document.kakao_pay_form.prType.value = "MPM";
        document.kakao_pay_form.channelType.value = "2";
    }

    // post로 iframe 페이지 호출
    document.kakao_pay_form.submit();
    // kakao_pay_form의 타겟, action을 수정한다

    document.kakao_pay_form.target = "";
    document.kakao_pay_form.action = $('#kakao_pay_form input[name=FORM_ACTION]').val();
    document.kakao_pay_form.acceptCharset = "utf-8";
    if (document.kakao_pay_form.canHaveHTML) { // detect IE
        document.charset = kakao_pay_form.acceptCharset;
    }

    // getTxnId.jsp의 onload 이벤트를 통해 cnspay() 호출
}


/* 카카오페이 cnspay  를 통해 결제를 시작합니다. */
function cnspay() {
    close_layer();

    // TO-DO : 가맹점에서 해줘야할 부분(TXN_ID)과 KaKaoPay DLP 호출 API
    // 결과코드가 00(정상처리되었습니다.)
    if(document.kakao_pay_form.resultCode.value == '00') {
        // TO-DO : 가맹점에서 해줘야할 부분(TXN_ID)과 KaKaoPay DLP 호출 API
        kakaopayDlp.setTxnId(document.kakao_pay_form.txnId.value);

        //kakaopayDlp.setChannelType('WPM', 'TMS'); // PC결제
        kakaopayDlp.setChannelType('MPM', 'WEB'); // 모바일 웹(브라우저)결제
        //kakaopayDlp.addRequestParams({ MOBILE_NUM : '010-'}); // 초기값 세팅

        kakaopayDlp.callDlp('kakaopay_layer', document.kakao_pay_form, submitFunc);
    } else {
        alert_Msg('[RESULT_CODE] : ' + document.kakao_pay_form.resultCode.value + '<br>[RESULT_MSG] : ' + document.kakao_pay_form.resultMsg.value);
    }
}

// 약관 동의 전체 체크
function allCheckFunc( obj ) {
    $("[name=checkOne]").prop("checked", $(obj).prop("checked") );
}

// 체크박스 체크시 전체선택 체크 여부
/*function oneCheckFunc( obj ){

    var allObj = $("[name=checkAll]");
    var objName = $(obj).attr("name");

    if($(obj).prop("checked")){
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
    else
    {
        allObj.prop("checked", false);
    }
}

$(function(){
    $("[name=checkAll]").click(function(){
        allCheckFunc( this );
    });
    $("[name=checkOne]").each(function(){
        $(this).click(function(){
            oneCheckFunc( $(this) );
        });
    });
});*/
function reserveVerify() {
    clearTimecount();
    cencelSend();
}
