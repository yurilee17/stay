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


/*// 선택되었을때 배경색과 폰트색 변경되는 js 
  const hpInner = document.querySelector('.hpInner');
 
        function select(ulEl, liEl){
            Array.from(ulEl.children).forEach(
                v => v.classList.remove('selected')
            )
            if(liEl) liEl.classList.add('selected');
        }
 
        hpInner.addEventListener('click', e => {
            const selected = e.target;
            select(hpInner, selected);
        })


*/
    
    
    
    
    
    
   