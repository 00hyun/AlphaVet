<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>

/* 모달창 자동완성 없으면 안보임 */
.ui-autocomplete {
	z-index: 2147483647;
}

/*fullcalendar css*/
.fc .fc-button-primary:disabled {
    color: var(--fc-button-text-color, #fff);
    background-color: #402eff;
    border-color: var(--fc-button-border-color, #402eff);
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

.fc .fc-list-empty {
    background-color: #f6f9ff80;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.fc-theme-standard .fc-list-day-cushion {
    background-color: #f6f9ff;
}

.fc-theme-standard .fc-list {
    border: 1px solid #ddd;
    border: 1px solid #f6f9ff80;
}

#fc-dom-1 {
	font-weight: bold;
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

/* 툴팁 */
.popover-header {
    padding: 0.5rem 0.75rem;
    margin-bottom: 0;
    font-size: .9rem;
    background-color: #d0bbe5;
    border-bottom: 1px solid #9f93e3;
    color: #fff;
    border-top-left-radius: calc(0.4rem - 1px);
    border-top-right-radius: calc(0.4rem - 1px);
}

.popover-body {
    padding: 0.5rem 0.75rem;
    color: #6d7999;
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

.form-group{
	margin-bottom: 10px;

}
</style>

<script>

$(function() {
	var calendarEl = document.getElementById('calendar');
	
	// 일정 등록시 select 색
	var resTitle = document.getElementById("resTitle"); 
		document.getElementById("resTitle").onchange = function(){
			var color = "";
			if(resTitle.value == "상담"){
				color = "#c5c9ef";
			}else if(resTitle.value == "진료"){
				color = "#a4c6f1";
			}else if(resTitle.value == "예방접종"){
				color = "#aee3a3";
			}else if(resTitle.value == "검사"){
				color = "#efb5d7";
			}else if(resTitle.value == "수술"){
				color = "#f3c66e";
			}
    		document.getElementById("resColor").value = color;
    		
	};
	
	var startTime = document.getElementById("startTime"); 
	console.log("와");
	document.getElementById("startTime").onchange = function(){
		var endTime = "";
		if(startTime.value == "09:00"){
			endTime = "09:30";
		}else if(startTime.value == "09:30"){
			endTime = "10:00";
		}else if(startTime.value == "10:00"){
			endTime = "10:30";
		}else if(startTime.value == "10:30"){
			endTime = "11:00";
		}else if(startTime.value == "11:00"){
			endTime = "11:30";
		}else if(startTime.value == "11:30"){
			endTime = "12:00";
		}else if(startTime.value == "12:00"){
			endTime = "12:30";
		}else if(startTime.value == "12:30"){
			endTime = "13:00";
		}else if(startTime.value == "13:00"){
			endTime = "13:30";
		}else if(startTime.value == "13:30"){
			endTime = "14:00";
		}else if(startTime.value == "14:00"){
			endTime = "14:30";
		}else if(startTime.value == "14:30"){
			endTime = "15:00";
		}else if(startTime.value == "15:00"){
			endTime = "15:30";
		}else if(startTime.value == "15:30"){
			endTime = "16:00";
		}else if(startTime.value == "16:00"){
			endTime = "16:30";
		}else if(startTime.value == "16:30"){
			endTime = "17:00";
		}else if(startTime.value == "17:00"){
			endTime = "17:30";
		}else if(startTime.value == "17:30"){
			endTime = "18:00";
		}else if(startTime.value == "18:00"){
			endTime = "18:30";
		}else if(startTime.value == "18:30"){
			endTime = "19:00";
		}
		
		document.getElementById("endTime").value = endTime;
		
};
	
	
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	        slotMinTime: '09:00', // Day 캘린더에서 시작 시간
	        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
			headerToolbar : { // 헤더에 표시할 툴 바
				left : 'today,prev,next',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			
			//			titleFormat : function(date) {
			//				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			//			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			eventDisplay : "block",
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					url : "/reservation/calendar",
					type : "POST",
					contentType : "application/json",
					dataType : "JSON",
					data : `${principal.username }`,
					traditional : true,
					async : false, //동기
					cache : false,
					success : function(data) {
// 						console.log(data)

						var events = [];

						$.each(data, function(i, v) {
							events.push({
								title : v.resTitle,
								memo : v.resCont,
								start : v.resStartDate,
								// 								end : v.resEndDate,
								allDay : v.resAllDay,
								groupId : v.resNm,
								username : v.empId,
								color : '#FFF',
								backgroundColor: v.resColor
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
// 			eventDidMount : function (info) {
// 				console.log("event:",info.event)
// 	            $(info.el).popover({
// 	                title: info.event.title,
// 	                placement: 'bottom',
// 	                trigger: 'hover',
// 	                content: info.event.extendedProps.memo,
// 	                container: 'body'
// 	            });
// 			}, 오류나서 주석
			eventMouseEnter : function(info) {

			},
			eventMouseLeave : function() {
				//				alert("메모 닫음")
			},
			eventDrop : function(info) {
				
				 Swal.fire({
					   title: '일정을 변경하시겠습니까?',
					   icon: 'warning',
					   
					   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					   confirmButtonText: '변경', // confirm 버튼 텍스트 지정
					   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
					   
					   
						}).then(result =>{

						   if (result.isConfirmed) {

					//초기값 세팅
					var resNm = info.event._def.groupId;
					var resTitle = info.event._def.title;
					var resCont = info.event._def.extendedProps.memo;
					var resStartDate;
					// 					var resEndDate;

					var date = new Date(info.event._instance.range.start);
					resStartDate = date.getFullYear() + "/"
							+ (date.getMonth() + 1) + "/" + date.getDate();
					
					
					console.log("하이",resStartDate);
					console.log("하이",date);
					
					
					date = new Date(info.event._instance.range.end);
					// 					resEndDate = date.getFullYear() + "-"
					// 							+ (date.getMonth() + 1) + "-" + date.getDate();
					
					
					var jsonObject = {
						resNm : resNm,
						resTitle : resTitle,
						resCont : resCont,
						resStartDate : resStartDate 
						
					}
					console.log("dd",jsonObject);
					

					$.ajax({
						url : "/reservation/update",
						data : JSON.stringify(jsonObject),
						type : "post",
						dataType : "json",
						contentType : "application/json; charset=utf-8",
						success : function(res) {
							console.log(res);
							if(res.result == "SUCCESS"){
								Swal.fire({
									  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
									  title: '일정을 변경하였습니다.'
									});
								console.log("일정 변경", jsonObject);
								resList();
							}
						}
					})

				};
						   })
			},
			eventClick : function(arg) {
				console.log(arg)
				var resNm = arg.event._def.groupId;

				 Swal.fire({
					   title: '일정을 삭제 하시겠습니까?',
					   icon: 'warning',
					   
					   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					   confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
					   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
					   
					   
						}).then(result =>{

				if (result.isConfirmed) {
				
					$.ajax({
						url : "/reservation/delete",
						data : {
							"resNm" : resNm
						},
						type : "post",
						success : function(res) {
							Swal.fire({
								  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
								  title: '일정이 삭제 되었습니다.'
								});
							resList();
						}
					});
					arg.event.remove();
				}
						   })
			},
			eventRemove : function(info) {
				//				console.log("일정을 삭제했습니다.")
			},
			select : function(info) {

				$("#exampleModal").modal('show')

				var arg = info;

				// 날짜들
				var startDay = document.querySelector("#resStartDate");
				// 				var endDay = document.querySelector("#resEndDate");
				var startTime = document.querySelector("#startTime");
				var endTime2 = document.querySelector("#endTime");

				// 날짜 계산 
				var resStartDate = info.startStr; // 처음날짜 캘린더제공하는
				console.log("내가 처음에 선택한 날짜 : " + info.startStr);
				console.log("마지막에 선택한 날짜 : " + info.endStr);

				startDay.value = resStartDate;
				
				var resColor = document.querySelector("#resColor").value;
				
				var date = new Date(info.endStr);
				date.setDate(date.getDate() - 1);
				var month = ((date.getMonth() + 1) < 10) ? "0"
						+ (date.getMonth() + 1) : (date.getMonth() + 1);
				var day = (date.getDate() < 10) ? "0" + date.getDate() : date
						.getDate();
				// 				var resEndDate = date.getFullYear() + "-" + month + "-" + day;
				// 				endDay.value = resEndDate;
				// 				console.log("지금은? : " + resEndDate);

				var $contextMenu = $("#contextMenu");
				$contextMenu.off('click').on("click", "button", function(e) {
					e.preventDefault();
					console.log("버튼 클릭 ?" + $(this).text())

					//닫기 버튼이 아닐때
					if ($(this).text() !== '취소') {
						addSchedule(info, calendar);
						calendar.unselect();

					} else {
						modalReset();
					}
				});

				calendar.unselect();

			},
			nowIndicator : true, // 현재 시간 마크
			locale : 'ko' // 한국어 설정
		});

		calendar.render();

	});



	// 일정 등록
	var addSchedule = function(info, calendar) {
		event.preventDefault();

		// 날짜들
		var startDay = document.querySelector("#resStartDate");
		// 		var endDay = document.querySelector("#resEndDate");
		var startTime = document.querySelector("#startTime");
		var endTime = document.querySelector("#endTime");

		// 환자, 의사 정보
		var patId = document.querySelector("#patId").value;
		var empId = document.querySelector("#empId").value;
		
		var resColor = document.querySelector("#resColor").value;
		
		// 날짜 계산 
		var resStartDate = info.startStr; // 처음날짜 캘린더제공하는
		var resTitle = document.querySelector("#resTitle").value;
		var resCont = document.querySelector("#resCont").value;
		var allDayCheck = document.querySelector("#allDay");
		
		if (allDayCheck.checked == true) {
			startTime.value = "";
			endTime.value = "";
		}

		resStartDate = startDay.value;
		// 		resEndDate = endDay.value;

		var jsonObject = {
			resTitle : resTitle,
			resCont : resCont,
			resStartDate : resStartDate + " " + startTime.value,
			// 			resEndDate : resEndDate + " " + endTime.value,
			resAllDay : allDayCheck.checked,
			empId : empId,
			patId : patId,
			resColor : resColor
		}
		
		
		$.ajax({
			url : "/reservation/insert.do",
			data : JSON.stringify(jsonObject),
			type : "post",
			async : false,
			contentType : "application/json; charset=utf-8",
			success : function(res) {
				console.log("일정등록완료");
				Swal.fire({
					  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
					  title: '예약이 등록 되었습니다.'
					});
				sendMessageAlram();
				resList();
				calendar.render();
			},
			dataType : "json"
		})

		if (allDayCheck.checked) {

			calendar.addEvent({
				title : resTitle,
				start : resStartDate,
				// 				end : resEndDate,
				memo : resCont,
				allDay : allDayCheck.checked,
				empId : empId,
				patId : patId,
				resColor : resColor
				
			})
		} else {
			calendar.addEvent({
				title : resTitle,
				start : resStartDate + " " + startTime.value,
				// 				end : resEndDate + " " + endTime2.value,
				memo : resCont,
				allDay : false,
				empId : empId,
				patId : patId,
				resColor : resColor
			})
		}

		$('.modal').on('hidden.bs.modal', function(e) {
			$(this).find('form')[0].reset();
		});

		$("#exampleModal").modal('hide');
	}

	function modalReset() {
		$('.modal').each(function() {
			this.reset();
		});
	}
	

	
	//필터
// 	$('.filter').on('change', function () {
// 	    $('#calendar').fullCalendar('rerenderEvents');
// 	});

// 	$("#type_filter").select2({
// 	    placeholder: "선택..",
// 	    allowClear: true
// 	});
	
// 	function filtering(event){
// 		  var show_username = true;
// 		  var show_type = true;

// 		  var username = $('input:checkbox.filter:checked').map(function () {
// 		    return $(this).val();
// 		  }).get();
// 		  var types = $('#type_filter').val();

// 		  show_username = username.indexOf(event.username) >= 0;

// 		  if (types && types.length > 0) {
// 		    if (types[0] == "all") {
// 		      show_type = true;
// 		    } else {
// 		      show_type = types.indexOf(event.type) >= 0;
// 		    }
// 		  }

// 		  return show_username && show_type;
// 		}
	

// $(function() {
// 	const empResNameTemplate = empResName =>{
// 		let code ="";
// 		if(empResName.length ==0){
// 			code ="<a>의사 없음</a>";
// 		}else{
// 			for(var i=0; i<empResName.length; i++){
// 				code +=`
// 					<label class='checkbox-inline'>
// 					<input class='filter' type='checkbox' value='\${empResName[i].empId}' checked>
// 					\${empResName[i].empName}
// 					</label>
// 				`;
// 			}
// 		}
// 		console.log("디버깅:", code);
// 		return code;
// 	}		
// })

// function resEmpList() {
// 	$.ajax({
// 		method : "post",
// 		url : "/reservation/resEmpList"
// 		,dataType : "json"
// 	    ,contentType : "application/json"
// 	    ,async: true
// 	    ,cache : false
// 	    ,dataType: "json"
// 		,success : function(rslt) {
// 	        $("#empResList").html(empResNameTemplate(rslt));
// 		}
// 	})
// }


// $(document).ready(function() {
// 	resEmpList();
// })
	
	// 달력 끝

	
	
	
	
	$(function() {
		//일정 입력 시 자동완성 (펫 이름)  
		var searchId = "";
		$(".searchPat").autocomplete({
			source : function(request, response) { //source: 입력시 보일 목록
				$.ajax({
					url : "/reservation/autocompletePat",
					type : "POST",
					dataType : "JSON",
					data : {
						value : request.term
					} // 검색 키워드
					,
					success : function(data) { // 성공
						console.log(data);
						response($.map(data.patNameList, function(item) {
							tel = item.MEM_TEL
							searchId = item.PAT_NAME + "/" + tel
							return {
								label : item.PAT_NAME + "(" + tel + ")" // 목록에 표시되는 값
								,
								value : item.PAT_NAME + "(" + tel + ")" // 선택 시 input창에 표시되는 값
								,
								idx : item.PAT_ID

							// index
							// 			                           , name : item.PAT_ID
							};

						})); //response
					},
					error : function() { //실패
						alert("오류가 발생했습니다.");
					}
				});
			},
			focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
			},
			minLength : 1// 최소 글자수
			,
			autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
			,
			delay : 100 //autocomplete 딜레이 시간(ms)
			,
			select : function(evt, ui) {
				console.log(ui.item.label);
				console.log(ui.item.idx);
				$("#patId").val(ui.item.idx);
			}
		});
		//일정 입력 시 자동완성 (펫 이름)  끝

		
		//일정 입력 시 자동완성 (수의사 이름)  
		$(".searchEmp").autocomplete({
			source : function(request, response) { //source: 입력시 보일 목록
				$.ajax({
					url : "/reservation/autocompleteEmp",
					type : "POST",
					dataType : "JSON",
					data : {
						value : request.term
					} // 검색 키워드
					,
					success : function(data) { // 성공
						console.log(data);
						response($.map(data.empNameList, function(item) {
							// 			                	 empId = item.emp_id
							searchId = item.EMP_NAME
							return {
								label : item.EMP_NAME // 목록에 표시되는 값
								,
								value : item.EMP_NAME // 선택 시 input창에 표시되는 값
								,
								idx : item.EMP_ID
							// index
							// 			                           , name : item.EMP_ID
							};
						})); //response

					},
					error : function() { //실패
						alert("오류가 발생했습니다.");
					}
				});
			},
			focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
			},
			minLength : 1// 최소 글자수
			,
			autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
			,
			delay : 100 //autocomplete 딜레이 시간(ms)
			,
			select : function(evt, ui) {
				console.log(ui.item.label);
				console.log(ui.item.idx);
				$("#empId").val(ui.item.idx);

			}
		});
		//일정 입력 시 자동완성 (수의사 이름)  끝//////

	})
	
	 function sendMessageAlram(){
		send(
				"alarm", 				// 전송 타입(알람/채팅)
			 	$("#empId").val(), 	// 받는 사람(알림 받는 사람)
			 	$("#resTitle").val(),	// 알림 타입(예약/댓글 등)
			 	"<a><i class='ri-calendar-check-fill'></i> 예약</a>" 	// 알림 내용
			);	
	}
	

	// 알림 발송 끝	
</script>


<div id='calendar-container'>
	<div id="empResList"> </div>
	<div id='calendar' class="fc fc-ltr fc-bootstrap"></div>
</div>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel"><b><i class="ri-reserved-line"></i>&nbsp;예약 등록</b></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- Modal body -->
				<div class="modal-body">
					<form id="sns_form" method="post">
						<div class="form-group">
							<label for="resTitle"><b>예약타입</b></label> 
							<select name="" id="resTitle" class="form-control">
								<option value="">타입 선택</option>
								<option value="상담">상담</option>
								<option value="진료">진료</option>
								<option value="예방접종">예방접종</option>
								<option value="검사">검사</option>
								<option value="수술">수술</option>
							</select>
						</div>
						<div class="form-group">
              				<select style="display: none;" name="" id="resColor" class="form-control">
								<option value="">선택</option>
								<option value="#c5c9ef">보라색</option>
								<option value="#a4c6f1">하늘색</option>
								<option value="#aee3a3">연두색</option>
								<option value="#efb5d7">분홍색</option>
								<option value="#f3c66e">주황색</option>
							</select>
						</div>
						<div class="form-group">
							<label for="resCont"><b>예약메모</b></label> 
							<input type="text" class="form-control" placeholder="" id="resCont">
						</div>
						<div class="form-group">
							<label for="patId"><b>환자이름</b></label> 
							<input type="text" class="form-control searchPat" >
							<input type="hidden" class="form-control" id="patId" >
						</div>
						<div class="form-group">
							<label for="empId"><b>담당 수의사</b></label> 
							<input type="text" class="form-control searchEmp">
							<input type="hidden" class="form-control" id="empId" >
						</div>
						<div class="form-group">
							<label for="resStartDate"><i class="far fa-calendar-check"></i><b> 예약날짜</b></label> 
							<input class="form-control" type="date" id="resStartDate">
							<!-- 								<label for="resEndDate"> 종료날짜:</label> -->
							<!-- 							<input type="date" id="resEndDate"> -->
						</div>
						<div class="form-group">
							<input type="hidden" value="false" id="allDay"> 
							<label for="startTime"><i class="far fa-clock"></i><b> 예약시간</b></label> 
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
							<label for="endTime"><i class="far fa-clock"></i><b> 종료시간</b></label> 
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
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>