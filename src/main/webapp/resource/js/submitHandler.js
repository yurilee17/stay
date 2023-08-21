
// submitHandler.js
$(document).ready(function() {
    $("#submitBtn").on("click", function() {
       // 폼 데이터 유효성 검사
if (!validateForm()) {
    return;
}

// 폼 데이터 저장
const formData = new FormData(document.getElementById("submitForm"));

// AJAX를 통한 폼 데이터 제출
$.ajax({
    url: "/submit",  // 요청 URL
    method: "POST",  // 전송 방식
    data: formData,  // 전송할 데이터
    processData: false, // 데이터 처리 방식
    contentType: false, // 데이터 타입
    success: function(response) {  // 서버 응답 성공 시 호출되는 콜백 함수
        console.log(response);
        alert("제출이 완료되었습니다.");
    },
    error: function(xhr, status, error) {  // 서버 응답 실패 시 호출되는 콜백 함수
        console.error(xhr.statusText);
        alert("제출에 실패하였습니다. 관리자에게 문의하세요.");
    }
});
    });
});