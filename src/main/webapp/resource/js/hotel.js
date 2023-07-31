function showSubMenu() {
  var mainMenu = document.getElementById("mainMenu");
  var subMenu = document.getElementsByClassName("subMenu");

  // 모든 서브 메뉴 감추기
  for (var i = 0; i < subMenu.length; i++) {
    subMenu[i].style.display = "none";
  }

  // 선택된 값에 따라 해당 서브 메뉴 표시
  if (mainMenu.value === "Main1") {
    document.getElementById("subMenu").style.display = "block";
  } else if (mainMenu.value === "Main2") {
    document.getElementById("subMenu2").style.display = "block";
  } else if (mainMenu.value === "Main3") {
    document.getElementById("subMenu3").style.display = "block";
  } else if (mainMenu.value === "Main4") {
    document.getElementById("subMenu4").style.display = "block";
  } else if (mainMenu.value === "Main5") {
    document.getElementById("subMenu5").style.display = "block";
  }
}

 // 오늘 날짜를 yyyy-mm-dd 형식으로 반환하는 함수
    function getTodayDate() {
      const today = new Date();
      const year = today.getFullYear();
      const month = String(today.getMonth() + 1).padStart(2, '0');
      const day = String(today.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    }

    // 3개월 후의 날짜를 yyyy-mm-dd 형식으로 반환하는 함수
    function getThreeMonthsLaterDate() {
      const today = new Date();
      today.setMonth(today.getMonth() + 3);
      const year = today.getFullYear();
      const month = String(today.getMonth() + 1).padStart(2, '0');
      const day = String(today.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    }

    // startday와 endday input의 value, min, max 속성 설정
    document.getElementById("startday").value = getTodayDate();
    document.getElementById("startday").setAttribute("min", getTodayDate());
    document.getElementById("startday").setAttribute("max", getThreeMonthsLaterDate());

    document.getElementById("endday").value = getTodayDate();
    document.getElementById("endday").setAttribute("min", getTodayDate());
    document.getElementById("endday").setAttribute("max", getThreeMonthsLaterDate());
    
    
    
    
    
    
   $(function () {
            $('#demo').daterangepicker({
                "locale": {
                    "format": "YYYY-MM-DD",
                    "separator": " ~ ",
                    "applyLabel": "확인",
                    "cancelLabel": "취소",
                    "fromLabel": "From",
                    "toLabel": "To",
                    "customRangeLabel": "Custom",
                    "weekLabel": "W",
                    "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
                    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    "firstDay": 1
                },
                "startDate": "2020-10-21",
                "endDate": "2020-10-23",
                "drops": "down"
            }, function (start, end, label) {
                console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
            });
        });
