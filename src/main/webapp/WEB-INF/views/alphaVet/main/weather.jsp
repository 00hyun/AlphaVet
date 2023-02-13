<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" -->
<!-- 	crossorigin="anonymous"></script> -->

<style>
.weather{
    color: white;
}
.CurrIcon{
    display: inline-block;
    font-size: 50px;  
}

.CurrTemp{
    display: inline-block;
    font-size: 30px; 
}
.CurrIcon{
     margin-right: 0.5%; 
}
/* .City{ */
/*      font-size: 30px;  */
/*      text-align: right;  */
/*      margin-right: 10%; */
/* } */
</style>	
	
<script>
//날씨

//const API_KEY = "71922718a637ab462406a66d14d54997"

//function onGeoOk(position) {
//// 위도와 경도 받기
//const lat = position.coords.latitude
//const lon = position.coords.longitude
//// 날씨 API 활용
//const url = "https://api.openweathermap.org/data/2.5/weather?lat="+ lat +"&lon="+lon+"&appid="+API_KEY+"&units=metric"
//fetch(url).then(response => response.json()).then(data => {
//	const weather = document.querySelector("#weather span:first-child")
//  const city = document.querySelector("#weather span:last-child")
 
//  city.innerHTML = data.name
//  weather.innerText = data.weather[0].main + "/" + data.main.temp
//})
//}
//function onGeoError() {
//alert("Can't find you. No weather for you.")
//}

//// 위치를 받을 수 있음
//navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError)


 $(document).ready(function() {
   let weatherIcon = {
     '01' : 'fas fa-sun',
     '02' : 'fas fa-cloud-sun',
     '03' : 'fas fa-cloud',
     '04' : 'fas fa-cloud-meatball',
     '09' : 'fas fa-cloud-sun-rain',
     '10' : 'fas fa-cloud-showers-heavy',
     '11' : 'fas fa-poo-storm',
     '13' : 'far fa-snowflake',
     '50' : 'fas fa-smog'
   };

 $.ajax({
 url:'http://api.openweathermap.org/data/2.5/weather?q=Daejeon,KR&APPID=71922718a637ab462406a66d14d54997&units=metric',

 dataType:'json',
 type:'GET',
 success:function(data){
   var $Icon = (data.weather[0].icon).substr(0,2);
   var $Temp = Math.floor(data.main.temp) + '°';
   var $city = data.name;

   $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
   $('.CurrTemp').prepend($Temp);
   $('.City').append($city);
   }
 })
 });


</script>


<div class="weather" align="right">
		<div style="text-align: right; margin-right: 10%">
			<div class="CurrIcon" ></div>
			<div class="CurrTemp"></div>
		</div>
<!-- 		<div class="City"></div> -->
</div>