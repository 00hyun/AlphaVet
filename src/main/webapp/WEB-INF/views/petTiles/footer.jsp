<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 메뉴바 -->
<div class="card" id="menuBar">
   <div class="card-body">
      <ul class="nav nav-pills nav-justified" role="tablist">
         <li class="nav-item waves-effect waves-light"><a
            class="nav-link active" data-bs-toggle="tab" href="#homeTab2"
            role="tab" id = "homeTab"> 
            <img src="${pageContext.request.contextPath}/resources/images/appImg/pet1.png" style="width:60px;"><br>HOME
         </a></li>
         <li class="nav-item waves-effect waves-light"><a
            class="nav-link" data-bs-toggle="tab" href="#careTab2" role="tab" id = "careTab">
            <img src="${pageContext.request.contextPath}/resources/images/appImg/note.png" style="width:60px;"><br>데일리케어
         </a></li> 
         <li class="nav-item waves-effect waves-light"><a
            class="nav-link" data-bs-toggle="tab" href="#contentTab2" role="tab" id = "contentTab">
               <img src="${pageContext.request.contextPath}/resources/images/appImg/paw11.png" style="width:60px;"><br>컨텐츠
         </a></li>
         <li class="nav-item waves-effect waves-light menuName"><a
            class="nav-link" data-bs-toggle="tab" href="#reservationTab2" role="tab" id = "reservationTab">
               <img src="${pageContext.request.contextPath}/resources/images/appImg/clock.png" style="width:60px;"><br>
               예약
         </a></li>
      </ul>
   </div>
</div>

<script>
document.getElementById("careTab").addEventListener("click", (e)=>{
	document.getElementById("headerDiv").style.display="block";
})
document.getElementById("homeTab").addEventListener("click", (e)=>{
	document.getElementById("headerDiv").style.display="none";
})
document.getElementById("contentTab").addEventListener("click", (e)=>{
	document.getElementById("headerDiv").style.display="none";
})
document.getElementById("reservationTab").addEventListener("click", (e)=>{
	document.getElementById("headerDiv").style.display="none";
})
</script>