<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authentication property="principal" var="principal"/>

<style>
.textSize{
   font-size: 1.1em;
   font-weight: 400;
}
.alignRight{
   text-align : right;
}
.alignLeft{
   text-align : left;
}
.font07{
   font-size : 0.7em;
}
.bottomBorder{
   border : 0px;
   border-bottom: 1px solid lightgray;
}
</style>

<div class="page-content textSize">
   <div class="container-fluid">
      <div class="card">
         <div class="card-body">
            <!-- 메뉴 -->
            <ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
               <li class="nav-item" id="patLi">
                  <a class="nav-link active" data-bs-toggle="tab" href="#patient" role="tab" aria-selected="true">
                     <span class="d-block d-sm-none">
                        <i class="fas fa-home"></i>
                     </span>
                     <span class="d-none d-sm-block"><h5><b>환자</b></h5></span>
                  </a>
               </li>
               <li class="nav-item" id="facilityLi">
                  <a class="nav-link" data-bs-toggle="tab" href="#facility" role="tab" aria-selected="false">
                     <span class="d-block d-sm-none">
                        <i class="fas fa-home"></i>
                     </span>
                     <span class="d-none d-sm-block"><h5><b>시설물</b></h5></span>
                  </a>
               </li>
               <li class="nav-item" id="drugLi">
                  <a class="nav-link" data-bs-toggle="tab" href="#stack" role="tab" aria-selected="false">
                     <span class="d-block d-sm-none">
                        <i class="fas fa-home"></i>
                     </span>
                     <span class="d-none d-sm-block"><h5><b>재고</b></h5></span>
                  </a>
               </li>
               <li class="nav-item" id="empLi">
                  <a class="nav-link" data-bs-toggle="tab" href="#employees" role="tab" aria-selected="false">
                     <span class="d-block d-sm-none">
                        <i class="fas fa-home"></i>
                     </span>
                     <span class="d-none d-sm-block"><h5><b>직원</b></h5></span>
                  </a>
               </li>
               <li class="nav-item" id="documentLi">
                  <a class="nav-link" data-bs-toggle="tab" href="#document" role="tab" aria-selected="false">
                     <span class="d-block d-sm-none">
                        <i class="fas fa-home"></i>
                     </span>
                     <span class="d-none d-sm-block"><h5><b>서식</b></h5></span>
                  </a>
               </li>
               <li class="nav-item" id="chartLi">
                  <a class="nav-link" data-bs-toggle="tab" href="#chart" role="tab" aria-selected="false">
                     <span class="d-block d-sm-none">
                        <i class="fas fa-home"></i>
                     </span>
                     
                     <span class="d-none d-sm-block"><h5><b>통계</b></h5></span>
                  </a>
               </li>
<!--                <li class="nav-item" id="documentLi"> -->
<!--                   <a class="nav-link" data-bs-toggle="tab" href="#zoom" role="tab" aria-selected="false"> -->
<!--                      <span class="d-block d-sm-none"> -->
<!--                         <i class="fas fa-home"></i> -->
<!--                      </span> -->
<!--                      <span class="d-none d-sm-block">zoomTest</span> -->
<!--                   </a> -->
<!--                </li> -->
<!--                <li class="nav-item" id="documentLi"> -->
<!--                   <a class="nav-link" data-bs-toggle="tab" href="#sms" role="tab" aria-selected="false"> -->
<!--                      <span class="d-block d-sm-none"> -->
<!--                         <i class="fas fa-home"></i> -->
<!--                      </span> -->
<!--                      <span class="d-none d-sm-block">smsTest</span> -->
<!--                   </a> -->
<!--                </li> -->
<!--                <li class="nav-item" id="documentLi"> -->
<!--                   <a class="nav-link" data-bs-toggle="tab" href="#websocket" role="tab" aria-selected="false"> -->
<!--                      <span class="d-block d-sm-none"> -->
<!--                         <i class="fas fa-home"></i> -->
<!--                      </span> -->
<!--                      <span class="d-none d-sm-block">websocket 테스트</span> -->
<!--                   </a> -->
<!--                </li> -->
<!--                <li class="nav-item" id="documentLi"> -->
<!--                   <a class="nav-link" data-bs-toggle="tab" href="#appContent" role="tab" aria-selected="false"> -->
<!--                      <span class="d-block d-sm-none"> -->
<!--                         <i class="fas fa-home"></i> -->
<!--                      </span> -->
<!--                      <span class="d-none d-sm-block">글 작성용</span> -->
<!--                   </a> -->
<!--                </li> -->
               <li class="nav-item" id="documentLi">
                  <a class="nav-link" data-bs-toggle="tab" href="#" role="tab" aria-selected="false">
                     <span class="d-block d-sm-none">
                        <i class="fas fa-home"></i>
                     </span>
                     <span class="d-none d-sm-block">etc</span>
                  </a>
               </li>
            </ul>
         </div>
      </div>
         
            <!-- 바뀔부분 -->
      <div class="tab-content">
<!-- 직원 -->
         <div class="tab-pane" id="employees" role="tabpanel">
            <div class="row mb-4">
               <%@include file="empList.jsp"%>
            </div>
         </div>
<!-- 환자 -->
         <div class="tab-pane active" id="patient" role="tabpanel">
            <div class="row mb-4">
               <%@include file="patList.jsp"%>
            </div>
         </div>
<!-- 재고 -->
         <div class="tab-pane" id="stack" role="tabpanel">
            <div class="row mb-4">
               <%@include file="drug.jsp"%>
            </div>
         </div>
<!-- 시설물 -->
         <div class="tab-pane" id="facility" role="tabpanel">
            <div class="row mb-4">
               <%@include file="facility.jsp"%>
            </div>
         </div>
<!-- 서식 -->
         <div class="tab-pane" id="document" role="tabpanel">
            <div class="row mb-4">
               <%@include file="document.jsp"%>
            </div>
         </div>
<!-- 통계 -->
         <div class="tab-pane" id="chart" role="tabpanel">
            <div class="row mb-4">
               <%@include file="charts.jsp"%>
            </div>
         </div>
<!--          <div class="tab-pane" id="zoom" role="tabpanel"> -->
<!--             <div class="card"> -->
<!--                <div class="card-body"> -->
<!--                   <div class="row mb-4"> -->
<%--                      <%@include file="zoom.jsp"%> --%>
<!--                   </div> -->
<!--                </div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="tab-pane" id="sms" role="tabpanel"> -->
<!--             <div class="card"> -->
<!--                <div class="card-body"> -->
<!--                   <div class="row mb-4"> -->
<%--                      <%@include file="sms.jsp"%> --%>
<!--                   </div> -->
<!--                </div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="tab-pane" id="websocket" role="tabpanel"> -->
<!--             <div class="card"> -->
<!--                <div class="card-body"> -->
<!--                   admin.jsp의 186 ~ 191번줄에 알림 발송 스크립트 있습니다.<br/> -->
<!--                   알림을 발송해야 하는 부분에서(ex : 댓글 작성, 예약 일정 등록 등) 형식에 맞춰 send 함수를 불러주세요.<br/> -->
<!--                   형식 : send(전송타입, 받는사람, 알림내용, 알림타입);<br/><br/> -->
<!--                   <div class="row mb-4"> -->
<!--                      알림 타입  -->
<!--                         <select name="type" id="sendType"> -->
<!--                            <option value="alarm">알람</option> -->
<!--                            <option value="receipt">접수</option> -->
<!--                         </select> -->
<!--                      알림 받는사람<input type="text" name="receiver" id="receiver" value=""/> -->
<!--                      알림 내용<textarea name="alarmCont" id="alarmCont" rows="10" cols="20"></textarea> -->
<!--                      알림 구분?<input type="text" name="alarmType" id="alarmType" value=""/>  -->
<!--                      <input type="button" id="sendAlarmBtn" value="떤쏭!"/> -->
<!--                   </div> -->
<!--                </div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="tab-pane" id="appContent" role="tabpanel"> -->
<!--             <div class="row mb-4"> -->
<%--                <%@include file="appContentWrite.jsp"%> --%>
<!--             </div> -->
<!--          </div> -->
         <div class="tab-pane" id="appContent" role="tabpanel">
            <div class="row mb-4">
            </div>
         </div>
      </div>
   </div>
</div>



<!-- 모달 시작 ****************************************** 모달 시작 ****************************************** 모달 시작 -->
<%@include file="admin_modal.jsp"%>
<!-- 모달 끝 ********************************************* 모달 끝 ********************************************* 모달 끝 -->




<script>

// 알림 발송 시작
// $("#sendAlarmBtn").on("click", function(){

//    send(
//          $("#sendType").val(),    // 전송 타입(알람/채팅/접수)
//           $("#receiver").val(),    // 받는 사람(알림 받는 사람)
//           $("#alarmCont").val(),    // 알림 내용
//           $("#alarmType").val()   // 알림 타입(예약/댓글 등)
//       );      
   
// })
// 알림 발송 끝



var empModal = $("#composemodal");

const empForm = $("#insertForm");
const profile = $("#profileFile");

const profileImg = $("#empProfile");

var empRegBtn = $("#empRegBtn");   // 직원등록 버튼
var empUpdateBtn = $("#empUpdateBtn");   // 직원수정 버튼
var empDeleteBtn = $("#empDeleteBtn");   // 직원삭제 버튼

const cntInputClass = $(".cntInput");

// 사진파일 올리면 화면에 출력해줌
function readURL(input) {
     if (input.files && input.files[0]) {
       var reader = new FileReader();
       var empProfile = document.getElementById('empProfile');
       reader.onload = function(e) {
          empProfile.style.display="";
          empProfile.src = e.target.result;
       };
       reader.readAsDataURL(input.files[0]);
     } else {
       document.getElementById('empProfile').src = "";
     }
   }
   
   var empLi = $("#empLi");
   var patLi = $("#patLi");
   var drugLi = $("#drugLi");
   var facilityLi = $("#facilityLi");
   var documentLi = $("#documentLi");

   
// 직원 리스트 가져오는 함수
function getEmpList(){
   $.ajax({
      method : "post",
      url : "/emp/allList",
      dataType : "json",
      success : function(rslt){
         $('#empTable').dataTable({
            destroy: true,
            dom: 'Bfrtip',
            info: false,
//             autoWidth : false,
            lengthChange: false,
            scrollX: false,
            language:{
               search : "<a><i class='ri-search-line'></i></a>",
               paginate : {
                        first : "처음",
                        last : "마지막",
                        next : "다음",
                        previous : "이전"
                    }
            },
            buttons: [
               {
                  extend: 'excel'
                  ,text: '엑셀출력'
                  ,filename: '엑셀파일명'
                  ,title: '[AlphaVet]직원 목록'
                  ,className : 'btn btn-secondary buttons-excel buttons-html5'
                  
               }
               ],
              data: rslt,
              columns: [
                 { data: 'empId', 'visible' : false, 'searchable' : false},
                 { data: 'empName', "width":"80px"},
                 { data: 'empJob', "width":"80px"},
                    { data: 'empTel', "width":"100px"},
                   { data : function (data, type, dataToSet) {return data.empAdd1 + " " + data.empAdd2 + " " + data.empZipcode;}, "width":"250px"},
                 { data: 'empJoinDate', "defaultContent": "" , "width":"100px"},
                 { data: 'empState' , "width":"100px"}
              ],
              createdRow: function (row, data, dataIndex, full) {
                 $(row).attr('id', data.empId);
                 $(row).attr('class', "empTr");
             }
           });
         
         
         
         let vetCnt = 0;
         let techCnt = 0;
         let etcCnt = 0;
         let retireCnt = 0;
         for(let i =0; i<rslt.length; i++){
            if(rslt[i].empState == "퇴사"){
               retireCnt += 1;
            }else{
               if(rslt[i].empJob == "의사"){ vetCnt = vetCnt + 1; }
               else if(rslt[i].empJob == "테크니션"){ techCnt = techCnt + 1; }
               else{ etcCnt = etcCnt +1; }
            }
         }
         $("#empCnt").val(rslt.length - retireCnt);
         $("#vetCnt").val(vetCnt);
         $("#techCnt").val(techCnt);
         $("#etcCnt").val(etcCnt);
         $("#retireCnt").val(retireCnt);
         
         $('.dataTables_filter').remove(); // dataTable 자체 search input 없애기
         
//          document.querySelector(".downEmpExcelBtn")[0].style.display="";
      }
   })
}
   
// 환자 목록 가져오는 함수

//      var patTable = $("#patTable").DataTable();
//      patTable.destroy();
function getPatientList(){
   $.ajax({
      method : "post",
      url : "/pat/list",
      dataType : "json",
      success : function(rslt){
         $('#patTable').dataTable({
            destroy: true,
            info: false,
            autoWidth : false,
             lengthChange: false,
//                scrollX: false,
             language:{
               search : "<a><i class='ri-search-line'></i></a>",
                paginate : {
                        first : "처음", last : "마지막", next : "다음", previous : "이전"
                  }},
              data: rslt,
              columns: [
                 { data: 'patId', 'visible' : false, 'searchable' : false },
                 { data: 'animalCd', "width":"80px"},
                 { data: 'patName', "width":"80px"},
                    { data: 'patBirth', "defaultContent": "", "width":"100px"},
                    { data: 'memName', "defaultContent": "", "width":"80px"},
                    { data: 'memTel', "defaultContent": "", "width":"100px"},
                    { data : function (data, type, dataToSet) {return data.patAdd1 + " " + data.patAdd2;}, "width":"250px"}
              ],
              createdRow: function (row, data, dataIndex, full) {
                 $(row).attr('id', data.patId);
                 $(row).attr('class', "patTr");
             }
           });
         let dogCnt = 0;
         let catCnt = 0;
         let patEtcCnt = 0;
         let stayCnt = 0;
         for(let i = 0; i<rslt.length; i++){
            if(rslt[i].animalCd == "dog"){ dogCnt = dogCnt + 1;}
            else if(rslt[i].animalCd == "cat"){ catCnt = catCnt + 1;}
            else{ patEtcCnt = patEtcCnt + 1;}
            
            if(rslt[i].patStayCheck == "Y"){ stayCnt = stayCnt + 1;}
         }
         $("#patCnt").val(rslt.length);
         $("#dogCnt").val(dogCnt);
         $("#catCnt").val(catCnt);
         $("#patEtcCnt").val(patEtcCnt);
         $("#stayCnt").val(stayCnt);
         
         $('.dataTables_filter').remove(); // dataTable 자체 search input 없애기
         
      }
   })
}

// 퇴사 처리하는 기능
document.getElementById("empRetireBtn").addEventListener("click", function(){
   let empId = document.empForm.empId.value;
   Swal.fire({
                 title: "퇴사할 경우 정보를 확인할 수 없습니다.",
                 text: "정말 퇴사처리 하시겠습니까?",
              icon: 'warning',
                 showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: '확인',
                  cancelButtonText: '취소',
                  reverseButtons: true
              }).then((result) => {
                  if (result.isConfirmed) {
                     
                     Swal.fire({
                     title: '퇴사일을 입력해주세요.',
                     html: '<input type="date" id="retireDate" class="swal2-input"/>',
                       confirmButtonColor: '#3085d6',
                       confirmButtonText: '확인',
                         backdrop: true,
                        preConfirm: () => { return document.getElementById('retireDate').value; }
                       }).then((result) => {
                          let data = {
                                empId : empId,
                                empState : "퇴사",
                                empRetireDate : ((result.value).replace("-", "/")).replace("-", "/")
                             }
                           $.ajax({
                              method : "post",
                              url : "/emp/updateEmpState",
                              data : JSON.stringify(data),
                              dataType : "text",
                              contentType : "application/json;charset=utf-8",
                              success : function(rslt){
                                 empModal.modal('hide');
                                 
                                 Swal.fire({
                                    icon: "success",
                                    title: "퇴사처리 되었습니다.",
                                      confirmButtonColor: '#3085d6',
                                      confirmButtonText: '확인',
                                        backdrop: true,
                                   })
                                   
                                   getEmpList();
                              }
                           })
                 })
                  }else if (result.isDismissed) {
                     Swal.fire({
                         title: "취소되었습니다.",
                         showCancelButton: false,
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: '승인',
                         reverseButtons: true
                     })
                  }
              }) 
})
   
$(function(){
   getPatientList();
   
   empLi.on("click", function(){
      getEmpList();
   })
   patLi.on("click", function(){
      getPatientList()
   })
   
   $('#employeesSearch').keyup(function () {
         // input의 값대로 search
         let $value = $(this).val();
         $("#empTable").DataTable().search($value).draw();
     });
   
   // 직원 상세 정보 가져오기
   $(document).on("click", ".empTr", function(){
      let empInput = document.getElementsByClassName("empInput");
      for(let i = 0; i<empInput.length; i++){
         empInput[i].disabled = true;
      }
      
      document.getElementById("empRetireBtn").style.display ="";
      document.getElementById("profileFile").parentNode.style.display = "none";
      document.getElementById("empId").parentNode.parentNode.style.display = "";
      document.getElementById("empId").readOnly = "readonly";
      
      profileImg.show();
      
      empRegBtn.hide();
      empUpdateBtn.show();
      empDeleteBtn.show();
      
      empForm[0].reset();
      
      document.getElementById("msgCheckDiv").style.display= "none";
      
      $("#empUpdateBtn").val("정보 수정");
      
      $.ajax({
         method : "post",
         url : "/emp/detail",
         data : "empId="+ $(this).attr("id"),
         dataType : "json",
         success : function(rslt){
            console.log(rslt)
            var eForm = document.empForm;
//             document.empForm.elements
            $.each(rslt, function(key, value){
               console.log(key);
               for(var i =0; i<eForm.elements.length; i++){
//                   console.log(eForm.elements[i].name);
                  if(key == eForm.elements[i].name){
                     eForm.elements[i].value=value;
                  }
               }
            })
            $.each(rslt.empAuthVOList, function(key, value){
               let roleName = value.empAuthName;
               if(document.getElementById(roleName) != null){
                  document.getElementById(roleName).checked = true;
               }
            })
            document.querySelector("#empProfile").src = rslt.empProfile;

//             document.empForm.empId.value = rslt.empId;
//             document.empForm.managerId.value = rslt.managerId;
//             document.empForm.empPw.value = rslt.empPw;
//             document.empForm.empName.value = rslt.empName;
//             console.log("rslt.empProfile : " + rslt.empProfile);
//             document.querySelector("#empProfile").src = rslt.empProfile;
//             $("#empDropZone").hide();
//             document.empForm.animalCd.value = rslt.animalCd;
//             document.empForm.empJob.value = rslt.empJob;
//             document.empForm.empTel.value = rslt.empTel;
//             document.empForm.empAdd1.value = rslt.empAdd1;
//             document.empForm.empAdd2.value = rslt.empAdd2;
//             document.empForm.empZipcode.value = rslt.empZipcode;
//             document.empForm.empBirth.value = rslt.empBirth;
//             document.empForm.empJoinDate.value = rslt.empJoinDate;
//             console.log("???:" + rslt);
//             $.each(rslt.empAuthVOList, function(i, v){   // 권한 표시
//                console.log("권한 : " + rslt.empAuthVOList[i]);
//                var authName = v.empAuthName; 
//             })
            
            empModal.modal('show');
         }
      })
   })
   
   
   // 직원 정보 수정하기
   $("#empUpdateBtn").on("click", function(){
      let formData = new FormData(empForm[0]);
      formData.append("profileFile", empForm[0].profileFile.files[0]);
      
      let empInput = document.getElementsByClassName("empInput");
      
      if(this.value == "정보 수정"){
         this.value = "등록";
         
         for(let i = 0; i<empInput.length; i++){
            empInput[i].disabled = false;
         }
         document.getElementById("profileFile").parentNode.style.display = "";

      }else{
         document.getElementById("empId").readOnly = "";
         
//          console.log(formData);
         $.ajax({
            method : "post",
            url : "/emp/update",
            data : formData,
   //          dataType : "json",
            contentType : false,
            processData : false,
            success : function(rslt){
               if(rslt > 0){
                  Swal.fire({
                     title: "직원 정보를 수정하였습니다.",
                     icon: "success",
                       confirmButtonColor: '#3085d6',
                       confirmButtonText: '확인',
                         backdrop: true,
                       }) 
               }else{
                  Swal.fire({
                     title: "직원 정보를 수정하지 못했습니다.",
                     icon: "error",
                       confirmButtonColor: '#3085d6',
                       confirmButtonText: '확인',
                         backdrop: true,
                       }) 
               }
               empLi.trigger("click");
               empModal.modal('hide');
               empForm[0].reset();
            }
         })
      }
   })

   // 직원 정보 삭제하기
   empDeleteBtn.on("click", function(){
      var empForm = $("#insertForm");
      $.ajax({
         method : "post",
         url : "/emp/delete",
         data : "empId="+$("#empId").val(),
//          dataType : "json",
         processData : false,
         success : function(rslt){
            if(rslt > 0){
               Swal.fire({
                  title: "직원을 삭제하였습니다.",
                  icon: "success",
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                      backdrop: true,
                    }) 
            }else{
               Swal.fire({
                  title: "직원을 삭제하지 못했습니다.",
                  icon: "error",
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                      backdrop: true,
                    }) 
            }
            empLi.trigger("click");
            empModal.modal('hide');
         }
      })
   })
   
   
   // 직원 등록하기
   $("#empModalBtn").on("click", function(){
      
      let empInput = document.getElementsByClassName("empInput");
      for(let i = 0; i<empInput.length; i++){
         empInput[i].disabled = false;
      }
      
      document.getElementById("empRetireBtn").style.display ="none";
      document.getElementById("profileFile").parentNode.style.display = "";
      document.getElementById("empId").parentNode.parentNode.style.display = "none";
      document.getElementById("empId").readOnly = "";
      
      profileImg.hide();
      
      empRegBtn.show();
      empUpdateBtn.hide();
      empDeleteBtn.hide();
      
      profileImg.attr("src", "");
      empForm[0].reset();
      document.getElementById("msgCheckDiv").style.display= "";
   })
   
   empRegBtn.on("click", function(){
      
      let formData = new FormData(empForm[0]);
      formData.append("profileFile", empForm[0].profileFile.files[0]);
      
      if(document.getElementById("msgCheckInput").getAttribute("checked")){
//          let smsContent = `
            
//          `;
//          let smsPhone = ``;
//          sendMessage(smsPhone, smsContent);
      }
      
      $.ajax({
         method : "post",
         url : "/emp/insert",
         data : formData,
         dataType : "text",
         contentType : false,
         processData : false,
         success : function(rslt){
            if(rslt > 0){
               Swal.fire({
                  title: "새로운 직원을 등록했습니다.",
                  icon: "success",
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                      backdrop: true,
                    }) 
            }else{
               Swal.fire({
                  title: "새로운 직원을 등록하지 못했습니다.",
                  icon: "error",
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                      backdrop: true,
                    }) 
            }
            empLi.trigger("click");
            empModal.modal('hide');
            empForm[0].reset();
         }
      })
   })
   
   // 직책 선택에 따른 권한 체크박스 선택하기
   $("#empJob").on("change", function(){
      var job = document.querySelector("#empJob").value;
      
//       var roles = document.querySelectorAll(".role");
      document.getElementById("ROLE_MEDIC").checked = false;
      document.getElementById("ROLE_ENTER").checked = false;
      document.getElementById("ROLE_WONMU").checked = false;
      document.getElementById("ROLE_RES").checked = false;
      document.getElementById("ROLE_ADMIN").checked = false;

      if(job === "의사"){
         document.getElementById("ROLE_MEDIC").checked = true;
      }else if(job === "테크니션"){
         document.getElementById("ROLE_ENTER").checked = true;
      }else if(job === "etc"){
         
      }
      
   })
   
   const animalCdSelect = $("#animalCd");
   animalCdSelect.on("change", function(){
      var etcDiv = document.querySelector("#etcDiv");
      if(animalCdSelect.val() == 'etc'){
         etcDiv.style.display = "";
      }else{
         etcDiv.style.display = "none";
      }
      
   })

   $('#patientSearch').keyup(function () {
         // input의 값대로 search
         let $value = $(this).val();
         $("#patTable").DataTable().search($value).draw();
     });
   
   
   
   //환자 모달창
   const $patModal = $("#patModal");
   
   // 환자 등록하기
   $("#patModalBtn").on("click", function(){
      
      let patInput = document.getElementsByClassName("patInput");
      for(let i = 0; i<patInput.length; i++){
         patInput[i].disabled = false;
      }
      document.getElementById("patId").readOnly = "";
//       document.patForm.patId.pare
      
      $("#patRegBtn").show();
      $("#patUpdateBtn").hide();
      $("#patDeleteBtn").hide();
      
      $("#patForm")[0].reset();
   })
   
   // 환자 상세 정보 가져오기
   $(document).on("click", ".patTr", function(){
      let patInput = document.getElementsByClassName("patInput");
      for(let i = 0; i<patInput.length; i++){
         patInput[i].disabled = true;
      }
      document.getElementById("patId").readOnly = "readonly";
      
      $("#patForm")[0].reset();
      
      $("#patRegBtn").hide();
      $("#patUpdateBtn").show();
      $("#patDeleteBtn").show();
      
      $.ajax({
         method : "post",
         url : "/pat/detail",
         data : "patId="+ $(this).attr("id"),
         dataType : "json",
         success : function(rslt){
            console.log(rslt);
            
            let patForm = document.patForm;
            
            $.each(rslt, function(key, value){
               for(let i = 0; i<patForm.elements.length; i++){
                  if(key == patForm.elements[i].name){
                     patForm.elements[i].value=value;
                  }
               }
            })
//             document.patForm.patId.value = rslt.patId;
//             document.patForm.patName.value = rslt.patName;
// //             document.patForm.empProfile.value = rslt.empProfile;
//             document.patForm.animalCd.value = rslt.animalCd;
//             document.patForm.memTel.value = rslt.memTel;
//             document.patForm.patAdd1.value = rslt.patAdd1;
//             document.patForm.patAdd2.value = rslt.patAdd2;
//             document.patForm.patMemo.value = rslt.patMemo;
//             document.patForm.patBirth.value = rslt.patBirth;
//             document.patForm.memName.value = rslt.memName;
            
            $patModal.modal('show');
         }
      })
   })
   
   
   
   // 재고 탭 클릭
   drugLi.on("click", function(){
   // 약품 재고 가져오기
//       var drugTable = $("#drugTable").DataTable();
//       drugTable.destroy();
      let data = datePeriod.value.split("~");
      let periodData = {
               startDate : data[0],
               endDate : data[1]
            }
      
      $.ajax({
         method : "post",
         url : "/drug/list",
         dataType : "json",
         success : function(rslt){
            $('#drugTable').dataTable({
               destroy : true,
                pageLength : 100,
                  lengthChange: false,
                  autoWidth : false,
//                   scrollX: false,
                  scrollY: '300px',
//                   scroller: true,
                  language:{
                     search : "<a><i class='ri-search-line'></i></a>",
                     paginate : {  first : "처음", last : "마지막",next : "다음", previous : "이전" }
                  },
               info : false,
               ordering: false,
               select:{ style:"multi"},
                 data: rslt,
                 columns: [
                    { data: 'drugNm', 'visible' : false, 'searchable' : false },
                    { data: 'itemSeq' , "width":"40px"},
                    { data: 'entpName' , "width":"40px"},
                    { data: 'itemName' , "width":"130px", "class":"alignLeft"},
                       { data: 'itemEngName', "defaultContent": "", "width":"80px", "class":"alignLeft"},
                    { data: function(data, type, dataToSet){ return Number(data.drugCostPrice).toLocaleString();}, "width":"10px", "class" : "alignRight"},
                    { data: 'drugAmount' , "width":"10px", "class" : "alignRight"},
                    { data: 'drugStockDate', "width":"50px"}
                 ],
               createdRow: function (row, data, dataIndex, full) {
                    $(row).attr('id', data.drugNm);
                    $(row).attr('class', "drugTr");
                    $(row).attr('onclick', "addDrugDa(this.id)");
                    $(row).attr('data-buyer', data.entpName);
                    $(row).attr('data-price', data.drugCostPrice);
                }
              });
            
            $('.dataTables_filter').remove(); // dataTable 자체 search input 없애기
            
//             document.getElementById("drugTable").children[0].style.display="none";
            
         }
      });
      

   $('#drugSearch').keyup(function () {
         // input의 값대로 search
         let $value = $(this).val();
         $("#drugTable").DataTable().search($value).draw();
     });
   
      // 재고 신청 목록 가져오는 아작스
      $.ajax({
         method : "post",
         url : "/da/list",
         dataType : "json",
         data : JSON.stringify(periodData),
         contentType : "application/json;charset=utf-8",
         processData : false,
         success : function(rslt){
            data1 = "";
            data2 = "";
            $.each(rslt, function(i,v){
               if(v.daState=='N'){
                  data1 += `<tr id='\${v.daNm}' onclick='detailDA(\${v.daNm})' class='daTr'>`;
                  data1 += `<td style="width:60%">\${v.daDate}</td>`;
                  data1 += `<td><div class="badge badge-soft-danger font-size-18">미입고</div></td>`;
                  data1 += `</tr>`;
               }else{
                  data2 += `<tr id='\${v.daNm}' onclick='detailDA(\${v.daNm})' class='daTr'>`;
                  data2 += `<td style="width:60%">\${v.daDate}</td>`;
                  data2 += `<td><div class="badge badge-soft-success font-size-18">입고완료</div></td>`;
                  data2 += `</tr>`;
               }
               
            })
            $("#daListTbody1").html(data1);
            $("#daListTbody2").html(data2);
         }
      });
   })
   
   // 약품 재고 테이블에 신청서에 추가하기
   

   
//    $(document).on("click", ".drugTr", function(){
//       var daTbody = document.querySelector("#daTbody");
//       daTbody.append($(this).cloneNode(true));
      
//    })
   
   facilityLi.on("click", function(){
      getFacility();
   })
   
   // 시설물 오른쪽 클릭 이벤트
   $("#test").on("contextmenu", function(){
   })

// 서식 탭 클릭하면
   documentLi.on("click", function(){
      resetSmsForm();
      smsList();
   })
   
   // 방 추가
   cntInputClass.on("change", function(){
      cnt = this.value;
      className = this.id.replace("Cnt", "Class");
      let roomCnt = document.getElementsByClassName(className).length-1;

      let roomDiv = document.getElementById(this.id.replace("Cnt", "Div"));
      let roomsDiv = document.getElementById(this.id.replace("Cnt", "sDiv"));
      
      if(cnt > roomCnt){
         for(let i = roomCnt; i< cnt; i++){
            let newDiv = makeCloneDiv(roomDiv, roomsDiv, i+1);
            newDiv.style.display="";
            if(this.id == "praRoomCnt"){
               empSelectClone = empSelect.cloneNode(true);
               empSelectClone.disabled = false;
               newDiv.children[0].children[1].appendChild(empSelectClone).style.display="";
            }
         }   
      }      
      
      
   })
   
});

// 문자 발송 체크박스
document.getElementById("msgCheckInput").addEventListener("click", (e) =>{
   $.ajax({
      method : "post",
      url : "sms/empSmsList",
      dataType : "json",
      processData : false,
      success : function(rslt){
         let data = "";
         
         $.each(rslt, function(i, v){
            data += `
               <option value='\${v.smsCd}'>\${v.smsTitle}<input type='hidden' id='\${v.smsCd}' value='\${v.smsContent}'/></option>
            `;
         })
         
         document.empForm.smsType.innerHTML = "";
      }
   })
})



// 약품 선택 -> 재고신청 테이블 추가, 제거
var daTbody = document.querySelector("#daTbody");

function addDrugDa(drugNm){
   var drug = document.getElementById(drugNm);
   if(drug.children.length==7){
      if(!document.getElementById('new'+drug.id)){
         
         var newTr = daTbody.appendChild(drug.cloneNode(true));
         
         newTr.id = "new"+drug.id;
         daTbody.rows[daTbody.rows.length-1].deleteCell(-1)
         var newCell = daTbody.rows[daTbody.rows.length-1].insertCell(-1)
         newCell.innerHTML = '<input type="number" value="1" name="daDtAmount" id="amount' + drug.id + '" class="daDtList alignRight" style="width:50px;border:none;background-color:#fff0f2;"/>'
                        +'<input type="hidden" value="' + drugNm + '" name="drugNm"/>'
                        + '<input type="hidden" value=' + newTr.dataset.buyer + ' name="buyerName"/>'
                        + '<input type="hidden" value=' + newTr.dataset.price + ' name="drugCostPrice"/>';
         
         newCell = daTbody.rows[daTbody.rows.length-1].insertCell(-1)
         newCell.innerHTML = '<input type="button" class="btn btn-danger waves-effect waves-light" value="취소" id="cancle' + drug.id + '" onclick="addDrugDa(' + drug.id+ ')"/>';
         
      }else{
         document.getElementById('new'+drug.id).remove();   // tr 삭제!
         drug.className="drugTr odd";
      }
   }
}

var drugModal = $("#composemodal3");

// 재고신청 상세 목록 가져오는 함수
function detailDA(daNm){
   $.ajax({
      method : "post",
      url : "/da/detail",
      data : "daNm=" + daNm,
      dataType : "json",
      processData : false,
      success : function(rslt){
         
         data = "";
         $.each(rslt, function(i,v){
            let commaPrice = Number(v.daDtPrice).toLocaleString();

            data += `<tr id='\${v.daDtNm}'>                 `;
            data += `<td width='55px'>\${v.drugNm}
                  <input type="text" name="daDtNm" value="\${v.daDtNm}" style="display:none"/>
                  <input type="text" name="drugNm" value="\${v.drugNm}" style="display:none"/></td>                          `;
            data += `<td width='400px'>\${v.itemName}</td>                          `;
            data += `<td width='200px'>\${v.itemEngName}</td>                          `;
            data += `<td width='55px'>\${v.daDtAmount}                         
                  <input type="text" name="daDtAmount" value="\${v.daDtAmount}" style="display:none"/></td>`;
            data += `<td width='130px' class="alignRight">\${commaPrice}</td>                          `;
            data += `<td width='150px'>\${v.entpName}</td>                          `;
            if(v.daDtCheck=='N'){
               data += `<td><div class="badge badge-soft-danger font-size-18" onclick="changeDaDtCheck(this)">미입고</div>
                     <input type="text" name="daDtCheck" value="\${v.daDtCheck}" style="display:none"/></td>                        `;
            }else{
               data += `<td><div class="badge badge-soft-success font-size-18" onclick="changeDaDtCheck(this)">입고완료</div>
                     <input type="text" name="daDtCheck" value="\${v.daDtCheck}" style="display:none"/></td>                        `;
            }
            data += `</tr>                        `;
         })
         $("#daDtTbody").html(data);
         document.daDtForm.daNm.value = daNm;
         drugModal.modal('show');
      }
   });
}

const drugApplyForm = $("#drugApplyForm");

$("#drugApplyBtn").on("click", function(){
   
   Swal.fire({
        title: "재고를 신청하시겠습니까?",
      icon: "success",
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
           let drugForm = drugApplyForm.serializeArray();
          $.ajax({
             method : "post",
             url : "/da/insert",
             data : JSON.stringify(drugForm),
             dataType : "text",
             contentType : "application/json;charset=utf-8",
             processData : false,
             success : function(rslt){
                if(rslt > 1){
                   Swal.fire({
                      title: "재고신청을 완료하였습니다.",
                      icon: "success",
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: '확인',
                          backdrop: true,
                        }) 
                   while(daTbody.hasChildNodes()){
                      daTbody.removeChild(daTbody.firstChild);
                   }
                   drugLi.trigger("click");
                }else{
                   Swal.fire({
                      title: "재고신청을 하지 못했습니다.",
                      icon: "error",
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: '확인',
                          backdrop: true,
                        }) 
                }
             }
          });
        }else{
           
        }
    })
})

const daUpdateBtn1 = document.querySelector("#daUpdateBtn1");
const daUpdateBtn2 = document.querySelector("#daUpdateBtn2");
const checkAllDaDt = document.getElementById("checkAllDaDt");
const $daDtForm = $("#daDtForm");

daUpdateBtn1.addEventListener("click", function(){
   daUpdateBtn1.style.display = "none";
   daUpdateBtn2.style.display = "";
//    checkAllDaDt.style.display = "";
})

daUpdateBtn2.addEventListener("click", function(){
   
   let daDetailForm = $daDtForm.serializeArray();
   console.log(JSON.stringify(daDetailForm));
   $.ajax({
      method : "post",
      url : "/da/update",
      data : JSON.stringify(daDetailForm),
      dataType : "text",
      contentType : "application/json;charset=utf-8",
      processData : false,
      success : function(rslt){
         if(rslt > 0){
            Swal.fire({
               title: "재고 상태가 변경되었습니다.",
               icon: "success",
                 confirmButtonColor: '#3085d6',
                 confirmButtonText: '확인',
                   backdrop: true,
                 }) 
         }else{
            Swal.fire({
               title: "재고 상태가 변경되지 못했습니다.",
               icon: "error",
                 confirmButtonColor: '#3085d6',
                 confirmButtonText: '확인',
                   backdrop: true,
                 }) 
         }
         drugLi.trigger("click");
         drugModal.modal('hide');
         daUpdateBtn1.style.display = "";
         daUpdateBtn2.style.display = "none";
         checkAllDaDt.style.display = "none";
      }
   });
   
})

function changeDaDtCheck(daDtCheck){
   if(daUpdateBtn2.style.display == "none"){
      return false;
   }
   
   if(daDtCheck.innerHTML == "미입고"){
      daDtCheck.innerHTML = "입고완료";
      daDtCheck.className = "badge badge-soft-success font-size-18";
      daDtCheck.nextElementSibling.value="Y";
   }else{
      daDtCheck.innerHTML = "미입고";
      daDtCheck.className = "badge badge-soft-danger font-size-18";
      daDtCheck.nextElementSibling.value="N";
   }
}

// 문자 발송 함수
function sendMessage(smsPhone, smsContent){
   let data = {
      phoneNumber : smsPhone,
      content : smsContent
   }
   $.ajax({
      method : "post",
      url : "/sendMSG",
      data : JSON.stringify(data),
      contentType:"application/json;charset=utf-8",
      dataType : "text",
      processData : false,
      success : function(){
         Swal.fire({
            title: "메세지가 전송되었습니다.",
            icon: "success",
              confirmButtonColor: '#3085d6',
              confirmButtonText: '확인',
                backdrop: true,
              }) 
      }
   });
}






const praRoomsDiv = document.getElementById("praRoomsDiv");
const praRoomDiv = document.getElementById("praRoomDiv");

const surRoomsDiv = document.getElementById("surRoomsDiv");
const surRoomDiv = document.getElementById("surRoomDiv");

const wardsDiv = document.getElementById("wardsDiv");
const wardDiv = document.getElementById("wardDiv");

const cagesDiv = document.getElementById("cagesDiv");
var cages;

const animalSelect = document.querySelector(".animalSelect");
const empSelect = document.querySelector(".empSelect");

// 시설물 가져오기
function getFacility(){
      praRoomsDiv.innerHTML = "";
      surRoomsDiv.innerHTML = "";
      wardsDiv.innerHTML = "";
      cagesDiv.innerHTML = "";
      
      if(removeDiv = praRoomDiv.getElementsByClassName("animalSelect")[0]){
         removeDiv.remove();
         surRoomDiv.getElementsByClassName("animalSelect")[0].remove();
         wardDiv.getElementsByClassName("animalSelect")[0].remove();
      }
   
      $.ajax({
         method : "post",
         url : "/setting/list",
         dataType : "json",
         contentType : "application/json;charset=utf-8",
         processData : false,
         success : function(rslt){
            console.log(rslt);
            let newSelect = animalSelect.cloneNode(true);
            for(let i = 0; i < rslt.animalList.length; i++){
               newSelect.appendChild(makeOption(rslt.animalList[i].animalCd, rslt.animalList[i].animalType));
            }
            newSelect.style.display = "";
            cloneSelect = newSelect.cloneNode(true);
            cloneSelect.className += " praRoomEdit";
            praRoomDiv.children[0].children[1].prepend(cloneSelect);
            
            cloneSelect = newSelect.cloneNode(true);
            cloneSelect.className += " surRoomEdit";
            surRoomDiv.children[0].children[0].append(cloneSelect);
            
            cloneSelect = newSelect.cloneNode(true);
            cloneSelect.className += " wardEdit";
            wardDiv.children[0].children[1].prepend(cloneSelect);
            
            
            $("#praRoomCnt").val(rslt.praRoomList.length);
            for(let i = 0; i < rslt.praRoomList.length; i++){
               let newDiv = makeCloneDiv(praRoomDiv, praRoomsDiv, i+1);
               newDiv.children[0].children[1].children[0].value = rslt.praRoomList[i].animalCd;
               
               let newSelect = empSelect.cloneNode(true);
               newSelect.className += " praRoomEdit";
               newSelect.appendChild(makeOption(rslt.praRoomList[i].empId, rslt.praRoomList[i].empName));
               newSelect.value = rslt.praRoomList[i].empId;
               newDiv.children[0].children[1].appendChild(newSelect);
               newDiv.children[0].children[2].value = rslt.praRoomList[i].praRoomNm;
               
               newSelect.style.display = "";
               newDiv.style.display="";
            }

            $("#surRoomCnt").val(rslt.surRoomList.length);
            for(let i = 0; i < rslt.surRoomList.length; i++){
               let newDiv = makeCloneDiv(surRoomDiv, surRoomsDiv, i+1);
               newDiv.children[0].children[0].children[1].value = rslt.surRoomList[i].animalCd;
               newDiv.children[0].children[1].value = rslt.surRoomList[i].surRoomNm;
               
               newDiv.style.display="";
            }

            $("#wardCnt").val(rslt.wardList.length);
            for(let i = 0; i < rslt.wardList.length; i++){
               let newDiv = makeCloneDiv(wardDiv, wardsDiv, i+1);
               newDiv.children[0].children[1].children[2].value = rslt.wardList[i].wardAmount;
               newDiv.children[0].children[1].children[1].value = rslt.wardList[i].wardName;
               newDiv.children[0].children[1].children[0].value = rslt.wardList[i].animalCd;
               newDiv.children[0].children[2].value = rslt.wardList[i].wardNm;
               
               newDiv.style.display="";
            }

            $("#cageCnt").val(rslt.cageList.length);
            cages = rslt.cageList;
         }
      });
}

function updateCnt(roomId, cal){
   let target = document.getElementById(roomId + "Cnt");
   if(cal == "-"){
      target.value = target.value - 1;
   }else{
      target.value = target.value + 1;
   }
}

function showWard(div){
   cagesDiv.innerHTML = "";
   wardNm = div.children[0].children[2].value;
   document.cageForm.innerHTML = "<input type='text' value='" + wardNm + "' name='wardNm' style='display:none;'/>"
   
   for(let i = 0; i < cages.length; i++){
      if(cages[i].wardNm == wardNm){
         let newDiv = makeCloneDiv(cageDiv, cagesDiv, i+1);
         newDiv.children[0].children[1].children[0].value = cages[i].cageSize;
         newDiv.children[0].children[1].children[1].value = cages[i].cageCon;
         newDiv.children[0].children[2].value = cages[i].cageNm;
         
         newDiv.style.display="";
      }
   }
}

function makeCloneDiv(roomDiv, roomsDiv, num){
   let newDiv = roomsDiv.appendChild(roomDiv.cloneNode(true));
   newDiv.id = roomDiv.id + num;
   
   let tempDiv = newDiv.children[0].children[0];
   
   if(roomDiv.id == "surRoomDiv"){
      tempDiv.children[0].innerHTML = num + tempDiv.children[0].innerHTML;
   }else{
      tempDiv.innerHTML = num + tempDiv.innerHTML;
   }
   newDiv.className += (" " + roomDiv.id.replace("Div", "Edit"));
   return newDiv;
}

function makeOption(value, innerHtml){
   let option = document.createElement('option');
   option.innerHTML = innerHtml;
   option.value = value;
   return option;
}


const addBtn = document.querySelectorAll(".addBtn");


function editFacility(btn){
   let roomName = btn.dataset.room;
   
   let editInput = document.getElementsByClassName(roomName +"Edit");
   let addRoomBtn = document.getElementById(roomName +"Btn");
   let draggableRooms = document.getElementsByClassName(roomName + "Div");
   
   btn.style.display = "none";    // 수정 버튼 비활성화
   btn.nextElementSibling.style.display = "";   // 저장 버튼 활성화
   
   addRoomBtn.style.display = "";   // 방 추가 버튼 활성화
//    if(roomName == "ward"){
//       document.getElementById("cageBtn").style.display = "";
//    }

   for(let i = 0; i<editInput.length; i++){
      editInput[i].disabled = false;
   }
   
   for(let i = 0; i<draggableRooms.length; i++){
      draggableRooms[i].draggable=true;
   }
}

function saveFacility(btn){
   let roomName = btn.dataset.room;
   
   let editInput = document.getElementsByClassName(roomName+"Edit");
   let addRoomBtn = document.getElementById(roomName +"Btn");
   let draggableRooms = document.getElementsByClassName(roomName + "Div");
   
   btn.style.display = "none";
   btn.previousElementSibling.style.display = "";

   addRoomBtn.style.display = "none";
   if(roomName == "ward"){
      document.getElementById("cageBtn").style.display = "none";
   }
   
   for(let i = 0; i<draggableRooms.length; i++){
      draggableRooms[i].draggable=false;
   }
   

   if(roomName == "praRoom"){
      submitPraRoom();   
   }else if(roomName == "surRoom"){
      submitSurRoom();   
   }else if(roomName == "ward"){
      submitWard();
   }else if(roomName == "cage"){
      submitCage();
   }
   
   for(let i = 0; i<editInput.length; i++){
      editInput[i].disabled = true;
   }
}


let isRoomIn = true;
let target;
$(document).on("dragstart", ".dragRoom", function(event){
   target = document.getElementById(event.target.id);
   isRoomIn = true;
})
$(document).on("dragleave", ".dragRoom", function(event){
   target.style.opacity = "0.8";
   isRoomIn = false;
})
$(document).on("dragover", ".dragRoom", function(event){
   target.style.opacity = "1";
   isRoomIn = true;
})
$(document).on("dragend", ".dragRoom", function(event){
   if(!isRoomIn){
      target.remove();
      updateCnt(target.id.substring(0, target.id.indexOf("Div")), "-");
   }
})

function addRoom(btn){
   id = btn.id.replace("Btn", "");
   let roomsDiv = document.getElementById(id + "sDiv");
   let roomDiv = document.getElementById(id + "Div");
   let roomCntInput = document.getElementById(id + "Cnt");
   
   roomCntInput.value= parseInt(roomCntInput.value)+1;
   
   let newDiv = makeCloneDiv(roomDiv, roomsDiv, roomCntInput.value);
   newDiv.style.display="";
   if(id == "praRoom"){
      empSelectClone = empSelect.cloneNode(true);
      empSelectClone.disabled = false;
      newDiv.children[0].children[1].appendChild(empSelectClone).style.display="";
   }
}

function submitPraRoom(){
   let praRoomForms = document.querySelectorAll(".praRoomForm");
   
//    console.log(JSON.stringify($("#praRoomForm").serialize()));
//    console.log(JSON.stringify($("#praRoomForm").serializeArray()));
   
   $.ajax({
      method : "post",
      url : "/setting/updatePraRoom",
      data : JSON.stringify($("#praRoomForm").serializeArray()),
      dataType : "text",
      contentType : "application/json;charset=utf-8",
//       contentType : false,
      processData : false,
      success : function(rslt){
         Swal.fire({
               title: "진료실을 수정하였습니다.",
               icon: "success",
                 confirmButtonColor: '#3085d6',
                 confirmButtonText: '확인',
                   backdrop: true,
              })
         getFacility();
      }
   })
}

function submitSurRoom(){
//    console.log(JSON.stringify($("#surRoomForm").serializeArray()));
   
   $.ajax({
      method : "post",
      url : "/setting/updateSurRoom",
      data : JSON.stringify($("#surRoomForm").serializeArray()),
      dataType : "text",
      contentType : "application/json;charset=utf-8",
//       contentType : false,
      processData : false,
      success : function(rslt){
         Swal.fire({
               icon: "success",
               title: "수술실을 수정하였습니다.",
                 confirmButtonColor: '#3085d6',
                 confirmButtonText: '확인',
                   backdrop: true,
              })
         getFacility();
      }
   })
}

function submitCage(){
//    console.log(JSON.stringify($("#cagesDiv").serializeArray()));
   
   $.ajax({
      method : "post",
      url : "/setting/updateCage",
      data : JSON.stringify($("#cagesDiv").serializeArray()),
      dataType : "text",
      contentType : "application/json;charset=utf-8",
      processData : false,
      success : function(rslt){
         Swal.fire({
            icon: "success",
            title: "입원실을 수정하였습니다.",
              confirmButtonColor: '#3085d6',
              confirmButtonText: '확인',
                backdrop: true,
           })
         getFacility();
      }
   })
}

function submitWard(){
   console.log(JSON.stringify($("#wardsDiv").serializeArray()));
   
   $.ajax({
      method : "post",
      url : "/setting/updateWard",
      data : JSON.stringify($("#wardsDiv").serializeArray()),
      dataType : "text",
      contentType : "application/json;charset=utf-8",
      processData : false,
      success : function(rslt){
         Swal.fire({
            icon: "success",
            title: "병동을 수정하였습니다.",
              confirmButtonColor: '#3085d6',
              confirmButtonText: '확인',
                backdrop: true,
           })
         getFacility();
      }
   })
}

// const forrrm=$("#surRoomsDiv");
// function submitsurRoom(){
//    let form = new FormData($("#surRoomsDiv")[0]);
//    console.log(document.forrrm.animalType);
//    console.log(forrrm.serialize());
//    console.log(JSON.stringify(forrrm.serialize()));
//    $.ajax({
//       method : "post",
//       url : "/setting/updatePraRoom",
//       data : JSON.stringify(forrrm.serializeArray()),
//       dataType : "text",
//       contentType : "application/json;charset=utf-8",
// //       contentType : false,
//       processData : false,
//       success : function(rslt){
         
//       }
//    })
   
// }

function changeAnimalCd(animalSelect){
   $.ajax({
      method : "post",
      url : "/setting/empListByAnimalCd",
      data : "animalCd="+animalSelect.value,
      dataType : "json",
      success : function(rslt){
         console.log(rslt);
         let empSelect = animalSelect.nextElementSibling;
         console.log(empSelect);
         empSelect.textContent = "";
         for(let i = 0; i<rslt.length; i++){
            let newOption = makeOption(rslt[i].empId, rslt[i].empName);
            empSelect.append(newOption);
         }
      }
   })
}

// 환자 주소api
window.onload = function(){
    document.getElementById("patAdd1").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("patAdd1").value = data.address; // 주소 넣기
                document.getElementById("patZipcode").value = data.zonecode; // 주소 넣기
                document.querySelector("input[name=patAdd2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
    
    document.getElementById("empAdd1").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("empAdd1").value = data.address; // 주소 넣기
                document.getElementById("empZipcode").value = data.zonecode; // 주소 넣기
                document.querySelector("input[name=empAdd2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

































// 크롬 오른쪽 클릭 막기
window.oncontextmenu = function () {
     return false;
};

</script>

<script>
// 헤더 검색창 숨기기
$(function(){
   document.getElementById("headerSearchBar").style.display="none";
})
</script>