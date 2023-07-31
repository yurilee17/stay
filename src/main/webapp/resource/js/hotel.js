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
