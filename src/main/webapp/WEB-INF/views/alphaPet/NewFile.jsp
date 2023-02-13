<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

 <!-- Style CSS -->
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/app/css/style.css">
 <!-- Demo CSS (No Need to include it into your project) -->
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/app/css/demo.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0/all.min.css">

<style>
.mdi{
   zoom:1.0;
}

.aa{
   /*background-image: url("data:image/svg+xml,%3csvg width='100%25' height='100%25' xmlns='http://www.w3.org/2000/svg'%3e%3crect width='100%25' height='100%25' fill='none' rx='10' ry='10' stroke='black' stroke-width='5' stroke-dasharray='6%2c 14' stroke-dashoffset='51' stroke-linecap='square'/%3e%3c/svg%3e");
   border-radius: 10px;*/
}
#myPetImg{
   width: 50px;
   height: 50px;
}

#coverImg{
   width: 500px;
   height: 200px;
}

#plusImg{
   width: 50px;
   height: 50px;
}

#coverDiv{
   background-image: url("../../resources/images/appImg/catpuppy.PNG");
   background-size: 100% auto;
}

#contentDiv{
   position: relative;
   top: -45px;
   border-radius: 25px;
}

.tab-pane{
   position: relative;
   left: 10px;
   width: 505px;
}





#time{
    width: 50px;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
     margin: auto;
}

.date-time {
    width: 1px;
    padding: 10px;
    padding-right: 30px;
    padding-left: 30px;
    background-color: #e4efff8a;
    border-width: 10px;
    color: #445990;
    border-radius: 100px;
}

#time td[id = am], #time td[id = pm]{
   background-color: white;
   color: black;
}

.date-time.selected2{
   background-color : #d0dff58a;
}

.date-time.none{
   background-color: #f8f8f8;
   color: #ccc;
}

/* .offcanvas-bottom {
   height: 50vh;
} */

html, body {
   height: 100%;
    font-family: 'IBM Plex Sans KR', sans-serif;
}

.empStyle{
   font-size: 1.5em;
   font-weight: 500;
   padding-left: 20px;
}



</style>

<%String userId = (String)session.getAttribute("userId"); %>

<body>

<div class="tab-content text-muted">
   <!-- home메인 -->
   <div class="tab-pane active" id="homeTab2" role="tabpanel">
      <div id="homeDiv">
          <div class="card row" id="coverDiv">
             <div class = "card-body" style="height: 300px">
             </div>
          </div>
         <div class="card row" id="contentDiv">
            <div class="card-body">
            <div style="margin-bottom: 3%;">
                  <select class="form-select" aria-label="Default select example" id = "selectPet2" style="display:inline; width: 30%;"></select>
               <input type="button" class="btn btn-info waves-effect waves-light" style=" margin-left: 52.5%;" value="접수하기" id="appReceipt"> 
            </div>
               
               <div>
               </div> 
               
               
               
               <div id="accessList" class = "row">
               
               </div>
            </div>
         </div>
            <div class="appHome">
                 <%@ include file = "appPhoto.jsp" %>
            </div>
      </div>
      <!-- 병원인증 관련 -->
      <%@ include file = "clinicAccess.jsp" %>
   </div>
   <!-- 데일리케어 -->
   <div class="tab-pane" id="careTab2" role="tabpanel">
      <%@ include file = "dailyCareTab.jsp" %>
   </div>
   <!-- 컨텐츠 -->
   <div class="tab-pane" id="contentTab2" role="tabpanel">
      <%@ include file = "contentTab.jsp" %>
   </div>
   <!-- 예약 -->
   <div class="tab-pane" id="reservationTab2" role="tabpanel">
         <%@ include file = "appReservation.jsp" %>
   </div>
</div>

</body>
<script>
   const userId = `${userId}`
   const resDivHtml = $("#resDiv").html()

   // 웹소켓 연결 부분 시작
   $(function() {
      connect();
   })
   let webSocket;

   function connect() {
      webSocket = new WebSocket("ws://" + window.location.host
            + "${pageContext.request.contextPath}/alarm"); // End Point
      webSocket.onopen = fOpen;
      webSocket.onmessage = fMessage;
   }
   function fOpen() {
      //    alert("연결됨!");
   }
   function send(type, receiver, cont, etc) { // 소켓 메세지 보내는 부분
      console.log("send: " + type + "&" + receiver + "&" + cont + "&" + etc);
      if (type == "alarm") { // 알람일 때
         webSocket.send(
               type + "&" + 
               receiver + "&" + 
               cont + "&" + 
               etc + "&" +                // 알람 Type
               "h001"
        );
      } else if (type == "chat") { // 채팅일 때

      } else if (type == "receipt") { // 접수 알림 보내기
      //       alert("접수 알림입니다.");
         webSocket.send(type + "&" + cont + "&" + etc)
      }
   }
   function fMessage() {
      let data = event.data;
      let dataArray = data.split("&");

      if (dataArray[0] == "alarm") {

      } else if (dataArray[0] == "chat") {

      } else if (dataArray[0] == "receipt") { // 접수 알림 받기

      }
   }
   function disconnect() {
      webSocket.close();
   }
   //웹소켓 연결 부분 끝

   $(function() {
      var homeDiv = document.querySelector("#homeDiv")
      var clinicDiv = document.querySelector("#clinicDiv")
      var clinicAccessBtn = document.querySelector("#clinicAccessBtn")
      var clinicStr = "";
      var homeSelectStr = "";

      var accessList = document.querySelector("#accessList") //인증 리스트

      var clinic = document.querySelectorAll(".clinic") //병원 리스트들
      var clinicInfo = document.querySelector("#clinicInfo") //병원 디테일

      var showDiv = document.querySelector("#showDiv") //인증 화면

      var nextBtn = document.querySelector("#nextBtn") //인증 마지막 페이지 버튼
      var memName = document.querySelector("#memName") //입력 값들
      var memTel = document.querySelector("#memTel") //입력 값들

      var careTab = document.querySelector("#careTeb") //데일리 케어 탭
      var allList = document.querySelector("#allList") //전체
      var medicList = document.querySelector("#medicList") //내원
      var vaccineList = document.querySelector("#vaccineList") //백신
      var stayList = document.querySelector("#stayList") //입원
      var careStr = "";

      accessPetList();

      $("#coverPlus").on("click", function() {
         alert("d")
      })
      
    
   //병원 리스트
      $(document).on('click', '#clinicAccessBtn', function() {
         clinicList();
      })

      //병원 디테일
      $(document).on('click', '.clinic', function() {
         $.ajax({
             url : "/selectClinic",
             type : "post",
             data : {
                cliCd : $(this).attr("id")
             },
             dataType : "json",
             success : function(clinicVO) {
                console.log(clinicVO)
                $(clinicDiv).css("display", "none")
                $(clinicInfo).css("display", "")

                clinicStr = "";
                clinicStr += "<div class='card-body' align='center'>"
                clinicStr += "<img class='logo logoLogin' src='${pageContext.request.contextPath }/resources/images/appImg/alphaPet.png' width='200px' />"
                clinicStr += "<h4>동물 병원 인증</h4></div>";
                clinicStr += "<div class = 'card overflow-hidden card-h-100'><img src = ''></div>"
                clinicStr += "<div class = 'card-body'>"
                clinicStr += "<h4 name = 'cliCd' id = '" + clinicVO.cliCd + "'>"
                      + clinicVO.cliName + "</h4>";
                clinicStr += "<h5>전화 "
                      + clinicVO.cliTel + "</h5>"
                clinicStr += "<h5>주소 "
                      + clinicVO.cliAddr1 + ""
                      + clinicVO.cliAddr2
                      + "</h5>";
                clinicStr += "<button id = 'clnicChoice' type = 'button' class = 'btn btn-info btn-rounded waves-effect waves-light'>동물병원 인증</button>"
                clinicStr += "<hr class = 'my-4'>"
                clinicStr += "<h5>공지 사항</h5>"
                clinicStr += "<h5>병원 소개</h5>"
                clinicStr += "<h5>운영 시간</h5>"
                clinicStr += "</div>"

                $(clinicInfo).html(clinicStr)
             }
          })
      })

      //동물병원 인증
      $(document).on('click', '#clnicChoice', function() {
          Swal.fire({
             title: '병원 인증을 진행 하시겠습니까?',
             
             showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
             confirmButtonText: '진행', // confirm 버튼 텍스트 지정
             cancelButtonText: '취소', // cancel 버튼 텍스트 지정
             }).then(result =>{
                if (result.isConfirmed) {         
            $(clinicInfo).css("display", "none")
            $(showDiv).css("display", "")

            $(".previous").trigger('click');
            $(showDiv).attr("name", $("p[name = 'cliCd']").attr("id"))
         }
         
         })
         
      })

      //병원 인증 !!!
      $(nextBtn).on("click",function() {
         $.ajax({
            url : "/isMember",
            type : "post",
            dataType : "json",
            data : {
               memName : $("#memName").val(),
               memTel : $("#memTel").val(),
               cliCd : $(showDiv).attr("name"),
               userId : `${userId}`
            },
            success : function(isMember) {
               clinicStr = ""
               if (isMember.length == 0) { //인증 불가
                  clinicStr += '<i class="mdi mdi-alert-circle-outline text-warning display-4"></i>'
                  clinicStr += '<h4>병원 인증 불가 안내</h4><br>'
                  clinicStr += '<h5>해당 동물병원에 회원님의 휴대전화 번호가 등록되어 있지 않습니다.</h5>'
                  clinicStr += '<h5><b>내원/진료 내역</b>이 있으신 경우,</h5>'
                  clinicStr += '<h5>동물병원에 문의하여 고객님의 <b>전화번호 등록을 요청</b>해주세요.</h5>'

                  $("#nextBtn").css("display",
                        "none")
                  $("#resBtn").css("display", "")
                  $("#resBtn").attr("class", "next")
                  $("#resBtn button").text("닫기")
               } else { //인증 완료
                  clinicStr += "<div class='mb-4'>";
                  clinicStr += "   <i class='mdi mdi-check-circle-outline text-success display-4'></i>";
                  clinicStr += "</div>";
                  clinicStr += "<div>";
                  clinicStr += "   <h5>인증이 완료되었습니다</h5>";
                  clinicStr += "   <p class='text-muted'></h5>";
                  clinicStr += "</div>";

                  $("#nextBtn").css("display",
                        "none")
                  $("#resBtn").css("display", "")
                  $("#resBtn").attr("class", "next")
                  $("#resBtn button").text("완료")
               }

               $("#resultDiv").html(clinicStr)
            }
         })
      })

      $("#resBtn button").on("click", function() {
         if ($("#resBtn button").text() == "닫기") {
            $("#nextBtn").css("display", "")
            $("#resBtn").css("display", "none")

            $(showDiv).css("display", "none")
            $(homeDiv).css("display", "none")
            $(clinicDiv).css("display", "")
            clinicList();
         } else {
            $("#nextBtn").css("display", "")
            $("#resBtn").css("display", "none")

            $(showDiv).css("display", "none")
            $(homeDiv).css("display", "")
            accessPetList();
         }
      })

      var selectId; //환자Id
      var selectCd; //병원Cd
      var homeTab = document.querySelector("#homeTab")
      var selectPet = document.querySelector("#selectPet")
      var selectPet2 = document.querySelector("#selectPet2")

      $(homeTab).on("click", function() {
         $("#clinicDiv").css("display", "none");        
         $("#showDiv").css("display", "none");        
         $("#clinicInfo").css("display", "none");        
         $(homeDiv).css("display", "")
         
         selectId = $("#selectPet2 option:selected").attr("data-patId");
         hospitalSelect(selectId);
      })

      $(selectPet2).on("change", function() {
         selectId = $("#selectPet2 option:selected").attr("data-patId");
         hospitalSelect(selectId);
      })

      //데일리 케어 선택
      $("#careTab").on("click", function() {
         $("#careMain").css("display", "");
         $("#stayDetailDiv").css("display", "none");
         $("#vaccineDetailDiv").css("display", "none");

         console.log($("#selectPet option:selected").attr("data-patId"));
         console.log($("#selectPet option:selected").attr("data-cliCd"));

         selectId = $("#selectPet option:selected").attr("data-patId")
         selectCd = $("#selectPet option:selected").attr("data-cliCd")

         carePraList(selectId, selectCd) //진료 리스트
         careVaccineList(selectId, selectCd) //백신 리스트
         careStayList(selectId, selectCd) //입원 리스트
      })

      //데일리 케어 동물 변경
      $(selectPet).on("change", function() {
         selectId = $("option:selected", this).attr("data-patId");
         selectCd = $("option:selected", this).attr("data-cliCd");

         carePraList(selectId, selectCd) //진료 리스트
         careVaccineList(selectId, selectCd) //백신 리스트
         careStayList(selectId, selectCd) //입원 리스트
      })

      //var vaccineDetailDiv = document.querySelector("#vaccineDetailDiv");
      var stayDetailDiv = document.querySelector("#stayDetailDiv");
      var detailStr = "";
      var detailStr2 = "";
      var detailPriceStr = "";

      var selectStCd = "";

      var selectPetId;
      var selectVdNm;
      var selectDate;

      //백신 상세
      $(document).on('click', ".vaccineListDiv", function() {
         console.log("patId :: " + $(this).children("#patId").text())
         console.log("vdNm :: " + $(this).children("#vdNm").text())

         selectDate = $(this).children("#vaccineDate").text();
         selectPetId = $(this).children("#patId").text();
         selectVdNm = $(this).children("#vdNm").text();

         vaccineDetail(selectPetId, selectVdNm, selectDate)
      })

      var foodPriceTotal = 0;
      var stPriceTotal = 0;
      var stTotal = 0;

      //입원 상세
      $(document).on('click', ".stayListDiv", function() {
         selectStCd = $(this).children("#stCd").text();
         stayDetail(selectStCd);
      })

      var boardStr = "";
      var careTab = document.querySelector("#careTab")
      var stayDetailBack = document.querySelector("#stayDetailBack")
      var vaccineDetailBack = document.querySelector("#vaccineDetailBack")
      
      //컨텐츠 Tab
      $(contentTab).on("click", function() {
         petContentList();
      })

      $(stayDetailBack).on("click", function() {
         $(careTab).trigger("click");
      })

      $(vaccineDetailBack).on("click", function() {
         $(careTab).trigger("click");
      })
      
      
     $(document).on('click', "#boardDetail", function() { 
         //$("#boardDetail").on("click", function(){
      $("#boardList").css("display", "none");
      $("#boardDetailDiv").css("display", "");
      
      var path = $(this).attr("data-path")
      
      careStr = "";
      
      careStr += '<iframe id="inlineFrameExample" title="Inline Frame Example"';
      careStr += '   width="100%" height="650px"                                ';
      careStr += '   src= "' + path + '">                             ';
      careStr += '</iframe>';
      
      $("#boardDetailDiv").html(careStr)
      })
      
     $("#boardDetailBack").on('click', function() {
        $("#boardList").css("display", "");
        $("#boardDetailDiv *").remove();
     })     
        
      var selAnimalCd = ""
      var empId = ""
      var resDate = ""
      
      var dateStr = ""
      var resStr = ""
      var dateTime = ""
      
      var selDate = ""
      var animalSelect = document.querySelector("#animalSelect")
      
      var reservationTab = document.querySelector("#reservationTab")
      
      $(reservationTab).on("click", function() {
         selectId = $("#selectPet3 option:selected").attr("data-patId");
         reservationMyList(selectId)
      })
      
      //진료과(animalCd) 선택
      $(animalSelect).on("change", function() {
         selAnimalCd = $("#animalSelect option:selected").val();
         empList(selAnimalCd);
      })
      
      //의사 선택
      $(document).on('click', '#emp', function(){
         empId = $(this).children("#empId").text()
         var empName =   $(this).children("#empInfo").children("#empName").text()
         var empJob = $(this).children("#empInfo").children("#empJob").text()
         
         dateStr = ""
         dateStr += empName + empJob
         $("#empSelect").html(dateStr)
         
         $("#accordion-emp").trigger("click");
         setTimeout(() => $("#accordion-date").trigger("click"), 500);
      })
      
      var dateSelect = document.querySelector("#dateSelect");
      
      //달력 날짜 선택
      $(document).on('click', '.date-picker', function(){ 
          
         if($(this).attr("class") == "date-picker none"){
           Swal.fire({
              icon: 'error',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
              title: '예약 가능한 날짜가 아닙니다.',
              text: '날짜를 다시 선택해주세요.'
           });            
              return false;
           }
         
         
      
         $(".selected").attr("class", "date-picker")
         $(this).attr("class", "date-picker selected")
         
         var dateYear = $(this).attr("data-year")
         var dateMonth = $(this).attr("data-month")
         var dateDate = $(this).attr("data-date")
                  
         dateStr = ""
         
         for(i = 1; i<10; i++){
            if(dateMonth == i+""){
               dateMonth = "0" + i
            }
            if(dateDate == i+""){
               dateDate = "0" + i
            }
         }
         
         dateStr += dateYear + "-" + dateMonth + "-" + dateDate
         
         $(dateSelect).html(dateStr)
                  
         selDate = $(dateSelect).text();
         reservationList(empId, selDate);
         
         $("#accordion-date").trigger("click");
         setTimeout(() => $("#accordion-clock").trigger("click"), 500);
                  
      })
      
      var timeSelect = document.querySelector("#timeSelect");
      var submitBtn = document.querySelector("#submitBtn");
      
      //시간선택
      $(document).on('click', '.date-time', function(){
        if(empId == ""){
              Swal.fire({
            title: '예약 세부 사항을 먼저 진행해주세요.'
            });
            $("#accordion-clock").trigger("click")
            setTimeout(() => $("#accordion-emp").trigger("click"), 500);
            return false;
         }
         
          if(selDate == ""){
              Swal.fire({
            title: '날짜를 먼저 선택해주세요.'
            });
            $("#accordion-clock").trigger("click")
            setTimeout(() => $("#accordion-date").trigger("click"), 500);
            return false;
         }
       
         $(".selected2").attr("class", "date-time");
         
         
         if($(this).attr("class") == "date-time none"){
         Swal.fire({
            icon: 'error',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
            title: '예약 가능한 시간이 아닙니다.',
            text: '시간을 다시 선택해주세요.'
         });            
            return false;
         }
         
         if($(this).attr("class") == "date-time"){
            $(this).attr("class", "date-time selected2")            
         }
         
         
         
         dateTime = $(this).text()
         
         dateStr = ""
         dateStr += dateTime
       
         $(timeSelect).html(dateStr)
      })
      
      $(submitBtn).on("click", function(){
         if(empId == ""){
            Swal.fire({
             title: '예약 세부 사항을 먼저 진행해주세요.'
          });
            $("#accordion-clock").trigger("click")
            setTimeout(() => $("#accordion-emp").trigger("click"), 500);
            return false;
         }
         
         selectId = $("#selectPet3 option:selected").attr("data-patId");
         selResStartDate = selDate + " " + dateTime + ":00";
         
         reservationInsert(empId, selectId, selResStartDate)
      })
      
      
      //    지현이지현이지현이지현이지현이지현이지현이지현이지현이지현이지현이지현이
      
      var appReceipt = document.querySelector("#appReceipt");
      
      $(appReceipt).on("click", function() {
         //       selectId : 선택된 동물의 아이디 
         $.ajax({ //appreceipt 테이블에 넣음
            url : "/checkReceipt",
            type : "post",
            data : {
               patId : selectId
            },
            dateType : "text",
            success : function(data) {
               console.log("appReceipt", data)
               if (data == "0") {
                  Swal.fire({
                     title : "이미 접수 신청되었습니다.",
                     icon : "warning",
                     confirmButtonColor : '#3085d6',
                     confirmButtonText : '확인',
                     backdrop : true,
                  })
               } else {
                  Swal.fire({
                     title : "접수 신청이 완료되었습니다.",
                     icon : "success",
                     confirmButtonColor : '#3085d6',
                     confirmButtonText : '확인',
                     backdrop : true,
                  })
                  sendMessageAlram()
               }

            },
            error : function(request, status, error) {
               console.log("paymentInsert:" + request.status
                     + "\n" + "message:" + request.responseText
                     + "\n" + "error:" + error);
            }
         })
      })

   })

   //소켓
   function sendMessageAlram() {
      send("receipt", // 전송 타입(알람/채팅)
      "받는사람", // 받는 사람(알림 받는 사람)
      "알림타입", // 알림 타입(예약/댓글 등)
      "알림내용" // 알림 내용
      );
   }
 
   //병원 리스트
   function clinicList() {
      $.ajax({
         url : "/clinicList",
         type : "post",
         success : function(clinicList) {
            $(homeDiv).css("display", "none")
            $(clinicDiv).css("display", "")
            console.log(clinicList)
            clinicStr = "";
         
            
            clinicStr += "<div class='card-body' align='center'>"
            clinicStr += "<img class='logo logoLogin' src='${pageContext.request.contextPath }/resources/images/appImg/alphaPet.png' width='200px' />"
            clinicStr += "<h4>동물 병원 인증</h4></div>"
            clinicStr += "</br>"
            clinicStr += "<div class='search-box chat-search-box pb-4'>"
            clinicStr += "<div class='position-relative'>"
            clinicStr += "<input type='text' class='form-control' placeholder='alphaPet 병원차트 사용 병원만 검색가능'>"
            clinicStr += "<i class='mdi mdi-magnify search-icon'></i>"
            clinicStr += "</div>"
            clinicStr += "</div>"
            clinicStr += "<hr class = 'my-4'>"

            $.each(clinicList,function(i, v) {
               clinicStr += "<div class = 'card clinic' id = '" + v.cliCd + "'>"
               clinicStr += "   <div class = 'row'>"
               clinicStr += "      <div class = 'card-body col-md-6'>"
               clinicStr += "         <h5>" + v.cliName + "</h5>"
               clinicStr += "      </div>"
               clinicStr += "      <div class = 'card-body col-md-2'>"
               clinicStr += "         <h5>></h5>"
               clinicStr += "      </div>"
               clinicStr += "   </div>"
               clinicStr += "</div>"
            })

            $(clinicDiv).html(clinicStr)
         }
      })
   }

   //병원 디테일
   function hospitalSelect(patId) {
      if (patId == null) {
         console.log("adasdsadsa")
         clinicStr = "";
         clinicStr += "<div class = 'card col-md-6'>"
         clinicStr += "   <div class = 'card-body'>"
         clinicStr += "   <div align='center' class = 'card-body' id = 'clinicAccessBtn'>"
         clinicStr += "      <a><img src='${pageContext.request.contextPath }/resources/images/app/dogFace.png' style='width: 60px;'></a>"
         clinicStr += "      <h5> <b>+</b> 동물병원 인증하기</h5>";
         clinicStr += "   </div>"
         clinicStr += "   </div>"
         clinicStr += "</div>"

         $("#accessList").html(clinicStr)
         return;
      }

      $.ajax({
         url : "/hospitalSelect",
         type : "post",
         data : {
            patId : patId
         },
         dataType : "json",
         success : function(clinicList) {
            console.log("dsadaa : ", clinicList)
            clinicStr = "";

            $.each(clinicList, function(i, v) {
               clinicStr += "<div class = 'card col-md-6'>"
               clinicStr += "<div class = 'card-body'>"
               clinicStr += "   <h4><a><img src='${pageContext.request.contextPath }/resources/images/app/vetvet.png' style='width: 20px;'></a>  " + v.cliName + "</h4>";
               clinicStr += "   <div style='padding-left: 20px;'>";
               clinicStr += "   <h5><b>[진료]</b>" + v.praCon + "</h5>";
               clinicStr += "   <h5 class = 'card-title-desc'>" + v.praDate + "</h5>";
               clinicStr += "</div></div>"
               clinicStr += "</div>"
            })

            clinicStr += "<div class = 'card col-md-6'>"
            clinicStr += "   <div align='center' class = 'card-body' id = 'clinicAccessBtn'>"
            clinicStr += "      <a><img src='${pageContext.request.contextPath }/resources/images/app/dogFace.png' style='width: 60px;'></a>"
            clinicStr += "      <h5> <b>+</b> 동물병원 인증하기</h5>";
            clinicStr += "   </div>"
            clinicStr += "</div>"

            $("#accessList").html(clinicStr)
         }
      })
   }

   //로그인 한 회원의 인증된 환자
   function accessPetList() {
      $.ajax({
         url : "/accessPetList",
         type : "post",
         dataType : "json",
         data : {
            userId : `${userId }`
         },
         success : function(accessList) {
            console.log(accessList)

            $(homeDiv).css("display", "")
            $("#menuBar").css("display", "")

            homeSelectStr = "";
            careStr = "";
            dateStr = "";
            resStr = "";
         
            console.log("accessList 없음??", accessList)
            
            if (accessList.length == 0) {
               
               $("#resDiv").css("display", "none")   
               $("#resDiv2").css("display", "")   
               
               homeSelectStr += "<option>인증필요</option>"
               careStr += "<option>인증필요</option>"
               dateStr += "<option>인증필요</option>"

               resStr += "<h4 style = 'text-align: center;'>현재 인증된 병원이 없습니다.</h4>"
               resStr += "<h5 id = 'accessBtn' class = 'card-title-desc' style = 'text-align: center;' >병원 인증하기</h5>"
               
               
               $(selectPet).html(careStr)
               $(selectPet2).html(homeSelectStr)
               $(selectPet3).html(dateStr)
               $("#resDiv2").html(resStr)
               
               $(homeTab).trigger("click");
               return;
            }
            
            $("#resDiv").css("display", "")
            $("#resDiv2").css("display", "none")   
            
            $.each(accessList,function(i, v) {
               //mainHome 화면 accessList에 뿌릴것
               homeSelectStr += "<option id = 'patName' value='" + v.patName + "' data-patId = '"+ v.patId +"' data-cliCd = '"+ v.cliCd +"'>"
                     + v.patName + "</option>";

               //데일리케어 안에 동물선택
               careStr += "<option id = 'patName' value='" + v.patName + "' data-patId = '"+ v.patId +"' data-cliCd = '"+ v.cliCd +"'>"
                     + v.patName + "</option>";

               //예약 안에 동물선택
               dateStr += "<option id = 'patName' value='" + v.patName + "' data-patId = '"+ v.patId +"' data-cliCd = '"+ v.cliCd +"'>"
                     + v.patName + "</option>";
            })

            $(selectPet).html(careStr)
            $(selectPet2).html(homeSelectStr)
            $("#selectPet3").html(dateStr)

            $(homeTab).trigger("click");
         }
      })
   }

   //진료 내역
   function carePraList(patId, cliCd) {
      $.ajax({
         url : "/carePraList",
         type : "post",
         data : {
            patId : patId,
            cliCd : cliCd
         },
         dataType : "json",
         async : false,
         success : function(praList) {
            console.log("praList", praList)
         
            careStr = ""

            if (praList.length != 0) {
               for (let i = 0; i < praList.length; i++) {
                  careStr += "<div>";
                  careStr += "<h5>[내원]" + praList[i].praCon
                        + "</b></h5>";
                  careStr += "<h5 class = 'card-title-desc'>" + praList[i].praDate2.substring(0, 10) + "</b></h5>";
                  careStr += "</div>";
               }
               $("#medicList").html(careStr);
               $("#allList").html(careStr);

            } else {
//                   careStr += "<h5>진료 내역이 없습니다.</h5>";
                    careStr += "   <div align='center' class = 'card-body''>"
                   careStr += "      <a><img src='${pageContext.request.contextPath }/resources/images/app/dogFace.png' style='width: 80px;'></a>"
                   careStr += "      <h5>진료 내역이 없습니다.</h5>"
                   careStr += "   </div>"
            
               $("#allList").html(careStr);
               $("#medicList").html(careStr);
            }
         }
      })
   }

   //백신 내역
   function careVaccineList(patId, cliCd) {
      $.ajax({
         url : "/careVaccineList",
         type : "post",
         data : {
            patId : patId,
            cliCd : cliCd
         },
         dataType : "json",
         async : false,
         success : function(vaccineList) {
            console.log(vaccineList)
            careStr = ""

            if (vaccineList.length != 0) {
               for (let i = 0; i < vaccineList.length; i++) {
                  careStr += "<div class = 'vaccineListDiv'>";
                  careStr += "<h5>[백신]" + vaccineList[i].vaccineName
                        + vaccineList[i].vaccineCount + "회차 </b></h5>";
                  careStr += "<h5 class = 'card-title-desc' id = 'vaccineDate'>"
                        + vaccineList[i].vaccineDate + "</h5>";
                  careStr += "<p id = 'vdNm' style = 'display:none'>"
                        + vaccineList[i].vdNm + "</h5>";
                  careStr += "<p id = 'patId' style = 'display:none'>"
                        + vaccineList[i].patId + "</h5>";
                  careStr += "</div>";
               }
               $("#vaccineList").html(careStr)
               $("#allList").append(careStr)

            } else {
//                $("#vaccineList").html("<h5>진료 내역이 없습니다.</h5>")
               $("#vaccineList").html("<div align='center' class = 'card-body''><a><img src='${pageContext.request.contextPath }/resources/images/app/playDog.png' style='margin-top: 10%; width: 200px;'></a><h3 style='margin-bottom: 20%;'><b>진료 내역</b>이 없습니다.</h3></div>")
            }
         }
      })
   }

   //백신 상세
   function vaccineDetail(selectPatId, selectVdNm, selectDate) {
      console.log("vaccineDetail", selectPatId, selectVdNm, selectDate)

      $("#careMain").css("display", "none");
      $("#vaccineDetailDiv").css("display", "");

      $.ajax({
         url : "/vaccineDetail",
         type : "post",
         data : {
            patId : selectPatId,
            vdNm : selectVdNm
         },
         dataType : "json",
         success : function(vaccineDetail) {
            console.log("vaccineDetailList!!!! ", vaccineDetail)
            detailStr = "";
            detailStr += "<div class = 'card-body'>";
            detailStr += "<h5 class = 'card-title-desc'>"+ selectDate +"</h5>";
            detailStr += "<h5>" + vaccineDetail[0].vdName + vaccineDetail[0].vdType
                  + (vaccineDetail[0].vdCnt) + "차" + "</h5>";
            
            detailStr += "<h5> ---- </h5>";
            detailStr += "<h5>다음 접종일 : " + vaccineDetail[1].vdName
                  + vaccineDetail[1].vdCnt + "차 ("
                  + vaccineDetail[1].nextDay + ")</h5>";
            detailStr += "<h5>" + vaccineDetail[1].vdCon + "</h5>";
            detailStr += "<h5>금액 : "+ vaccineDetail[1].vdPrice +"</h5>";
            detailStr += "</div>";

            $("#vaccineDetailDiv2").html(detailStr)

         }
      })

   }

   //입원 내역
   function careStayList(patId, cliCd) {
      $.ajax({
         url : "/careStayList",
         type : "post",
         data : {
            patId : patId,
            cliCd : cliCd
         },
         dataType : "json",
         async : false,
         success : function(stayList) {
            console.log(stayList)
            careStr = ""

            if (stayList.length != 0) {
               for (let i = 0; i < stayList.length; i++) {
                  if (stayList[i].stEndDate = 'undefined') {
                     careStr += "<div class = 'stayListDiv'>";
                     careStr += "<h5>[입원]진료내역</b></h5>";
                     careStr += "<h5 class = 'card-title-desc'>" + stayList[i].stStartDate
                           + " ~ </h5>";
                     careStr += "<p id = 'stCd' style = 'display:none'>"
                           + stayList[i].stCd + "</h5>";
                     careStr += "</div>";
                  } else {
                     careStr += "<div class = 'stayListDiv'>";
                     careStr += "<h5>[입원]진료내역</b></h5>";
                     careStr += "<h5>" + stayList[i].stStartDate
                           + " ~ " + stayList[i].stEndDate
                           + "</b></h5>";
                     careStr += "<p id = 'stCd' style = 'display:none'>"
                           + stayList[i].stCd + "</h5>";
                     careStr += "</div>";
                  }
               }
               $("#stayList").html(careStr)
               $("#allList").append(careStr)

            } else {
//                $("#stayList").html("<h5>진료 내역이 없습니다.</h5>")
               $("#stayList").html("<div align='center' class = 'card-body''><a><img src='${pageContext.request.contextPath }/resources/images/app/dogFace.png' style='width: 80px;'></a><h5>진료 내역이 없습니다.</h5></div>")
            }
         }
      })
   }

   //입원상세
   function stayDetail(stCd) {
      $.ajax({
          url : "/stayDetail",
          type : "post",
          data : {
             stCd : stCd
          },
          dataType : "json",
          success : function(stayDetailList) {
             detailStr = "";
             detailPriceStr = "";

             stPriceTotal = 0;
             foodPriceTotal = 0;
             stTotal = 0;

             console.log("stayDetailList", stayDetailList)
             $("#careMain").css("display", "none");
             $("#stayDetailDiv").css("display", "");

             if (stayDetailList.length == 1) {
                $("#carouselExampleInterval button").css("display",
                      "none")
             }

             //날짜
             $.each(stayDetailList, function(i, v) {
                detailStr += "<div id = '" + (i + 1)+ "day' class='carousel-item' data-bs-interval='50000'>";
                detailStr += "   <div class='d-flex mt-4'>"
                detailStr += "      <div class='flex-grow-1 ms-3'>"
                detailStr += "         <h5>--" + (i + 1) + "일차("+ v.snDate + ")--</b></h5>";
                detailStr += "         <h5>체온 : " + v.snTempState + "</b></h5>";
                detailStr += "         <h5>건강상태 : " + v.snHealthState + "</b></h5>";
                detailStr += "         <h5>배변상태 : " + v.snPooState + "</b></h5>";
                detailStr += "         <h5>특이사항 : " + v.snSpecal + "</b></h5>";
                detailStr += "         <h5>내용 : " + v.snCon + "</b></h5>";
                detailStr += "         <br>";
                detailStr += "      </div>";
                detailStr += "   </div>";
                detailStr += "</div>";

                stPriceTotal += v.stPrice
                foodPriceTotal = v.stFoodTotal
             })

             //금액
             stTotal = stPriceTotal + foodPriceTotal

             detailPriceStr += "<div class = 'card row'>";
             detailPriceStr += "<div class = 'card-body'>";
             detailPriceStr += "<h5>누적 입원 비용 : " + stPriceTotal + "원</b></h5>";
             detailPriceStr += "<h5>누적 식비 : " + foodPriceTotal + "원</b></h5>";
             detailPriceStr += "<h5> 합 계  : " + stTotal + "원</b></h5>";
             detailPriceStr += "<div>";
             detailPriceStr += "<div>";

             $("#stayOneDay").html(detailStr)
             $("#stayPrice").html(detailPriceStr)

             $("#1day").attr("class", "carousel-item active")
          }
       })
   }
   
   //펫과사전
   function petContentList() {
      $.ajax({
         url : "/app/boardList",
         type : "post",
         dataType : "json",
         success : function(boardList) {
            console.log(boardList)
            boardStr = ""
            $.each(boardList, function(i, v) {
               boardStr += "<div class = 'card-body col-md-6 petCon1'><hr>";
               boardStr += "   <div align='center'><a id = 'boardDetail' data-path ='/contentRead?abNm="+ v.abNm +"'>";
               boardStr += "      <img class='appImg' src='${pageContext.request.contextPath }/resources/images/petBoard/"+ v.abImg +"'>";
               boardStr += "   </a>";
               boardStr += "   <br>";
               boardStr += "   <div align='left' style='padding-left: 10px; padding-right: 10px; margin-top: 10px;'><h7>알파벳</h7>";
               boardStr += "   <h5><b>" + v.abTitle + "</b></h5></div></div>";
               boardStr += "</div>";
            });

            $("#boardList").html(boardStr)
         }
      })
   }
   
   function empList(selAnimalCd){
      console.log(selAnimalCd)
      $.ajax({
         url : "/app/empList",
         type : "post",
         dataType : "json",
         data : { 
            animalCd : selAnimalCd
         },
         success : function(empList){
            console.log("empList", empList)
            dateStr = "";
            $.each(empList, function(i, v){
               dateStr += "<div id = 'emp' class = 'row col-md-12' style = 'margin:10px;'>";
               dateStr += "   <span id = 'empId' style = 'display:none;'>"+ v.empId +"</span>";
               dateStr += "   <div class = 'col-md-1'></div>";
               dateStr += "   <div id = 'empInfo' class = 'col-md-11'>";
               dateStr += '   <img class="col-md-6 rounded-circle img-thumbnail avatar-md" src="${pageContext.request.contextPath }'+ v.empProfile + '">';
               dateStr += "      <span id = 'empJob' class='empStyle'>"+ v.empJob + "</span>";
               dateStr += "      <span id = 'empName' class='empStyle'><b>"+ v.empName + "</b></span>";
               dateStr += "   </div>";
               //dateStr += "   <h5>"+ v.animalCd + "</h5>"
               dateStr += "</div>";
//                dateStr += "<tr id = 'emp' style='margin-bottom: 10px;'><td id = 'empId' style = 'display:none;'>"+ v.empId +"</td>";
//                dateStr += "<td><img src='${pageContext.request.contextPath }"+v.empProfile + "' class='rounded-circle img-thumbnail avatar-sm'/></td>";
//                dateStr += "<td id = 'empJob'>"+ v.empJob + "</td>";
//                dateStr += "<td id = 'empName'>"+ v.empName + "</td>";
//                dateStr += "</tr>";
               
            })
            $("#empListDiv").html(dateStr);
         }
      })
   }
   
   function reservationList(selEmpId, selDate){
      console.log(selEmpId)
      $.ajax({
         url : "/app/reservationList",
         type : "post",
         data : {empId : selEmpId},
         dataType : "json",
         success : function(reservationList){
            console.log("reservationList", reservationList)
            console.log("내가 선택한 날짜", selDate)
            var timeTd = document.querySelectorAll('.date-time');
            
            $.each(reservationList, function(i, v){
               console.log("예약 된 날짜", selDate, v.resStartDate.substring(0, 10))               
               console.log(selDate == v.resStartDate.substring(0, 10))
               if(selDate == v.resStartDate.substring(0, 10)){
                  console.log("날짜 일치??", selDate == v.resStartDate.substring(0, 10))
                  
                  for(i=0; i<=timeTd.length; i++){
                     if($(".date-time").eq(i).text() == v.resStartDate.substring(11, 16)){
                        console.log("시간 일치??", $(".date-time").eq(i).text() == v.resStartDate.substring(11, 16))
                        $(".date-time").eq(i).attr("class", "date-time none")                                          
                     }                     
                  }
               } 
            })
         }
      })
   }
   
   function reservationInsert(selEmpId, selPatId, selResDate){
      console.log("empId : ", selEmpId, "patId : ", selPatId, "resDate : ", selResDate)

      $.ajax({
         url : "/app/reservationInsert",
         type : "post",
         data : {
            empId : selEmpId,
            patId : selPatId,
            resStartDate : selResDate 
         },
         success : function(){
            $("#accordion-clock").trigger("click")
            Swal.fire({
               title : "예약이 완료되었습니다",
               icon : "success",
               confirmButtonColor : '#3085d6',
               confirmButtonText : '확인',
               backdrop : true,
            })
            reservationMyList(selPatId);
            $("#resDiv").html(resDivHtml);
            $("#closeBtn").trigger("click")
            sendMessageAlram2(selEmpId);
         }
      })
   }
   
   function reservationMyList(selPatId){
      console.log(selPatId)
      $.ajax({
         url : "/reservationMyList",
         type : "post",
         data : {
            userId : userId,
            patId : selPatId
         },
         success : function(resList){
            console.log("resList", resList)
            dateStr = "";
            if (stayList.length != 0) {
               $.each(resList, function(i, v){
                  console.log(i, v.resStartDate.substring(6, 7))
                  
                  dateStr += "<div>";
                  dateStr += "<h5>"+ v.resStartDate +"</h5>";
                  dateStr += "</div>";               
               })
            }else{
               dateStr += "예약 내역이 없습니다"
            }
            $("#myReservation").html(dateStr)
         }
      })
   }
   
function sendMessageAlram2(selEmpId){
      console.log("알람 empId", selEmpId)   

      send(
            "alarm",             // 전송 타입(알람/채팅)
            selEmpId,    // 받는 사람(알림 받는 사람)
             "진료",   // 알림 타입(예약/댓글 등)
             "<a><i class='ri-calendar-check-fill'></i> 예약</a>"    // 알림 내용
         );   
   }
   
</script>