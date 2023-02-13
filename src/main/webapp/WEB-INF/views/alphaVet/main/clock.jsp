<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <style>
        /*CSS : 시계를 꾸미는 부분*/
        .Clock {
    	    margin-top: -5%;
            text-align: center;
/*             margin-top: 15%; */
        }
        #Clock {
            color: 	white;
            font-size: 150px;
            opacity: 0.9;
        }
        #Clockday {
        	margin-top: -5%;
            color: 	white;
            font-size: 25px;
            opacity: 0.9; /*투명도*/
        }
    </style>
<script>
function Clock() {
    var date = new Date();
    var YYYY = String(date.getFullYear());
    var MM = String(date.getMonth() + 1);
    var DD = Zero(date.getDate());
    var hh = Zero(date.getHours());
    var mm = Zero(date.getMinutes());
    var ss = Zero(date.getSeconds());
    var Week = Weekday();

    Write(YYYY, MM, DD, hh, mm, ss, Week);
   //시계에 1의자리수가 나올때 0을 넣어주는 함수 (ex : 1초 -> 01초)

    function Zero(num) {
        return (num < 10 ? '0' + num : '' + num);
    }

   //요일을 추가해주는 함수
    function Weekday() {
        var Week = ['일', '월', '화', '수', '목', '금', '토'];
        var Weekday = date.getDay();
        return Week[Weekday];
    }


   //시계부분을 써주는 함수
    function Write(YYYY, MM, DD, hh, mm, ss, Week) {
        var Clockday = document.getElementById("Clockday");
        var Clock = document.getElementById("Clock");
        Clockday.innerText = YYYY + '년 ' + MM + '월 ' + DD + '일 ' + Week + '요일';
//         Clock.innerText = hh + ':' + mm + ':' + ss;
        Clock.innerText = hh + ':' + mm;
    }
}

setInterval(Clock, 1000); //1초(1000)마다 Clock함수를 재실행 한다

</script>


<body>
   <div class="Clock">
        <div id="Clock"></div>
        <b><div id="Clockday"></div></b>
        </div>
        </body>