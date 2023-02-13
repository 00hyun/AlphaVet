<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib  uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sec:authentication property="principal" var = "principal"/>

<!DOCTYPE html>
<html>
<head>

<!-- title-meta.html 시작 -->
<meta charset="UTF-8" />
<title>alpha,Vet</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
<meta content="Themesdesign" name="author" />
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/icon_mini.ico" />
<!-- title-meta.html 끝 -->

<link href="${pageContext.request.contextPath }/resources/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

<!-- head-css.html 시작 -->
<link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" />
<!-- head-css.html 끝 -->	

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<!-- 폰트 끝-->

<!-- Plugin css 지현 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css" />


        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/core/main.min.css" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/daygrid/main.min.css" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/bootstrap/main.min.css" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/timegrid/main.min.css" type="text/css"/>
 
<!-- Plugin css 지현 끝-->

<!-- (재한) 진료 페이지 dropzone css 사용 시작 -->
<link href="${pageContext.request.contextPath }/resources/assets/libs/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/libs/dropzone/min/basic.min.css" rel="stylesheet" type="text/css" />
<!-- 진료 페이지 dropzone css 사용 끝  -->

<style type="text/css">

/*드래그 색*/
::selection {
   background: #a5a6f3;
   color: #fff;
}

/*로딩*/
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.8;
	background: black;
	z-index: 99999;
	text-align: center;
}

#load > img {
	position: absolute;
	top: 38%;
	left: 40%;
	z-index: 100;
	width: 250px;
}
/*로딩 끝*/


html, body {
	height: 100%;
 	font-family: 'IBM Plex Sans KR', sans-serif;
}

/*스크롤바 없애는 기능 // 이동할 때 틀어져서 해놓음*/
body{
 -ms-overflow-style: none;
 }
::-webkit-scrollbar {
  display: none;
}

#ddingDivs{
	position:fixed;
	z-index:100;
	top:9%;
	left:86%;
	width:250px;
	height:70px;
	color: white;
	opacity: 80%;
}
.flexDiv{
	display : flex;
/*  	justify-content : space-around;  */
 	justify-content : space-between; 
}
.chat-conversation .conversation-list .arrow-left:before {
    top: 30px;
}
.chat-conversation .conversation-list .ctext-wrap {
    border-radius: 8px;
}
.chat-conversation .right .conversation-list .ctext-wrap {
    border-radius: 8px;
}
.textSize{
	font-size: 1.1em;
	font-weight: 400;
}
.chat-input{
   padding-right: 0px;
}
</style>


<!-- right-sidebar.html 시작 -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
<!-- right-sidebar.html 끝 -->
<%--         <script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script> --%>

<!-- (지현) -->
<!-- 
        <script src="${pageContext.request.contextPath }/resources/assets/libs/moment/min/moment.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/libs/jquery-ui-dist/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/core/main.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/bootstrap/main.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/daygrid/main.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/timegrid/main.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/interaction/main.min.js"></script>
 -->
        
<!-- Calendar init -->

<!-- 
        <script src="${pageContext.request.contextPath }/resources/assets/js/pages/calendar.init.js"></script>
 -->

<!-- Required datatable js -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<!-- Buttons examples -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/jszip/jszip.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/pdfmake/build/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/pdfmake/build/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
<!-- Responsive examples -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
<!-- Datatable init js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/datatables.init.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/tinymce/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/form-editor.init.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!-- Development -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>

<!-- Production -->
<!-- <script src="https://unpkg.com/@popperjs/core@2"></script> -->
<!-- <script src="https://unpkg.com/tippy.js@6"></script> -->

<!-- 에디터폼 -->
<tiles:insertAttribute name="pageCSS" />

<!-- 관리자 페이지 시작 -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/chart.js/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/chartjs.init.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/remix-icons-list.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/exceljs/4.3.0/exceljs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.0/FileSaver.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.3/apexcharts.min.js"></script> -->
<!-- 관리자 페이지 끝 -->

<!-- 진료 페이지 dropzone js 사용 시작 -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/dropzone/min/dropzone.min.js"></script>
<!-- 진료 페이지 dropzone js 사용 끝  -->

<!-- 풀 영현-->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/core/main.min.css" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/daygrid/main.min.css" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/bootstrap/main.min.css" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/timegrid/main.min.css" type="text/css"/>
<!-- 로딩 -->
         
</head>

<body data-topbar="light" data-keep-enlarged="true" class="vertical-collpsed" style="background-color: #f8f6ff">

    <!-- 로딩 -->
    <div id="load" align="center">
		<img src="${pageContext.request.contextPath }/resources/images/pawpaw2.gif" alt="loading">
	</div>
	<!-- 로딩 끝-->

	<div id="ddingDivs">
	</div>

	<div id="layout-wrapper">
		<tiles:insertAttribute name="menu" />
		<tiles:insertAttribute name="right-sidebar" />
		<div class="rightbar-overlay"></div>
		<div class="main-content">
			<tiles:insertAttribute name="content" />
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	
	
	<script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>


<!-- 알림 클론용 띵 Div 시작 -->
<div class="bg-primary p-3 rounded ddingDiv" style="display:none;height:70px;width:100%;margin:5px;">
	<h5 class="font-size-18 text-white mb-2 mt-2">
		<b></b>
	</h5>
</div>
<!-- 알림 클론용 띵 Div 끝 -->
</body>



























<!-- 소켓 이용한 애들 스크립트인데 다 작성하면 js 파일로 빼낼게요 그때까지만 참아줘영 -->

<script>

// 실험중.. 로딩
function loading() {
    $(window).on('load', function() {
        setTimeout(function(){
            $("#load").fadeOut();
        }, 1000);
    });
} 

loading();

const chatBtn = document.querySelector("#page-header-chatting-dropdown");
const chatEmpLi = document.querySelector("#chatEmpLi");
const chatEmpUl = document.querySelector("#chatEmpUl");

const chatRoomLi = document.querySelector("#chatRoomLi");
const chatRoomUl = document.querySelector("#chatRoomUl");

const chatNotiDot = document.getElementById("chatNotiDot");

const chatRoomsDiv = document.getElementById("chatRoomsDiv");
const chatRoomDiv = document.getElementById("chatRoomDiv");
const goChatRoomsDiv = document.getElementById("goChatRoomsDiv");

const yourChatLi = document.getElementById("yourChat");
const myChatLi = document.getElementById("myChat");
const chatDateLi = document.getElementById("chatDateLi");

const chatForm = document.chatForm;
const alarmBtn = document.querySelector("#page-header-notifications-dropdown");

const ddingDiv = document.getElementsByClassName("ddingDiv")[0];
const ddingDivs = document.getElementById("ddingDivs");

$(function(){
	connect();
	alarmUncheckedCnt();
})
let webSocket;

function connect() {
	webSocket = new WebSocket("ws://"+window.location.host+"${pageContext.request.contextPath}/alarm"); // End Point
	webSocket.onopen = fOpen;
	webSocket.onmessage = fMessage;
}
function fOpen() {
// 	alert("연결됨!");
} 
function send(type, receiver, cont, etc) {			// 소켓 메세지 보내는 부분
	console.log("send: " + type +"&"+ receiver +"&"+ cont +"&"+ etc);
	if(type=="alarm"){	// 알람일 때
		webSocket.send(
						type + "&" + 
						receiver + "&" + 
						cont + "&" + 
						etc + "&" + 					// 알람 Type
						"${principal.empVO.cliCd }"
					);
	}else if(type=="chat"){	// 채팅일 때
		let etcArray = etc.split("_");
		webSocket.send(
						type + "&" +
						receiver + "&" +
						cont + "&" +
						etcArray[0] + "&" +						// 채팅방
						"${principal.empVO.empId }" + "&" +
						"${principal.empVO.empProfile }" + "&" +		// 프로필 사진
						"${principal.empVO.empName}"
		)
	}else if(type=="receipt"){		// 접수 알림 보내기
// 		alert("접수 알림입니다.");
		webSocket.send(
			type + "&" +
			cont + "&" +
			etc
		)
	}
	
}
function fMessage() {
	let data = event.data;
	let dataArray = data.split("&");
	
	
	if(dataArray[0] == "alarm"){
		if(alarmBtn.getAttribute("aria-expanded") == 'true'){
			updateAlarmList(dataArray[1], dataArray[2]);
			checkAlarm();
		}else{
			document.querySelector("#alarmNotiDot").className = "noti-dot";
			
			let ddingClone = ddingDiv.cloneNode(true);
			ddingClone.getElementsByTagName("b")[0].innerHTML = "[ " + dataArray[1] + " ]";
			ddingClone.style.display="";
			ddingDivs.prepend(ddingClone);
			setTimeout(() => ddingClone.remove(), 2500);
		}
	}else if(dataArray[0] == "chat"){
		let state = chatNotiDot.parentElement.getAttribute("aria-expanded");
		if(state == "false"){
			chatNotiDot.className = "noti-dot";
			
			let ddingClone = ddingDiv.cloneNode(true);
			ddingClone.getElementsByTagName("b")[0].innerHTML = dataArray[4] + " : " + dataArray[1];
			ddingClone.style.display="";
			ddingDivs.prepend(ddingClone);
			setTimeout(() => ddingClone.remove(), 2500);
		}else{
			if(chatRoomDiv.style.display == "none"){
				
				let chatRoom = document.getElementById("chatRoom" + dataArray[3]);
				
				let today = getToday();
				
				if(today == dataArray[2].substring(0,10)){
					today = dataArray[2].substring(11,16);
				}else{
					today = dataArray[2].substring(0,10);
				}
				
				chatRoom.getElementsByTagName("p")[0].innerHTML = dataArray[1];
				chatRoom.getElementsByClassName("font-size-11")[0].innerHTML = today;
				chatRoom.getElementsByTagName("i")[0].className = "mdi mdi-circle align-middle font-size-10 me-2 text-danger";
				
			}else{
				if(chatForm.chRoomNm.value == dataArray[3]){
					makeChatClone(dataArray[4], dataArray[1], dataArray[5], dataArray[2]);
					chatRoomDiv.getElementsByTagName("ul")[1].lastChild.scrollIntoView();
				}else{
					chatNotiDot.className = "noti-dot";
				}
			}
		}
	}else if(dataArray[0] == "receipt"){		// 접수 알림 받기
// 		alert("접수 알림확인")
		appReceiptList()
		document.querySelector("#alarmNotiDot2").className = "noti-dot";
		countAppReceipt()

// 		var test = document.querySelector("#test").className = "col-lg-4 on_now_tag";
		
		/* 
		var test = document.querySelector("#test").cloneNode();
		test.id = "bomiBanJJack";
// 		test.innerHTML = "보미 보미";
		let needData = document.querySelector("#test").getBoundingClientRect(); 
// 		alert(needData.height);
		test.style.height = needData.height  - 20 + "px";
		test.style.width = needData.width  - 20 + "px";
		test.style.borderRadius = "5%";
		test.className = "col-lg-4 on_now_tag";
		test.style.position = "absolute";
		test.style.left = needData.left -290 + "px";
		test.style.top = needData.top + document.documentElement.scrollTop + -95 + "px";
		test.style.opacity = "0.3";
		
		document.querySelector("#test").parentElement.appendChild(test)
 */
		 
		 
		
		// 		alert(dataArray[1] + ", " + dataArray[2]);
	
	
	
	
	}
}

window.onresize = function(){

	
	var test = document.querySelector("#bomiBanJJack")
	if(test){
		let needData = document.querySelector("#test").getBoundingClientRect(); 
		test.style.height = needData.height  - 20 + "px";
		test.style.width = needData.width  - 20 + "px";
		test.style.borderRadius = "5%";
		test.style.position = "absolute";
		test.style.left = needData.left -290 + "px";
		test.style.top = needData.top + document.documentElement.scrollTop + -95 + "px";
		test.style.opacity = "0.3";		
	}
	

}

function disconnect() {
	webSocket.close();
}

const alarmCloneA = document.querySelector("#alarmCloneA");
const alarmsDivParent = document.querySelector("#alarmsDiv");
const alarmsDiv = alarmsDivParent.querySelectorAll(".simplebar-content");

function updateAlarmList(alarmContent, alarmType){

	let clone = alarmCloneA.cloneNode(true);
	clone.id = "";
	let cloneContent = clone.children[0].children[1];
	cloneContent.children[0].children[0].innerHTML = alarmType;
	cloneContent.children[0].children[1].innerHTML = alarmContent;
	cloneContent.children[1].children[1].innerHTML = "지금";
	clone.children[0].children[2].innerHTML = '<i class="mdi mdi-circle text-danger font-size-10"></i>';
	
	clone.style.display="";
// 	alert(alarmType);
	if(alarmType == "예약"){
		clone.getElementsByTagName("i")[0].className = "ri-calendar-check-fill";
		clone.getElementsByTagName("i")[1].className = "ri-calendar-check-fill";
	}
	
	
	alarmsDiv[0].prepend(clone);
	alarmsDiv[0].lastElementChild.remove();
}

alarmBtn.addEventListener("click", function(){
	document.querySelector("#alarmNotiDot").className = "";
	
	if(this.getAttribute("aria-expanded")){
		console.log("hi");
		$.ajax({
			method : "post",
			url : "/alarmList",
			dataType : "json",
			processData : false,
			success : function(rslt){
				alarmsDiv[0].innerHTML = "";
				
				for(let i = 0; i<rslt.length; i++){

					let clone = alarmCloneA.cloneNode(true);
					clone.id = "";
					let cloneContent = clone.children[0].children[1];
					cloneContent.children[0].children[0].innerHTML = rslt[i].alarmType;
					cloneContent.children[0].children[1].innerHTML = rslt[i].alarmCont;
					cloneContent.children[1].children[1].innerHTML = rslt[i].alarmDate;
					
					if(rslt[i].alarmCheck == 'N'){
						clone.children[0].children[2].innerHTML = '<i class="mdi mdi-circle text-danger font-size-10"></i>';
					}
					
					clone.style.display="";
					
					alarmsDiv[0].append(clone);
				}
				checkAlarm();
			}
		})
		
	}
})

function checkAlarm(){
	$.ajax({
		method : "post",
		url : "/checkAlarm",
		dataType : "json",
		processData : false,
		success : function(){
			alert("알람 체크 완료!");
		}
	})
}

function getToday(){
	let today = new Date();
	
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);
	today = year +"-"+ month +"-"+ day;
	
	return today;
}

chatBtn.addEventListener("click", function(){
	resetChatRoom();
	
	$.ajax({
		method : "post",
		url : "/emp/list",
		dataType : "json",
		processData : false,
		success : function(rslt){
			$.each(rslt, function(i,v){
				if(v.empId != "${principal.empVO.empId}"){
					let liClone = chatEmpLi.cloneNode(true);
					
					liClone.id = "chatEmp" + v.empId;
					liClone.getElementsByTagName("img")[0].setAttribute("src",v.empProfile);
					liClone.getElementsByTagName("h5")[0].innerHTML = v.empName + v.empJob;
					liClone.style.display="";
					
					if(v.empCurrent == "I"){
						liClone.getElementsByTagName("i")[0].className = "mdi mdi-circle text-success font-size-10";
						chatEmpUl.prepend(liClone);
					}else{
						chatEmpUl.append(liClone);
					}

				}
			})
		}
	});
	
	getChatRoomList();
})

// 채팅방들 초기화
function resetChatRoom(){
	chatNotiDot.className = "";
	chatEmpUl.innerHTML = "";
	chatRoomUl.innerHTML = "";
	chatRoomDiv.style.display = "none";
	chatRoomsDiv.style.display = "";
	chatRoomDiv.dataset.roomNm = "";
}

function getChatRoomList(){
	$.ajax({
		method : "post",
		url : "/chat/chatRoomList",
		dataType : "json",
		processData : false,
		success : function(rslt){
			$.each(rslt, function(i,v){
				let liClone = chatRoomLi.cloneNode(true);
				
				liClone.id = "chatRoom" + v.chRoomNm;
				liClone.getElementsByTagName("span")[0].innerHTML = v.chPersonnel;
				
				let empNames = "";
				let empIds = "";
				for(let j = 0; j<v.chatEmpList.length; j++){
					empIds += v.chatEmpList[j].empId + "_";
					if("${principal.empVO.empName }" != v.chatEmpList[j].empName){
						empNames += v.chatEmpList[j].empName + " ";
					}
				}
				
				let today = getToday();
				
				if(today == v.chDate.substring(0,10)){
					today = v.chDate.substring(11,16);
				}else{
					today = v.chDate.substring(0,10);
				}
				
				liClone.getElementsByTagName("h5")[0].innerHTML = empNames;
				if(v.chRoomName != "_"){
					liClone.getElementsByTagName("h5")[0].innerHTML = v.chRoomName;
				}
				liClone.getElementsByClassName("chRoomEmpsInput")[0].value = empIds;
				liClone.getElementsByTagName("p")[0].innerHTML = v.chCon;
				liClone.getElementsByClassName("font-size-11")[0].innerHTML = today;
				liClone.style.display="";
				
				chatRoomUl.append(liClone);
			})
		}
	});
}


function showChat(chRoomLi){
	chRoomNm = chRoomLi.id.replace("chatRoom", "");
	
	chatRoomsDiv.style.display = "none";
	chatRoomDiv.style.display = "";
	chatRoomDiv.dataset.roomNm = "";
	chatRoomDiv.getElementsByTagName("ul")[1].innerHTML = "";
	
	chatRoomDiv.getElementsByTagName("span")[0].innerHTML = chRoomLi.getElementsByTagName("h5")[0].innerHTML;	// 채팅방 이름
	
	chatRoomDiv.dataset.roomNm = chRoomNm;
	chatRoomDiv.dataset.emps = chRoomLi.getElementsByClassName("chRoomEmpsInput")[0].value;
	
	chatForm.chRoomNm.value = chRoomNm;
	chatForm.receiver.value = chRoomLi.getElementsByClassName("chRoomEmpsInput")[0].value;
	
	chRoomLi.getElementsByTagName("i")[0].className = "";
	
	$.ajax({
		method : "post",
		url : "/chat/chatContent",
		data : "chRoomNm="+chRoomNm,
		dataType : "json",
		processData : false,
		success : function(rslt){
			
			let today = "1999";
			$.each(rslt, function(i, v){
				if(v.emp_id != 'ALPHAVET-SERVER'){
					chatDay = v.chDate.substring(0,10);
					if(today != chatDay){
						let liClone = chatDateLi.cloneNode(true);
						liClone.getElementsByTagName("span")[0].innerHTML = chatDay;
						today = chatDay;
						if(chatDay == getToday()){
							liClone.getElementsByTagName("span")[0].innerText = "Today";
						}
						liClone.style.display = "";
						chatRoomDiv.getElementsByTagName("ul")[1].append(liClone);
					}
					makeChatClone(v.empName, v.chCon, v.empProfile, v.chDate);
				}
			})
			if(rslt.length > 2){
				chatRoomDiv.getElementsByTagName("ul")[1].lastChild.scrollIntoView();
			}
			
			let temp = document.querySelectorAll(".chat-conversation conversation-list arrow-left");
			for(let i =0; i < temp.length; i++){
				temp[i].style.top = "35px";
			}
		}
	})
	
}

function makeChatClone(empName, chCon, empProfile, chDate){
	let liClone = yourChatLi.cloneNode(true);
	liClone.getElementsByTagName("p")[0].innerHTML = empName;
	liClone.getElementsByTagName("img")[0].setAttribute("src",empProfile);
	
	if(empName == "${principal.empVO.empName}"){
		liClone = myChatLi.cloneNode(true);
	}
	liClone.getElementsByTagName("p")[1].innerHTML = chCon;
	
	liClone.getElementsByTagName("span")[0].innerHTML = chDate.substring(11,16);
	liClone.style.display = "";
	chatRoomDiv.getElementsByTagName("ul")[1].append(liClone);
}

goChatRoomsDiv.addEventListener("click", (e) => {
	chatRoomDiv.style.display = "none";
	chatRoomsDiv.style.display = "";
	chatRoomDiv.dataset.roomNm = "";
	chatRoomDiv.getElementsByTagName("ul")[1].innerHTML = "";
	
	chatNotiDot.className = "";
})

function sendChat(){
	$chatForm = $("#chatForm");
	let formData = new FormData($chatForm[0]);
	console.log(formData);	
	$.ajax({
		method : "post",
		url : "/chat/sendChat",
		data : formData,
		dataType : "json",
		contentType : false,
		processData : false,
		success : function(rslt){
			console.log(rslt);
			send(
					"chat", 		// 채팅
				 	rslt.receiver, 	// 받는 사람
				 	rslt.chCon + "_" + rslt.chDate, 	// 채팅 내용
				 	rslt.chRoomNm + "_" + rslt.empProfile	// 채팅방
				);	
			makeChatClone(rslt.empName, rslt.chCon, rslt.empProfile, rslt.chDate);
			
			chatRoomDiv.getElementsByTagName("ul")[1].lastChild.scrollIntoView();
			chatForm.chCon.value = "";
		}
	})
}

// const empNameInput = document.getElementById("searchEmp");
// const chatRoomInput = document.getElementById("searchChatRoom");

// 채팅방 만들기 버튼 클릭 시
const chatEmpsForm = document.chatEmpsForm;

const confirmChatEmpBtn = document.getElementById("confirmChatEmpBtn");
const cancleChatEmpBtn = document.getElementById("cancleChatEmpBtn");

function addChatRoomBtn(){
	chatEmpsForm.style.display="";
	chatRoomsDiv.getElementsByTagName("a")[1].click();
}

function selectChatEmp(a){
	if(chatEmpsForm.style.display=="none"){
		return false;
	}
	
	if(a.className == "btn btn-light waves-effect"){
		a.className = "";
	}else{
		a.className ="btn btn-light waves-effect";
	}
	
	let empId = a.parentElement.id.replace("chatEmp", "");
	let empsInput = chatEmpsForm.chatEmpId.value;	// 선택한 직원 id들
	
	if(empsInput.includes(empId+"_")){
		chatEmpsForm.chatEmpId.value = empsInput.replace(empId+"_" , "");
	}else{
		chatEmpsForm.chatEmpId.value += empId + "_";
	}
}

chatEmpsForm.addEventListener("submit", (e) =>{
	e.preventDefault();
	document.chatEmpsForm.chatEmpId.value += "${principal.empVO.empId}"
	console.log($("#chatEmpsForm").serialize());
	
	$.ajax({
		method : "post",
		url : "/chat/makeChatRoom",
		data : $("#chatEmpsForm").serialize(),
		dataType : "text",
// 		contentType : false,
		processData : false,
		success : function(rslt){
			chatBtn.click();
			setTimeout(() => chatBtn.click(), 10);
			setTimeout(() => showChat(chatRoomsDiv.getElementsByTagName("ul")[1].getElementsByTagName("li")[0]), 50);

			document.chatEmpsForm.chatEmpId.value = "";
			document.chatEmpsForm.chRoomName.value = "";
			document.chatEmpsForm.style.display = "none";
		}
	})
	
})

function alarmUncheckedCnt(){
	$.ajax({
		method : "post",
		url : "/alarmUncheckedCnt",
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		processData : false,
		success : function(rslt){
			console.log("rslt : " + rslt);
			if(rslt > 0){
				document.querySelector("#alarmNotiDot").className = "noti-dot";
			}
		}
	})
}

// function chatRoomsDiv(){
	
// }

// function searchChatRoomBtn(){
// 	if(chatRoomInput.style.display == "")
// 		chatRoomInput.style.display="none";
// 	}else{
// 		chatRoomInput.style.display="";
// 	}
// }

// chatRoomInput.addEventListener("keydown", (e) => {
// 	let roomName = chatRoomInput.value;
	
	
// })
// empNameInput.addEventListener("keydown", (e) => {
// 	let empName = empNameInput.value;
// 	console.log(empName);
// 	$.ajax({
// 		method : "post",
// 		url : "/emp/searchEmpName",
// 		data : "empName="+empName,
// 		dataType : "json",
// 		success : function(rslt){
// 		}
// 	})
// })



</script>
<style>
.on_now_tag{
    font-size: 14px;
    padding: 2px 10px;
    margin-left: -7px;
    font-weight: 500;
    z-index: 100;
    position: relative;
    display: inline-block;
/*     width: 100px; */
/*     height: 100px; */
    background-color: #FFFFE0;
    opacity : 0.3;
/*     border-radius: 50%; */
    margin-left: 3px;
    -webkit-animation:blink 1s ease-in-out infinite alternate;
}
/* .on_now_tag:after {
    content: "";
    display: inline-block;
    width: 100px;
    height: 100px;
    background-color: #fd183a;
    border-radius: 50%;
    margin-left: 3px;
    -webkit-animation:blink 1s ease-in-out infinite alternate;
    -moz-animation:blink 1s ease-in-out infinite alternate;
    animation:blink 1s ease-in-out infinite alternate;
} */
-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}

</style>
</html>
