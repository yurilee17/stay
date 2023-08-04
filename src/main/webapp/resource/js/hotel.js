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



/*
// 선택되었을때 배경색과 폰트색 변경되는 js 
  const hpInner = document.querySelector('.inner2');
 
        function select(ulEl, liEl){
            Array.from(ulEl.children).forEach(
                v => v.classList.remove('inner2')
            )
            if(liEl) liEl.classList.add('inner2');
        }
 
        hpInner.addEventListener('click', e => {
            const selected = e.target;
            select(hpInner, selected);
        })
        */
        
        
/*   var inner2 = document.getElementsByClassName("inner2");

      function handleClick(event) {
        console.log(event.target);
        // console.log(this);
        // 콘솔창을 보면 둘다 동일한 값이 나온다

        console.log(event.target.classList);

        if (event.target.classList[1] === "clicked") {
          event.target.classList.remove("clicked");
        } else {
          for (var i = 0; i < inner2.length; i++) {
            inner2[i].classList.remove("clicked");
          }

          event.target.classList.add("clicked");
        }
      }

      function init() {
        for (var i = 0; i < inner2.length; i++) {
          inner2[i].addEventListener("click", handleClick);
        }
      }

      init();
      
      */
      
/*   		const menu_Items = document.querySelectorAll('.hpNav .inner ul li a');

			function handleClick(event) {
				console.log(event.target);
				
			  event.preventDefault();
			  
			  
			   console.log(event.target.classList);
			
			  const selectedMenuItem = event.target;
			
			  // 이전에 선택된 메뉴 아이템에서 'selected' 클래스 제거
			  const previouslySelected = document.querySelector('.hpNav .inner ul li a.selected');
			  if (previouslySelected) {
			    previouslySelected.classList.remove('selected');
			  }
			
			  // 클릭한 메뉴 아이템에 'selected' 클래스 추가
			  selectedMenuItem.classList.add('selected');
			}
			
			function init() {
			  // 메뉴 아이템들에 클릭 이벤트 리스너 등록
			  menu_Items.forEach(item => item.addEventListener('click', handleClick));
			}
			
			init();

    
    */
    
    
    
   