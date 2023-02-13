
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib  uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authentication property="principal" var = "principal"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
.textST {
	width: 80px; 
	border: 1px solid #ced4da; 
	border-radius: 0.25rem;
}
.textST2 {
	width: 80px; 
	border: none;
	border-radius: 0.25rem;
}
</style>

<script>

$(function(){

   var enterRecordWrite = document.querySelector("#enterRecordWrite");
   var enterRecordList = document.querySelector("#enterRecordList");
   var enterRecordRead = document.querySelector("#enterRecordRead");
   var mediInsert = document.querySelector("#mediInsert");
   var foodList = document.querySelector("#foodList");
   var drugInsertInfo = document.querySelector("#drugInsertInfo");
   var recordPriceList = document.querySelector("#recordPriceList");
   var enterPriceList = document.querySelector("#enterPriceList");
   
 
   // 입원 일지 데이터 테이블
   var enterRecordTable = $("#enterRecordTable").DataTable({
	   pageLength : 9,
	   info: false,
	   lengthChange: false,
	   scrollX: false,
	   ordering: false,
	   language:{
		   search : "<a><i class='ri-search-line'></i></a>",
           zeroRecords : "검색 결과가 없습니다.",
			paginate : {
		            first : "처음",
		            last : "마지막",
		            next : "다음",
		            previous : "이전"
		        }
	   }
   });
   
   
   // 입원 일지 데이터 테이블 ajax
   function enterNoteList(){
	   var enterRecordTable = $("#enterRecordTable").DataTable();
	   enterRecordTable.destroy();
		$.ajax({
			method : "post",
			url : "/enter/notelist",
			dataType : "json",
			success : function(rslt) {
				$("#enterRecordTable").DataTable(
					{
					   pageLength : 9,
					   info: false,
					   lengthChange: false,
					   scrollX: false,
					   ordering: false,
					   language:{
						   search : "<a><i class='ri-search-line'></i></a>",
				           zeroRecords : "검색 결과가 없습니다.",
							paginate : {
						            first : "처음",
						            last : "마지막",
						            next : "다음",
						            previous : "이전"
						        }
					   },
						data : rslt,
						destroy: true,
						columns : [ {
							data : 'snNm',
							"defaultContent" : ""
						}, {
							data : 'stCd',
							"defaultContent" : ""
						},{
							data : 'patName',
							"defaultContent" : ""
						}, {
							data : 'cageNm',
							"defaultContent" : "",
							render : function(data, type, row, meta){
								return row.wardName + "-" + row.cageNm;
							}
						}, {
							data : 'snDate',
							"defaultContent" : ""
						}, {
							data : 'url',
							"defaultContent" : "",
							"render" : function(data, type, row){
// 								console.log("짱나", row.snNm);
								return '<button type="button" onclick="fgetRecord('+ row.snNm +')" class="btn btn-light btn-sm waves-effect waves-light"><i class="ri-file-text-line"></i></button>';
							}
						}
			
						]
							})
			}   
		   
		   
	   })
   }
   
   
   

// 	$(document).ready(function() {
// 		//예약 목록 불러오기 ajax
// 		enterNoteList();
// 	})
	
	
   // 일지 작성 버튼 -> 작성 폼
   $(document).on('click', '#recordInsertBtn', function(){
      $(enterRecordList).css("display", "none");
      $(enterRecordRead).css("display", "none");
      $(enterRecordWrite).css("display", "block");
   })
   
	// 현재 수납비 보기 버튼
   $(document).on('click', '#recordPriceBtn', function(){
      $(recordPriceList).css("display", "block");
      
   })

   // 현재 수납비 닫기 버튼
   $(document).on('click', '#listCloseBtn', function(){
      $(recordPriceList).css("display", "none");
   })


   // 일지 목록 버튼
   $(document).on('click', '.recordListBtn', function(){
      $(enterRecordWrite).css("display", "none");
      $(enterRecordRead).css("display", "none");
      $(enterRecordList).css("display", "block");
      enterNoteList();
   })

   // 일지 수정 버튼
   $(document).on('click', '#recordModyBtn', function(){
      $(enterRecordRead).css("display", "none");
      $(enterRecordWrite).css("display", "none");
      $(enterRecordList).css("display", "block");
      getEnterNoteList();
   })
   
   // 투약 정보 클릭 시 이벤트
$("#mediTable").on("click", "tr", function(){
   var str = ""
   var tdArr = [];
   
   // 현재 클릭된 Row(<tr>)
   var tr = $(this);
   var td = tr.children();
   console.log("클릭한 Row의 모든 데이터 : "+tr.text());
   
   td.each(function(i){
      tdArr.push(td.eq(i).text());
   });
   
   console.log("배열에 담긴 값 : "+tdArr);
   
     var drugNm =td.eq(0).text(); 
     var drugName =td.eq(1).text(); 
     var injAmount =td.eq(2).text(); 
     var injType =td.eq(5).text(); 
     
     str += "<tr><td><input type='text' class='textST2' name='drugNm' value='"+  drugNm + "' class='form-control'></td>"
      str += "<td><input type='text' class='textST2' name='drugName' value='"+  drugName + "' class='form-control' ></td>"
      str += "<td><input type='text' class='textST2' name='injAmount' value='"+  injAmount + "' class='form-control'></td>"
//       str += "<td><input type='text' name='injType' value='"+  injType + "' class='form-control'></td>"
      str += "<td><input class='form-control' type='datetime-local' name='injDate' value='13:45:00' id='example-time-input' style='width: 150px'></td></tr>"
         
      $(drugInsertInfo).html(str)
   
})


 // 식이 정보 클릭 시 이벤트
$("#foodTable tr").click(function(){
   var str = ""
   var tdArr = [];
   
   // 현재 클릭된 Row(<tr>)
   var tr = $(this);
   var td = tr.children();
   console.log("클릭한 Row의 모든 데이터 : "+tr.text());
   
   td.each(function(i){
      tdArr.push(td.eq(i).text());
   });
   
   console.log("배열에 담긴 값 : "+tdArr);
   
     var foodNm =td.eq(0).text(); 
     var foodName =td.eq(1).text(); 
     var foodPrice =td.eq(2).text(); 
     
     str += "<tr><td><input class='textST2' type='text' name='foodNm' value='"+foodNm +"' style='width : 25px;'></td>"
      str += "<td>"+ foodName +"</td>"
      str += "<td><input type='text' class='textST2' name='foodPrice' value='"+foodPrice +"'></td>"
      str += "<td><input class='form-control textS2' name='foodDate' type='datetime-local' value='13:45:00' id='example-time-input' style='width: 150px'></td></tr>"
         
      $("#foodInsertInfo").html(str)
   
})
   
   
   
   
});




   const insertNote = document.querySelector("#insertNote");
   
   // 입원 정보
   const enterInfoTemplate = data => {
      return`
      <div class='col-xl-12'><div class='card card-h-50'>
      <div class='card-body'><div class='table-responsive'>
      <a class='form-label h5'><i class='fas fa-paw'></i><b>&nbsp;동물 정보</b></a>
      <div>
      <input type='button' class='btn btn-light btn-sm waves-effect waves-light' id='recordPriceBtn' value='현재 수납비 내역'  style='margin-left: 75%;'/>
      <button type='button' id='recordInsertBtn' class='btn btn-light btn-sm waves-effect waves-light'><i class='ri-edit-2-fill'></i></button>
      <div>
      <table class='table mb-1'>
      <thead><tr>
          <th colspan='2' rowspan='2'><img src='${pageContext.request.contextPath }/resources/assets/images/profile/siroo.jpg' class='rounded-circle img-thumbnail avatar-lg'/></th>
          <th colspan='2' rowspan='2'></th></tr></thead>
      <tbody><tr>
          <th>동물명</th>
          <td>\${data.patName}(\${data.stCd})</td>
          <th>진료메모</th>
          <td>\${data.praCon}</td></tr>
        <tr>
          <th>보호자 정보</th>
          <td>\${data.memName} (\${data.memTel})</td>
          <th>동물메모</th>
          <td>\${data.patMemo}</td>
        </tr>
        <tr>
          <th>입원일</th>
          <td>\${data.stStartDate}</td>
          <th>수술유무</th>
          <td></td>
        </tr></tbody></table>
      `;
      
   }
   
   // 투약 클릭 시 값
   const drugInsertInfoTemplate = data => {
      return `
      <tr>
      <td name='drugNm'></td>
      <td></td>
      <td name='injAmount'></td>
      <td name='injType'></td>
      <td><input class='form-control' type='time'
         value='13:45:00' name='injTime' id='example-time-input'
         style='width: 150px'></td>
      </tr>
      `;
   }
   
   // 일지 목록 템플릿
   const enterNoteTemplate = data => {
	   return `
       <div class='table-responsive' id='enterRecordList'>
       <h4 class='card-title'>
          <a class='form-label h5'><i class='fas fa-notes-medical'></i><b>&nbsp;입원 일지</b></a>
       </h4>
			<div style='width: 98%'>
             <table class='table mb-1 table-hover' id='enterRecordTable'>
                <thead>
                   <tr>
                      <th align='center' width='10px'></th>
                      <th align='center'>입원번호</th>
                      <th align='center'>환자명</th>
                      <th align='center'>입원 병동</th>
                      <th align='center'>작성일자</th>
                      <th align='center'></th>
                   </tr>
                </thead>
                <tbody>
                            <tr>
                               <th align='center'>\${data.snNm }</th>
                               <td align='center'>\${data.stCd }</td>
                               <td align='center'>\${data.patName }</td>
                               <td align='center'>\${data.cageNm }-\${data.cageNm }</td>
                               <td align='center'>\${data.snDate}</td>
                               <td><input type='hidden' name='snNm' value='\${note.snNm }' />
                               <button type='button' onclick='fgetRecord(this.id)' id='\${note.snNm }' class='btn btn-light btn-sm waves-effect waves-light'>
                               <i class='ri-file-text-line'></i> 
                           </button>
                               </td>      
                            </tr>
                         </tbody></table> </div></div>
	   `;
	   
   }
   
   
   // 중간 정산 테이블 템플릿
   const enterPriceTemplate = data => {
	   return `
	   <table class="table mb-1 table-sm">
		<thead>
			<tr>
				<th>품목</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>원내 처방비</td>
				<td>1</td>
				<th>\${data.preInTotal}원</th>
			</tr>
			<tr>
				<td>식이</td>
				<td>\${data.stFoodNum}</td>
				<th>\${data.stFoodTotal}원</th>
			</tr>
			<tr>
				<td>입원비 <b>(80,000원)</b></td>
				<td>\${data.stDays}</td>
				<th>\${data.stDays * 80000}원</th>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="3">
				</th>
			</tr>
			<tr>
				<th colspan="2">현재 정산 금액</th>
				<th colspan="2">\${data.preInTotal + data.stFoodTotal + (data.stDays * 80000)}원</th>
			</tr>
		</tfoot>
	</table>
	   `;
	   
   }
   
   
   // 일지 - 처방목록 템플릿
   const enterMediListTemplate = enterMediInfo => {
	   let code ="";
	   if(enterMediInfo.length == 0){
		   code ="<tr><td colspan='5'> 투약 내역이 존재하지 않습니다.</td></tr>";
	   }else{
		   for(var i = 0; i < enterMediInfo.length; i++){
			   code +=`
				   <tr>
	                  <td scope='row'>\${enterMediInfo[i].injNm}</td>
	                  <td scope='row'>\${enterMediInfo[i].itemName}</td>
	                  <td>\${enterMediInfo[i].injAmount}</td>
// 	                  <td>\${enterMediInfo[i].injType}</td>
	                  <td>\${enterMediInfo[i].injDate}</td>
	               </tr>
			   `;
		   }
		   console.log("디버깅:",code);
		   return code;
	   }
   }

   
   // 일지 - 식이목록 템플릿
   const enterFoodListTemplate = enterFoodInfo => {
	   let code ="";
	   if(enterFoodInfo.length == 0){
		   code ="<tr><td colspan='4'> 식이 등록 내역이 존재하지 않습니다.</td></tr>";
	   }else{
		   for(var i = 0; i < enterFoodInfo.length; i++){
			   code +=`
				   <tr>
	                  <td scope='row'>\${enterFoodInfo[i].foodDtNm}</td>
	                  <td scope='row'>\${enterFoodInfo[i].foodName}</td>
	                  <td>\${enterFoodInfo[i].foodAmount}</td>
	                  <td>\${enterFoodInfo[i].foodPrice}</td>
	                  <td>\${enterFoodInfo[i].foodDate}</td>
	               </tr>
			   `;
		   }
		   
		   console.log("디버깅:",code);
		   return code;
	   }
   }
   
   // mediList 템플릿
   const mediInsertTemplate = mediList => {
	   let code ="";
	   if(mediList.length == 0){
		   code ="<tr><td colspan='4'> 처방 목록이 존재하지 않습니다.</td></tr>";
	   }else{
		   for(var i = 0; i < mediList.length; i++){
			   code +=`
				   <tr>
	                  <td scope='row'>\${mediList[i].drugNm}</td>
	                  <td scope='row'>\${mediList[i].itemName}</td>
	                  <td>\${mediList[i].preInAmount}</td>
	                  <td>\${mediList[i].preInCnt}</td>

	               </tr>
			   `;
		   }
		   console.log("디버깅:",code);
		   return code;
	   }
   }
   
   
   
   
	   
   
   // 일지 상세 보기 템플릿
   const recordTemplate = data => {
	   
	   return `
                   <table class='table table-bordered mb-1'>
                      <thead>
                         <tr>
                            <th colspan='3' style='text-align: center;'><h3><b>입원일지</b></h3></th>
                         </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td colspan='2'>입원일지 NO. <b>\${data.snNm}</b></td>
                            <td style='text-align:right;'>일시 <b>\${data.snDate}</b></td>
                         </tr>
                         <tr>
                            <td colspan='2' style='text-align:center;'>동물명 <b>\${data.patName}</b></td>
                            <td style='text-align:center;'>담당의사 <b>\${data.empName}</b></td>
                         </tr>
                         <tr>
                         <td colspan='3' style='text-align:center;'>진료메모 <b>\${data.praCon}</b>
                         </tr>
                         <tr>
                         <td style='text-align:center;'>
	                         <div class="box">체온<br>  <b>\${data.snTempState}</b></div>
                         </td>
                         <td style='text-align:center;'>
	                         <div class="box">건강상태<br> <b>\${data.snHealthState}</b></div>
                         </td>
                         <td style='text-align:center;'>
	                         <div class="box">배변상태<br> <b>\${data.snPooState}</b></div>
                         </td>
                         </tr>
                         <tr>
                            <td colspan='2'>일지 내용 <b>\${data.snCon}</b></td>
                            <td style='text-align:center;'>특이사항 <b>\${data.snSpecal}</td>
                         </tr>
                      </tbody>
                    </table>
                     
	   `;
   }
   
   // 일지 목록
//    function fgetEnterNoteList(pthis) {
		
// 		$.ajax({
// 			url : "/notelist",
// 			type : "post",
// 			success : function(data){
// 				alert("일지");
// 				$(enterRecordWrite).css("display", "none");
// 			    $(enterRecordRead).css("display", "none");
// 			    $(enterRecordList).css("display", "block");
// 				$(enterRecordList).html(enterNoteTemplate(data));
// 			}
// 		})
// 	}
   

   // 일지 등록   
function fRecordWrite(pthis){
   var data =  $('#insertNote').serialize();
//    data = {
//          stCd:stCd
//    }
   var data = {
      snHealthState : $("[name=snHealthState]").val(),
      snTempState : $("[name=snTempState]").val(),
      snPooState : $("[name=snPooState]").val(),
      snSpecal : $("[name=snSpecal]").val(),
      snCon : $("[name=snCon]").val(),
      stCd : $("#hiddenId").val()   }
   
   console.log("일지 등록 : "+$("#hiddenId").val())
   
   if (confirm("일지 등록을 하시겠습니까?")) {
       $.ajax({
          url : "${webPath}/enter/insertRecord" 
        , type : "POST"
        , data : JSON.stringify(data)
        , contentType : "application/json"
          , dataType: "json"
        , success : function(rslt){    // 성공
            console.log(rslt);
           if(rslt != null){          
             alert("일지 등록이 완료되었습니다.");
              console.log("일지 등록"+data);
              console.log("snNm = > " + rslt.snNm);

              $(enterRecordWrite).css("display", "none");
              fgetRecord(rslt.snNm);
//               $(enterRecordRead).css("display", "block");
//               $(enterRecordRead).html(recordTemplate(rslt));
           }else {
                alert("등록 실패");
             }
           }
        });
      }else{
      alert("일지 등록을 취소하였습니다.");
      return false;
   }
}
   
   
   // 식이 등록   
function fFoodWrite(pthis){
   var data =  $('#foodInsert').serialize();
//    data = {
//          stCd:stCd
//    }

   console.log($('#foodInsert').serialize());
   var data = {
      foodNm : $("[name=foodNm]").val(),
      foodDate : $("[name=foodDate]").val(),
      foodPrice : $("[name=foodPrice]").val(),
      stCd : $("#hiddenId2").val()
   }
   console.log("식이정보 등록 : " , data);
   
   if (confirm("식이 정보를 등록을 하시겠습니까?")) {
       $.ajax({
          url : "${webPath}/enter/insertFood" 
        , type : "POST"
        , data : JSON.stringify(data)
        , contentType : "application/json"
          , dataType: "text"
        , success : function(rslt){    // 성공
            console.log(rslt);
           if(rslt = "OK"){          
             alert("식이 등록이 완료되었습니다.");
              console.log("식이 등록",data);
              console.log("stCd =>",rslt.stCd);
              $(enterRecordWrite).css("display", "none");
              $(enterRecordRead).css("display", "none");
              $(enterRecordList).css("display", "block");
              enterNoteList();
            }else {
                alert("식이 등록에 실패하였습니다.");
             }
           }
        });
      }else{
      alert("식이 등록을 취소하였습니다.");
      return false;
   }
}
   
    
    
   // 투약 등록   
function fRecordMedi(pthis){
   var data =  $('#Input').serialize();
//    data = {
//          stCd:stCd
//    }
   console.log("등록 내용 : " + $('#Input').serialize());

   var data = {
      drugNm : $("[name=drugNm]").val(),
      injType : $("[name=injType]").val(),
      injAmount : $("[name=injAmount]").val(),
      injDate : $("[name=injDate]").val(),
      stCd : $("#hiddenId3").val()
   }
   
//    console.log("투약 등록 : "+$("#hiddenId3").val())
   
   console.log("투약 등록 : ",data);
   
   if (confirm("투약 기록을 등록 하시겠습니까?")) {
       $.ajax({
          url : "${webPath}/enter/insertMedi" 
        , type : "POST"
        , data : JSON.stringify(data)
        , contentType : "application/json"
          , dataType: "text"
        , success : function(rslt){    // 성공
            console.log(rslt);
           if(rslt = "OK"){          
             alert("투약 정보 입력이 완료되었습니다.");
              console.log("투약 등록 : ",data);
              $(enterRecordWrite).css("display", "none");
              $(enterRecordRead).css("display", "none");
              $(enterRecordList).css("display", "block");
              enterNoteList();

            }else {
                alert("등록 실패");
             }
           }
        });
      }else{
      alert("투약 등록을 취소하였습니다.");
      return false;
   }
}

   
   
   
   
//일지 삭제
function recordDel(pthis){
   
   console.log("ppp",$(pthis).closest("tr")[1]);
   let snNm = pthis.parentElement.children[1].value;
   console.log("snNm:",snNm);
   
   let data = {
         snNm:snNm
   }
   
   if (confirm("일지를 삭제하시겠습니까?")) {
      $.ajax({
         type:"delete",
         url:"${webPath}/enter/delRecord",
         data: JSON.stringify(data),  
         contentType:"application/json;charset=utf-8",
         dataType:"text",
         success:function(rslt){
               console.log("확인:",rslt)
             if(rslt == "OK"){          
                alert("일지를 삭제하였습니다.");
                
               $(enterRecordRead).css("display", "none");
               $(enterRecordList).css("display", "block");
               $(enterRecordList).css("display", "remove");
               $(enterRecordList).css("display", enterNoteList());
//                enterNoteList();

             }else {
                alert("삭제에 실패하였습니다.");
             }      
         }
      })
   }else{
      alert("삭제를 취소하였습니다.");
      return false;
   }
}


// 개별 동물 정보 , 식이 목록 띄우기, 개별 수납비 내역
function fget(pthis){
   let code = pthis.parentElement.children[0].value      
   data = {
         stCd : code
      }
   
   var str = "";
    $.ajax({
       url : "${webPath}/enter/read/"+code   
     , type : "POST"
     , data : JSON.stringify(data)
     , contentType : "application/json"
     , async: true
     , cache : false
       , dataType: "json"
     , success : function(data){    // 성공
        console.log("동물 수납비", data.readPrice);                                           
        console.log("동물 수납비 내역", data.readPriceEnter);                                           
        $("#animalInfo").html(enterInfoTemplate(data.enterInfo));
	    $("#animalInfo").html(enterInfoTemplate(data.enterInfo));
	    $("#hiddenId").val(data.enterInfo.stCd);
	    $("#hiddenId2").val(data.enterInfo.stCd);
	    $("#hiddenId3").val(data.enterInfo.stCd);
	    $(mediInsert).html(mediInsertTemplate(data.readPreInList));
	    $(enterPriceList).html(enterPriceTemplate(data.readPrice));
       
//        $(foodList).html(foodInsertTemplate(data[2]));
     }
     , error:function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
    
}




// 일지 상세 정보(글 읽기)
function fgetRecord(pthis){
	   
//    let snNm = pthis.parentElement.children[0].value      
   let snNm = pthis;      
   data = {
         snNm : snNm
      }
   
   //var str = "";
    $.ajax({
       url : "${webPath}/enter/getRecord/"+snNm   
     , type : "POST"
     , data : JSON.stringify(data)
     , contentType : "application/json"
     , async: true
     , cache : false
       , dataType: "json"
     , success : function(data){    // 성공
	      $(enterRecordWrite).css("display", "none");
	      $(enterRecordList).css("display", "none");
	      $(enterRecordRead).css("display", "block");
	      $("#enterNoteContent").html(recordTemplate(data.getRecord));
	      $("#hiddenSnNm").val(data.getRecord.snNm);
	
	//         console.log("식이목록 : ", enterFoodListTemplate(data.enterFoodList));
	      $("#enterfoodInfo").html(enterFoodListTemplate(data.enterFoodList));
	      $("#enterMediInfo").html(enterMediListTemplate(data.enterMediList));
     }
     , error:function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}


// 동물 퇴원 
function fdel(pthis){
   console.log("ppp",$(pthis).closest("tr")[0]);
   let stCd = pthis.parentElement.children[0].value;
   console.log("stCd:",stCd);
   
   let data = {
         stCd:stCd
   }
   
   if (confirm("해당 동물을 퇴원시키겠습니까?")) {
      $.ajax({
         type:"put",
         url:"${webPath}/enter/delete",
         data: JSON.stringify(data),  
         contentType:"application/json;charset=utf-8",
         dataType:"text",
         success:function(rslt){
               console.log("확인:",rslt)
             if(rslt == "OK"){          
                alert("동물 퇴원을 완료하였습니다. <br> 수납실로 이동되었습니다.");
                let tr = $(pthis).closest("tr")[0];
                let tbody = tr.parentElement;
                tbody.removeChild(tr);
                if(tbody.children.length == 0){
                   tbody.innerHTML = '<tr><td colspan="6" align="center">현재 입원 중인 동물이 없습니다.</td></tr>'
                }
                //$(pthis).closest("tr").remove(); // 화면에서 지우깅
             }else {
                alert("퇴원에 실패하였습니다.");
             }      
         }
      })
   }else{
      alert("퇴원을 취소하였습니다.");
      return false;
   }
}




   
</script>

<div class="page-content">
   <div class="container-fluid">

      <div class="row">
         <!-- 왼쪽 열 -->
         <div class="col-xl-5">
            <div class="row h-80">
               <div class="col-xl-12">

                  <div class="card overflow-hidden card h-500">
                     <div class="card-body">
                        <!-- 첫번째 카드 -->
                        <div class="d-flex justify-content-between">
                              <a class="form-label h5"><i class="ri-hotel-bed-fill" ></i>
                              <b>입원 목록</b>
                              </a>

                           <ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
                              <c:choose>
                              	<c:when test="${empty wardList }">
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#'${wardNm }'" role="tab"> 
		                                    <span class="d-block d-sm-none"><i class="fas fa-dog"></i></span>
		                                    <span class="d-none d-sm-block">깜이 귀여웡</span>
                                		 </a>
									</li>
                              	</c:when>
                              	<c:otherwise>
									<c:forEach items="${wardList }" var="ward" varStatus="status">
									<li class="nav-item">
										<a class="nav-link <c:if test="${status.count eq 1 }"><c:out value="active"/></c:if>" data-bs-toggle="tab" href="#animal${ward.wardNm }" role="tab"> 
		                                    <span class="d-block d-sm-none"><i class="fas fa-dog"></i></span>
		                                    <span class="d-none d-sm-block">${ward.wardName }</span>
                                		 </a>
									</li>
									</c:forEach>                              	
                              	</c:otherwise>
                              </c:choose>
                              
                           </ul>
                        </div>
						
						
                        <div class="tab-content p-3 text-muted table-responsive">
                        
 						<c:choose>
						  <c:when test="${empty wardList }">
	                        	<div class="tab-pane active" id="${wardList.wardNm }" role="tabpanel">
	                              <table class="table mb-1">

		                                <tbody>
		                                 <tr>
                                             <td colspan="6" align="center">현재 입원 중인 동물이 없습니다.</td>
                                          </tr>
	                        			</tbody>
                        			</table>
                        		</div>
                        	</c:when>	
                        	<c:otherwise>
							<c:forEach items="${wardList }" var="ward" varStatus="status">
								<div class="tab-pane <c:if test="${status.count eq 1 }"><c:out value="active"/></c:if>" id="animal${ward.wardNm }" role="tabpanel">
	                              <table class="table mb-1 aniList">
	                                 	<thead>
		                                    <tr>
		                                       <th>입원번호</th>
		                                       <th>케이지</th>
		                                       <th>동물명</th>
		                                       <th>입원일</th>
		                                       <th></th>
		                                    </tr>
	                                 	</thead>
		                                <tbody>
										<c:forEach items="${aniList }" var="ani">
										<c:if test="${ani.wardNm eq ward.wardNm }">
                                             <tr>
                                                <td align="center" class="stCd">${ani.stCd }</td>
                                                <td align="center">${ani.cageNm }</td>
                                                <td align="center">${ani.patName }</td>
                                                <td align="center">
                                                <fmt:parseDate value="${ani.stStartDate}" pattern="yyyy-MM-dd" var='startDate'/>
                                                <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/></td>
                                                <td align="center">
                                                   <form action="/delete" class="delDogForm" method="post">
                                                      <input type="hidden" name="stCd" value="${ani.stCd }" />
                                                      <input type="hidden" name="tab" value="dog" />
                                                   <input type="button" class="btn btn-light btn-sm waves-effect waves-light" onclick="fget(this)" value="상세정보"/>
                                                   <input type="button" class="btnDogRemove btn btn-light btn-sm waves-effect waves-light" onclick="fdel(this)" value="퇴원" />
                                                   </form>
                                                </td>
                                             </tr>
										</c:if>
                                        </c:forEach>
	                        			</tbody>
                        			</table>
                        		</div>
							</c:forEach>
                        </c:otherwise>
						</c:choose>
                        </div> 
                     </div>
                     <script>
                     let tbody = document.querySelector("#animal2 tbody");
                     if(tbody.children.length == 0){
                    	 tbody.innerHTML = ` <tr>
                         <td colspan="6" align="center">현재 입원 중인 동물이 없습니다.</td>
                         </tr>`;
                     } 
                     </script>
                  </div>
               </div>
            </div>
            
            
            <div id="animalInfo">
               <!-- 동물 정보 ajax -->
            </div>
            <div class="col-xl-12" id="recordPriceList" style="display: none;">
                  <div class="card card-h-50">
                     <div class="card-body">
                        <div class="table-responsive">
                           <h4 class="card-title">
                              <b>수납비 중간 계산</b>
                              <button type='button' class='btn btn-light btn-sm waves-effect waves-light' id='listCloseBtn' style='margin-left: 95%; margin-top: -3%;'><i class="ri-close-fill"></i></button>
<!--                            <input type='button' class='btn btn-light btn-sm waves-effect waves-light btn-rounded' id='listCloseBtn' value='X' style='margin-left: 95%;'/> -->
                           </h4>
                          	 <div id="enterPriceList">
								<!-- 수납비 -->									
                          	 </div>
							</div>
                     </div>
                  </div>
               </div>
            
            <!-- 왼쪽 2행 끝 -->

         </div>
         <!-- 왼쪽 열 끝-->

         <!-- 오른쪽 열 시작 -->
         <div class="col-xl-7">

            <!-- 오른쪽 1행 시작 -->
            <div class="col-xl-12">

               <div class="card overflow-hidden card-h-50" id="enterInfo">
                  <div class="card-body">
                     <div class="table-responsive" id="enterRecordList">
                        <h4 class="card-title">
                           <a class='form-label h5'><i class='fas fa-notes-medical'></i><b>&nbsp;입원 일지</b></a>
                        </h4>
							<div style="width: 98%">
                              <table class="table mb-1 table-hover" id="enterRecordTable">
                                 <thead>
                                    <tr>
                                       <th align="center" width="10px"></th>
                                       <th align="center">입원번호</th>
                                       <th align="center">환자명</th>
                                       <th align="center">입원 병동</th>
                                       <th align="center">작성일자</th>
                                       <th align="center"></th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:choose>
                                       <c:when test="${empty enterNoteList }">
                                          <tr>
                                             <td colspan="6" align="center">등록된 입원일지가 없습니다.</td>
                                          </tr>
                                       </c:when>
                                       <c:otherwise>
                                          <c:forEach items="${enterNoteList }" var="note">
                                             <tr>
                                                <th align="center">${note.snNm }</th>
                                                <td align="center">${note.stCd }</td>
                                                <td align="center">${note.patName }</td>
                                                <td align="center">${note.wardName}-${note.cageNm }</td>
                                                <td align="center"><fmt:parseDate
                                                      value="${note.snDate}" pattern="yyyy-MM-dd"
                                                      var='noteDate' /> <fmt:formatDate value="${noteDate}"
                                                      pattern="yyyy-MM-dd" /></td>
                                                <td><input type="hidden" name="snNm" value="${note.snNm }" />
                                                <button type="button" onclick="fgetRecord(this.id)" id="${note.snNm }" class="btn btn-light btn-sm waves-effect waves-light">
                                                <i class="ri-file-text-line"></i> 
                                            </button>
                                                
                                                </td>      
                                             </tr>
                                          </c:forEach>
                                       </c:otherwise>
                                    </c:choose>
                                 </tbody>
                              </table>
                           </div>
						</div>
                        

							<div class="row" id="enterRecordRead" style="display: none">
								<div class='row'>
									<div class='col-xl-12'>
										<div class='card card-h-50'>
											<div class='card-body'>
												<div class='table-responsive'>
												
								<!-- 입원 일지 상세 정보 -->
								<div style="text-align: right;">등록 직원 | <b>${principal.empVO.empName}</b></div>
													<table class='table table-bordered mb-1' id="enterNoteContent">
													

													</table>
													<br><br>
													<a class="form-label h5" style="margin-bottom: 2%;">
														<i class="fas fa-hand-holding-medical"></i>           
														<b style="margin-bottom: 10%;">투약 정보</b></a>                  
													<table class='table table-bordered mb-1 table-sm'>
														<thead>
															<tr>
																<th>번호</th>
																<th>의약품명</th>
																<th>투여량</th>
																<th>약품 구분</th>
																<th>투약 시간</th>
<!-- 																<td>가격</td> -->
															</tr>
														</thead>
														<tbody id="enterMediInfo">
															<tr >
															</tr>
														</tbody>
													</table>
													<br><br>
													<a class="form-label h5" style="margin-bottom: 2%;">
													<i class="fas fa-hand-holding-medical"></i>          
														<b style="margin-bottom: 10%;">식이 정보</b>
													</a>
													
													<table class='table table-bordered mb-1 table-sm'>
														<thead>
															<tr>
																<th>식이번호</th>
																<th>식이명</th>
																<th>용량</th>
																<th>가격</th>
																<th>식이시간</th>
															</tr>
														</thead>
														<tbody id="enterfoodInfo">
															<tr >
															</tr>
														</tbody>
													</table>


													<!-- 끝 -->
												
												
												  <div style="margin-top: 5%">
							                      <input type='submit' class='btn btn-light btn-sm waves-effect waves-light' id='recordModyBtn'  value='수정'style='margin-left: 82%;'/>
							                      <input type='hidden' name='snNm' value='' id='hiddenSnNm'/>
							                      <input type='button' class='btn btn-light btn-sm waves-effect waves-light' id='recordDelBtn' onclick='recordDel(this)' value='삭제' style='margin-left: 0.5%;'/>
							                      <input type='button' class='btn btn-light btn-sm waves-effect waves-light recordListBtn'  onclick="fgetEnterNoteList(this)" value='목록' style='margin-left: 0.5%;'/>
							                      </div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>


							<div class="row" id="enterRecordWrite" style="display: none">
                                    <div class="table-responsive">
                                       <div class="d-flex justify-content-between">
                                          <ul class="nav nav-tabs" role="tablist">
                                             <li class="nav-item"><a class="nav-link"
                                                data-bs-toggle="tab" href="#foodRecord" role="tab" aria-selected="false"> 
                                                   <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                                                   <span class="d-none d-sm-block">식이</span>
                                             </a></li>
                                             <li class="nav-item"><a class="nav-link"
                                                data-bs-toggle="tab" href="#mediRecord" role="tab"
                                                aria-selected="false"> <span
                                                   class="d-block d-sm-none"><i class="far fa-user"></i></span>
                                                   <span class="d-none d-sm-block">투약</span>
                                             </a></li>
                                             <li class="nav-item active"><a
                                                class="nav-link active" data-bs-toggle="tab"
                                                href="#enterRecord" role="tab" aria-selected="true">
                                                   <span class="d-block d-sm-none"><i
                                                      class="far fa-envelope"></i></span> <span
                                                   class="d-none d-sm-block">입원 기록</span>
                                             </a></li>
                                          </ul>
                                       </div>
                                       <div class="tab-content p-3 text-muted">


                                          <div class="tab-pane" id="foodRecord" role="tabpanel">
                                             <div class="row">
                                             <hr>
                                                <div class="col-xl-4">
                                                   <div class="table-responsive" id="foodList">
                                                      <!-- 식이 입력 창 -->
                                                      <h4 class='card-title'>
                                                      <b><i class="fas fa-comment-medical"></i> 식이 목록</b>
                                                   </h4>
                                                   <table class='table table-hover table-sm mb-1 ' id="foodTable">
                                                      <thead>
                                                         <tr>
                                                            <th>번호</th>
                                                            <th>식이명</th>
                                                            <th>가격</th>
                                                         </tr>
                                                      </thead>
                                                      <tbody>
                                                <c:choose>
                                                   <c:when test="${empty readFood }">
                                                      <tr>
                                                         <td colspan="6" align="center">등록된 입원일지가 없습니다.</td>
                                                      </tr>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <c:forEach items="${readFood }" var="food">
                                                         <tr>
                                                         <tr>
                                                            <th scope='row'>${food.foodNm}</th>
                                                            <td>${food.foodName}</td>
                                                            <td>${food.foodPrice}</td>
                                                         </tr>
                                                      </c:forEach>
                                                   </c:otherwise>
                                                </c:choose>
                                             </tbody>
                                                   </table>
                                                   </div>
                                                </div>
                                                <div class="col-xl-8">
                                                <form id="foodInsert" method="post">
                                             <table class='table table-hover table-sm mb-1'>
                                                <thead>
                                                   <tr>
                                                      <th>식이번호</th>
                                                      <th>식이명</th>
                                                      <th>가격</th>
                                                      <th>식이 시간</th>
                                                   </tr>
                                                </thead>
                                                <tbody id="foodInsertInfo">
                                                   <tr>
                                                      <td></td>
                                                      <td></td>
                                                      <td></td>
                                                      <td></td>
                                                      <td><input class="form-control" type="time"
                                                         value="13:45:00" id="example-time-input"
                                                         style="width: 150px"></td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                                         <input type='hidden' name='stCd' value='' id='hiddenId2' />
                                                   <input type="button"
                                                      class="btn btn-light btn-sm waves-effect waves-light"
                                                      id="sa-params" value="등록"  onclick="fFoodWrite(this)"
                                                      style="margin-top: 10%; margin-left: 85%"  />
                                                </form>
                                                </div>
												<hr>
                                             </div>

                                          </div>

                              <div class="tab-pane" id="mediRecord" role="tabpanel">
                                 <div class="row">
                                 <hr>
                                    <div class="col-xl-4">
                                       <div class="table-responsive">
                                          <h4 class='card-title'>
                                             <b><i class="fas fa-comment-medical"></i> 처방 목록</b>
                                          </h4>
                                          <table class='table table-hover table-sm mb-1' id="mediTable">
                                             <thead>
                                                <tr>
                                                   <th>약품번호</th>
                                                   <th>의약품명</th>
                                                   <th>1회투여량</th>
                                                   <th>1일투여횟수</th>
<!--                                                    <th>처방 구분</th> -->
<!--                                                    <th>약품 분류</th> -->
                                                </tr>
                                             </thead>
                                             <tbody id="mediInsert" >
                                             </tbody>
                                          </table>


                                          <!-- 투약 입력 창 -->
                                       </div>
                                    </div>

                                    <div class="col-xl-8">
                                       <div class="row mb-3">
                                          <h4 class='card-title'>
                                             <b>처방 등록</b>
                                          </h4>
                                          <form id="mediInsertInput" method="post">
                                             <table class='table table-hover table-sm mb-1'>
                                                <tbody id="drugInsertInfo">
                                                   <tr>
                                                      <td></td>
                                                      <td></td>
                                                      <td></td>
                                                      <td></td>
<!--                                                       <td></td> -->
                                                   </tr>
                                                </tbody>
                                             </table>
                                             <input type='hidden' name='stCd' value='' id='hiddenId3' />
                                             <input type="button"
                                                class="btn btn-light btn-sm waves-effect waves-light"
                                                id="sa-params" value="등록" onclick="fRecordMedi(this)"
                                                style="margin-top: 10%; margin-left: 85%" />
                                          </form>
                                       </div>

                                    </div>
                                    <hr>
                                 </div>
                                 </div>


                                 <div class="tab-pane active" id="enterRecord" role="tabpanel">
                                    <form id="insertNote" method="post">
                                       <div class="row">
                                          <hr>
                                       <h4 class="card-title">
                                             <b><i class="fas fa-comment-medical"></i> 일지 작성</b>
                                          </h4>
                                          <br><br>
                                          <div class="col-xl-2">
                                             <div class="row mb-3">
                                                <h4 class="h5  font-size-14 mb-3"><b>건강</b></h4>
                                                <label> <input type="radio" name="snHealthState"
                                                   value="좋음" class="form-check-input"> 좋음
                                                </label> <label><input type="radio" name="snHealthState"
                                                   value="보통" class="form-check-input"> 보통</label> <label><input
                                                   type="radio" name="snHealthState" value="나쁨"
                                                   class="form-check-input"> 나쁨</label>
                                             </div>
                                             <div class="row mb-3">
                                             	<div>
                                                <h4 class="h5 font-size-14 mb-3" style="margin-top: 31px"><b>체온체크</b></h4>
                                                <label> <input class="textST" name="snTempState" type="number" step="0.1" value="36.5" min="33" max="40"> ℃
                                                </label>
                                             	</div>
                                             </div>



										</div>
                                          <div class="col-xl-2">
                                             <div class="row mb-3">
                                                <h4 class="h5 font-size-14 mb-3"><b>배변상태</b></h4>
                                                <label> <input type="radio" name="snPooState"
                                                   value="보통" class="form-check-input"> 보통
                                                </label> <label> <input type="radio" name="snPooState"
                                                   value="딱딱함" class="form-check-input"> 딱딱함
                                                </label> <label> <input type="radio" name="snPooState"
                                                   value="묽음" class="form-check-input"> 묽음
                                                </label> <label> <input type="radio" name="snPooState"
                                                   value="안했음" class="form-check-input"> 안했음
                                                </label>
                                             </div>
                                             <div class="row mb-3">
                                                <h4 class="h5 font-size-14 mb-3"><b>특이사항</b></h4>
                                                <textarea rows="2" cols="5" class="form-control"
                                                   name="snSpecal" placeholder="오늘은...."></textarea>
                                             </div>

                                          </div>
                                          <div class="col-xl-8">
                                             <h4 class="h5 font-size-14 mb-3"><b>일지 내용</b></h4>
                                             <textarea rows="5" cols="5" class="form-control" placeholder="오늘의 일지 내용을 작성해주세요.." name="snCon"></textarea>
                                                <div>
                                             <input type="button"
                                                class="btn btn-light btn-sm waves-effect waves-light"
                                                id="sa-params" onclick="fRecordWrite(this)" value="등록"
                                                style="margin-top: 10%; margin-left: 85%" /> 
                                                <input type="hidden" name="stCd" value="" id="hiddenId" />
                                             <input type="button"
                                                class="btn btn-light btn-sm waves-effect waves-light recordListBtn"
                                                id="sa-params" value="목록"
                                                style="margin-top: 10%;" /> 
                                                </div>
                                          </div>
                                          <hr>
                                       </div>
                                    </form>
                                    <!-- 일지 등록 폼 끝 -->


                                 </div>
                              </div>
                           </div>
                                 </div>
                              </div>
                           </div>
                        </div>






                        <!-- 오른쪽 2행 시작 -->
               
               <!-- 오른쪽 2행 끝 -->

            </div>
         </div>
      </div>
      <!-- 오른쪽 열 끝 -->




   </div>
   <!-- 메인 끝 -->

