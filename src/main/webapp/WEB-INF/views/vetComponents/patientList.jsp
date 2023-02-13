<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authentication property="principal" var="principal" />

<style>
.mt-3 {
	margin: 0px 10px 0px 10px;
}

.modal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#patientListBar .table>:not(:last-child)>:last-child>* {
	border-bottom-color: #8f91eb;
}

.card-text {
	font-size: 1.2em;
}
</style>


<!-- <div id="patientListBar" class="col-xl-2" -->
<!-- 	style="height: auto; padding: 0px; margin: 0px; background-color: #ffffff; border: 1px solid none; padding: 3px;"> -->
<div class="col-xl-2" id="patientListBar">
	<div class="row h-80">
		<div class="col-xl-12">
			<div class="card"
				style="background-color: #ffffff; border-radius: 10px; padding-top: 10px;">
<!-- 				<h5  style="text-align: center; color: gray;" id="toDayPtag0"></h5> -->
<!-- 				<h6  style="text-align: center; font-weight: 500; color: gray;" id="toDayPtag"></h6> -->
				<!-- 진료실별 div -->
				<c:forEach items="${praList }" var="i">
					<div class="mt-3" style="padding-bottom: 20px;">
						<div class="table-responsive">
							<table class="table mb-0 jinryosil"
								style="border-collapse: separate; border-radius: 10px; border-collapse: separate; border-radius: 10px; border: 1px solid white; background-color: white; margin: 20px 0px;">

								<thead style="width: 30px;">
									<tr>
										<th colspan="2" style="font-size: 1.2em; padding: 3px 12px;"><input
											type="hidden" value=" ${i.praRoomNm }">진료실
											${i.praRoomNm } <i style="color: #4f9dff;" class="fas fa-user-md"></i>
											<span style="color: #4f9dff;">${i.empName }</span>
											 <i class="ri-arrow-up-s-line tableDrop"></i>
											<span style="font-size: 0.9em;"> [<span
												class="waitCount"></span>명]
										</span></th>
									</tr>
								</thead>
								<tbody class="jinryo" style="display:">
								</tbody>
							</table>
						</div>
					</div>
				</c:forEach>




				<div
					style="background-color: white; background-color: #ffffff; border-radius: 10px;">
					<div class="mt-3" style="padding-bottom: 20px;">
						<div class="table-responsive">
							<table class="table mb-0" id="receiptTable"
								style="border-collapse: separate; border-radius: 10px; border-collapse: separate; border-radius: 10px; border: 1px solid white; background-color: white; margin: 20px 0px;">

								<thead style="width: 30px;">
									<tr style="border: 1px solid white;">
										<th colspan="2" style="padding: 3px 12px; font-size: 1.1em;">수납대기
											<i class="ri-arrow-down-s-line tableDrop"></i> <!--                         　  　[<span class="wCount"></span>명] -->
										</th>
									</tr>
								</thead>
								<tbody id="receiptsil">
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div
					style="background-color: white; background-color: #ffffff; border-radius: 10px;">
					<div class="mt-3" style="padding-bottom: 20px;">
						<div class="table-responsive">
							<table class="table mb-0" id="receiptResultTable"
								style="border-collapse: separate; border-radius: 10px; border-collapse: separate; border-radius: 10px; border: 1px solid white; background-color: white; margin: 20px 0px;">

								<thead style="width: 30px;">
									<tr style="border: 1px solid white;">
										<th colspan="2" style="padding: 3px 12px; font-size: 1.1em;">수납실
											<i class="ri-arrow-up-s-line tableDrop2"></i>
										</th>
									</tr>
								</thead>
								<tbody id="receipt2fix" style="border-bottom: 1px solid red;">
								</tbody>
								<tbody id="receipt2" style="display: none;">
									<!--    <tr>
                        <th style="text-align: center;">깜이</th>
                        <td style="padding: 0px; vertical-align: middle;">
                        <button type="button" class="btn btn-primary btn-sm btn-rounded waves-effect waves-light">진료중</button></td>
                     </tr>  -->
								</tbody>
							</table>
						</div>
					</div>
				</div>


				<div
					style="background-color: white; background-color: #ffffff; border-radius: 10px;">
					<div class="mt-3" style="padding-bottom: 20px;">
						<div class="table-responsive">
							<table class="table mb-0"
								style="border-collapse: separate; border-radius: 10px; border: 1px solid none; background-color: white; margin: 20px 0px; margin-top: 0px;">


								<thead style="width: 30px;">
									<tr style="border: 1px solid white;">
										<th colspan="2" style="padding: 3px 12px; font-size: 1.1em;">예약<i
											class="ri-arrow-down-s-line tableDrop"></i></th>
									</tr>
								</thead>
								<tbody id="reserList" style="font-size: 1.2em;">
									<c:if test="${empty reservationList }">
										<tr>
											<td>예약된 환자가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty reservationList }">
										<c:forEach items="${reservationList }" var="i">
											<tr>
												<th style="text-align: center;">${i.patName }</th>
												<input class="reserNo" type="hidden" value="${i.resNm}">
												<input class="patIDclass" type="hidden" value="${i.patId}">
												<td style="padding: 0px; vertical-align: middle;">
													<button
														class="btn btn-light btn-sm btn-rounded waves-effect waves-light reserBtn"
														data-bs-toggle="modal"
														data-bs-target=".bs-example-modal-center22" style="font-weight: 700;">　${i.resTime }　</button>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>













<!-- </div> -->
<!-- patientListBar끝  -->
<!-- 입원하는 모달 -->
<div class="modal fade bs-example-modal-center11" tabindex="-1"
	id="enterModal" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="font-weight: bolder;" class="modal-title">입원</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div style="text-align: center;" class="modal-body">
				<p id="enterName" style="font-weight: bolder; font-size: 1.5em;"></p>
				<input type="hidden" id="praCdEnterHidden" value=""> <input
					type="hidden" id="enterHidden" value=""> <select
					class="form-select" style="width: 150px; display: inline-block"
					id="wardSelect">
					<option style="width: 200px;">-병동선택-</option>
					<c:forEach items="${wardList }" var="i">
						<option value="${i.wardNm }">${i.wardName}</option>
					</c:forEach>
				</select> <select class="form-select"
					style="width: 150px; display: inline-block" id="cageSelect">
					<option>-케이지선택-</option>
				</select><br /> <span style="font-size: 1.3em; font-weight: 500;">케이지로 이동합니다</span>

			</div>
			<div class="modal-footer"
				style="display: flex; justify-content: center;">
				<button type="button"
					class="btn btn-primary waves-effect waves-light" id="enterCheck">확인</button>
				<button type="button" class="btn btn-light waves-effect"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<!--예약 접수하는 모달 -->
<div class="modal fade bs-example-modal-center22" tabindex="-1"
	id="reservationModal" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="font-weight: bolder;" class="modal-title">예약</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div style="text-align: center;" class="modal-body">
				<!--             <input type="hidden" id="enterHidden" value=""> -->
				<input type="hidden" id="reserNm" value=""> <span
					id="reservationName" style="font-weight: bolder; font: 1.5em;"></span>
				<span style="font-weight: bolder; font: 1.5em;">환자 접수를
					진행하시겠습니까?</span>
			</div>
			<div class="modal-footer"
				style="display: flex; justify-content: center;">
				<button type="button" id="reserCancel"
					class="btn btn-light waves-effect" data-bs-dismiss="modal">예약취소</button>
				<button type="button" id="reserConfirm"
					class="btn btn-primary waves-effect waves-light">확인</button>
			</div>
		</div>
	</div>
</div>





<script>
   $(function(){
      //날짜
 	let today = new Date();
	
 	let year = today.getFullYear(); 
 	// 월 getMonth() (0~11로 1월이 0으로 표현되기 때문에 + 1을 해주어야 원하는 월을 구할 수 있다.)
 	let month = today.getMonth() + 1
 	let date = today.getDate(); // 일
     $("#toDayPtag0").text(year+"년 "+month+"월 "+date+"일")
	getTime()


      
	  
	   
      //메모바 기본 감춤
      $("#memoBar").hide();
      
      //진료실 토글      
      $(".ri-arrow-up-s-line").on("click",function(){
         reClass = $(this).attr('class').split(" ")
         if(reClass[0] == "ri-arrow-up-s-line"){
            $(this).attr('class','ri-arrow-down-s-line')
         }else{
            $(this).attr('class','ri-arrow-up-s-line')
         }
         
      })
      
      $(".ri-arrow-down-s-line").on("click",function(){
         reClass = $(this).attr('class').split(" ")
         if(reClass[0] == "ri-arrow-down-s-line"){
            $(this).attr('class','ri-arrow-up-s-line')
         }else{
            $(this).attr('class','ri-arrow-down-s-line')
         }
         
      })
      
      //예약취소
      $("#reserCancel").on("click",function(e){
         $("#reservationModal").modal('hide');
         $("#search").val("")
          var rNo = $(this).parents(".modal-content").find(".modal-body").find("#reserNm").val() //예약번호 뽑음

         var trLength = $("#reserList tr").length //예약 tr갯수
         for(var i=0; i<trLength; i++){
            console.log("순서",$("#reserList tr").eq(i).find(".reserNo").val())
            if($("#reserList tr").eq(i).find(".reserNo").val() == rNo){
               $("#reserList tr").eq(i).fadeOut("slow")
            }
         }
          //reservationUpdate
          this.timer = setTimeout(function () {
         $.ajax({
            url : "/reservationUpdate",
            type : "POST",
            data : {resNm : rNo},
            async : true,
            cache : false,
            dataTyspe : "text",
            success : function(data) { // 성공
               console.log("reservationUpdate",data);
               //예약리스트 환기시키기
               showReserList()
               $("#wonmuMain").show();
            },
            error : function(request, status, error) {
               console.log("reservationUpdate:" + request.status + "\n"
                     + "message:" + request.responseText + "\n"
                     + "error:" + error);
            }
         });
          }, 1000);
         
      })
      
      //예약리스트에서 예약-접수확인 클릭시에
      //접수화면으로 넘기고 예약에서 
      $("#reserConfirm").on("click",function(){
         $(".ri-search-line").trigger('click');
         $("#reservationModal").modal('hide');
         var rNo = $(this).parents(".modal-content").find(".modal-body").find("#reserNm").val() //예약번호 뽑음
         
         var trLength = $("#reserList tr").length //예약 tr갯수
         for(var i=0; i<trLength; i++){
            console.log("순서",$("#reserList tr").eq(i).find(".reserNo").val())
            if($("#reserList tr").eq(i).find(".reserNo").val() == rNo){
               $("#reserList tr").eq(i).fadeOut("slow")
            }
         }
         
         //reservationUpdate
         this.timer = setTimeout(function () {
         $.ajax({
            url : "/reservationUpdate",
            type : "POST",
            data : {resNm : rNo},
            async : true,
            cache : false,
            dataTyspe : "text",
            success : function(data) { // 성공
               console.log("reservationUpdate",data)
               //예약리스트 환기시키기
               showReserList()
            },
            error : function(request, status, error) {
               console.log("reservationUpdate:" + request.status + "\n"
                     + "message:" + request.responseText + "\n"
                     + "error:" + error);
            }
         });
         }, 1000);
         
         
      })

      $(".btn-close").on("click",function(){
         $("#search").val("")
      })

      //예약 버튼 눌렀을 떄 
      $(document).on('click', '.reserBtn', function() {
         //patId가져왔음 : $(this).closest("tr").find(".patIDclass").val()
         reserName = $(this).closest("tr").find("th").text()
         reserHidden =  $(this).closest("tr").find(".patIDclass").val()
         reserNo = $(this).closest("tr").find(".reserNo").val()
         $("#reservationName").text(reserName)
         $("#reserNm").val(reserNo)
         //patid로 memtel을 가져오기
         
         $("#search").val("")
         
         
         $("#memoPatName").text(reserName)
         $("#memoPatId").val(reserHidden)
         $("#memoBar").show();
         showMemo(reserHidden);
         
         $.ajax({
            url : "/patIdSearch",
            type : "POST",
            data : {patId : reserHidden},
            async : true,
            cache : false,
            dataTyspe : "json",
            success : function(data) { // 성공
//                console.log("patIdSearch",data.memTel)
               $("#search").val(reserName+"("+data.memTel+")");
            },
            error : function(request, status, error) {
               console.log("patIdSearch:" + request.status + "\n"
                     + "message:" + request.responseText + "\n"
                     + "error:" + error);
            }
         });
         
      })
      
      
      
      
      
      
      var firstTr=""
//       수정금지
      jinryosil = document.querySelectorAll(".jinryosil"); //배열
      tboddy = $('.jinryosil').children('tbody');
      for(var i=0; i<jinryosil.length; i++){
         showPatiList(i+1)  //리스트 실행
       } 
      receiptList();
//       수정금지////////////////////////////
         
      //테이블 접고펼치기
      $(".tableDrop").on("click",function(){
         tbody = $(this).parents("thead").siblings("tbody")         
         tbody.toggle('500',function(){ })
      })
      $(".tableDrop2").on("click",function(){
//          tbody = $(this).parents("thead").siblings("tbody").eq(1)   
         tbody = $("#receipt2")   
         tbody.toggle('500',function(){ })
         
      })

      //진료실 버튼 클릭
       $(document).on('click', '.jinryosil .status-btn', function(e){
         patName = $(this).closest("tr").find("th").text()
         patIds =  $(this).closest("tr").find(".patListId").val()
         $("#memoPatName").text(patName)
         $("#memoPatId").val(patIds)
         $("#memoBar").show();
         showMemo(patIds);
          
       })
      
      

      //수납대기실의 버튼을 선택하면/!
       $(document).on('click', '#receiptsil .status-btn', function(e){
            enterName = $(this).closest("tr").find("th").text()
            enterHidden =  $(this).closest("tr").find(".patIDclass").val()
            praCdHidden =  $(this).closest("tr").find(".praCdHidden").val()
            patListId =  $(this).closest("tr").find(".patListId").val()
            patIDclass =  $(this).closest("tr").find(".patIDclass").val()
            patNameclass =  $(this).closest("tr").find(".patNameclass").text()
            $("#enterName").text(patNameclass)
            $("#enterHidden").val(enterHidden)
            $("#praCdEnterHidden").val(praCdHidden)
            $("#hiddenPraCd").val(praCdHidden)
            $(".hiddenPraCd").val(praCdHidden)
//             $("#progressReceipt .hiddenPraCd").val(praCdHidden)
            $("#memoPatName").text(enterName)
            $("#memoPatId").val(patIDclass)
            $("#praCode").text(praCdHidden)
            $("#praCodeName").text(enterName)
            $("#memoBar").show();
            $("#change").val("")
            
            showMemo(enterHidden); 
            
    		
            details(praCdHidden)
            
            //수납대기 클릭하면 바로 접수창으로 보일 수 있도록하자
            $("#moneyTotal").empty()
            $("#sum").empty()
            $("#wonmuMain").hide()
            $("#receipt").hide()
//             $("#progressReceipt").show()
            
            $("#payId").text("NO."+enterHidden)
            $("#payName").text(enterName)
            
            var btnText = $(this).text().trim()
            if(btnText == "수납대기"){
                $("#progressReceipt").show()
	            showReceitpDetail(praCdHidden)
            }else{
            	return false;
            }
            
            
            //원외처방여부를 확인해서 버튼 변경
    		
    		$.ajax({
      			url : "/countPreOut",
      			type : "POST",
      			data : {praCd : praCdHidden},
      			dataType : "text",
      			context: this,
      			success : function(data) { // 성공\
      				
      				if(data == "0"){//원외처방 없다
      					$("#prescription").attr("disabled", true);
      					$("#prescriptionDes").html("원외처방내역이 없습니다.")
      				}else{
      					$("#prescription").attr("disabled", false);
      					$("#prescriptionDes").html("원외처방 내역을 확인해주세요.")
      					
      				}
      			},
      			error : function(request, status, error) {
      				console.log("code:" + request.status + "\n"
      						+ "message:" + request.responseText + "\n"
      						+ "error:" + error);
      			}
      		});
            
            
            //날짜명시
    		
    		$.ajax({
      			url : "/praCdDate",
      			type : "POST",
      			data : {praCd : praCdHidden},
      			dataType : "json",
      			context: this,
      			success : function(data) { // 성공\
      				console.log("날짜",data)
      				$("#praYY").text(data.YY);
      				$("#praMM").text(data.MM);
      				$("#praDD").text(data.DD);
      				
      			},
      			error : function(request, status, error) {
      				console.log("날짜code:" + request.status + "\n"
      						+ "message:" + request.responseText + "\n"
      						+ "error:" + error);
      			}
      		});
            
            
            
            
            
            
       })
       
       //수납실에서 수납완료 버튼 누르면
        $(document).on('click', '#receiptResultTable .status-btn', function(e){
            enterName = $(this).closest("tr").find("th").text()
            enterHidden =  $(this).closest("tr").find(".patIDclass").val()
            praCdHidden =  $(this).closest("tr").find(".praCdHidden").val()
            patIDclass =  $(this).closest("tr").find(".patIDclass").val()
            $("#enterName").text(enterName+"환자를");
            $("#enterHidden").val(enterHidden);      
            $("#praCdEnterHidden").val(praCdHidden)

            
            console.log(enterHidden)
            $("#memoBar").show();
            showMemo(enterHidden);
            
            //환자기록 가져오기
            $("#memoBar").show()
            $("#memoPatId").val(patIDclass)
            $("#memoPatName").text(enterName)

            
        })
       
       //입원수속
       $("#enterCheck").on("click",function(){
            //${principal.empVO.empName }
            EpatId = $("#enterHidden").val();
            EpraCd = $(".praCdHidden").val()
            var EcageNm = $("#cageSelect").val()//케이지넘버
            $("#wonmuMain").show();            
            EempId = `${principal.empVO.empId }`
            
          $.ajax({
               url : "/enterStay",
               type : "POST",
               data : {
                  patId : EpatId,
                  praCd : EpraCd,
                  cageNm : EcageNm,
                  empId : EempId                  
               },
               dataType : "json",
               success : function(data) { // 성공
                  console.log("입원성공",data)
                  if(data > 0){//이미 환자가 있다
                     Swal.fire({
                        title: "이미 입원 처리된 환자입니다.",
                        icon: "warning",
                          confirmButtonColor: '#3085d6',
                          confirmButtonText: '확인',
                            backdrop: true,
                          }).then((result) => {
                                 if (result.isConfirmed) {
                                       //모달닫기
                                       $("#enterModal").modal('hide');
                                 }
                             })    
                  }else{
                     Swal.fire({
                        title: "입원등록이 완료되었습니다.",
                        icon: "success",
                          confirmButtonColor: '#3085d6',
                          confirmButtonText: '확인',
                            backdrop: true,
                          }).then((result) => {
                                 if (result.isConfirmed) {
                                       //모달닫기
                                       $("#enterModal").modal('hide');
                                       
//                                        var rNo = $("#enterCheck").parents(".modal-content").find(".modal-body").find("#praCdEnterHidden").val() //진료코드 뽑음
                                       var rNo = $("#enterCheck").parents(".modal-content").find(".modal-body").find("#praCdEnterHidden").val() //진료코드 뽑음
                                       console.log("입원하는애 진료코드", rNo)
                                       var receiptsil = $("#receiptsil tr").length //예약 tr갯수
                                       for(var i=0; i<receiptsil; i++){
                                          if($("#receiptsil tr").eq(i).find(".praCdHidden").val() == rNo){
                                             $("#receiptsil tr").eq(i).fadeOut("slow")
                                          }
                                       }
                                 }
                             }) 
                  }
                  

               },
               error : function(request, status, error) {
                  console.log("code:" + request.status + "\n"
                        + "enterStay@!! message:" + request.responseText + "\n"
                        + "error:" + error);
               }
            });
       })
          
       
       
       //병동 선택에 따른 잔여 케이지 보이기
       $("#wardSelect").on("change",function(){
            var warNumber = this.value;//병동의 번호를 가져왔다.
            
            $.ajax({
               url : "/vacantCage",
               type : "POST",
               data : {wardNm : warNumber},
               dataType : "json",
               success : function(data) { // 성공
                  console.log("빈병동성공",data)
                  code = ""
                  
                  if(data.length > 0){
                     for(var i=0; i<data.length; i++){
                     code +=
                        `
                        <option>\${data[i].cageNm}</option>
                        
                        `
                     }
                  }else{
                     code +=
                        `<option style="width: 200px;">빈케이지가 없습니다.</option>`
                  }
                  $("#cageSelect").html(code);
                  

               },
               error : function(request, status, error) {
                  console.log("code:" + request.status + "\n"
                        + "vacantCage@!! message:" + request.responseText + "\n"
                        + "error:" + error);
               }
            });
            
            
       })

      
      
   });
   
   async function checkRoomNm() {
	      const response = await fetch("/medic/roomNm", {
	         method: "POST",
	         cache: "no-cache",
	      });
	      const roomNm = await response.text();

	      return roomNm;
	   }
   
   
   
   //진료실 번호에 따라 환자리스트 불러옴
    function showPatiList(num) {

      var param ={            
            praRoomNm : num
      }
      $.ajax({
         url : "/patientList",
         type : "POST",
         data : param,
         dataType : "json",
         success : function(data) { // 성공
//             console.log("/patientList :", data)
            
            name=""
             for(var i=0; i<data.length; i++){
                name += 
                  `<tr sytle="height : 20px; padding : 0px;" >
                     <th style="font-size : 1.2em; text-align: center; width : 55%;  padding-left : 0px; padding-right : 0px;" class="patTr"> \${data[i].patName}</th>
                     <input class="patListId" type="hidden" value="\${data[i].patId}">
                     <input class="patListRecNm" type="hidden" value="\${data[i].recNm}">
                     <td style="text-align : center; padding: 0px; vertical-align: middle; width : 45%">
                     <button type="button" data-pat-id="\${data[i].patId}" data-rec-nm="\${data[i].recNm}"
                     class="btn btn-outline-success btn-sm btn-rounded waves-effect waves-light status-btn "style="font-weight:700;">
                     \${data[i].recStatus}</button></td>
                  </tr>
                  ` 
             }
         
                  tboddy[num-1].innerHTML = "";
                  tboddy[num-1].innerHTML = name;
                  if (typeof displayPatient === "function") {
                     tboddy[num-1].addEventListener("mouseup", displayPatient);
                  }
                  
                  
                  
                  //총인원 넣기
                  waitCount = document.querySelectorAll(".waitCount")
                  
                  var a = tboddy[num-1].innerHTML
                  var results = a.match(/진료대기/g); 
                  wait = "";
                  if(results != null) {
                     wait = results.length;
                  }else{
                     wait = 0;
                  }
                  
                  waitCount[num-1].innerHTML=wait;
                  
                  //색바꾸기 
                  chheecck = document.querySelectorAll(".status-btn")
                  for(var i=0; i<chheecck.length; i++){
                     if(chheecck[i].innerText.trim() == "진료중"){
                        chheecck[i].setAttribute('class','btn btn-success btn-sm btn-rounded waves-effect waves-light status-btn')
                        }
                     }   
                  
                  
                  
                  
         },
         error : function(request, status, error) {
            console.log("code:" + request.status + "\n"
                  + "patientList@!! message:" + request.responseText + "\n"
                  + "error:" + error);
         }
      });
      
   }  
      //진료실 번호에 따라 환자리스트 불러옴
      
      
     function receiptListAni() {
         $("#receipt2fix").attr('class','animate__animated animate__backInDown')
      
   }
      
      
      
   //수납실 환자리스트 불러옴
     function receiptList() {
      
      $.ajax({
         url : "/receiptList",
         type : "POST",
         dataType : "json",
         success : function(data) { // 성공
            nameWait=""
            console.log("receiptList",data)      
            for(var i=0; i<data.length; i++){
            	
            	if(data[i].recStatus == "수납대기"){
            		 nameWait +=
                         `
                         <tr>
                            <th style="font-size : 1.2em;text-align: center; width : 55%;  padding-left : 0px; padding-right : 0px;"> \${data[i].patName}</th>
                            <input class="patIDclass" type="hidden" value="\${data[i].patId}">
                            <input class="praCdHidden" type="hidden" value="\${data[i].praCd}">
                            <td style="padding: 0px; vertical-align: middle; width : 45%">
                            <button type="button" class="btn btn-outline-warning btn-sm btn-rounded waves-effect waves-light status-btn" style="font-weight:700;">
                            \${data[i].recStatus}</button></td>
                         </tr>
                         `
            	}else if(data[i].recStatus == "입원대기"){
            		 nameWait +=
            		`
                    <tr>
                       <th style="font-size : 1.2em; text-align: center; width : 55%;  padding-left : 0px; padding-right : 0px;" class="patNameclass"> \${data[i].patName}</th>
                       <input class="patIDclass" type="hidden" value="\${data[i].patId}">
                       <input class="praCdHidden" type="hidden" value="\${data[i].praCd}">
                       <td style="padding: 0px; vertical-align: middle; width : 45%">
                       <button type="button" class="btn btn-warning btn-sm btn-rounded waves-effect waves-light status-btn"
                    	data-bs-toggle="modal" data-bs-target=".bs-example-modal-center11" style="font-weight:700;">
                       \${data[i].recStatus}</button></td>
                    </tr>
                    `
            	}
            	
            }
         
            $("#receiptsil").html(nameWait);//수납대기
            
            if( $("#receiptsil").find("tr").eq(0).html() == undefined){ //수납대기에 아무도 없을 때 
               $("#nameSpan").parent(".card-text").text("현재 수납대기중인 환자가 없습니다.")
               $("#memoSpan").empty()
               $("#progress").attr('disabled','disabled')
               $("#openChart").attr('disabled','disabled')
               
            }else{
               $("#hiddenId").val(data[0].patId)
               $("#praCdSpan").val(data[0].patId)//진료번호 넣음
               $("#idSpan").val(data[0].patId)
               $("#nameSpan").text(data[0].patName)
               $("#genderSpan").text(data[0].patGender)
               $("#birthSpan").text(data[0].patBirth)
               $("#memoSpan").text(data[0].patMemo);


            }
            

         },
         error : function(request, status, error) {
            console.log("code:" + request.status + "\n"
                  + "patientList@!! message:" + request.responseText + "\n"
                  + "error:" + error);
         }
      });
      
      
      $.ajax({
         url : "/receiptList2",
         type : "POST",
         dataType : "json",
         success : function(data) { // 성공
            name=""
            name1=""
            console.log("receiptList2",data)   
            for(var i=1; i<data.length; i++){
               name += `
               <tr>
                  <th style="font-size:1.2em; text-align: center; width : 55%;  padding-left : 0px; padding-right : 0px;"> \${data[i].patName}</th>
                  <input class="patIDclass" type="hidden" value="\${data[i].patId}">
                  <input class="praCdHidden" type="hidden" value="\${data[i].praCd}">
                  <td style="padding: 0px; vertical-align: middle; width : 45%">
                  <button type="button" 
                  class="btn btn-danger btn-sm btn-rounded waves-effect waves-light status-btn"
                     data-bs-toggle="modal" data-bs-target=".bs-example-modal-center11" style="font-weight:700;">
                	  수납완료</button></td>
               </tr>
               `
            }
         
         $("#receipt2").html(name)
         
         if(data.length > 0){
        	  name1 += `
               <tr>
                  <th style=" font-size:1.2em; text-align: center; width : 55%;  padding-left : 0px; padding-right : 0px; border: solid 1px white;"> \${data[0].patName}</th>
                  <input class="patIDclass" type="hidden" value="\${data[0].patId}">
                  <input class="praCdHidden" type="hidden" value="\${data[0].praCd}">
                  <td style="padding: 0px; vertical-align: middle; width : 45%; border: solid 1px white;">
                  <button type="button" 
                  class="btn btn-danger btn-sm btn-rounded waves-effect waves-light status-btn"
                     data-bs-toggle="modal" data-bs-target=".bs-example-modal-center11" style="font-weight:700;">
                 	 수납완료</button></td>
           </tr>
               `
        	 $("#receipt2fix").html(name1)
         }
         
          
         
         
         
            
         },
         error : function(request, status, error) {
            console.log("code:" + request.status + "\n"
                  + "patientList@!! message:" + request.responseText + "\n"
                  + "error:" + error);
         }
      });
      
      
      
      
      
   }
      
      //수납실 환자리스트 불러옴
      
      function showReserList(){
//          reservationList
         $.ajax({
            url : "/reservationList",
            type : "POST",
            dataType : "json",
            success : function(data) { // 성공
//                console.log("reservationList",data);
               code =""
               if(data.length > 0){
                  for(var i=0; i<data.length; i++){
                     code += `
                        <tr>
                        <th style="text-align: center;">\${data[i].patName}</th>
                        <input class="reserNo" type="hidden" value="\${data[i].resNm}">
                        <input class="patIDclass" type="hidden" value="\${data[i].patId}">
                        <td style="padding: 0px; vertical-align: middle;">
                        <button class ="btn btn-light btn-sm btn-rounded waves-effect waves-light reserBtn"
                        data-bs-toggle="modal" data-bs-target=".bs-example-modal-center22" style="font-weight:700;"> \${data[i].resTime} </button></td>
                     </tr>   
                  `
                  }
               }else{
                  code += `<tr><td>예약된 환자가 없습니다.</td></tr>`
               }

               
               $("#reserList").html(code)
            },
            error : function(request, status, error) {
               console.log("code:" + request.status + "\n"
                     + "patientList@!! message:" + request.responseText + "\n"
                     + "error:" + error);
            }
         });
      }
      
      
      function showReceitpDetail(pracdNum){
    	  window.scrollTo(0,0)

    	 
    	 //입원여부를 체크한 후에 입원전의 금액 or 입원까지 모두 마친 세부 내역을 뽑아냄 (단순 금액 아님)
    	  $.ajax({
              url : "/resultPriceDetail",
              type : "POST",
              data : {praCd : pracdNum},
              async : true,
              cache : false,
              dataType : "json",
              success : function(data) { // 성공
           	   console.log("세부 내역",data)
           	   $("#praPrice").text((data.praPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원")
				$("#progressReceipt .hiddenPraCd").val(pracdNum)
           	   
           	   if( data.preInTotal != "0"){
           	  		var preInTotal = (data.preInTotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원";
           	  		$("#preInTotal").text(preInTotal);
           	  	}else{
           	  		$("#preInTotal").text("-");
           	  		
           	  	}
           	  	if( data.vaccinePrice != "0"){
           	  		var vaccinePrice = (data.vaccinePrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원";
           	  		$("#vaccineTotal").text(vaccinePrice);
           	  	}else{
           	  		$("#vaccineTotal").text("-");

           	  	}
           	  	if( data.testTotal != "0"){
           	  		$("#testTotal").text((data.testTotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원")
           	  	}else{
           	  		$("#testTotal").text("-")
           	  	}
           	  	if( data.stTotal != "0"){
           	  		var stTotal = data.stTotal - data.stFoodTotal;
           	  		$("#stTotal").text((stTotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원")
           	  	}else{
           	  		$("#stTotal").text("-")
           	  	}
           	  	if( data.stFoodTotal != "0"){
           	  		
           	  		$("#stFoodTotal").text((data.stFoodTotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원")
           	  	}else{
           	  		$("#stFoodTotal").text("-")
           	  	}
				
              },
              error : function(request, status, error) {
                 console.log("resultPriceDetail:" + request.status + "\n"
                       + "message:" + request.responseText + "\n"
                       + "error:" + error);
              }
           });
    	  
    	   	    //입원여부를 체크한 후에 입원전의 금액 or 입원까지 모두 마친 금액을 산출함
    	  $.ajax({
              url : "/resultPrice",
              type : "POST",
              data : {praCd : pracdNum},
              async : true,
              cache : false,
              dataType : "text",
              success : function(data) { // 성공
           	   console.log("최종금액확인",data)
           	   $("#wonSpan").text((data).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','))
				$("#wonSpanHidden").val(data);
           		$("#moneyTotal").val(data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
           		$("#sum").text(data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");
			
           	//분할결제 잔돈계산
				change=0;
				var total = $("#wonSpanHidden").val();
				$('#moneyTotal').on('keyup',function(){
			        var cnt = $("#moneyTotal").val().length;     
			        console.log("길이",cnt);
			        
				for( var i=1; i< cnt; i++){
				   var sum = parseInt($(this).val() || 0 );
				   change = total - sum
				   
				}
				$("#change").val((change).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
// 				$("#change").val((change).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
				});
				
				cardsum=0;
				$('#moneyTotal').on("change",function(){
					cardsum = $('#moneyTotal').val()
				})
				
                 },
              error : function(request, status, error) {
                 console.log("finalSum:" + request.status + "\n"
                       + "message:" + request.responseText + "\n"
                       + "error:" + error);
              }
           });
    	  
    	  
    	  
    	  
      }
      
      
      function getTime() {
  		var d = new Date();	// 현재 날짜와 시간
  		var hur = d.getHours();		// 시
  		var min = d.getMinutes();	//분
  		var sec = d.getSeconds();	//초

  		var timeBoard = document.getElementById("toDayPtag"); // 값이 입력될 공간
  		
  		var time = hur + " : " + min + " : " + sec// 형식 지정
  		
  		timeBoard.innerHTML = time;	// 출력
  		
  		setTimeout(getTime, 1000);	//1000밀리초(1초) 마다 반복
  	}
      
      
      
      
		

  	function details(hiddenPraCd){
  		//검사내역 리스트로 뽑아옴
  		 this.timer = setTimeout(function () {
  		$.ajax({
  			url : "/praCdTest",
  			type : "POST",
  			data : {praCd : hiddenPraCd},
  			dataType : "json",
  			context: this,
  			success : function(data) { // 성공\
  				console.log("praCdTest",data)
  				
  				
  				code =""
  	  				if(data.length > 0){
  	  					for(var i=0; i<data.length; i++){
  	  						var price = (data[i].testPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

  	  						code += `
  	  	  					<tr>
  	  	  					<td>\${data[i].testName}</td>
  	  	  					<td></td>
  	  	  					<td></td>
  	  	  					<td style="text-align: right;">\${price }</td>
  	  	  					</tr>
  	  	    				`	
  	  					}
  	  					$("#testTotalTbody").html(code);

  	  				}else{
  	  					$("#testTotalTbody").html("");
  	  				}
  				
  			
  			},
  			error : function(request, status, error) {
  				console.log("code:" + request.status + "\n"
  						+ "message:" + request.responseText + "\n"
  						+ "error:" + error);
  			}
  		});
  	    }, 200);
  	    
  	    //원내처방
  	    this.timer = setTimeout(function () {
  		$.ajax({
  			url : "/praCdDrug",
  			type : "POST",
  			data : {praCd : hiddenPraCd},
  			dataType : "json",
  			context: this,
  			success : function(data) { // 성공\
  				console.log("praCdDrug",data)
  				code =""
  				if(data.length > 0){
  					for(var i=0; i<data.length; i++){
  	  					
  						var price = (data[i].drugPrice*data[i].preInAmount * data[i].preInCnt * data[i].preInDays).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

  						
  						code += `
  	  					<tr>
  	  					<td>\${data[i].itemName}</td>
  	  					<td>\${price}</td>
  	  					<td>\${data[i].preInAmount * data[i].preInCnt * data[i].preInDays }</td>
  	  					<td style="text-align: right;">\${price }</td>
  	  					</tr>
  	    				`	
  					}
  					$("#preInTotalTbody").html(code);

  				}else{
  					$("#preInTotalTbody").html("");

  				}
  			},
  			error : function(request, status, error) {
  				console.log("praCdDrugcode:" + request.status + "\n"
  						+ "message:" + request.responseText + "\n"
  						+ "error:" + error);
  			}
  		});
  	    }, 200);
  	    
  	    
  	    //접종
  	    this.timer = setTimeout(function () {
  		$.ajax({
  			url : "/praCdVaccine",
  			type : "POST",
  			data : {praCd : hiddenPraCd},
  			dataType : "json",
  			context: this,
  			success : function(data) { // 성공\
  				console.log("praCdVaccine",data)
  				var code = "";
//   				vaccineTotalTbody
  				code =""
  	  				if(data.length > 0){
  	  					for(var i=0; i<data.length; i++){
  	  	  					
  	  						var vdPrice = (data[i].vdPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

  	  						code += `
  	  	  					<tr>
  	  	  					<td>\${data[i].vdName}</td>
  	  	  					<td>\${vdPrice}</td>
  	  	  					<td>1</td>
  	  	  					<td style="text-align: right;">\${vdPrice}</td>
  	  	  					</tr>
  	  	    				`	
  	  					}
  	  					
  	  					$("#vaccineTotalTbody").html(code);

  	  				}else{
  	  					$("#vaccineTotalTbody").html("");
  	  					
  	  				}
  			
  			},
  			error : function(request, status, error) {
  				console.log("code:" + request.status + "\n"
  						+ "message:" + request.responseText + "\n"
  						+ "error:" + error);
  			}
  		});
  	    }, 200);
  	    
  	    //입원여부를 체크한 후에 입원전의 금액 or 입원까지 모두 마친 금액을 산출함
  	    this.timer = setTimeout(function () {
  		$.ajax({
  			url : "/totalSum",
  			type : "POST",
  			data : {praCd : hiddenPraCd},
  			dataType : "json",
  			context: this,
  			success : function(data) { // 성공\
  				console.log("입원전/후의 금액",data)
  			},
  			error : function(request, status, error) {
  				console.log("totalSumcode:" + request.status + "\n"
  						+ "message:" + request.responseText + "\n"
  						+ "error:" + error);
  			}
  		});
  	    }, 200);
  	    
  	    
  	    
  	    
  	}
      
   
   </script>