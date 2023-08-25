
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
        
        // 폼 재설정
        $("#submitForm")[0].reset();
    },
    error: function(xhr, status, error) {  // 서버 응답 실패 시 호출되는 콜백 함수
        console.error(xhr.statusText);
        alert("문의 등록에 실패 하였습니다.");
    }
});
    });
});
function validateForm() {
    // 여기에 폼 데이터의 유효성을 검사하는 로직을 추가하세요.
    // 필요한 유효성 검사를 수행하고, 유효하지 않은 경우 false를 반환하고, 유효한 경우 true를 반환합니다.

    // 예시: 폼 데이터의 필드 중 하나라도 비어있으면 유효하지 않음으로 처리
    const inputFields = document.querySelectorAll(".js-validate-input");
    for (const inputField of inputFields) {
        if (inputField.value.trim() === "") {
            alert("모든 문의사항을 입력해주세요.");
            return false;
        }
    }

    // 추가적인 유효성 검사 로직을 추가할 수 있습니다.

    return true;  // 모든 유효성 검사가 통과하면 true 반환
    }