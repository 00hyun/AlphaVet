<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib  uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>

<sec:authentication property="principal" var = "principal"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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

.nav-fill .nav-item .nav-link, .nav-justified .nav-item .nav-link {
    width: 125%;
}

.priceAlign{
	text-align: right;
	margin-right: 2px;
}

.enterPriceTable{
	font-size: 1.09em;
	table-layout: fixed;
}

#enterAllFoodList{
	font-size: 0.95em;
}

.price2{
	font-size: 1.2em;
}

.foodSpan{
	display: inline-block;
}

#resSearchBox {
	width: 20%;
    margin-left: 75%; 
}

.textSize{
	font-size: 1.1em;
	font-weight: 400;
}

.clickTd1{
	width: 400px;

}

.clickTd2{
	text-align: right;
}

.aniList, .noteThead{
	text-align: center;
}

hr.hr-2 {
  border: 0;
  border-bottom: 2px dashed #eee;
  background: #999;
}


input:focus, select:focus, textarea:focus {
    border: 1px solid #989ae7 !important;
    outline: none;
}

	#enterPawImg{
		width: 100px;
		opacity: 0.1;
		position: fixed;
		top: 770px;
		text-align: center;
		margin-left: 250px;
	}

.avatar-lg {
    height: 9rem;
    width: 9rem;
}

.ri-arrow-up-s-line{
	cursor: pointer;
	font-size: 1.28em;
	margin-left: 10px;
}

.ri-arrow-up-s-line:hover{
	color: #815efe;
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
	$('.dataTables_filter').remove(); // dataTable 자체 search input 없애기

	$('#enterSearch').keyup(function () {
        let $value = $(this).val();
        $("#enterRecordTable").DataTable().search($value).draw();
    });
   
	enterNoteList();
	
   

   
	
   // 일지 작성 버튼 -> 작성 폼
   $(document).on('click', '#recordInsertBtn', function(){
      $(enterRecordRead).css("display", "none");
      $("#enterRecordEdit").css("display", "none");
      $(enterRecordList).css("display", "none");
      $(enterRecordWrite).css("display", "block");
   })
   
	// 현재 수납비 보기 버튼
   $(document).on('click', '#recordPriceBtn', function(){
      $(recordPriceList).css("display", "block");
   })
   
   // 동물 상세 정보 닫기 버튼
   $(document).on('click', '.ri-arrow-up-s-line', function(){
      $("#animalInfo2").css("display", "none");
      $(enterRecordList).css("display", "remove");
      enterNoteList();
   })
   


   // 일지 목록 버튼
   $(document).on('click', '.recordListBtn', function(){
      $(enterRecordWrite).css("display", "none");
      $(enterRecordRead).css("display", "none");
      $("#enterRecordEdit").css("display", "none");
      $(enterRecordList).css("display", "block");      
      enterNoteList();
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
//      var injType =td.eq(5).text(); 
     
     str += "<tr><td><input type='text' class='textST2' name='drugNm' value='"+  drugNm + "' class='form-control'></td>"
      str += "<td class='clickTd1'>"+ drugName + "</td>"
      str += "<td><input type='text' class='textST2 clickTd2' name='injAmount' value='"+  injAmount + "' class='form-control'></td>"
      str += "<td><input class='form-control' type='datetime-local' name='injDate' value='13:45:00' id='example-time-input' style='width: 230px'></td></tr>"
         
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
     var price = foodPrice.split(',').join("");
     
     str += "<tr><td><input class='textST2' type='text' name='foodNm' value='"+foodNm +"' style='width : 25px;'></td>"
      str += "<td class='clickTd1'>"+ foodName +"</td>"
      str += "<td class='clickTd2'><input type='text' class='textST2' value='"+foodPrice +"원'></td>"
      str += "<td class='clickTd2'><input class='form-control textS2' name='foodDate' type='datetime-local' value='13:45:00' id='example-time-input' style='width: 230px'></td>"
      str += "<td class='clickTd2'><input type='hidden' class='textST2' name='foodPrice' value='"+price +"'></td></tr>"
         
      $("#foodInsertInfo").html(str)
   
})
   
});

//입원 일지 데이터 테이블 ajax
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
								return '<button type="button" onclick="fgetRecord('+ row.snNm +')" class="btn btn-light btn-sm waves-effect waves-light"><i class="ri-file-text-line"></i></button>';
							}
						}
			
						]
							})
							
							$('.dataTables_filter').remove(); // dataTable 자체 search input 없애기
			}   
		   
	   })
	   
}



   const insertNote = document.querySelector("#insertNote");
   
   // 입원 동물 개별 정보
   const enterInfoTemplate = data => {
      return`

      <div align='right'>
     	 <button type='button' id='recordInsertBtn' class='btn btn-light btn-sm waves-effect waves-light'><i class='ri-edit-2-fill'></i> 일지 작성</button>
      </div>
      <div class="row">
      
      <div class="col-xl-5">
      <table  class='table mb-1'>
      	<thead>
	  		<tr>
	          <th colspan='2' style="text-align: center;"><img src='${pageContext.request.contextPath }\${data.patProfile}' class='rounded-circle img-thumbnail avatar-lg'/></th>
			</tr>
      	</thead>
      	<tbody>
      		<tr>
		        <th>동물명</th>
	      		<td><span class='price2'>\${data.patName}</span> (\${data.stCd})</td>
      		</tr>
      		<tr>
	      		<th>입원일</th>
	            <td>\${data.stStartDate}</td>
  			</tr>
      	</tbody>
      </table> 
      </div>
      
      <div class="col-xl-7">
      <table class='table mb-1'>
      <tbody>
      	<tr>
	      	<th style='width: 100px;'>보호자 정보</th>
    	    <td>\${data.memName} (0\${data.memTel})</td>
      	</tr>
      		<tr>
		        <th>몸무게</th>
	      		<td>\${data.patWeight}kg</td>
  			</tr>
      	<tr>
	      	<th>생년월일</th>
  			<td>\${data.patBirth} </td>
      	</tr>
      	<tr>
          <th>진료메모</th>
          <td>\${data.praCon}</td></tr>
        <tr>
          <th>동물메모</th>
          <td>\${data.patMemo}</td>
        </tr>
        <tr>
          
        </tr></tbody></table>
        </div>
      `;
   }
   
   // 투약 클릭 시 값
   const drugInsertInfoTemplate = data => {
      return `
      <tr>
      <td name='drugNm'></td>
      <td></td>
      <td name='injAmount'></td>
//       <td name='injType'></td>
      <td><input class='form-control' type='time'
         value='13:45:00' name='injTime' id='example-time-input'
         style='width: 150px'></td>
      </tr>
      `;
   }
   
   // 일지 목록 템플릿
   const enterNoteTemplate = enterNoteList => {
	   let code ="";
	   if(enterNoteList.length == 0){
		   code =`<tr><td colspan='6'><span class='font500'> 등록된 일지가 없습니다. </span></td></tr>`;
	   }else{
		   for(var i = 0; i < enterNoteList.length; i++){
			   code +=`
				     <tr>
				        <td align='center'>\${enterNoteList[i].snNm }</td>
				        <td align='center'>\${enterNoteList[i].stCd }</td>
				        <td align='center'>\${enterNoteList[i].patName }</td>
				        <td align='center'>\${enterNoteList[i].wardName }-\${enterNoteList[i].cageNm }</td>
				        <td align='center'>\${enterNoteList[i].snDate}</td>
				        <td><input type='hidden' name='snNm' value='\${enterNoteList[i].snNm }' />
				        <button type='button' onclick='fgetRecord(this.id)' id='\${enterNoteList[i].snNm }' class='btn btn-light btn-sm waves-effect waves-light'>
				        <i class='ri-file-text-line'></i> 
				    </button>
				        </td>      
				        </tr>
				   `;			
		   }
			   console.log("디버깅:",code);
	   
   }
			   return code;
	   }
   
   
  
   
   
  
   
   
   
   

   // 일지 등록   
function fRecordWrite(pthis){
   var data =  $('#insertNote').serialize();

   var data = {
      snHealthState : $("[name=snHealthState]").val(),
      snTempState : $("[name=snTempState]").val(),
      snPooState : $("[name=snPooState]").val(),
      snSpecal : $("[name=snSpecal]").val().replace(/\n/g, "<br>"),
      snCon : $("[name=snCon]").val().replace(/\n/g, "<br>"),
      stCd : $("#hiddenId").val(),
      empId : $("[name=empId]").val()
      }
   
   console.log("일지 등록 : "+$("#hiddenId").val())
   
// 	   Swal.fire({
// 	   title: '일지를 등록하시겠습니까?',
// 	   icon: 'warning',
	   
// 	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
// 	   confirmButtonText: '등록', // confirm 버튼 텍스트 지정
// 	   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	
// 	   }).then(result =>{

// 	   if (result.isConfirmed) {
	       $.ajax({
	          url : "${webPath}/enter/insertRecord" 
	        , type : "POST"
	        , data : JSON.stringify(data)
	        , contentType : "application/json"
	        , dataType: "json"
	        , cache:false
	        , success : function(rslt){    // 성공
	            console.log(rslt);
	           if(rslt != null){          
					Swal.fire({
						  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
						  title: '일지 등록이 완료되었습니다.'
						});
	              console.log("일지 등록"+data);
	//               console.log("snNm = > " + rslt.snNm);
	
	              $(enterRecordWrite).css("display", "none");
	              fgetRecord(rslt.snNm);
	              
	              fget(rslt.stCd);

	           }else {
					Swal.fire({
						  icon: 'warning',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
						  title: '일지 등록에 실패하였습니다.',
						  text: '다시 시도해주세요.'
						});
	             }
	           }
	        });
	      }else{
				Swal.fire({
					  icon: 'error',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
					  title: '일지 등록을 취소하였습니다.'
					});
	
	      return false;
	   }
	
// 	   })
   }
   
   // 식이 등록   
function fFoodWrite(pthis){
   var data =  $('#foodInsert').serialize();

   console.log($('#foodInsert').serialize());
   var data = {
      foodNm : $("[name=foodNm]").val(),
      foodDate : $("[name=foodDate]").val(),
      foodPrice : $("[name=foodPrice]").val(),
      stCd : $("#hiddenId2").val()
   }
   console.log("식이정보 등록 : " , data);
   
   
   Swal.fire({
	   title: '식이 기록을 등록하시겠습니까?',
	   icon: 'warning',
	   
	   showCancelButton: true, 
	   confirmButtonText: '등록', 
	   cancelButtonText: '취소', 
	   
		}).then(result =>{
   
  	 if (result.isConfirmed) {
	       $.ajax({
	          url : "${webPath}/enter/insertFood" 
	        , type : "POST"
	        , data : JSON.stringify(data)
	        , contentType : "application/json"
	        , dataType: "text"
	       	, cache: false
	        , success : function(rslt){    // 성공
	            console.log(rslt);
	           if(rslt = "OK"){          
					Swal.fire({
						  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
						  title: '식이 기록이 등록되었습니다.'
						});
	              console.log("식이 등록",data);
	              console.log("stCd =>",data.stCd);
	//               $(enterRecordWrite).css("display", "none");
	//               $(enterRecordRead).css("display", "none");
	//               $(enterRecordList).css("display", "block");
	// 			  enterNoteList();
	              fget(data.stCd);
	            }else {
					Swal.fire({
						  icon: 'warning',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
						  title: '식이 등록에 실패하였습니다.',
						  text: '다시 시도해주세요.'
						});
	             }
	           }
	        });
	      }else{
	    		Swal.fire({
	  			  icon: 'error',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
	  			  title: '식이 등록을 취소하였습니다.'
	  			});
	      return false;
	   }
		   })
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
//       injType : $("[name=injType]").val(),
      injAmount : $("[name=injAmount]").val(),
      injDate : $("[name=injDate]").val(),
      stCd : $("#hiddenId3").val()
   }
   
//    console.log("투약 등록 : "+$("#hiddenId3").val())
   
   console.log("투약 등록 : ",data);
   
   
   Swal.fire({
	   title: '투약 기록을 등록하시겠습니까?',
	   icon: 'warning',
	   
	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	   confirmButtonText: '등록', // confirm 버튼 텍스트 지정
	   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	   
	   
		}).then(result =>{

		   if (result.isConfirmed) {
       $.ajax({
          url : "${webPath}/enter/insertMedi" 
        , type : "POST"
        , data : JSON.stringify(data)
        , contentType : "application/json"
        , dataType: "text"
       	, cache:false
        , success : function(rslt){    // 성공
            console.log(rslt);
           if(rslt = "OK"){          
				Swal.fire({
					  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
					  title: '투약 기록이 등록되었습니다.'
					});
              console.log("투약 등록 : ",data);
//               $(enterRecordWrite).css("display", "none");
//               $(enterRecordRead).css("display", "none");
//               $(enterRecordList).css("display", "block");
//               $(enterRecordList).css("display", "remove");
//               enterNoteList();
              fget(data.stCd);
            }else {
 				Swal.fire({
					  icon: 'warning',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
					  title: '등록에 실패하였습니다.',
					  text: '다시 시도해주세요.'
					});
             }
           }
        });
      }else{
  		Swal.fire({
			  icon: 'error',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
			  title: '투약 등록을 취소하였습니다.'
			});
      return false;
   }
		})
}

   
// 일지 목록
// function fgetEnterNoteList(pthis) {
	
// 		$.ajax({
// 			url : "${webPath}/enter/notelist",
// 			type : "post",
// 		    data : JSON.stringify(data),
// 		    contentType : "application/json",
// 		    async: true,
// 		    cache : false,
// 		    dataType: "json",
// 			success : function(data){
// 				$(enterRecordWrite).css("display", "none");
// 			    $(enterRecordRead).css("display", "none");
// 			    $(enterRecordList).css("display", "block");
// 				enterNoteList();
// 			}
// 		})
// 	}
   
//일지 삭제
function recordDel(pthis){
   
   console.log("ppp",$(pthis).closest("tr")[1]);
   let snNm = pthis.parentElement.children[1].value;
   console.log("snNm:",snNm);
   
   let data = {
         snNm:snNm
   }
   
   Swal.fire({
	   title: '일지를 삭제하시겠습니까?',
	   icon: 'warning',
	   
	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	   confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
	   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	   
	   
		}).then(result =>{

		   if (result.isConfirmed) {
		   
		      $.ajax({
		         type:"delete",
		         url:"${webPath}/enter/delRecord",
		         data: JSON.stringify(data),  
		         contentType:"application/json;charset=utf-8",
		         dataType:"text",
		         cache:false,
		         success:function(rslt){
		               console.log("확인:",rslt)
		             if(rslt == "OK"){      
		 				Swal.fire({
							  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
							  title: '일지를 삭제하였습니다.'
							});
		                
		               $(enterRecordRead).css("display", "none");
		               $(enterRecordList).css("display", "block");
		               $(enterRecordList).css("display", "remove");
		               enterNoteList();
		             }else {
			 				Swal.fire({
								  icon: 'warning',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
								  title: '일지 삭제에 실패하였습니다.',
								  text: '다시 시도해주세요.'
								});
		             }      
		         }
		      })
		   }else{
				Swal.fire({
					  icon: 'error',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
					  title: '일지 삭제를 취소하였습니다.'
					});
		      return false;
		   }
		})
}


// 개별 동물 정보 , 식이 목록 띄우기, 개별 수납비 내역
function fget(pthis){
//    let code = pthis.parentElement.children[0].value
   let code = pthis;      

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
    	console.log("동물내용",data);
        console.log("동물 수납비", data.readPrice);
        
        $("#animalInfo2").css("display", "block");
        $("#animalInfo").empty();
        $("#animalInfo").html(enterInfoTemplate(data.enterInfo));
        $("#animalInfo").empty();
	    $("#animalInfo").html(enterInfoTemplate(data.enterInfo));
	    
	    $("#hiddenId").val(data.enterInfo.stCd);
	    $("#hiddenId2").val(data.enterInfo.stCd);
	    $("#hiddenId3").val(data.enterInfo.stCd);
	    
	    $(mediInsert).html(mediInsertTemplate(data.readPreInList));
	    $("#todayMedi").empty();
	    $("#todayMedi").html(todayMediTemplate(data.todayMediList));
	    $("#todayFood").empty();
	    $("#todayFood").html(todayFoodTemplate(data.todayFoodList));
	    $(enterPriceList).html(enterPriceTemplate(data.readPrice));
	    $("#enterAllFoodList").html(allFoodListTemplate(data.readAllFoodList));
	    
	    $("#aniNoteList").html(enterNoteTemplate(data.aniEnterNoteList));
	    
       
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
   
	$("#enterfoodInfo").empty();
	$("#enterMediInfo").empty();
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
// 	      $("#empWriter").html(recordEmpWriterTemplate(data.getRecord));
	      $("#empWriter").html(recordEmpWriter(data.getRecord));
	      $("#hiddenSnNm").val(data.getRecord.snNm);
		  console.log(data.getRecord.empWriter);
	//         console.log("식이목록 : ", enterFoodListTemplate(data.enterFoodList));
	      $("#enterfoodInfo").html(enterFoodListTemplate(data.enterFoodList));
	      $("#enterMediInfo").html(enterMediListTemplate(data.enterMediList));
	      
// 	      fget(data.stCd);
     }
     , error:function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

// 일지 수정 내용
function fgetRecordMody(pthis){
	
	console.log("ppp",$(pthis).closest("tr")[1]);
	let snNm = pthis.parentElement.children[1].value;
	console.log("snNm:",snNm);
    data = {
         snNm : snNm
      }
    
    $.ajax({
       url : "${webPath}/enter/getRecord/"+snNm   
     , type : "POST"
     , data : JSON.stringify(data)
     , contentType : "application/json"
     , async: true
     , cache : false
       , dataType: "json"
     , success : function(data){    // 성공
         $(enterRecordRead).css("display", "none");
         $(enterRecordWrite).css("display", "none");
         $(enterRecordList).css("display", "none");  
         $("#enterRecordEdit").css("display", "block");
         
	      $("#enterNoteContent2").html(recordEditTemplate(data.getRecord));
	      $("#hiddenSnNm").val(data.getRecord.snNm);
	
	      $("#enterfoodInfo2").html(enterFoodListTemplate(data.enterFoodList));
	      $("#enterMediInfo2").html(enterMediListTemplate(data.enterMediList));
     }
     , error:function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

// 일지 수정 버튼
function fgetNoteEdit(pthis){

	   console.log("ppp",$(pthis).closest("tr")[1]);
	   let snNm = pthis.parentElement.children[1].value;
	   console.log("수정 일지 snNm:",snNm);
	   
	   var data = {
	    	      snHealthState : $('select[name=snHealthState2]').val(),
				  snPooState : $('select[name=snPooState2]').val(),
	    	      snTempState : $('[name=snTempState2]').val(),
	    	      snSpecal : $('[name=snSpecal2]').val().replace(/\n/g, "<br>"),
	    	      snCon : $('[name=snCon2]').val().replace(/\n/g, "<br>"),
	    	      snNm : snNm
	    	      }
	    
	    console.log("수정할 데이터 : ",data);

	   
	   Swal.fire({
		   title: '일지를 수정하시겠습니까?',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonText: '수정', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   
			}).then(result =>{

			   if (result.isConfirmed) {
	   
				      $.ajax({
				         type:"put",
				         url:"${webPath}/enter/upRecord",
				         data: JSON.stringify(data),  
				         contentType:"application/json;charset=utf-8",
				         dataType:"text",
				         success:function(rslt){
		// 		               console.log("확인:",data);
				             if(rslt == "OK"){        
				 				Swal.fire({
									  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
									  title: '일지 수정이 완료되었습니다.'
									});
				                $("#enterRecordEdit").css("display", "none");
				                fgetRecord(data.snNm);
				             }else {
					 				Swal.fire({
										  icon: 'warning',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
										  title: '일지 수정에 실패하였습니다.',
										  text: '다시 시도해주세요.'
										});
				             }      
				         }
				      })
				   }else{
						Swal.fire({
							  icon: 'error',                   
							  title: '일지 수정을 취소하였습니다.'
							});
		
				      return false;
				   }
			})
		}	   


// 동물 퇴원 
function fdel(pthis){
   console.log("ppp",$(pthis).closest("tr")[0]);
   let stCd = pthis.parentElement.children[0].value;
//    let praCd = pthis.parentElement.children[1].value;
   console.log("stCd:",stCd);
//    console.log("praCd:",praCd);
   
   
   let data = {
         stCd:stCd
   }
   
   
   Swal.fire({
	   title: '해당 동물을 퇴원시키겠습니까?',
	   icon: 'warning',
	   
	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	   confirmButtonText: '퇴원', // confirm 버튼 텍스트 지정
	   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	   
	   
		}).then(result =>{

		   if (result.isConfirmed) {
   
      $.ajax({
         type:"put",
         url:"${webPath}/enter/delete",
         data: JSON.stringify(data),  
         contentType:"application/json;charset=utf-8",
         dataType:"text",
         success:function(rslt){
               console.log("확인:",rslt)
             if(rslt == "OK"){       
 				Swal.fire({
					  icon: 'success',                     
					  title: '동물 퇴원을 완료 하였습니다.'
					});
                let tr = $(pthis).closest("tr")[0];
                let tbody = tr.parentElement;
                tbody.removeChild(tr);
                if(tbody.children.length == 0){
                   tbody.innerHTML = '<tr><td colspan="6" align="center">현재 입원 중인 동물이 없습니다.</td></tr>'
                }
                $("#animalInfo2").css("display", "none");
	            $(enterRecordList).css("display", "remove");
	            enterNoteList();
                
                //$(pthis).closest("tr").remove(); // 화면에서 지우깅
             }else {
	 				Swal.fire({
						  icon: 'warning',                    
						  title: '퇴원에 실패했습니다.',
						  text: '다시 시도해주세요.'
						});

             }      
         }
      })
   }else{
		Swal.fire({
			  icon: 'error',                   
			  title: '퇴원을 취소하였습니다.'
			});

      return false;
   }
		})
}

// 일지 등록 시 알림 
function sendMessageAlram(){
	send(
			"alarm", 				// 전송 타입(알람/채팅)
		 	$("#userId").val(), 	// 받는 사람(알림 받는 사람)
		 	$("#resTitle").val(),	// 알림 타입(예약/댓글 등)
		 	"입원일지 등록" 	// 알림 내용
		);	
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
		                                    <span class="d-none d-sm-block textSize"><b>${ward.wardName }</b></span>
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
	                        	<div class="tab-pane active textSize" id="${wardList.wardNm }" role="tabpanel">
	                              <table class="table mb-1 table-hover">
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
	                              <table class="table mb-1 aniList textSize table-hover">
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
		                                <c:choose>
						  					<c:when test="${empty aniList }">
						  						<tr>
                                           	  		<td colspan="6" align="center">현재 입원 중인 동물이 없습니다.</td>
                                          		</tr>
						  					</c:when>
							  				<c:otherwise>	
												<c:forEach items="${aniList }" var="ani">
													<c:if test="${ani.wardNm eq ward.wardNm }">
			                                             <tr>
			                                                <td class="stCd">${ani.stCd }</td>
			                                                <td>${ani.cageNm }</td>
			                                                <td>${ani.patName }</td>
			                                                <td>
			                                                <fmt:parseDate value="${ani.stStartDate}" pattern="yyyy-MM-dd" var='startDate'/>
			                                                <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/></td>
			                                                <td align="center">
			                                                   <form action="/delete" class="delDogForm" method="post">
			                                                      <input type="hidden" name="stCd" value="${ani.stCd }" />
			                                                      <input type="hidden" name="praCd" value="${ani.praCd  }" />
			                                                      <input type="hidden" name="tab" value="dog" />
			                                                   <input type="button" class="btn btn-light btn-sm waves-effect waves-light" onclick="fget(this.id)" id="${ani.stCd }" value="상세정보"/>
			                                                   <input type="button" class="btnDogRemove btn btn-light btn-sm waves-effect waves-light" onclick="fdel(this)" value="퇴원" />
			                                                   </form>
			                                                </td>
			                                             </tr>
													</c:if>
		                                        </c:forEach>
	                                        </c:otherwise>
                                        </c:choose>
                                        </tbody>
                        			</table>
                        		</div>
							</c:forEach>
                        </c:otherwise>
						</c:choose>
                        </div> 
                     </div>
                     <script>
                     let tbody = document.querySelector("#animal1 tbody");
                     if(tbody.children.length == 0){
                     	 tbody.innerHTML = ` <tr>
                         <td colspan="6" align="center"><b>현재 입원 중인 동물이 없습니다.</b></td>
                         </tr>`;
                     } 

                     let tbody2 = document.querySelector("#animal2 tbody");
                     if(tbody2.children.length == 0){
                     	 tbody2.innerHTML = ` <tr>
                         <td colspan="6" align="center"><b>현재 입원 중인 동물이 없습니다.</b></td>
                         </tr>`;
                     } 
                     let tbody3 = document.querySelector("#animal38 tbody");
                     if(tbody3.children.length == 0){
                     	 tbody3.innerHTML = ` <tr>
                         <td colspan="6" align="center"><b>현재 입원 중인 동물이 없습니다.</b></td>
                         </tr>`;
                     } 
                     </script>
                  </div>
               </div>
            </div>
            
            


				<div id="animalInfo2" style="display: none;">
					<div class="col-xl-12">
						<div class="card card-h-50">
							<div class="card-body">
							<div class="d-flex justify-content-between">
								<div>
	                              <a class="form-label h5"><i class='fas fa-paw'></i><b>&nbsp;동물 정보</b></a><b><i class="ri-arrow-up-s-line"></i></b>
								</div>
								<ul class="nav nav-tabs nav-tabs-custom nav-justified"
									role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-bs-toggle="tab" href="#animalInfo" role="tab"> 
											<span class="d-none d-sm-block textSize"><b>상세정보</b></span>
									</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#middlePrice" role="tab"> 
												<span class="d-none d-sm-block textSize"><b>수납비 </b></span>
										</a>
									</li>
								</ul>
							</div>
							
							<div class="tab-content p-3 text-muted">
								<div class="tab-pane active textSize" id="animalInfo" role="tabpanel">
			
								</div>
								<div class="tab-pane" id="middlePrice" role="tabpanel">
								<div class="table-responsive" id="middlePrice">
										<h2 class="card-title" style="text-align: right;">
											<span class="price2"><b>수납비 중간 계산</b></span>
										</h2>
										<h5 class="card-title" style="text-align: right;">
											<span><%= sf.format(nowTime) %></span>
										</h5>
										<hr class="hr2">
										<div id="enterPriceList">
											<!-- 수납비 -->
										</div>
									</div>
								</div>
							</div>



							</div>
					</div>
				</div>
				</div>
					<!-- 동물 상세 정보 끝 -->

				
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
											<a class='form-label h5'><i class='fas fa-notes-medical'></i>
											<b>&nbsp;입원 일지</b></a>
										</h4>
																					<div class="search-box">
												<div class="position-relative" id="resSearchBox">
													<input type="text" id="enterSearch"
														class="form-control rounded" placeholder="검색..." /> <i
														class="mdi mdi-magnify search-icon"></i>
												</div>
											</div>
										<div style="width: 98%">
											<table class="table mb-1 table-hover textSize noteThead" id="enterRecordTable">
												<thead>
													<tr>
														<th></th>
														<th>입원번호</th>
														<th>환자명</th>
														<th>입원 병동</th>
														<th>작성일자</th>
														<th></th>
													</tr>
												</thead>
												<tbody id="aniNoteList">
													<c:choose>
														<c:when test="${empty enterNoteList }">
															<tr>
																<td colspan="6" align="center">등록된 입원일지가 없습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${enterNoteList }" var="note">
																<tr class="noteThead">
																	<td>${note.snNm }</td>
																	<td>${note.stCd }</td>
																	<td>${note.patName }</td>
																	<td>${note.wardName}-${note.cageNm }</td>
																	<td><fmt:parseDate
																			value="${note.snDate}" pattern="yyyy-MM-dd"
																			var='noteDate' /> <fmt:formatDate
																			value="${noteDate}" pattern="yyyy-MM-dd" /></td>
																	<td><input type="hidden" name="snNm"
																		value="${note.snNm }" />
																		<button type="button" onclick="fgetRecord(this.id)"
																			id="${note.snNm }"
																			class="btn btn-light btn-sm waves-effect waves-light">
																			<i class="ri-file-text-line"></i>
																		</button></td>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
											
										</div>
									</div>


									<div class="row" id="enterRecordRead" style="display: none">
										<!-- 입원일지 리스트 -->
										<%@include file="enterRecordInfo.jsp"%>


									</div>


									<div class="row" id="enterRecordWrite" style="display: none">
										<div class="table-responsive textSize">
											<!-- 입원 일지 작성 -->
											<%@include file="enterRecord.jsp"%>

											<div class="d-flex justify-content-between"></div>
										</div>
									</div>

									<div class="row" id="enterRecordEdit" style="display: none">
										<div class="table-responsive textSize">
											<!-- 입원 일지 수정 -->
											<%@include file="enterRecordEdit.jsp"%>

											<div class="d-flex justify-content-between"></div>
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
<script>
$(function(){
	document.getElementById("headerSearchBar").style.display="none";
})
</script>
