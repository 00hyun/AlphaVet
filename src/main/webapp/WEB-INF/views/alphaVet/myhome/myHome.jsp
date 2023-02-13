<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib  uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authentication property="principal" var = "principal"/>

<style>
.alarmHover:hover{
	background-color: #f8f6ff; 
}

.changeBtn{
	zoom : 1.5;
}

.changeTitle{
	zoom : 1.5;
	text-align : center;
	padding : 7px 0;
}

#selectTo, #selectFrom{
	/* margin-top: 50px;
    margin-bottom: -30px; */
}

.dotted{
    border: none;
    border-top: 3px dotted #445990;
    color: #fff;
    background-color: #fff;
    height: 1px;
    width: 100%;
}

.myHome-content{
	margin-bottom: 0px;
}

/* 모달창 자동완성 없으면 안보임 */
.ui-autocomplete {
	z-index: 2147483647;
}

/*fullcalendar css*/
.fc .fc-button-primary:disabled {
    color: var(--fc-button-text-color, #fff);
    background-color: #8378f7;
    border-color: var(--fc-button-border-color, #8378f7);
}

.fc-button-primary:disabled {
    color: #fff;
    background-color: #9ba4fd;
    border-color: #9ba4fd;
}
.fc-button-primary:disabled {
    color: #fff;
    background-color: #9ba4fd;
    border-color: #2C3E50;
}

.fc .fc-button-primary {
    color: var(--fc-button-text-color, #fff);
    background-color: #aaafe7;
    border-color: #aaafe7;
}

#fc-dom-1 {
	font-size: 18px;
}


.fc-theme-standard td, .fc-theme-standard th {
    border: 0.5px solid #f4f7fd;
}

.fc-theme-standard .fc-scrollgrid {
    border: 2.1px solid #ededef;
/*     border: 1px solid #dde6f3; */
    border-radius: 0.7em;
    box-shadow: 7px 6px 15px -8px #dbddef;
}

a{
	color:#676899;
}

.fc .fc-button-primary:not(:disabled).fc-button-active {
    color: #fff;
    color: var(--fc-button-text-color, #fff);
    background-color: var(--fc-button-active-bg-color, #8378f7);
    border-color: var(--fc-button-active-border-color, #8378f7);
}

.fc .fc-button-primary:hover {
    color: #fff;
    color: var(--fc-button-text-color, #fff);
    background-color: #8378f7;
    border-color: var(--fc-button-hover-border-color, #8378f7);
}

.fc .fc-button-primary:not(:disabled):active:focus, .fc .fc-button-primary:not(:disabled).fc-button-active:focus {
    box-shadow: 0 0 0 0.2rem rgb(153 146 219 / 50%);
}

.fc .fc-button-primary:not(:disabled):active, .fc .fc-button-primary:not(:disabled).fc-button-active {
    color: #fff;
    color: var(--fc-button-text-color, #fff);
    background-color: #8378f7;
    border-color: var(--fc-button-active-border-color, #8378f7);
}

/* 오늘 날짜 배경색 */
.fc-day-today {
    background: #f8fafd !important;
/*     border: none !important; */
  
} 

/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: #d35f94;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: #4790eb;
  text-decoration: none;
}

/* 오늘 선*/
.fc .fc-timegrid-now-indicator-line {
    position: absolute;
    z-index: 4;
    left: 0;
    right: 0;
    border-style: solid;
    border-color: #9991f1;
    border-width: 1px 0 0;
}

.fc .fc-timegrid-now-indicator-arrow {
    position: absolute;
    z-index: 4;
    margin-top: -5px;
    border-style: solid;
    border-color: #9991f1;
}

.fc-event, .fc-event-dot {
    background-color: #c5c9ef;
}
.fc-event {
    position: relative;
    display: block;
    font-size: .75em;
    line-height: 1.4;
    border-radius: 3px;
/*     border: 1px solid #c5c9ef; */
     border: none; 
}

element.style {
    border-color: #b7bce9;
    background-color: #b7bce9;
}

#calendar .fc-daygrid-event-dot {
  display: none;
}

/* 스크롤 */
.chat-out{
    border-radius: 30px;
    background-color: rgba(0, 140, 255, 0.767) !important;
    border-color:  rgba(0, 140, 255, 0.767) !important;
    padding-right: 120px;
    color: white;
}
  
  
#alarmDiv::-webkit-scrollbar {
   width: 8px;  /* 스크롤바의 너비 */
}

#alarmDiv::-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
    background: #DCDCDC	; /* 스크롤바의 색상 */
    
    border-radius: 10px;
}

#memoList::-webkit-scrollbar {
   width: 8px;  /* 스크롤바의 너비 */
}

#memoList::-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
    background: #DCDCDC	; /* 스크롤바의 색상 */
    
    border-radius: 10px;
}

#noticeBoardTable td{
	cursor:pointer;
}

#gyeongjosaBoardTable td{
	cursor:pointer;
}

#complainBoardTable td{
	cursor:pointer;
}

#academicBoardTable td{
	cursor:pointer;
}

#empInfoTable {
     width: 100%;
     border-collapse: seperate;
     border-spacing: 20px 30px;
}

.font-size{
	font-size: 1.2em;
}

.tabTitle{
	font-size: 1.25em;
	font-weight: 700;
}

.imgCard{
	padding-left: 20px;
	padding-right: 20px;
}

.empImgCard{
    width: 100%;
    border-radius: 10px;
}

#logImg2{
	width: 30px;
	margin-left: 45%;
	margin-top: 10px;
	margin-bottom: -10px;
}

.email-leftbar{
	font-size: 1.28em;
}

.boardFont{
	font-size: 1.28em;
}

#detail{
	font-size: 1.25em;
}

.memCon {
  position: relative;
  font-weight: bold;
  color: #black;
}
/* .memCon::after { */
/*   content: ''; */
/*   display: block; */
/*   width: 0; */
/*   height: 5px; */
/*   position: absolute; */
/*   left: 0; */
/*   bottom: 0px; */
/*   background: rgba(200, 125, 220, .6); */
/* } */
/* .memCon:hover{ */
/*   width: 100%; */
/*   transition: width .3s; */
/*   background: rgba(200, 125, 220, .6); */
  
/* } */


#memo {
  margin-bottom: 10px;
}
.memCon {
  position: relative;
  font-weight: bold;
  color: #445990;
}
.memCon::after {
  content: '';
  display: block;
  width: 0;
  height: 5px;
  position: absolute;
  left: 0;
  bottom: 0px;
  box-shadow: inset 0 -10px 0 #d4f6fb;
}
#memo:hover .memCon::after {
  width: 100%;
  transition: width .3s;
  
}

.changeForm {
	font-size: 1.2rem;
	resize: none;
}

.changeForm:focus {
	border : 2px solid #815efe;
	background-color: #f8f6ff; 
}


.changeForm2 {
	font-size: 1.2rem;
	resize: none;
}
.changeForm2:focus {
	border : 2px solid #ff9b2d;
	background-color: rgba(255,155,45,.18);
}
</style>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
	$(function() {
		//////////////////////////////마이페이지 홈
		var myHomeTab = document.querySelector("#myHomeTab");
		var myInfoDiv = document.querySelector("#myInfoDiv");
		var homeStr = "";
		
		var noticeCnt = 0;
		var gyeongjosaCnt = 0;
		var complainCnt = 0;
		
		myInfo();
		newBoard();
		alarmList();
		
		$(myHomeTab).on("click", function() {
			noticeCnt = 0
			gyeongjosaCnt = 0
			complainCnt = 0
			
			myInfo();
			newBoard();
			alarmList();
		})

		function myInfo() {
			$.ajax({
				url : "/myInfo",
				type : "post",
				data : {
					empId : `${principal.username }` 
				},
				success : function(empVO) {
					console.log(empVO)
					homeStr = "<div class = 'card' align='center'>";
					homeStr += '	<div class = "card-body" align="center"><img id="logImg2" src="${pageContext.request.contextPath }/resources/images/appImg/logoFix.png" style = "margin-left: 0%"></div>'
					homeStr += "	<div class = 'card-body imgCard'>";
					homeStr += '		<img class = "card-img-top empImgCard" src="${pageContext.request.contextPath }'+ empVO.empProfile + '">'
					homeStr += "	</div>"
					homeStr += "		<hr style='margin-top:-10px;'><h5 style = 'text-align: center'><b>대덕인재 동물병원</b></h5><h4><span class = 'small card-title-desc' style = 'text-align: center'>" + empVO.empId +"</span></h4>"
					homeStr += "		<h4 style = 'text-align: center'><span>" + empVO.empName + "</span>&nbsp;&nbsp;" + empVO.empJob + "</h4>"
					homeStr += "		<hr>"
					homeStr += "		<table class='table table-sm' id ='empInfoTable'>"
					homeStr += "		<tr>"
					homeStr += "			<td><h6><b>진료과</b></h6></td>"
					homeStr += "			<td><h5><b>" + empVO.animalCd + "</b></h5></td>"
					homeStr += "		</tr>"
					homeStr += "		<tr>"
					homeStr += "			<td><h6><b>입사일</b></h6></td>"
					homeStr += "			<td><h5><b>" + empVO.empJoinDate + "</b></h5></td>"
					homeStr += "		</tr>"
					homeStr += "		<tr>"
					homeStr += "			<td><h6><b>연락처</b></h6></td>"
					homeStr += "			<td><h5><b>" + empVO.empTel + "</b></h5></td>"
					homeStr += "		</tr>"
					homeStr += "		</table>"
					homeStr +="</div>"

					$(myInfoDiv).html(homeStr)                                                                                                                                               
				}
			})
		}
		
		
		//캘린더
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			headerToolbar : { // 헤더에 표시할 툴 바
				//left : 'prev today next',
				//center : 'title',
				//right : 'dayGridMonth,timeGridWeek,timeGridDay'
				left : 'title',
				right : 'today prev next'
			},
			//			titleFormat : function(date) {
			//				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			//			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					url : "/calendar",
					type : "POST",
					contentType : "application/json",
					dataType : "JSON",
					data : `${principal.username }`,
					traditional : true,
					async : false, //동기
					success : function(data) {
						console.log(data)

						var events = [];

						$.each(data, function(i, v) {
							events.push({
								title : v.schTitle,
								memo : v.schCont,
								start : v.schStartDate,
								end : v.schEndDate,
								allDay : v.schAllDay,
								groupId : v.schNm
							});
						})

						console.log(events)

						successCallback(events);
					},
					error : function(request, status, error) {
						alert("code = " + request.status + " message = "
								+ request.responseText + " error = " + error); // 실패 시 처리
						console.log("code = " + request.status + " message = "
								+ request.responseText + " error = " + error);
					}
				});
			},
			eventDidMount : function(info) {

				console.log(info.event.extendedProps)

				tippy(info.el, {
					content : info.event.extendedProps.memo
				});
			},
			eventMouseEnter : function(info) {

			},
			eventMouseLeave : function() {
				//				alert("메모 닫음")
			},
			eventDrop : function(info) {
				if (confirm("일정을 변경하시겠습니까?")) {

					//초기값 세팅
					var schNm = info.event._def.groupId;
					var schTitle = info.event._def.title;
					var schCont = info.event._def.extendedProps.memo;
					var schStartDate;
					var schEndDate;

					var date = new Date(info.event._instance.range.start);
					schStartDate = date.getFullYear() + "-"
							+ (date.getMonth() + 1) + "-" + date.getDate();
					date = new Date(info.event._instance.range.end);
					schEndDate = date.getFullYear() + "-"
							+ (date.getMonth() + 1) + "-" + date.getDate();

					var jsonObject = {
						schNm : schNm,
						schTitle : schTitle,
						schCont : schCont,
						schStartDate : schStartDate,
						schEndDate : schEndDate
					}

					$.ajax({
						url : "/update",
						data : JSON.stringify(jsonObject),
						type : "post",
						contentType : "application/json; charset=utf-8",
						success : function(res) {
							console.log("변경 완료")
						},
						dataType : "json"
					})

				};
			},
			eventClick : function(arg) {
				console.log(arg)
				var schNm = arg.event._def.groupId;

				if (confirm("일정을 삭제 하시겠습니까?")) {
					$.ajax({
						url : "/delete",
						data : {
							"schNm" : schNm
						},
						type : "post",
						success : function(res) {
							alert(res)
						}
					});
					arg.event.remove();
				}

			},
			eventRemove : function(info) {
				//				console.log("일정을 삭제했습니다.")
			},
			select : function(info) {

				$("#exampleModal").modal('show')

				var arg = info;

				// 날짜들
				var startDay = document.querySelector("#schStartDate");
				var endDay = document.querySelector("#schEndDate");
				var startTime = document.querySelector("#startTime");
				var endTime2 = document.querySelector("#endTime");
				
				// 날짜 계산 
				var schStartDate = info.startStr; // 처음날짜 캘린더제공하는
				console.log("내가 처음에 선택한 날짜 : " + info.startStr);
				console.log("마지막에 선택한 날짜 : " + info.endStr);

				startDay.value = schStartDate;

				var date = new Date(info.endStr);
				date.setDate(date.getDate() - 1);
				var month = ((date.getMonth() + 1) < 10) ? "0"
						+ (date.getMonth() + 1) : (date.getMonth() + 1);
				var day = (date.getDate() < 10) ? "0" + date.getDate() : date
						.getDate();
				var schEndDate = date.getFullYear() + "-" + month + "-" + day;
				endDay.value = schEndDate;

 				insertBtn.onclick = function(event, arg) {
 					event.preventDefault();
 					var schTitle = document.querySelector("#schTitle").value;
 					var schCont = document.querySelector("#schCont").value;
 					var allDayCheck = document.querySelector("#allDay");

 					console.log("allDay : " + allDayCheck.checked)

 					if (allDayCheck.checked == true) {
 						startTime.value = "";
 						endTime2.value = "";
 					}

 					var jsonObject = {
 						schTitle : schTitle,
 						schCont : schCont,
 						schStartDate : schStartDate + " " + startTime.value,
 						schEndDate : schEndDate + " " + endTime2.value,
 						schAllDay : allDayCheck.checked,
 						empId : `${principal.username }`
 					}

					console.log("끝 :: " + schEndDate)

 					$.ajax({
 						url : "/insert.do",
 						data : JSON.stringify(jsonObject),
 						type : "post",
 						contentType : "application/json; charset=utf-8",
 						success : function(res) {
 							console.log("일정등록완료")
 						},
 						dataType : "json"
 					})

 					console.log(schStartDate + " " + startTime.value)
 					if (allDayCheck.checked) {
						
 						calendar.addEvent({
 							title : schTitle,
 							start : schStartDate,
 							end : schEndDate,
 							memo : schCont,
 							allDay : allDayCheck.checked
 						})
					} else {
 						calendar.addEvent({
 							title : schTitle,
 							start : schStartDate + " " + startTime.value,
 							end : schEndDate + " " + endTime2.value,
 							memo : schCont,
 							allDay : false
 						})

 					}

 					$('.modal').on('hidden.bs.modal', function(e) {
 						$(this).find('form')[0].reset();
 					});

					$("#exampleModal").modal('hide')
 				}

				calendar.unselect();
				
			},
			nowIndicator : true, // 현재 시간 마크
			locale : 'ko' // 한국어 설정
		});
		
		
		calendar.render();
		
		//최근 게시판
		var newBoardDiv = document.querySelector("#newBoardDiv")
		var newNoticeBoardStr = "";
		var newGyeongjosaBoardStr = "";
		var newComplainBoardStr = "";
		
		$(newBoardDiv).on("click", function(){
			$("#boardTab").trigger('click');
		})
		
		function newBoard(){
			$.ajax({
				url : "/newBoardList",
				type : "post",
				success : function(newBoardList){
					console.log(newBoardList)
					newNoticeBoardStr = "";
					newGyeongjosaBoardStr = "";
					newComplainBoardStr = "";
					
					for(let i=0; i<newBoardList.length; i++){
						if(newBoardList[i].cateCd == '1'){
							noticeCnt++;
							
							if(noticeCnt <= 3){
								newNoticeBoardStr += '<h5 class="text-truncate font-size-14 mb-1">'+ newBoardList[i].boTitle +'</h5>';
								newNoticeBoardStr += '<h6 class="card-title-desc">' + newBoardList[i].boWriter +  '|' + newBoardList[i].boDate + '</h6>';															
							}else{
								newNoticeBoardStr += ""
							}
							
						}else if(newBoardList[i].cateCd == '2'){
							
							gyeongjosaCnt++;
							
							if(gyeongjosaCnt <= 3){
								newGyeongjosaBoardStr += '<h5 class="text-truncate font-size-14 mb-1">'+ newBoardList[i].boTitle +'</h5>';
								newGyeongjosaBoardStr += '<h6 class="card-title-desc">' + newBoardList[i].boWriter +  '|' + newBoardList[i].boDate + '</h6>';	
							}else{
								newGyeongjosaBoardStr += ""
							}
							
						}else if(newBoardList[i].cateCd == '3'){
							
							complainCnt++;
							
							if(complainCnt <= 3){
								newComplainBoardStr += '<h5 class="text-truncate font-size-14 mb-1">'+ newBoardList[i].boTitle +'</h5>';
								newComplainBoardStr += '<h6 class="card-title-desc">' + newBoardList[i].boWriter +  '|' + newBoardList[i].boDate + '</h6>';								
							}else{
								newComplainBoardStr += ""
							}
						}else{
							newComplainBoardStr += ""
						}
					}
					
					$("#newNotice").html(newNoticeBoardStr);
					$("#newGyeongjosa").html(newGyeongjosaBoardStr);
					$("#newComplain").html(newComplainBoardStr);
				}
				
			})
		}
		
		var memoInsertForm = document.querySelector("#memoInsertForm")
		var memoStr = "";
		
		
		getMemoList();
		
		//직원메모
		$("#memoInsertBtn").on("click", function(){
			//$("#memoList").css("display", "none");
			$("#memoInsertForm").css("display", "")
		})
		
		$("#memoInsertFormBtn").on("click", function(){
			let formData = new FormData(memoInsertForm);
			formData.append("empId", `${principal.username }`);
			
			$.ajax({
				url : "/memoInsert",
				type : "post",
				data : formData,
				contentType : false,
				processData : false,
				async : false,
				success : function(){
					getMemoList();
				}
			})
		})
 		
		$("#memoDeleteBtnOn").on('click', function(){
			$(".memoDeleteBtn").css("display", "");
		})
		
		 $(document).on('click', '.memoDeleteBtn', function(){ 
			memoDelete($(this).parent("#memo").children("#memoNm").text())
		})

		var check = "";
		
		$(document).on('click', '.memoStarBtn', function(){ 
			if($(this).attr('class') == 'mdi mdi-star memoStarBtn text-warning'){
				console.log($(this).attr('class'))
				$(this).attr('class', 'mdi mdi-star-outline memoStarBtn')
				check = 'N';
				memoCheckUpdate($(this).parent("#memo").children("#memoNm").text(), check)
			}else{
				console.log($(this).attr('class'))
				$(this).attr('class', 'mdi mdi-star memoStarBtn text-warning')
				check = 'Y';
				memoCheckUpdate($(this).parent("#memo").children("#memoNm").text(), check)
			}
		})
		
		
		function memoCheckUpdate(checkMemoNm, check){
			$.ajax({
				url : "/memoCheckUpdate",
				type : "post",
				data : { empMemoNm : checkMemoNm, empMemoCheck : check },
				success : function(){
					getMemoList();
				}
			})
		}
		
		
		function memoDelete(delMemoNm){
			$.ajax({
				url : "/memoDelete",
				type : "post",
				data : { empMemoNm : delMemoNm },
				success : function(){
					getMemoList();
				}
			})
		}
		
		
		function getMemoList(){
			$.ajax({
				url : "/memoList",
				type : "post",
				data : {empId : `${principal.username }`},
				success : function(empMemoList){
					console.log("memoList", empMemoList)
					$("#memoInsertForm").css("display", "none");
					$("#memoList").css("display", "");
					memoStr = "";
					
					$.each(empMemoList, function(i, v){
						memoStr += "<div>";
						memoStr += "	<div id = 'memo'>";
						memoStr += "		<p id = 'memoNm' style = 'display:none'>"+ v.empMemoNm +"</p>";
						memoStr += "		<i class='mdi mdi-close memoDeleteBtn' style = 'display:none'></i>";
						
						if(v.empMemoCheck == 'N'){
							memoStr += "		<i class='mdi mdi-star-outline memoStarBtn'></i>";							
						}else{
							memoStr += "		<i class='mdi mdi-star memoStarBtn text-warning'></i>";														
						}
						
						memoStr += "		<label class='form-check-label' for='formCheck2'>";
						memoStr += "			<p class='memCon'><b>"+ v.empMemoCon +"</b></p>";
						memoStr += "		</label>";
						memoStr += "		<p style='text-align: right; font-size: 0.8em;'>"+ v.empMemoDate +"</p>";
						memoStr += "	</div>";
						memoStr += "</div>";
					});
					
					$("#memoList").html(memoStr);
					$("#empMemoCon").val("")
				}
			})
		}
		
		
		//알람
		var alarmDiv = document.querySelector("#alarmDiv");
		var alarmStr = "";
		
		function alarmList(){
			$.ajax({
				url : "/myhome/alarmList",
				type : "post",
				data : {empId : `${principal.username }`},
				success : function(alarmList){
					alarmStr = "";
					console.log("alarmList", alarmList);
					$.each(alarmList, function(i, v){
						alarmStr += "<p class = 'alarmHover'><b>" + v.alarmType + v.alarmCont + "</b>\u00A0\u00A0\u00A0"+ v.alarmDate.substring(0, 10) +"</p>"
						//alarmStr += "<p>" + v.alarmDate.substring(0, 10) + "</p>"						
					})
					
					$(alarmDiv).html(alarmStr)
				}
			})
		}
		
		
		////////////////////////////////////////공지사항 게시판
		var createForm1 = document.querySelector("#createForm1");
		var createForm2 = document.querySelector("#createForm2");
		var createForm3 = document.querySelector("#createForm3");
		var createForm4 = document.querySelector("#createForm4");

		var boardTab = document.querySelector("#boardTab");
		var noticeTab = document.querySelector("#v-pills-home-tab")
		var noticeBoardContainer = document.querySelector("#noticeBoardContainer");
		var noticeBoardTable = document.querySelector("#noticeBoardTable");
		var noticeInsertBtn = document.querySelector("#noticeInsertBtn");
		var noticeTitle = document.querySelectorAll(".noticeTitle");
		var noticeStr = "";

		//메인탭에 게시판
		$("#boardTab").on("click", function() {
			$(createForm1).css("display", "none");
			$(createForm2).css("display", "none");
			$(createForm3).css("display", "none");
			$(createForm4).css("display", "none");
			
			$("#noticeBoardContainer *").remove()
			$("#gyeongjosaBoardContainer *").remove()
			$("#complainBoardContainer *").remove();
			$("#academicBoardContainer *").remove();
			
			//getAcademicList();
			getComplainList();
			getGyeongjosaList();
			getNoticeList();
			
			if(`${principal.username }` != 'e001'){
				$(noticeInsertBtn).css("visibility", "hidden")
			}
			
		})

		$(noticeTab).on("click", function() {
			$(createForm1).css("display", "none");
			$(createForm2).css("display", "none");
			$(createForm3).css("display", "none");
			$(createForm4).css("display", "none");
			$("#noticeBoardContainer *").remove()
			getNoticeList();
		})
		
		//게시판 입력form
		$(document).on('click', '#noticeInsertBtn', function() {
			if(`${principal.username }` == 'e001'){
				$("#noticeNoneTable").css("display", "none")
				$(createForm1).css("display", "")				
			}else{
				alert("관리자만 작성 가능")
			}
		})
		
		function formReset(){
			$('#createForm1').each(function() {
				this.reset();
	  		});
			$('#createForm2').each(function() {
				this.reset();
	  		});
			$('#createForm3').each(function() {
				this.reset();
	  		});
			$('#createForm4').each(function() {
				this.reset();
	  		});
		}
		
		//게시판 insert
		$("#noticeFormBtn").on("click",function() {
			let formData = new FormData();
			formData.append("boTitle", $("#noticeFormTitle").val());
			formData.append("boCon", tinymce.get("elm1").getContent());
			formData.append("cateCd", 1);
			formData.append("empId", `${principal.username }`);

			$.ajax({
				url : "/insertBoard",
				data : formData,
				type : "post",
				contentType : false,
				processData : false,
				async : false,
				success : function(res) {
					$(createForm1).css("display","none");
					formReset();
					
					Swal.fire({
		               title: "게시글 작성완료",
		               text: "",
		               icon: "success",
	                   showCancelButton: true,
	                   confirmButtonColor: '#3085d6',
	                   cancelButtonColor: '#d33',
	                   confirmButtonText: '확인',
	                   reverseButtons: true
		            })
		               
	             	//디테일 화면
					noticeStr = "";
					noticeStr += "<div id = 'detail'>"
					//noticeStr += "<input type = 'button' value = '수정' id = 'updateBtn'></input>";
					noticeStr += "	<br>";	
					noticeStr += `	<p><strong> \${res.boTitle}</strong></p>`;
					noticeStr += "	<div class = 'row col-md-12'>";	
					noticeStr += `		<p class = 'col-md-10'>\${res.boDate} | 대덕인재동물병원</p>`;
					noticeStr += `		<div class = 'col-md-2' id = 'detail2'>`;
					noticeStr += "			<p id = 'boNm' style = 'display:none'>" + res.boNm + "</p>";
					//noticeStr += `			<i class='mdi mdi-format-align-justify' id = 'listBtn' style='cursor:pointer'>목록</i>`;
					noticeStr += `			<button type="button" id = 'listBtn' class="btn btn-light waves-effect">목록</button>`;
					noticeStr += `			<button type="button" id = 'noticeDeleteBtn' class="btn btn-light waves-effect">삭제</button>`;
					//noticeStr += `			<i class='mdi mdi-trash-can-outline' id = 'noticeDeleteBtn' style='cursor:pointer'>삭제</i>`;
					noticeStr += `		</div>`;
					noticeStr += "	</div>";	
					noticeStr += "	<hr>";
					noticeStr += "	<p>" + res.boCon + "</p>";
					noticeStr += "<div>"
						
					$(noticeBoardContainer).html(noticeStr);
				}
			})
		})
	
		//제목선택 후 디테일
		$(document).on('click', '#noticeBoardTable td', function() {
			$.ajax({
				url : "/selectBoard",
				data : {
					boNm : $(this).prev().text(),
					cateCd : $(this).prev().attr("id")
				},
				type : "post",
				dataType : "json",
				success : function(res) {
					$("#noticeNoneTable").css("display", "none")

					noticeStr = "";
					noticeStr += "<div id = 'detail'>"
					//noticeStr += "<input type = 'button' value = '수정' id = 'updateBtn'></input>";
					noticeStr += "	<br>";	
					noticeStr += `	<p><strong> \${res.boTitle}</strong></p>`;
					noticeStr += "	<div class = 'row col-md-12'>";	
					noticeStr += `		<p class = 'col-md-10'>\${res.boDate} | 대덕인재동물병원</p>`;
					noticeStr += `		<div class = 'col-md-2' id = 'detail2'>`;
					noticeStr += "			<p id = 'boNm' style = 'display:none'>" + res.boNm + "</p>";
					noticeStr += `			<button type="button" id = 'listBtn' class="btn btn-light waves-effect">목록</button>`;
					noticeStr += `			<button type="button" id = 'noticeDeleteBtn' class="btn btn-light waves-effect">삭제</button>`;
					noticeStr += `		</div>`;
					noticeStr += "	</div>";	
					noticeStr += "	<hr>";
					noticeStr += "	<p>" + res.boCon + "</p>";
					noticeStr += "<div>"

					$(noticeBoardContainer).html(noticeStr);
					
					if(`${principal.username }` != 'e001'){
						$(updateBtn).css("visibility", "hidden");
						$(deleteBtn).css("visibility", "hidden");
					}
				}
			})
		})
		
		//삭제 버튼
		$(document).on('click', '#noticeDeleteBtn', function() {
			var delBoNm = $(this).parent("#detail2").children("#boNm").text()
			
			noticeBoardDelete(delBoNm);
		})
	
		//리스트 버튼
		$(document).on('click', '#listBtn', function() {
			$("#noticeBoardContainer *").remove()
			$("#noticeNoneTable").css("display", "")
			getNoticeList();
		})
		
		////////////////////////////////////////공지사항 게시판 End

		////////////////////////////////////////경조사 게시판 시작
		var gyeongjosaTab = document.querySelector("#v-pills-profile-tab")
		var gyeongjosaBoardContainer = document.querySelector("#gyeongjosaBoardContainer");
		var gyeongjosaInsertBtn = document.querySelector("#gyeongjosaInsertBtn");
		var gyeongjosaBoardTable = document.querySelector("#gyeongjosaBoardTable");
		var gyeongjosaTitle = document.querySelectorAll(".gyeongjosaTitle");
		var gyeongjosaStr = "";

		$(gyeongjosaTab).on("click", function() {
			$(createForm1).css("display", "none");
			$(createForm2).css("display", "none");
			$(createForm3).css("display", "none");
			$(createForm4).css("display", "none");
			$("#gyeongjosaBoardContainer *").remove()
			getGyeongjosaList();
		})

		//게시판 입력form
		$(document).on('click', '#gyeongjosaInsertBtn', function() {
			$(createForm2).css("display", "")
			$("#gyeongjosaNoneTable").css("display", "none")
		})
		
		var boNm1 = "";
		
		//게시판 insert
		$("#gyeongjosaFormBtn").on("click",function() {
			let formData = new FormData();
			formData.append("boTitle",$("#gyeongjosaFormTitle").val());
			formData.append("boCon", tinymce.get("elm2").getContent());
			formData.append("cateCd", 2);
			formData.append("empId", `${principal.username }`);
			
			$.ajax({
				url : "/insertBoard",
				data : formData,
				type : "post",
				contentType : false,
				processData : false,
				async : false,
				success : function(res) {
					$(createForm2).css("display","none");
					formReset();
					$("#gyeongjosaBoardContainer *").remove();
					
					Swal.fire({
		               title: "게시글 작성완료",
		               text: "",
		               icon: "success",
	                   showCancelButton: true,
	                   confirmButtonColor: '#3085d6',
	                   cancelButtonColor: '#d33',
	                   confirmButtonText: '확인',
	                   reverseButtons: true
			        })
					
					
					gyeongjosaStr = "";
					gyeongjosaStr += "<div id = 'detail'>"
					gyeongjosaStr += `	<p><strong> \${res.boTitle}</strong></p>`;
					gyeongjosaStr += "	<div class = 'row col-md-12'>"
					gyeongjosaStr += `		<p class = 'col-md-10'>\${res.boDate} | \${res.boWriter}</p>`;
					gyeongjosaStr += "		<div class = 'col-md-2'>";
					gyeongjosaStr += `			<button type="button" id = 'listBtn' class="btn btn-light waves-effect">목록</button>`;
					gyeongjosaStr += `			<button type="button" id = 'gyeongjosaDeleteBtn' class="btn btn-light waves-effect">삭제</button>`;
					gyeongjosaStr += "		</div>";
					gyeongjosaStr += "	</div>"
					
					gyeongjosaStr += `	<hr>`

					gyeongjosaStr += `	<div class= 'row col-md-12'>`
					gyeongjosaStr += "		<div class= 'col-md-8'>"
					gyeongjosaStr += "			<p id = 'boNm' style = 'display:none'>" + res.boNm + "</p>";
					gyeongjosaStr += "			<p>" + res.boCon + "</p>";
					gyeongjosaStr += "		</div>"
					gyeongjosaStr += `		<div class = 'col-md-4'>`
					gyeongjosaStr += `			<div>                                                                                                    `;
			        gyeongjosaStr += `    			<div class="row" id = "detail3">                                                                                                                   `;
			        gyeongjosaStr += `        			<div class="col">                                                                                                               `;
			        gyeongjosaStr += `            			<div class="position-relative">                                                                                             `;
			        gyeongjosaStr += `                			<input id = "comment" type="text" class="form-control chat-input" placeholder="댓글을 입력해주세요">                       `;
			        gyeongjosaStr += `            			</div>                                                                                                                      `;
			        gyeongjosaStr += `        			</div>                                                                                                                          `;
			        gyeongjosaStr += `        			<div class="col-auto" id = "detail2">                                                                                                          `;
			        gyeongjosaStr += "						<p id = 'boNm2' style = 'display:none'>" + res.boNm + "</p>";
			        gyeongjosaStr += `            			<button type="submit" id = "commentInsertBtn" class="btn btn-primary btn-rounded chat-send w-md waves-effect waves-light">  `;
			        gyeongjosaStr += `                			<span class="d-none d-sm-inline-block me-2">댓글 작성</span>                                                                 `;
			        gyeongjosaStr += `            			</button>                                                                                                                   `;
			        gyeongjosaStr += `        			</div>                                                                                                                          `;
			        gyeongjosaStr += `    			</div>                                                                                                                              `;
		        	gyeongjosaStr += `			</div>`;
		        	gyeongjosaStr += `			<br>`;
		            gyeongjosaStr += `			<div id = "commentBox">`
				    gyeongjosaStr += `			</div>`
				    gyeongjosaStr += `		</div>`
				    gyeongjosaStr += `	</div>`
					gyeongjosaStr += "</div>"
					
					boNm1 = res.boNm
					
					$(gyeongjosaBoardContainer).html(gyeongjosaStr);
					replyList(boNm1)
				}
			})

		})
		
		
		//제목선택 후 디테일
		$(document).on('click', '#gyeongjosaBoardTable td', function() {
			boNm1 = $(this).prev().text()
			
			$.ajax({
				url : "/selectBoard",
				data : {
					boNm : $(this).prev().text(),
					cateCd : $(this).prev().attr("id")
				},
				type : "post",
				dataType : "json",
				success : function(res) {
					$("#gyeongjosaNoneTable").css("display", "none")
					$("#gyeongjosaBoardContainer *").remove()
					
					gyeongjosaStr = "";
					gyeongjosaStr += "<div id = 'detail'>"
					gyeongjosaStr += `	<p><strong> \${res.boTitle}</strong></p>`;
					gyeongjosaStr += "	<div class = 'row col-md-12'>"
					gyeongjosaStr += `		<p class = 'col-md-10'>\${res.boDate} | \${res.boWriter}</p>`;
					gyeongjosaStr += "		<div class = 'col-md-2' id = 'detail4'>";
					gyeongjosaStr += "			<p id = 'boNm' style = 'display:none'>" + res.boNm + "</p>";
					gyeongjosaStr += `			<button type="button" id = 'listBtn' class="btn btn-light waves-effect">목록</button>`;
					gyeongjosaStr += `			<button type="button" id = 'gyeongjosaDeleteBtn' class="btn btn-light waves-effect">삭제</button>`;
					gyeongjosaStr += "		</div>";
					gyeongjosaStr += "	</div>"
					
					gyeongjosaStr += `	<hr>`

					gyeongjosaStr += `	<div class= 'row col-md-12'>`
					gyeongjosaStr += "		<div class= 'col-md-8'>"
					gyeongjosaStr += "			<p>" + res.boCon + "</p>";
					gyeongjosaStr += "		</div>"
					gyeongjosaStr += `		<div class = 'col-md-4'>`
					gyeongjosaStr += `			<div>                                                                                                    `;
			        gyeongjosaStr += `    			<div class="row" id = "detail3">                                                                                                                   `;
			        gyeongjosaStr += `        			<div class="col">                                                                                                               `;
			        gyeongjosaStr += `            			<div class="position-relative">                                                                                             `;
			        gyeongjosaStr += `                			<input id = "comment" type="text" class="form-control chat-input" placeholder="댓글을 입력해주세요">                       `;
			        gyeongjosaStr += `            			</div>                                                                                                                      `;
			        gyeongjosaStr += `        			</div>                                                                                                                          `;
			        gyeongjosaStr += `        			<div class="col-auto" id = "detail2">                                                                                                          `;
			        gyeongjosaStr += "						<p id = 'boNm2' style = 'display:none'>" + res.boNm + "</p>";
			        gyeongjosaStr += `            			<button type="submit" id = "commentInsertBtn" class="btn btn-primary btn-rounded chat-send w-md waves-effect waves-light">  `;
			        gyeongjosaStr += `                			<span class="d-none d-sm-inline-block me-2">댓글 작성</span>                                                                 `;
			        gyeongjosaStr += `            			</button>                                                                                                                   `;
			        gyeongjosaStr += `        			</div>                                                                                                                          `;
			        gyeongjosaStr += `    			</div>                                                                                                                              `;
		        	gyeongjosaStr += `			</div>`;
		        	gyeongjosaStr += `			<br>`;
		            gyeongjosaStr += `			<div id = "commentBox">`
				    gyeongjosaStr += `			</div>`
				    gyeongjosaStr += `		</div>`
				    gyeongjosaStr += `	</div>`
					gyeongjosaStr += "</div>"
					
					
					$(gyeongjosaBoardContainer).html(gyeongjosaStr);
					replyList(boNm1)
				}
			})
		})
		
		
		//리스트 버튼
		$(document).on('click','#listBtn',function() {
			$("#gyeongjosaBoardContainer *").remove()
			getGyeongjosaList();
		})
		
		//삭제 버튼
		$(document).on('click', '#gyeongjosaDeleteBtn', function() {
			var delBoNm = $(this).parent("#detail4").children("#boNm").text()
			console.log("경조사 삭제1 :: ", delBoNm)
			
			gyeongjosaBoardDelete(delBoNm);
			
		})
		
		//댓글 입력
		$(document).on('click', '#commentInsertBtn', function() {
			boNm1 = $(this).parents("#detail2").children("#boNm2").text()
			
			$.ajax({
				url : "/insertReply",
				type : "post",
				data : {
						boNm : $(this).parent("#detail2").children("#boNm2").text(),
						replyCon : $("#comment").val(),
						empId : `${principal.username }`
				},
				success : function(){
					$("#comment").val("")
					replyList(boNm1);
				}
           		
			})
		})
		
		//댓글리스트 출력
		function replyList(boNm1){
			$("#commentBox *").remove();
			
			$.ajax({
				url : "/replyList",
				type : "post",
				dataType : "json",
				data : { boNm : boNm1 },
				success : function(replyList){
					gyeongjosaStr = "";
					$.each(replyList, function(i, v){
						gyeongjosaStr += `	<div class="d-flex">`
						gyeongjosaStr += `		<div class="align-self-center me-3">`
	        			gyeongjosaStr += '			<img src="${pageContext.request.contextPath }' + v.empProfile + '" class="rounded-circle avatar-xs" alt="">'
	        			gyeongjosaStr += `		</div>`
						gyeongjosaStr += `		<div class="flex-grow-1 overflow-hidden">`
						gyeongjosaStr += '			<h5 class="text-truncate font-size-14 mb-1">' + v.empName + '&nbsp;&nbsp;' + v.empJob + '</h5>'                                                                                  
						gyeongjosaStr += '			<p class="text-truncate mb-0">' + v.replyCon + '</p>'                                                                                    
						gyeongjosaStr += `		</div>`
						gyeongjosaStr += `  </div>`
						gyeongjosaStr += `  <br>`
					});
		
					$("#commentBox").html(gyeongjosaStr)
				} 
			})
		} 
		
		
		
		////////////////////////////////////////경조사 게시판 End

		////////////////////////////////////////건의사항 게시판 시작
		var complainTab = document.querySelector("#v-pills-messages-tab")
		var complainBoardContainer = document.querySelector("#complainBoardContainer");
		var complainInsertBtn = document.querySelector("#complainInsertBtn");
		var complainBoardTable = document.querySelector("#complainBoardTable");
		var complainTitle = document.querySelectorAll(".complainTitle");

		$(complainTab).on("click", function() {
			$(createForm1).css("display", "none");
			$(createForm2).css("display", "none");
			$(createForm3).css("display", "none");
			$(createForm4).css("display", "none");
			$("#complainBoardContainer *").remove();
			
			getComplainList();
		})

		//게시판 입력form
		$(document).on('click', '#complainInsertBtn', function() {
			$("#complainNoneTable").css("display", "none")
			$(createForm3).css("display", "")
		})

		//게시판 insert
		$("#complainFormBtn").on("click",function() {
			let formData = new FormData();
			formData.append("boTitle", $("#complainFormTitle").val());
			formData.append("boCon", tinymce.get("elm3").getContent());
			formData.append("cateCd", 3);
			formData.append("empId", `${principal.username }`);

			$.ajax({
				url : "/insertBoard",
				data : formData,
				type : "post",
				contentType : false,
				processData : false,
				async : false,
				success : function(res) {
					$(createForm3).css("display","none");
					formReset();
					$("#complainBoardContainer *").remove();
					
					
					Swal.fire({
		               title: "게시글 작성완료",
		               text: "",
		               icon: "success",
	                   showCancelButton: true,
	                   confirmButtonColor: '#3085d6',
	                   cancelButtonColor: '#d33',
	                   confirmButtonText: '확인',
	                   reverseButtons: true
				    })
					
					
					complainStr = "";
					complainStr += "<div id = 'detail'>"
					//complainStr += "<input type = 'button' value = '수정' id = 'updateBtn'></input>";
					complainStr += "	<br>";	
					complainStr += `	<h4><strong> \${res.boTitle}</strong></h4>`;
					complainStr += "	<div class = 'row col-md-12'>";	
					complainStr += `		<p class = 'col-md-10'>\${res.boDate} | \${res.boWriter}</p>`;
					complainStr += `		<div class = 'col-md-2' id = 'detail2'>`;
					complainStr += "			<p id = 'boNm' style = 'display:none'>" + res.boNm + "</p>";
					complainStr += `			<button type="button" id = 'listBtn' class="btn btn-light waves-effect">목록</button>`;
					complainStr += `			<button type="button" id = 'complainDeleteBtn' class="btn btn-light waves-effect">삭제</button>`;
					complainStr += `		</div>`;
					complainStr += "	</div>";	
					complainStr += "	<hr>";
					complainStr += "	<p>" + res.boCon + "</p>";
					complainStr += "<div>"

					$(complainBoardContainer).html(complainStr);
				}
			})
		})
		
		//제목선택 후 디테일
		$(document).on('click', '#complainBoardTable td', function() {
			$.ajax({
				url : "/selectBoard",
				data : {
					boNm : $(this).prev().text(),
					cateCd : $(this).prev().attr("id")
				},
				type : "post",
				dataType : "json",
				success : function(res) {
					$("#complainBoardContainer *").remove()
					$("#complainNoneTable").css("display", "none")

					complainStr = "";
					complainStr += "<div id = 'detail'>"
					//complainStr += "<input type = 'button' value = '수정' id = 'updateBtn'></input>";
					complainStr += "	<br>";	
					complainStr += `	<h4><strong> \${res.boTitle}</strong></h4>`;
					complainStr += "	<div class = 'row col-md-12'>";	
					complainStr += `		<p class = 'col-md-10'>\${res.boDate} | \${res.boWriter}</p>`;
					complainStr += `		<div class = 'col-md-2' id = 'detail2'>`;
					complainStr += "			<p id = 'boNm' style = 'display:none'>" + res.boNm + "</p>";
					complainStr += `			<button type="button" id = 'listBtn' class="btn btn-light waves-effect">목록</button>`;
					complainStr += `			<button type="button" id = 'complainDeleteBtn' class="btn btn-light waves-effect">삭제</button>`;
					complainStr += `		</div>`;
					complainStr += "	</div>";	
					complainStr += "	<hr>";
					complainStr += "	<p>" + res.boCon + "</p>";
					complainStr += "</div>"
					complainStr += "<br><br><br><hr class = 'dotted'>"
					complainStr += "<div class = 'row col-md-12'>"
					complainStr += "<h4 class = 'col-md-6'><strong><i class='mdi mdi-comment-processing'></i>[답변]" + res.boTitle + "</strong>&nbsp;<span class = 'card-title-desc' style = 'font-size: 15px;'>2023-02-06 | 관리자</span></h4>"
					complainStr += "</div>"
					
					complainStr += "<p>안녕하세요</p>";
					complainStr += "<p>먼저 답변이 늦어져 죄송하다는 말씀을 드리며,</p>";
					complainStr += "<p>건의 주신 부분은 수정 완료 되었음을 알려드립니다.</p>";
						


					$(complainBoardContainer).html(complainStr);
				}
			})
		})
						
		//삭제 버튼
		$(document).on('click', '#complainDeleteBtn', function() {
			var delBoNm = $(this).parent("#detail2").children("#boNm").text()
			
			complainBoardDelete(delBoNm);
            
		})
		
		//리스트 버튼
		$(document).on('click','#listBtn',function() {
			$("#complainBoardContainer *").remove()
			getComplainList();
		})
		
		////////////////////////////////////////건의사항 게시판 End

		////////////////////////////////////////학술 게시판 시작
		var academicTab = document.querySelector("#v-pills-settings-tab")
		var academicBoardContainer = document.querySelector("#academicBoardContainer");
		var academicInsertBtn = document.querySelector("#academicInsertBtn");
		var academicBoardTable = document.querySelector("#academicBoardTable");
		var academicTitle = document.querySelectorAll(".academicTitle");

		$(academicTab).on("click", function() {
			$(createForm1).css("display", "none");
			$(createForm2).css("display", "none");
			$(createForm3).css("display", "none");
			$(createForm4).css("display", "none");
			$("#academicBoardContainer *").remove();
			/* getAcademicList(); */
		})
		
		$(document).on('keyup', '#changeOrigin', function(){
			selectTo = $("#selectTo option:selected").val();
			selectFrom = $("#selectFrom option:selected").val();
	    	console.log(selectTo, "->", selectFrom)
		    let changeData = this.value;
		    console.log(changeData)
		    
		    academicBoardPapago(selectTo, selectFrom, changeData);
		})
		
		$("#selectTo").on("change", function() {
			if($("#selectTo option:selected").val() == "en"){
				$("#selectFrom option[value=ko]").prop("selected", "selected")
			}else{
				$("#selectFrom option[value=en]").prop("selected", "selected")				
			}
		})
		////////////////////////////////////////학술 게시판 End

		////////////////////////////////////////이메일 시작
		var mailTab = document.querySelector("#mailTab");
		var mailInsertBtn = document.querySelector("#mailInsertBtn");

		var mailSendListBtn = document.querySelector("#mailSendListBtn");
		var mailAddressBtn = document.querySelector("#mailAddressBtn");
		
		//var mailContent = document.querySelector("#mailContent");
		var mailSendForm = document.querySelector("#mailSendForm");
		var mailSendList = document.querySelector("#mailSendList");
		var mailAddressDiv = document.querySelector("#mailAddressDiv");

		var mailFormAddress = document.querySelector("#mailFormAddress");

		var mailForm = document.querySelector("#mailForm");
		var mailFormBtn = document.querySelector("#mailFormBtn");
		
		var selectMailNm;
		var mailStr = "";
		
		var mailChecked = "";
		
		//메일 탭
		$(mailTab).on("click", function() {
			$(mailAddressDiv).css("display", "");
			$(mailSendForm).css("display", "none");
			$("#mailDetail").css("display", "none");
			$(mailSendList).css("display", "none");
			
			mailAddressList();
			/* mailList(); */
		})
		
		//보낸 메일함 버튼
		$(mailSendListBtn).on("click", function(){
			mailList();
			
			$(mailAddressDiv).css("display", "none");
			$("#mailDetail").css("display", "none");
			$(mailSendForm).css("display", "none");
			$(mailSendList).css("display", "");
			
			$(mailAddressBtn).attr("class", "");
			$(mailSendListBtn).attr("class", "active");
		})
		
		//보낸 메일 선택
		$(document).on('click', '.mailNms', function(){ 
			selectMailNm = $(this).attr("id");
			mailDetail(selectMailNm)
		})
		
		$("#mailDeleteBtn").on("click", function(){
			$('.mailListCheck').each(function (index) {
				if($(this).is(":checked")==true){
			    	mailChecked = $(this).attr("id")
			    }
			})
			
			console.log(mailChecked)
			
			mailDelete(mailChecked)
		})
		
		
		$("#mailFormPrivate").on("click", function(){
			$.ajax({
				url : "/privateAddressList",
				type : "post",
				data : {empId : `${principal.username }` },
				success : function(empList){
					console.log(empList)
					mailStr = ""
					$.each(empList, function(i, v){
						mailStr += "<div class='form-check mb-3 addressDiv2' style = 'cursor:pointer'>"
						mailStr += "<input class='form-check-input' type='checkbox' value = '"+ v.addrMail +"' id='formCheck1'>"
						mailStr += "<label class='form-check-label addressList' for='formCheck1'>"
						mailStr += v.addrName + "&lt;"+ v.addrMail + "&gt;"
						mailStr += "</label>"
						mailStr += "</div>"
					})
					
					$("#mailFormEmpList *").remove();
					$("#mailFormPrivateList").html(mailStr);
				}
			})
		})
		
		
		//메일 쓰기 버튼
		$(mailInsertBtn).on("click", function(){
			$(mailSendForm).css("display", "");
			$(mailSendList).css("display", "none");
			$(mailAddressDiv).css("display", "none");
			$("#mailDetail").css("display", "none");
			$("#mailFormPrivate").trigger('click');
		})
		
		//메일 폼 보내기 버튼
		$(mailFormBtn).on("click", function(){
			var file = document.querySelector("#mailFile")
			
			let formData = new FormData();
			formData.append("mailTitle", $("#mailTitle").val())
			formData.append("mailCon", tinymce.get("mailTa").getContent())
			formData.append("toMail", $("#tomail").val())
			formData.append("file", file.files[0])
			formData.append("empId", `${principal.username }`)
			
			setTimeout(() => 
				$.ajax({
	   				url : "/sendMail",
	   				type : "post",
	   				contentType : false,
	   				processData : false,
	   				async : false,
	   				data : formData,
	   				dataType : "text",
	   				success : function(data){
	   					console.log(data)
	  				}
			    }), 50);
			
			Swal.fire({
		        title: "메일 전송",
		        text: "",
		        timer: 100,
		        onOpen: function() {
		            Swal.showLoading()
		        }
		    }).then(function(result) {
		    	if (result.dismiss === "timer") {
			    	Swal.fire({
		               title: "메일 전송 완료",
		               text: "",
		               icon: "success",
		               confirmButtonColor: '#3085d6',
		               confirmButtonText: '확인',
		               reverseButtons: true,
		               showLoaderOnConfirm: true
					})
					mailList(); 
		    	}
    		})
			
		})
		


		$("#mailFormEmp").on("click", function(){
			$.ajax({
				url : "/addressList",
				type : "post",
				success : function(empList){
					console.log(empList)
					mailStr = ""
					$.each(empList, function(i, v){
						mailStr += "<div class='form-check mb-3 addressDiv2' style = 'cursor:pointer'>"
						mailStr += "<input class='form-check-input' type='checkbox' value = '"+ v.empMail +"' id='formCheck2'>"
						mailStr += "<label class='form-check-label addressList' for='formCheck1'>"
						mailStr += v.empName + v.empJob + "&lt;"+ v.empMail + "&gt;"
						mailStr += "</label>"
						mailStr += "</div>"
					})
					
					$("#mailFormPrivateList *").remove();
					$("#mailFormEmpList").html(mailStr);
				}
			})
		})
		
		
		
		$("#mailFormOk").on("click", function(){
			$('.form-check-input').each(function (index) {
				if($(this).is(":checked")==true){
			    	mailChecked = $(this).val();
			    }
			})
			console.log(mailChecked)
			$("#tomail").val(mailChecked)
			
			$("#mailModalClose").trigger('click');
		})
		
		$(document).on('keyup', '#searchAddress', function(){
		   let addressDiv2 = document.querySelectorAll('.addressDiv2');
		   let searchData = this.value;
		   
		   for(let i = 0; i< $(addressDiv2).length; i++){
		      let addressData = $(addressDiv2).eq(i).children('.addressList').eq(0).text();
		      if(addressData.indexOf(searchData) != -1){
		    	  $(addressDiv2).eq(i).css("display", "")
		      }else{
		    	  $(addressDiv2).eq(i).css("display", "none")		    	  
		      }
		   }
		})
		
		
		//메일 주소록 버튼
		$(mailAddressBtn).on("click", function(){
			mailAddressList();
		})
		
		//개인 주소록 탭
		$("#privateAddressTab").on("click", function(){
			mailPrivateList();
		})
		
		//직원 주소록 탭
		$("#empAddressTab").on("click", function(){
			mailAddressList();
		})
		
		
		$("#addAddressBtn").on("click", function(){
			addAddress();
		})
		
		$("#addSetBtn").on("click", function(){
			addAddressSet();
		})
		
		$(document).on('click', '#addressEdit', function(){ 
			$(this).children("i").attr("class", "mdi mdi-content-save")
			$(this).attr("id", "addressSave")
			$(this).attr("title", "저장")
			
			var addrType = $(this).parents("tr").children("td").eq(0).text()
			console.log($(this).parents("tr").children("td").eq(0))
			console.log($(this).parents("tr").children("td").eq(0).text())
			var addrName = $(this).parents("tr").children("td").eq(1).text()
			var addradd1 = $(this).parents("tr").children("td").eq(2).text()
			var addradd2 = $(this).parents("tr").children("td").eq(3).text()
			var addrTel = $(this).parents("tr").children("td").eq(4).text()
			var addrMail = $(this).parents("tr").children("td").eq(5).text()
			
			mailStr = "";
			mailStr += "<input type = 'text' class = 'form-control' value = '"+ addrType +"' name = 'addrType'>";
			$(this).parents("tr").children("td").eq(0).html(mailStr)
			
			mailStr = "";
			mailStr += "<input type = 'text' class = 'form-control' value = '"+ addrName +"' name = 'addrName'>";
			$(this).parents("tr").children("td").eq(1).html(mailStr)
			
			mailStr = "";
			mailStr += "<input type = 'text' class = 'form-control' value = '"+ addradd1 +"' name = 'addradd1'>";
			$(this).parents("tr").children("td").eq(2).html(mailStr)
			
			mailStr = "";
			mailStr += "<input type = 'text' class = 'form-control' value = '"+ addradd2 +"' name = 'addradd2'>";
			$(this).parents("tr").children("td").eq(3).html(mailStr)
			
			mailStr = "";
			mailStr += "<input type = 'text' class = 'form-control' value = '"+ addrTel +"' name = 'addrTel'>";
			$(this).parents("tr").children("td").eq(4).html(mailStr)
			
			mailStr = "";
			mailStr += "<input type = 'text' class = 'form-control' value = '"+ addrMail +"' name = 'addrMail'>";
			$(this).parents("tr").children("td").eq(5).html(mailStr)
		})
		
		//수정후 저장버튼
		$(document).on('click', '#addressSave', function(){
			//var tr = $(this).parents("tr").children("td").eq(7).text();
			let formData = new FormData();
			formData.append("addrType", $(this).parents("tr").children("td").eq(0).children("input").val())
			formData.append("addrName", $(this).parents("tr").children("td").eq(1).children("input").val())
			formData.append("addrAdd1", $(this).parents("tr").children("td").eq(2).children("input").val())
			formData.append("addrAdd2", $(this).parents("tr").children("td").eq(3).children("input").val())
			formData.append("addrTel", $(this).parents("tr").children("td").eq(4).children("input").val())
			formData.append("addrMail", $(this).parents("tr").children("td").eq(5).children("input").val())
			formData.append("addrNm", $(this).parents("tr").children("td").eq(7).text())
			
			$.ajax({
				url : "/addrUpdate",
				type : "post",
				data : formData,
				contentType : false,
				processData : false,
				async : false,
				success : function(){
					mailPrivateList();
				}
				
			})
		})
		
		//삭제버튼
		$(document).on('click', '#addressDel', function(){
			var tr = $(this).parents("tr").children("td").eq(7).text();
			console.log(tr)
			
			//console.log(addrNm)
 			$.ajax({
				url : "/addrDelete",
				type : "post",
				data : {addrNm : tr},
				success : function(){
					mailPrivateList();
				}
			})
		})
		
		//insert
		$(document).on('click', '#addrSave2', function(){
			let formData = new FormData();
			formData.append("addrType", $(this).parents('tr').children('td').eq(0).children("input").val())
			formData.append("addrName", $(this).parents('tr').children('td').eq(1).children("input").val())
			formData.append("addrAdd1", $(this).parents('tr').children('td').eq(2).children("input").val())
			formData.append("addrAdd2", $(this).parents('tr').children('td').eq(3).children("input").val())
			formData.append("addrTel", $(this).parents('tr').children('td').eq(4).children("input").val())
			formData.append("addrMail", $(this).parents('tr').children('td').eq(5).children("input").val())
			formData.append("empId", `${principal.username }`)
			
			$.ajax({
				url : "/addrInsert",
				type : "post",
				data : formData,
				contentType : false,
				processData : false,
				async : false,
				success : function(){
					mailPrivateList();
				}
			})
		})
		
	})

//메일 삭제
function mailDelete(mailChecked){
	$.ajax({
		url : "/mailDelete",
		type : "post",
		data : {mailNm : mailChecked},
		success : function(){
			Swal.fire({
               title: "메일이 삭제되었습니다",
               text: "",
               icon: "success",
               confirmButtonColor: '#3085d6',
               confirmButtonText: '확인',
               reverseButtons: true,
               showLoaderOnConfirm: true
			})
			mailList();
		}
	})		
}
	
	
//메일 개인 주소록 리스트
function mailPrivateList(){
	var privateAddressTable = $("#privateAddressTable").DataTable();
	var editor;
	privateAddressTable.destroy();
		
	$.ajax({
		url : "/privateAddressList",
		type : "post",
		data : {empId : `${principal.username }` },
		success : function(empList){
			console.log("개인 : ", empList)
			$("#privateAddressTable").DataTable({
				lengthChange: false,
				autoWidth : false, //가로자동
				info: false,
				language:{
					search : "<a><i class='ri-search-line'></i></a>",
					paginate : {  first : "처음", last : "마지막",next : "다음", previous : "이전" }
				},
				table: "#privateAddressTable",
				data : empList,
				columns : [ 
					{ data : "addrType", "width" : "200px"},
					{ data : "addrName", "width" : "200px"},
					{ data : "addrAdd1", "width" : "200px"},
					{ data : "addrAdd2", "width" : "200px"},
					{ data : "addrTel", "width" : "200px"},
					{ data : "addrMail", "width" : "10px"},
					{
		                data: null,
		                orderable: false,
		                defaultContent: '<div class = "col-md-12 editBtn">'
		                				+ '<a class="btn btn-outline-secondary btn-sm edit col-md-6" id="addressEdit" title="수정">'
	                           			+ '<i class="fas fa-pencil-alt"></i>'+ '</a>'
	                           			+ '<a class="btn btn-outline-secondary btn-sm edit col-md-6" id="addressDel" title="삭제">'
	                           			+ '<i class="far far fa-trash-alt"></i>'+ '</a>' + '</div>'
		            },
					{ data : "addrNm", 'searchable' : false, "width" : "1px"}
				],
			})
			
			$("#privateAddressTable").children("thead").children("tr").eq(0).children("th").eq(6).attr("colspan", "2");
			$("#privateAddressTable").children("thead").children("tr").eq(0).children("th").eq(7).css("display", "none");
			
			for(let i=0; i<empList.length; i++){
				$("#privateAddressTable").children("tbody").children("tr").eq(i).children("td").eq(7).css("display", "none");				
			}
			
		}
	})
}
	
	
	
//메일 직원 주소록 리스트
function mailAddressList(){
	$(mailSendList).css("display", "none");
	$("#mailDetail").css("display", "none");
	$(mailSendForm).css("display", "none");
	$(mailAddressDiv).css("display", "");
	
	$(mailAddressBtn).attr("class", "active");
	$(mailSendListBtn).attr("class", "");
	
	
	var addressTable = $("#addressTable").DataTable();
	addressTable.destroy();
		
	$.ajax({
		url : "/addressList",
		type : "post",
		success : function(empList){
			$("#addressTable").DataTable({
				lengthChange: false,
				autoWidth : false, //가로자동
				info: false,
				language:{
					search : "<a><i class='ri-search-line'></i></a>",
					paginate : {  first : "처음", last : "마지막",next : "다음", previous : "이전" }
				},
				data : empList,
				columns : [ {
					data : "empId"
				}, {
					data : "empName"
				}, {
					data : "empJob"
				},  {
					data : "empTel"
				}, {
					data : "empMail"
				} ]
			})
		}
	})
	
}
	
	
//보낸 메일 목록 출력 함수
function mailList(){
	$(mailAddressDiv).css("display", "none");
	$("#mailDetail").css("display", "none");
	$(mailSendForm).css("display", "none");
	$(mailSendList).css("display", "");
	
	$.ajax({
		url : "/mailList",
		type : "post",
		data : {empId : `${principal.username }`},
		success : function(mailList) {
			console.log(mailList)
			mailStr = "";
			
			mailStr+= ` <ul class="message-list">`;
			$.each(mailList, function(i, v){                                                                 
				mailStr+='<li>';                                                                    
				mailStr+='		<div class="col-mail col-mail-1">                                                 ';
       			mailStr+='			<div class="checkbox-wrapper-mail">                                           ';
           		mailStr+='				<input class = "mailListCheck" type="checkbox" id = "'+ v.mailNm +'" vlaue = "'+ v.mailNm +'">                                         ';
           		mailStr+='				<label  for = "'+ v.mailNm +'" class="toggle"></label>                                 ';
       			mailStr+='			</div>                                                                        ';
       			mailStr+='			<a href="#" class="title mailNms" id = "'+ v.mailNm +'">                                                    ';
              	mailStr+='				<div class="d-flex">                                                      ';
                mailStr+='					<div class="flex-grow-1 mt-2">                                        ';
                mailStr+='    					<h4 class="mb-0">'+ v.empName + v.empJob +'</h4>                  ';
                mailStr+='    					<p class="text-muted email-date font-size-15 mb-0">'+ v.mailDate.substr(0, 10) +'</p>';
                mailStr+='					</div>                                                                ';
            	mailStr+='				</div>                                                                    ';
         		mailStr+='			</a>                                                                          ';
                mailStr+='                                                                                        ';
         		//mailStr+='			<span class="star-toggle far fa-star"></span>                                 ';
     			mailStr+='		</div>		                                                                      ';
                mailStr+='	<div class="col-mail col-mail-2 font-size" style = "cursor:pointer">                                                     ';
                mailStr+='    		<h4 class="mb-0"><b>'+ v.mailTitle +'</b></h4> ';
                mailStr+='    		<div class="text-muted email-desc font-size-18"><div style = "width : 400px; height: 50px;overflow: hidden;"><p>'+ v.mailCon +'</p><div>        ';
	            mailStr+='    	<div class="date">                                                                ';
	            mailStr+='        <a href="">                                                                     ';
	            mailStr+='            <i class="mdi mdi-link-variant me-2 font-size-18"></i> '+ v.mailDate.substr(11, 16) +'               ';
	            mailStr+='        </a>                                                                            ';
	            mailStr+='    	</div>                                                                            ';
            	mailStr+='	</div>                                                                                ';
				mailStr+='</li>';
			});
			mailStr+= `	</ul>`;
			 	
			$("#mailSendListDiv").html(mailStr);
		}
	})
}

//메일 디테일
function mailDetail(selectMailNm){
	$.ajax({
		url : "/mailDetail",
		type : "post",
		data : {mailNm : selectMailNm},
		dataType : "json",
		success : function(mailVO){
			console.log(mailVO)
			
			var mailDot = mailVO.mfName.lastIndexOf('.')
			var mailLen = mailVO.mfName.length
			var mailEtc = mailVO.mfName.substring(mailDot, mailLen).toLowerCase()
			
			$("#mailSendList").css("display", "none");
			$("#mailDetail").css("display", "");
			mailStr = "";
			
			mailStr += '<div class="card-body">                                                          ';
			mailStr += '	<div class="d-flex">                                                          ';
		    mailStr += '		<img class="d-flex me-3 rounded-circle avatar-xs"                             ';
		    mailStr += '            src="${pageContext.request.contextPath }'+ mailVO.empProfile +'" alt="Generic placeholder image">   ';
		    mailStr += '    	<div class="flex-grow-1 align-self-center">                                   ';
		    mailStr += '    		<h4 class="font-size-20 m-0"><b>'+ mailVO.empName + mailVO.empJob +'</b></h4>                      ';
		    mailStr += '        	<h5 class="text-muted">'+ mailVO.empMail +'</h5>                              ';
		    mailStr += '    	</div>                                                                        ';
		    mailStr += '	</div><hr>                                                                            ';
		    mailStr += '    <div class="flex-grow-1 align-self-center">                                   ';
		    mailStr += '    	<p class="text-muted">받는사람 <b>'+ mailVO.toMail +'</b></p>                      ';
		    mailStr += '    </div><hr>                                                                        ';
		    mailStr += '	<h4 class="mt-4 font-size-20">'+ mailVO.mailTitle +'</h4>                        ';
		    mailStr += '	<h5 font-size-18>' + mailVO.mailCon +'</h5>                                                          ';
		    mailStr += '</div>';

		    mailStr += '<hr>';                                                                              
	        mailStr += '                                                                                    ';
            mailStr += '<div class="card-body row">                                                                   ';
            mailStr += '    <div class="col-xl-2 col-md-4">                                                 ';
            mailStr += '        <div class="card">                                                          ';
            mailStr += '            <a href="" class="email-img-overlay">                                   ';
            
			console.log("확장자", mailVO.mfName.substring(mailDot, mailLen).toLowerCase())
			if(mailEtc == '.png' && mailEtc == '.jpg'){
	            mailStr += '                <img class="card-img img-fluid" src="${pageContext.request.contextPath }'+ mailVO.mfPath + '" ';
	            mailStr += '                    alt="Card image cap">                                           ';				
			}else if(mailEtc == '.xlsx'){
	            mailStr += '                <img class="card-img img-fluid" src="${pageContext.request.contextPath }/resources/images/free-icon-excel-4725976.png" alt="Card image cap" style = "width: 60px; height: 60px;">                                           ';								
			}else if(mailEtc == '.hwp'){
	            mailStr += '                <i class = "ri-file-excel-line" style = "width: 100px; height: 100px;"></i>                                           ';								
			}else{
	            mailStr += '                <i class = "ri-file-text-line" style = "width: 100px; height: 100px;"></i>                                           ';								
			} 
            
            mailStr += '            </a>'+ mailVO.mfName +'                                                                    ';
            mailStr += '        </div>                                                                      ';
            mailStr += '    </div>                                                                          ';
            mailStr += '</div>                                                                              ';
		    
		    
			$("#mailDetail").html(mailStr);
		}
	})
}

function addAddress() {
    var privateAddressTbody = document.getElementById('privateAddressTbody');
    var row = privateAddressTbody.insertRow(0); // 상단에 추가
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    var cell7 = row.insertCell(6);
  
    cell1.innerHTML = '<input class = "form-control" type = "text" id = "addrType" name = "addrType" style = "width:100px">';
    cell2.innerHTML = '<input class = "form-control" type = "text" id = "addrName" name = "addrName" style = "width:100px">';
    cell3.innerHTML = '<input class = "form-control" type = "text" id = "addrAdd1" name = "addrAdd1" style = "width:100px">';
    cell4.innerHTML = '<input class = "form-control" type = "text" id = "addrAdd2" name = "addrAdd2" style = "width:100px">';
    cell5.innerHTML = '<input class = "form-control" type = "text" id = "addrTel" name = "addrTel" style = "width:100px">';
    cell6.innerHTML = '<input class = "form-control" type = "text" id = "addMail" name = "addrMail" style = "width:200px">';
    
    mailStr = "";
	mailStr += '<a class="btn btn-outline-secondary btn-sm edit" id = "addrSave2" title="저장">'
	mailStr += '<i class="mdi mdi-content-save"></i>'
	mailStr += '</a>'

    cell7.innerHTML = mailStr;
  }

function addAddressSet() {
    $("#addrType").val("개인")
    $("#addrName").val("김혜진")
    $("#addrAdd1").val("대전광역시 오류동")
    $("#addrAdd2").val("대덕인재개발원")
    $("#addrTel").val("010-7845-1236")
    $("#addMail").val("khj0099@ddit.or.kr")

  }
  
function noticeBoardDelete(delBoNm){
	Swal.fire({
    	title: "",
        text: "해당 게시글을 삭제하시겠습니까?",
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true
     }).then((result) => {
    	 if (result.isConfirmed) {
    		 $.ajax({
   				url : "/deleteBoard",
   				type : "post",
   				data : { boNm : delBoNm },
   				success : function(){
   					Swal.fire({
   		       			title: "",
   		                text: "게시글이 삭제되었습니다.",
   		                icon: "success",
   		                showCancelButton: true,
   		                confirmButtonColor: '#3085d6',
   		                cancelButtonColor: '#d33',
   		                reverseButtons: true
   		       		})
   		       		
	   		 		$("#noticeBoardContainer *").remove()
	   				getNoticeList();
   				}
    		 })
         }
    })
 }

function gyeongjosaBoardDelete(delBoNm){
	Swal.fire({
    	title: "",
        text: "해당 게시글을 삭제하시겠습니까?",
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true
     }).then((result) => {
    	 if (result.isConfirmed) {
    		 console.log("ddd ::: ", delBoNm)
    		 $.ajax({
   				url : "/deleteBoard",
   				type : "post",
   				data : { boNm : delBoNm },
   				success : function(){
   					Swal.fire({
   		       			title: "",
   		                text: "게시글이 삭제되었습니다.",
   		                icon: "success",
   		                showCancelButton: true,
   		                confirmButtonColor: '#3085d6',
   		                cancelButtonColor: '#d33',
   		                reverseButtons: true
   		       		})
   		       		
   					$("#gyeongjosaBoardContainer *").remove()
   					getGyeongjosaList();	
   				}
    		 })
         }
    })
}

function complainBoardDelete(delBoNm){
	Swal.fire({
    	title: "",
        text: "해당 게시글을 삭제하시겠습니까?",
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true
     }).then((result) => {
    	 if (result.isConfirmed) {
    		 $.ajax({
   				url : "/deleteBoard",
   				type : "post",
   				data : { boNm : delBoNm },
   				success : function(){
   					Swal.fire({
   		       			title: "",
   		                text: "게시글이 삭제되었습니다.",
   		                icon: "success",
   		                showCancelButton: true,
   		                confirmButtonColor: '#3085d6',
   		                cancelButtonColor: '#d33',
   		                reverseButtons: true
   		       		}).then((result) => {
   		       			console.log("dsadsadsda")
	   					$("#complainBoardContainer *").remove()
	   					getComplainList();	   		       			
   		       		})
   		       		
   				}
    		 })
         }
    })
}

function academicBoardPapago(selectTo, selectFrom, changeData){
	 $.ajax({
		url : "/academicPapago",
		type : "post",
		data : { 
			selectTo : selectTo,
			selectFrom : selectFrom,
			changeData : changeData
		},
		dataType : "json",
		success : function(data){
			console.log(data.message.result.translatedText)
			var data = data.message.result.translatedText;
			$("#changeResult").val(data)
			
		}
	 })
}

//공지사항 목록 출력 함수
function getNoticeList() {
	$("#noticeNoneTable").css("display", "")
	var noticeBoardTable = $("#noticeBoardTable").DataTable();
	noticeBoardTable.destroy();
	
	$.ajax({
		url : "/noticeBoardList",
		type : "post",
		success : function(boardList){
			$("#noticeBoardTable").DataTable({
				lengthChange: false,
				ordering: false,
				autoWidth : false, //가로자동
				info: false,
				searching: false,
				language:{
					search : "<a><i class='ri-search-line'></i></a>",
					paginate : {  first : "처음", last : "마지막",next : "다음", previous : "이전" }
				},
				data : boardList,
				columns : [ {
					data : "boNm" , "width" : "1px"
				}, {
					data : "boTitle" , "width" : "500px"
				}, {
					data : "boWriter", "width" : "100px"
				}, {
					data : "boDate", "width" : "150px"
				}]
			})
			
			var noticeBoardFirst = $("#noticeBoardTable").children("tbody").children("tr").eq(0).children("td").eq(1);
			var noticeBoardFirstTitle = $("#noticeBoardTable").children("tbody").children("tr").eq(0).children("td").eq(1).text();
			console.log("첫번째 공지사항 제목", noticeBoardFirst)
			noticeBoardFirst.html("<span class='badge bg-danger'>NEW!</span>\u00A0"+ noticeBoardFirstTitle)
			
		}
	})
}

//경조사 목록 출력 함수
function getGyeongjosaList() {
	$("#gyeongjosaNoneTable").css("display", "")
	var gyeongjosaBoardTable = $("#gyeongjosaBoardTable").DataTable();
	gyeongjosaBoardTable.destroy();
	
	$.ajax({
		url : "/gyeongjosaBoardList",
		type : "post",
		success : function(boardList){
			$("#gyeongjosaBoardTable").DataTable({
				lengthChange: false,
				ordering: false,
				autoWidth : false, //가로자동
				info: false,
				searching: false,
				language:{
					search : "<a><i class='ri-search-line'></i></a>",
					paginate : {  first : "처음", last : "마지막",next : "다음", previous : "이전" }
				},
				data : boardList,
				columns : [ {
					data : "boNm" , "width" : "1px"
				}, {
					data : "boTitle", "width" : "500px",
					"defaultContent" : "",
					render : function(data, type, row, meta){
						/* console.log(row.boHit) */
						return row.boTitle + '\u00A0<span class="badge bg-info">댓글('+ row.boHit +')</span>';
					}
				}, {
					data : "boWriter", "width" : "100px"
				}, {
					data : "boDate", "width" : "150px"
				}]
			})
		}
	})
}

//건의사항 목록 출력 함수
function getComplainList() {
	$("#complainNoneTable").css("display", "")
	var complainBoardTable = $("#complainBoardTable").DataTable();
	complainBoardTable.destroy();
	
	$.ajax({
		url : "/complainBoardList",
		type : "post",
		success : function(boardList){
			$("#complainBoardTable").DataTable({
				lengthChange: false,
				ordering: false,
				autoWidth : false, //가로자동
				info: false,
				searching: false,
				language:{
					search : "<a><i class='ri-search-line'></i></a>",
					paginate : {  first : "처음", last : "마지막",next : "다음", previous : "이전" }
				},
				data : boardList,
				columns : [ {
					data : "boNm", "width" : "1px"
				}, {
					data : "boTitle", "width" : "500px"
				}, {
					data : "boWriter", "width" : "100px"
				}, {
					data : "boDate", "width" : "150px"
				}]
			})
			
			var complainBoardFirst = $("#complainBoardTable").children("tbody").children("tr").eq(0).children("td").eq(1);
			var complainBoardFirstTitle = $("#complainBoardTable").children("tbody").children("tr").eq(0).children("td").eq(1).text();
			
			for(let i=0; i<boardList.length; i++){
				complainBoardFirst = $("#complainBoardTable").children("tbody").children("tr").eq(i).children("td").eq(1);
				complainBoardFirstTitle = $("#complainBoardTable").children("tbody").children("tr").eq(i).children("td").eq(1).text();
				complainBoardFirst.html(complainBoardFirstTitle + "\u00A0<span class='badge bg-warning'>답변(1)</span>")
			}
			
			
			
		}
	})
}

</script>
<style>
/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
/* .fc-day-sat a {
  color: blue;
  text-decoration: none;
} */
</style>



<div class="page-content myHome-content">
			<!-- 메뉴 -->
			<div class="card">
				<div class="card-body">
					<ul class="nav nav-tabs nav-tabs-custom nav-justified"
						role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-bs-toggle="tab" href="#home1" role="tab"
							aria-selected="true"> <span class="d-block d-sm-none"><i
									class="fas fa-home"></i></span> <span class="d-none d-sm-block tabTitle"
								id="myHomeTab">홈</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#profile1" role="tab" aria-selected="false"> <span
								class="d-block d-sm-none"><i class="far fa-user"></i></span> <span
								class="d-none d-sm-block tabTitle" id="mailTab">메일</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#settings1" role="tab" aria-selected="false"> <span
								class="d-block d-sm-none"><i class="fas fa-cog"></i></span> <span
								class="d-none d-sm-block tabTitle" id="boardTab">게시판</span>
						</a></li>
					</ul>
				</div>
			</div>

			<!-- 바뀔부분 -->
			<div class="tab-content">
				<div class="tab-pane active" id="home1" role="tabpanel">
					<!-- home -->
					<div class="row mb-12" >
						<!-- 프로필 -->
						<div class="col-xl-2">
							<div>
								<div id="myInfoDiv">
								</div>
							</div>
						</div>
						<div class="col-xl-4">
							<!-- 최신 게시글 -->							
							<div class="card font-size">
								<div class="card-body" class="font-size">
									<div id="carouselExampleInterval" class="carousel slide review-carousel" data-bs-ride="carousel" style = "height: 300px;">
										<div class="carousel-inner" id = "newBoardDiv">
											<h4 class = "card-title"><strong><i class="ri-artboard-fill"></i> 게시판 최근 글</strong></h4>
											<hr class = "my-4">
											<div class='carousel-item active' data-bs-interval='10000'>
												<p><b>공지사항</b></p>
												<div id = "newNotice"></div>
											</div>
											
											<div class='carousel-item' data-bs-interval='10000'>
												<p><b>경조사</b></p>
												<div id = "newGyeongjosa"></div>
											</div>
											
											<div class='carousel-item' data-bs-interval='10000'>
												<p><b>건의사항</b></p>
												<div id = "newComplain"></div>
											</div>
										</div>
										<br><br>
										<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
											<i class="mdi mdi-chevron-left carousel-control-icon"></i>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleInterval" data-bs-slide="next">
											<i class="mdi mdi-chevron-right carousel-control-icon"></i>
										</button>
									</div>
								</div>
							</div>
							<!-- 알람 -->
							<div class="card font-size">
								<div class="card-body">
								  <div class="row col-xl-12">
									<p class="font-size col-md-10" style="text-align: left!important; margin-bottom: 0px;"><b>할 일</b></p>
									<p class = "col-md-2" style="text-align: right!important; margin-bottom: 0px;">
										<i class="mdi mdi-plus" id = "memoInsertBtn"></i>
										<i class='mdi mdi-trash-can-outline' id = 'memoDeleteBtnOn'></i>
									</p>
								</div>	
									<hr class = "my-4">
									<!-- 메모 리스트 -->
									<div style = "height: 300px;">
									<div id = "memoList" style = "overflow: auto;"></div>
									<!-- 메모 입력 폼 -->
									<form id = "memoInsertForm" style = "display: none">
										<textarea required="" class="form-control" rows="3" id = "empMemoCon" name = "empMemoCon"></textarea>
										<button type="button" id = "memoInsertFormBtn" class="btn btn-light btn-sm waves-effect waves-light">저장</button>
									</form>
									</div>
								</div>
							</div>
						</div>
						<!-- 직원 메모 -->
						<div class="col-xl-3">
							<div class = "card font-size">
								<div class = "card-body">
									<div class = "row col-md-12">
										<h4 class = "card-title col-md-8"><strong><i class="ri-notification-3-line"></i> 알림창</strong></h4>
	                                       <div class="col-md-4">
	                                       </div>
									</div>
									<hr class = "my-4">
									<div id = "alarmDiv" style = "height: 664px; overflow: auto;"></div>
								</div>
							</div>
						</div>
						<!-- 캘린더 -->
						<div class="col-xl-3 h-100">
							<div class = "card">
								<div class="card-body h-50">
									<div id="calendar"></div>
								</div>
							</div>
						</div>
						<div style='clear: both'></div>
					</div>
				</div>
				<!-- 메일 -->
				<div class="tab-pane" id="profile1" role="tabpanel">
					<div class="row">
						<div class="col-12">
							<!-- 왼쪽 사이드바 -->
							<div class="email-leftbar card">
								<button type="button" class="btn btn-danger waves-effect waves-light" id = "mailInsertBtn">메일쓰기</button>
								<div class="mail-list mt-4">
									<a href="#" class="active" id = "mailAddressBtn">
										<i class="mdi mdi-archive me-2 font-size-16"></i><b>
										 주소록</b> <span class="ms-1 float-end"></span>
									</a> 
									<a href="#" class="" id = "mailSendListBtn">
										<i class="mdi mdi-email me-2 font-size-16"></i><b>
										보낸 메일함</b>
									</a>
								</div>
							</div>
							<!-- 왼쪽 사이드바 끝 -->

							<!-- 컨텐츠 -->
							<div class="email-rightbar mb-3">
								<div class="card">
									<!-- 메일 전송 Form -->
									<div class = "card-body" id = "mailContent">
										<div id = "mailSendForm" style = "display: none">
											<h2 class = "card-title"><i class="ri-send-plane-fill"></i><b> 메일 쓰기</b></h2>
											<div class="row">
												<div class="col-xl-12" align="right">
													<button type="button" class="btn btn-primary waves-effect w-md" id = "mailFormBtn">보내기</button>
												</div>
												<hr class = "my-4">
												<form id = "mailForm" name="mailForm">
													<div class="row mb-3">
	                                            		<label for="example-text-input" class="col-sm-2 col-form-label"><h5><b>받는 사람</b></h5></label>
	                                            		<div class="col-sm-8">
	                                                		<input class="form-control" type="text" placeholder="받는 사람의 메일 주소를 입력해주세요." id="tomail" name = "tomail">
	                                            		</div>
	                                            		<div class = "col-sm-2">
	                                            			<button type="button" id = "mailFormAddress" class="btn btn-primary waves-effect waves-light" data-bs-toggle="modal" data-bs-target=".bs-example-modal-center">주소록</button>
	                                        			</div>
	                                        		</div>
													<div class="row mb-3">
	                                            		<label for="example-text-input" class="col-sm-2 col-form-label"><h5><b>제목</b></h5></label>
	                                            		<div class="col-sm-10">
	                                                		<input class="form-control" type="text" placeholder="이메일 제목을 입력해주세요." id="mailTitle" name="mailTitle">
	                                            		</div>
	                                        		</div>
	                                        		<div class="row mb-3">
	                                        			<label for="example-text-input" class="col-sm-2 col-form-label"><h5><b>파일 첨부</b></h5></label>
	                                            		<div class="col-sm-10">
															<input type="file" class="form-control" id="mailFile">
														</div>
													</div>
													<textarea id="mailTa" name = "mailCon"></textarea>
												</form>
												<br>
											</div>
											<div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                           <!--  <div class="modal-header">
                                                            </div> -->
                                                            <div class="modal-body">
                                                            	<div class = "row card-body col-md-12">
			                                                        <h5 class="col-md-4 modal-title" style = "padding: calc(32px / 2) 0;">메일 주소록</h5>
													                <form class="col-md-8 app-search d-none d-lg-block">
											                            <div class="position-relative">
											                                <input type="text" class="form-control" placeholder="주소 검색" id = "searchAddress">
											                                <span class="ri-search-line"></span>
											                            </div>
											                        </form>
											                        <hr>
											                    </div>
                                                                <div class = "card-body row col-md-12">
	                                                                <div class = "col-md-4" style = "padding: 0px;">
	                                                                	<!-- <p><i class=" ri-contacts-book-2-line"></i>최근 사용한 주소</p> -->
	                                                                	<h5 id = "mailFormPrivate" style = "cursor:pointer"><i class=" ri-contacts-book-2-line"></i>개인 주소록</h5>
	                                                                	<h5 id = "mailFormEmp" style = "cursor:pointer"><i class="ri-building-4-line"></i>직원 주소록</h5>
	                                                                </div>
	                                                                <div class = "col-md-8" style = "padding: 0px;">
	                                                                	<div id = "mailFormPrivateList"></div>
	                                                                	<div id = "mailFormEmpList"></div>
	                                                                </div>
	                                                            </div>
	                                                            <div class = "card-body">
                                                                	<button type="button" class="col-md-3 btn btn-primary waves-effect w-md" data-bs-dismiss="modal" aria-label="Close" id = "mailModalClose" style = "margin-left: 200px;">취소</button>
		                                                            <button type="button" class="col-md-3 btn btn-primary waves-effect w-md" id = "mailFormOk">확인</button>
	                                                        	</div>
                                                            </div>
                                                        </div><!-- /.modal-content -->
                                                    </div><!-- /.modal-dialog -->
                                                </div><!-- /.modal -->
										</div>
									</div>
									<!-- 보낸 메일 -->
									<div id = "mailSendList">
	 									<div class="row">
											<div class="col-xl-12 col-md-12">
												<div class="btn-toolbar py-3 float-end" role="toolbar">
													<div class="btn-group me-2 mb-2 mb-sm-0">
														<button type="button"
															class="btn btn-primary waves-light waves-effect" id = "mailDeleteBtn">
															<i class="far fa-trash-alt"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
										<div id = "mailSendListDiv">
											
										</div>
										<div class="card-body row">
											<div class="col-7"></div>
											<div class="col-5">
												<div class="btn-group float-end">
													<button type="button"
														class="btn btn-sm btn-success waves-effect">
														<i class="fa fa-chevron-left"></i>
													</button>
													<button type="button"
														class="btn btn-sm btn-success waves-effect">
														<i class="fa fa-chevron-right"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 메일 디테일 -->
									<div id = "mailDetail"></div>
									<!-- 메일-주소록 -->
									<div id = "mailAddressDiv" style = "display: none">
										<div class = "card-body">
											<ul class="nav nav-tabs" role="tablist">
	                                            <li class="nav-item">
	                                                <a class="nav-link active" data-bs-toggle="tab" href="#empAddress" id = "empAddressTab" role="tab">
	                                                    <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
	                                                    <span class="d-none d-sm-block"><h5>직원 주소록</h5></span>    
	                                                </a>
	                                            </li>
	                                            <li class="nav-item">
	                                                <a class="nav-link" data-bs-toggle="tab" href="#privateAddress" id = "privateAddressTab" role="tab">
	                                                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
	                                                    <span class="d-none d-sm-block"><h5>개인 주소록</h5></span>    
	                                                </a>
	                                            </li>
                                        	</ul>
											<div class="tab-content p-3 text-muted">
	                                            <div class="tab-pane active" id="empAddress" role="tabpanel">
													<!-- <input type = "button" id = "addAddressBtn" value = "추가"> -->
													<table id="addressTable"
														class="table table-bordered dt-responsive nowrap table-hover"
														style="border-collapse: collapse; border-spacing: 0; width: 100%; font-size: 1.18em; text-align: center;">
														<thead>
															<tr>
																<th style="width: 150px;">사번</th>
																<th>이름</th>
																<th>직책</th>
																<th>전화번호</th>
																<th>메일주소</th>
															</tr>
														</thead>
														<tbody id="addressTbody">
														</tbody>
													</table>
	                                            </div>
	                                            <div class="tab-pane" id="privateAddress" role="tabpanel">
	                                            	<button style="margin-left: 96%;" type="button" id = "addSetBtn" class="btn btn-light waves-effect">세팅</button>
	                                            	<button style="margin-left: 96%;" type="button" id = "addAddressBtn" class="btn btn-light waves-effect">추가</button>
	                                                <table id="privateAddressTable" class="table table-bordered dt-responsive nowrap table-hover"
														style="border-collapse: collapse; border-spacing: 0; width: 100%; font-size: 1.18em; text-align: center;">
														<thead>
															<tr>
																<!-- <th width="1px"></th> -->
																<th style="width: 150px;">분류</th>
																<th width="150px">이름</th>
																<th>주소</th>
																<th>상세주소</th>
																<th>전화번호</th>
																<th>메일주소</th>
																<th width="150px"></th>
																<th width="30px"></th>
															</tr>
														</thead>
														<tbody id="privateAddressTbody">
														</tbody>
													</table>
	                                            </div>
	                                        </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 게시판탭 -->
				<div class="tab-pane" id="settings1" role="tabpanel">
					<div class="row mb-3">
							<!-- 게시판 목록 메뉴 -->
							<div class="row">
								<div class="col-md-2">
									<div class="card">
										<div class="card-body boardListTab">
											<p class="boardFont"><b>게시판 목록</b></p>
											<hr>
											<div class="nav flex-column nav-pills" id="v-pills-tab"
												role="tablist" aria-orientation="vertical">
												<a class="nav-link active boardFont" id="v-pills-home-tab"
													data-bs-toggle="pill" href="#v-pills-home" role="tab"
													aria-controls="v-pills-home" aria-selected="true">공지사항</a>
												<a class="nav-link mb-2 boardFont" id="v-pills-profile-tab"
													data-bs-toggle="pill" href="#v-pills-profile" role="tab"
													aria-controls="v-pills-profile" aria-selected="false">경조사</a>
												<a class="nav-link mb-2 boardFont" id="v-pills-messages-tab"
													data-bs-toggle="pill" href="#v-pills-messages" role="tab"
													aria-controls="v-pills-messages" aria-selected="false">건의사항</a>
												<a class="nav-link mb-2 boardFont" id="v-pills-settings-tab"
													data-bs-toggle="pill" href="#v-pills-settings" role="tab"
													aria-controls="v-pills-settings" aria-selected="false">학술</a>
											</div>
										</div>
									</div>
								</div>
								<!-- 게시판 바뀔부분 -->
								<div class="col-md-10">
									<div class="card">
										<div class="card-body">
											<div class="tab-content text-muted mt-4 mt-md-0"
												id="v-pills-tabContent">

												<%@include file="createForm.jsp"%>

												<div class="tab-pane fade active show" id="v-pills-home"
													role="tabpanel" aria-labelledby="v-pills-home-tab">
													<!-- 공지사항 게시판 -->
														<div class="table-responsive">
															<div class = "col-md-12" id = "noticeNoneTable" style="width: 97%">
																<br><button type="button" class="btn btn-primary waves-effect" id = 'noticeInsertBtn' style = "margin-left:94%;">새글쓰기</button><br><br><br>
																<table class="table dt-responsive nowrap w-100 table-hover font-size " id = 'noticeBoardTable' data-ordering="false" style="width: 90%">
																	<thead>
																	<tr>
																	<th></th>
																	<th>제목</th>
																	<th>작성자</th>
																	<th>작성날짜</th>
																	</tr>
																	</thead>
																</table>
															</div>
															<div id="noticeBoardContainer"></div>
														</div>
												</div>

												<!-- 경조사 게시판 -->
												<div class="tab-pane fade" id="v-pills-profile"
													role="tabpanel" aria-labelledby="v-pills-profile-tab">
													<div class="table-responsive">
														<div id = "gyeongjosaNoneTable" style="width: 97%">
																<br><button type="button" class="btn btn-primary waves-effect" id = 'gyeongjosaInsertBtn'style = "margin-left:94%;">새글쓰기</button><br><br><br>
																<table class="table dt-responsive nowrap w-100 table-hover font-size" id = 'gyeongjosaBoardTable' data-ordering="false" style="width: 90%">
																	<thead>
																		<tr>
																		<th></th>
																		<th>제목</th>
																		<th>작성자</th>
																		<th>작성날짜</th>
																		<!-- <th>댓글 수</th> -->
																		</tr>
																	</thead>
																</table>
															</div>
														<div id="gyeongjosaBoardContainer"></div>
													</div>
												</div>

												<!-- 건의사항 게시판 -->
												<div class="tab-pane fade" id="v-pills-messages"
													role="tabpanel" aria-labelledby="v-pills-messages-tab">
													<div class="table-responsive">
														<div id = "complainNoneTable" style="width: 97%">
															<br><button type="button" class="btn btn-primary waves-effect" id = 'complainInsertBtn'style = "margin-left:94%;">새글쓰기</button><br><br><br>
															<table class="table dt-responsive nowrap w-100 table-hover font-size" id = 'complainBoardTable' data-ordering="false" style="width: 90%">
																<thead>
																	<tr>
																		<th></th>
																		<th>제목</th>
																		<th>작성자</th>
																		<th>작성날짜</th>
																		</tr>
																	</thead>
																</table>
															</div>
														<div id="complainBoardContainer"></div>
													</div>
												</div>

												<!-- 학술 게시판 -->
												<div class="tab-pane fade" id="v-pills-settings"
													role="tabpanel" aria-labelledby="v-pills-settings-tab">
														<div class="table-responsive">
															<div class = "col-md-12 row">
																<div class = "col-md-6" style="height:100%;">
																	<iframe id = "academicIframe" src="https://koreascience.kr/main.page" style="width:100%; height:800px; border:none;"></iframe>
																</div>
																<div class = "col-md-6" style="height:100%;">
																	<!-- <button type="button" class="btn btn-primary waves-effect">번역</button> -->
																	<div>
																		<!-- <h4>번역</h4> -->
																		<div class = "card-body row col-md-12">
																			<div class="badge badge-soft-primary col-md-2 changeTitle">원문번역</div>
																			<div class = "col-md-10">
																			<select id = "selectTo" class="form-select" aria-label="Default select example">
							                                                    <option value="en">영어</option>
							                                                    <option value="ko">한국어</option>
						                                                    </select>
						                                                    </div>
						                                                </div>
																		<textarea required="" class="form-control changeForm" rows="10" id = "changeOrigin"></textarea>
																	</div>
																	<div class = "card-body" align="center"><i class = "ri-arrow-up-down-line changeBtn"></i></div>																
																	<div class = "card-body row col-md-12">
																		<div class="badge badge-soft-warning col-md-2 changeTitle">번역본</div>
																		<div class = "col-md-10">
																			<select id = "selectFrom" class="form-select" aria-label="Default select example">
							                                                    <option value="ko">한국어</option>
							                                                    <option value="en">영어</option>
						                                                    </select>
																		</div>
																	</div>																	
																	<textarea required="" class="form-control changeForm2" rows="10" id = "changeResult"></textarea>
																</div>
															</div>
															<div id="academicBoardContainer"></div>
														</div>
												</div>
												<!-- 학술 게시판 끝 -->
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
<!-- 		</div> -->
		<!-- </div> -->


		<!-- end row-->
		<div style="clear: both"></div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">일정추가</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- Modal body -->
						<div class="modal-body">
							<form id="sns_form" method="post">
								<div class="form-group">
									<label for="schTitle">일정제목:</label> <input type="text"
										class="form-control" placeholder="" id="schTitle">
								</div>
								<div class="form-group">
									<label for="schCont">일정내용:</label> <input type="text"
										class="form-control" placeholder="" id="schCont">
								</div>
								<!-- <br> <br> -->
								<div style = 'display:none'>
									<label for="schStartDate">시작날짜:</label>
										<input type="date" id="schStartDate">
									<label for="schEndDate">종료날짜:</label>
										<input type="date" id="schEndDate">
								</div>
								<!-- <br> <br> -->
								<div class="form-group">
									<span>allDay여부 : </span>
									<input type="checkbox" value="true" id="allDay" checked="checked">
									<br><br>
									<label for="startTime">시작시간:</label>
									<select class="form-control" id="startTime">
										<option value="09:00">09:00</option>
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
										<option value="18:00">18:00</option>
										<option value="18:30">18:30</option>
									</select>
								</div>
								<div class="form-group">
									<label for="endTime">종료시간:</label>
									<select class="form-control" id="endTime">
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
										<option value="18:00">18:00</option>
										<option value="18:30">18:30</option>
										<option value="19:00">19:00</option>
									</select>
								</div>
							</form>
						</div>

					</div>
					<div class="modal-footer" id="contextMenu">
						<button type="button" class="btn btn-primary" id="insertBtn">등록</button>
						<button type="button" class="btn btn-secondary" data-role="close" 
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

	<!-- </div> -->
</div>
<script>
$(function(){
	document.getElementById("headerSearchBar").style.display="none";
})
</script>