<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<p>셀렉트박스 동적 제어</p>
<div id="div_chk">
 
    <select id="select_id_parents" style="width: 10%;">
        <option value="number">숫자</option>
        <option value="string">한글</option>          
    </select>
 
</div>
<script type="text/javascript">
    $(document).ready(function(){
        
        let selectVal_parents ="";
        let selectVal_child ="";
        let selectVal_grandchild ="";
        
        $("#select_id_parents").on("change", function() {
            $("#select_id_child").remove();
            $("#select_id_grandchild").remove();
            $("#div_chk").append("<select id='select_id_child' style='width: 10%;'></select>");
            
            let number = ["0","1","2","3","4","5","6","7","8","9"];
            let string = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"];
            
            selectVal_parents = $(this).val();
            console.log("selectVal_parents",selectVal_parents);
            
            var selectItem;
            
            if(selectVal_parents == "number"){
                selectItem = number;
            }else if(selectVal_parents == "string"){
                selectItem = string;
            }
            
            $("#select_id_child").empty();
            
            for(var i = 0; i < selectItem.length; i++){
                $("#select_id_child").append("<option value='"+selectItem[i]+"'>"+selectItem[i]+"</option>");
            }
            
            
        });
        
        // select_id_child 동적으로 생성되었기 때문에 재할당을 해주어서 체인지 이벤트를 걸어줍니다!
        $(document).on("change", "#select_id_child", function() {
            $("#select_id_grandchild").remove();
            $("#div_chk").append("<select id='select_id_grandchild' style='width: 10%;'></select>");
            
            // 음..하드코딩 힘드네요ㅎㅎ..실제론 그냥 db값조회해서 하니까 이렇게까진 안합니다 ㅎㅎ
            let number0 = ["0.0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9"];
            let number1 = ["1.0","1.1","1.2","1.3","1.4","1.5","1.6","1.7","1.8","1.9"];
            let number2 = ["2.0","2.1","2.2","2.3","2.4","2.5","2.6","2.7","2.8","2.9"];
            let number3 = ["3.0","3.1","3.2","3.3","3.4","3.5","3.6","3.7","3.8","3.9"];
            let number4 = ["4.0","4.1","4.2","4.3","4.4","4.5","4.6","4.7","4.8","4.9"];
            let number5 = ["5.0","5.1","5.2","5.3","5.4","5.5","5.6","5.7","5.8","5.9"];
            let number6 = ["6.0","6.1","6.2","6.3","6.4","6.5","6.6","6.7","6.8","6.9"];
            let number7 = ["7.0","7.1","7.2","7.3","7.4","7.5","7.6","7.7","7.8","7.9"];
            let number8 = ["8.0","8.1","8.2","8.3","8.4","8.5","8.6","8.7","8.8","8.9"];
            let number9 = ["9.0","9.1","9.2","9.3","9.4","9.5","9.6","9.7","9.8","9.9"];
            
            let stringr = ["가","갸","거","겨","고","교","구","규","그","기"];
            let strings = ["나","냐","너","녀","노","뇨","누","뉴","느","니"];
            let stringe = ["다","댜","더","뎌","도","됴","두","듀","드","디"];
            let stringf = ["라","랴","러","려","로","료","루","류","르","리"];
            let stringa = ["마","먀","머","며","모","묘","무","뮤","므","미"];
            let stringq = ["바","뱌","버","벼","보","뵤","부","뷰","브","비"];
            let stringt = ["사","샤","서","셔","소","쇼","수","슈","스","시"];
            let stringd = ["아","야","어","여","오","요","우","유","으","이"];
            let stringw = ["자","쟈","저","져","조","죠","주","쥬","즈","지"];
            let stringc = ["차","챠","처","쳐","초","쵸","추","츄","츠","치"];
            let stringz = ["카","탸","커","켜","코","쿄","쿠","큐","크","키"];
            let stringx = ["타","탸","터","텨","토","툐","투","튜","트","티"];
            let stringv = ["파","퍄","퍼","펴","포","표","푸","퓨","프","피"];
            let stringg = ["하","햐","허","혀","호","효","후","휴","흐","히"];
            
            selectVal_child = $(this).val();
            console.log("selectVal_child",selectVal_child);
            
            var selectItem;
            
            if(selectVal_child == "0"){
                selectItem = number0;
            }else if(selectVal_child == "1"){
                selectItem = number1;
            }else if(selectVal_child == "2"){
                selectItem = number2;
            }else if(selectVal_child == "3"){
                selectItem = number3;
            }else if(selectVal_child == "4"){
                selectItem = number4;
            }else if(selectVal_child == "5"){
                selectItem = number5;
            }else if(selectVal_child == "6"){
                selectItem = number6;
            }else if(selectVal_child == "7"){
                selectItem = number7;
            }else if(selectVal_child == "8"){
                selectItem = number8;
            }else if(selectVal_child == "9"){
                selectItem = number9;
            }else if(selectVal_child == "ㄱ"){
                selectItem = stringr;
            }else if(selectVal_child == "ㄴ"){
                selectItem = strings;
            }else if(selectVal_child == "ㄷ"){
                selectItem = stringe;
            }else if(selectVal_child == "ㄹ"){
                selectItem = stringf;
            }else if(selectVal_child == "ㅁ"){
                selectItem = stringa;
            }else if(selectVal_child == "ㅂ"){
                selectItem = stringq;
            }else if(selectVal_child == "ㅅ"){
                selectItem = stringt;
            }else if(selectVal_child == "ㅇ"){
                selectItem = stringd;
            }else if(selectVal_child == "ㅈ"){
                selectItem = stringw;
            }else if(selectVal_child == "ㅊ"){
                selectItem = stringc;
            }else if(selectVal_child == "ㅋ"){
                selectItem = stringz;
            }else if(selectVal_child == "ㅌ"){
                selectItem = stringx;
            }else if(selectVal_child == "ㅍ"){
                selectItem = stringv;
            }else if(selectVal_child == "ㅎ"){
                selectItem = stringg;
            }
            
            $("#select_id_grandchild").empty();
            
            for(var i in selectItem){
                $("#select_id_grandchild").append("<option value='"+selectItem[i]+"'>"+selectItem[i]+"</option>");
            }
            
        });
        
        
 
        
        
    });
    
    
</script>
</body>
