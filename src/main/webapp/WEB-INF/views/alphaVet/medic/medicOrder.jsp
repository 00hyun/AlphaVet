<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.orderSetBtn{ 
   width : 100%;
}
.osDtTable td{
   padding: 5px;
}
</style>

<!-- 오더 메뉴 테스트 -->
<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-keyboard="true" data-bs-backdrop="false" tabindex="-1" id="orderMenuBar" aria-labelledby="offcanvasScrollingLabel" style="width: 470px">
    <div class="offcanvas-body">
    
    
    
    
       <ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
          <li class="nav-item">
              <a role="tab" href="#orderSetTab" data-bs-toggle="tab"  aria-selected="true" id="" class="nav-link active">
                  <span class="d-none d-sm-block"><b>오더 세트</b></span>
              </a>
          </li>
          <li class="nav-item">
              <a role="tab" href="#addOrderSetTab" data-bs-toggle="tab" aria-selected="false" id="" class="nav-link">
                  <span class="d-none d-sm-block"><b>오더 추가</b></span>
              </a>
          </li>
      </ul>
   
       <div class="tab-content p-0 text-muted">
          <div role="tabpanel" id="orderSetTab" class="tab-pane active">
          
                <div>
                <form class="app-search d-none d-lg-block">
                   <div class="position-relative">
                       <input type="text" class="form-control" id="searchOS" placeholder="오더세트명 검색...">
                       <span class="ri-search-line"></span>
                   </div>
               </form>
             </div>
             
             <div>
                  <ul class="list-unstyled ps-0">

                  <!-- 오더세트 리스트 들어감 -->

                  </ul>
             </div>
   
          </div>
       
       
          <div class="tab-pane" id="addOrderSetTab" role="tabpanel">
   
           
              <div >
                <form class="app-search d-none d-lg-block needs-validation mb-1">
                   <div class="position-relative">
                       <input type="text" class="form-control" id="searchOSDetail" placeholder="질병/약품/검사 검색...">
                       <span class="ri-search-line"></span>
                   </div>
               </form>
                 
               <ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
                   <li class="nav-item">
                       <a role="tab" href="#medicDiseaseOS" data-bs-toggle="tab"  aria-selected="true" id="medicDiseaseTabOS" class="nav-link active">
                           <span class="d-none d-sm-block">질병</span>
                       </a>
                   </li>
                   <li class="nav-item">
                       <a role="tab" href="#medicTestOS" data-bs-toggle="tab" aria-selected="false" id="medicTestTabOS" class="nav-link">
                           <span class="d-none d-sm-block">검사</span>
                       </a>
                   </li>
                   <li class="nav-item">
                       <a role="tab" href="#medicDrugOS" data-bs-toggle="tab" aria-selected="false" id="medicDrugTabOS" class="nav-link">
                           <span class="d-none d-sm-block">약품</span>
                       </a>
                   </li>
               </ul>
               <!-- Tab panes -->
               <div class="tab-content p-0 mb-1 text-muted" style="background-color:#f9f9f9;">
                   <div role="tabpanel" id="medicDiseaseOS" class="tab-pane active">
                           <table id="medicDiseaseTableOS" class="table dt-responsive nowrap osDtTable">
                               <thead style="display:none;">
                                   <tr class="w-auto">
                                      <th>코드</th>
                                       <th>분류</th>
                                       <th>질병명</th>
                                   </tr>
                               </thead>
                           </table>
                   </div>
                   
                   <div class="tab-pane" id="medicTestOS" role="tabpanel">
                           <table id="medicTestTableOS" class="table dt-responsive nowrap osDtTable">
                               <thead style="display:none;">
                                   <tr>
                                      <th>검사코드</th>
                                       <th>검사명</th>
                                       <th>검사 내용</th>
                                   </tr>
                               </thead>
                           </table>
                   </div>
                   
                   <div class="tab-pane" id="medicDrugOS" role="tabpanel">
                           <table id="medicDrugTableOS" class="table dt-responsive nowrap osDtTable">
                               <thead style="display:none;">
                                   <tr>
                                      <th>코드</th>
                                       <th width="100px;">약품명</th>
                                       <th width="50%;">영문명</th>
                                   </tr>
                               </thead>
                           </table>
                   </div>
               </div>
               
               <div>
               
               </div>
                  
<!--                <div style="background-color:#f9f9f9;border-radius:4px;"> -->
                  <form id="orderSetForm" name="orderSetForm" class="mt-1 mb-1" >
                     <div style="height: 300px; overflow: auto;">
                        <table id="addOrderSetTable" class="table dt-responsive nowrap w-100" >
                           <thead style="display:none;">
                              <tr>
                                 <th width="80px;">분류</th>
                                 <th>품명</th>
                                 <th>삭제</th>
                              </tr>
                           </thead>
                           
                           <tbody id="addOrderSetTbody">
                           </tbody>
                        </table>
                     </div>
                     
                     <label>오더명</label>
                        <input type="text" name="orderName" class="form-control" value="" placeholder="오더명을 입력해주세요." required/><br/>
                        
                     <label>설명</label>
                       <input type="text" name="orderCon" class="form-control" value="" placeholder="간단한 설명을 입력해주세요." required/><br/>
                       <div class="d-flex justify-content-end">
                          <input type="submit" class="btn btn-light waves-effect" value="등록"/> 
                       </div>
                    </form>
<!--                </div> -->
                  
                  
                  
            
                 </div>
                </div>
        </div>
   </div>
</div>

<!-- 오더세트 클론용 li 시작 -->
<li class="mb-2" id="ordersetLi" style="display:none;">
    <button class="btn btn-light waves-effect btn-toggle align-items-center rounded collapsed orderSetBtn" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false"><b>오더세트 1</b></button>
    <div class="collapse" id="home-collapse">
       <div style="margin:10px 0px;">
          <span>오더세트 설명</span>
       </div>
      <table class="table dt-responsive nowrap w-100">
         <thead>
            <tr>
               <th width="80px;">타입</th>
               <th style="text-align:center;">세부 내용</th>
            </tr>
         </thead>
         <tbody>
         
         </tbody>
      </table>
      <div class="d-flex justify-content-end">
         <input type="button" class="btn btn-outline-secondary btn-sm" value="처방" onclick="insertPre(this)"/>
      </div>
    </div>
</li>
<!-- 오더세트 클론용 li 끝 -->
<script>
const orderSetForm = document.orderSetForm;
const addOrderSetTbody = document.querySelector("#addOrderSetTbody");
const ordersetLi = document.getElementById("ordersetLi");
const orderSetTab = document.getElementById("orderSetTab");

// 오더세트 추가시 질병/약품/검사 선택하면 하단의 테이블에 복제해주는 함수
function addOrderSerDetail(detailTr){
   let type = detailTr.dataset.type;
   
   if(document.getElementById("new_"+detailTr.id)){
      document.getElementById("new_"+detailTr.id).remove();
   }else{
      let newTr = detailTr.cloneNode(true);
      newTr.id = "new_"+detailTr.id;
      
      if(type == "disease"){
         newTr.children[0].innerHTML = "질병";
         let newCell = newTr.insertCell(-1);
         newCell.innerHTML = "<input type='button' class='btn-close'/>";
      }else if(type == "drug"){
         let newCell = newTr.insertCell(0);
         newCell.innerHTML = "약품";
         newTr.children[2].innerHTML = "<input type='button' class='btn-close'/>";
      }else{
         let newCell = newTr.insertCell(0);
         newCell.innerHTML = "검사";
         newTr.children[2].innerHTML = "<input type='button' class='btn-close'/>";
      }
      newTr.children[0].style.width="80px";
      newTr.children[2].innerHTML += `<input type="hidden" value="\${detailTr.id}" name="orderCd"/>
                              <input type="hidden" value="\${type}" name="orderDtType" />
                              <input type="hidden" value="\${newTr.children[1].innerHTML}" name="orderDtName" />`;

      addOrderSetTbody.appendChild(newTr);
   }
}


// 질병 목록
function getMedicList(){
   $.ajax({
      method: 'post',
       url: '/medic/disease/list',
       dataType: 'json',
       success: function (result) {
          const medicDiseaseTableOS = $('#medicDiseaseTableOS').dataTable({
             destroy : true,
               paging : false,
               autoWidth: false,
               scrollY: '200',
               scroller: true,
               info: false,
               ordering: false,
               select: { style: 'multi' },
               data: result,
               columns: [
                  { data: 'disCd', 'visible' : false, 'searchable' : false },
                  { data: 'disType',  "width":"150px" }, 
                  { data: 'disKorName',  "width":"150px" }
                  ],
               createdRow: function (row, data, dataIndex, full) {
                  $(row).attr('id', data.disCd);
                  $(row).attr('class', "disTr");
                  $(row).attr('onclick', "addOrderSerDetail(this)");
                  $(row).attr('data-type', "disease");
               },
           });
          $('.dataTables_filter').remove();
       }
   })
} 


// 검사 목록
function getTestList(){
   $.ajax({
      method: 'post',
       url: '/medic/test/list',
       dataType: 'json',
       success: function (result) {
          const medicTestTableOS = $('#medicTestTableOS').dataTable({
             destroy : true,
               paging : false,
               autoWidth: false,
               scrollY: '200',
               scroller: true,
               info: false,
               ordering: false,
               select: { style: 'multi' },
               data: result,
               columns: [
                  { data: 'testCd', 'visible' : false, 'searchable' : false},
                  { data: 'testName',  "width":"150px"}, 
                  { data: 'testCon', "defaultContent": "",  "width":"150px" }
                  ],
               createdRow: function (row, data, dataIndex, full) {
                  $(row).attr('id', data.testCd);
                  $(row).attr('class', "testTr");
                  $(row).attr('onclick', "addOrderSerDetail(this)");
                  $(row).attr('data-type', "test");
                  $(row).attr('title', data.testCon)
               },
           });
          $('.dataTables_filter').remove();
       }
   })
}

// 약품 목록
function getDrugList(){
   $.ajax({
      method: 'post',
       url: '/medic/drug/list',
       dataType: 'json',
       success: function (result) {
          const medicDrugTableOS = $('#medicDrugTableOS').dataTable({
             destroy : true,
               paging : false,
               autoWidth: false,
               scrollY: '200',
               scroller: true,
               info: false,
               ordering: false,
               select: { style: 'multi' },
               data: result,
               columns: [
                  { data: 'drugNm', 'visible' : false, 'searchable' : false },
                  { data: 'itemName',  "width":"150px"}, 
                  { data: 'itemEngName', "defaultContent": "",  "width":"150px"}
                  ],
               createdRow: function (row, data, dataIndex, full) {
                  $(row).attr('id', data.drugNm);
                  $(row).attr('class', "drugTr");
                  $(row).attr('onclick', "addOrderSerDetail(this)");
                  $(row).attr('data-type', "drug");
               },
           });
          $('.dataTables_filter').remove();
       }
   })
}


// 오더세트 submit 눌렀을 때 선택한 데이터들 추합해서 컨트롤러로 보내는 함수
orderSetForm.addEventListener("submit", (e) => {
   e.preventDefault();
   let $orderSetForm = $("#orderSetForm");
   let data = $orderSetForm.serializeArray();
   
   console.log(JSON.stringify(data));
   
   $.ajax({
      method: 'post',
       url: '/medic/insertOrderSet',
       data : JSON.stringify(data),
       contentType : "application/json;charset=utf-8",
      processData : false,
       dataType: 'json',
       success: function (result) {
          if(result > 0){
             Swal.fire({
               title: "새로운 오더세트를 등록하였습니다.",
               icon: "success",
                 confirmButtonColor: '#3085d6',
                 confirmButtonText: '확인',
                   backdrop: true,
                 }) 
             
             addOrderSetTbody.innerHTML = "";
             
             orderSetForm.orderName.value ="";
             orderSetForm.orderCon.value ="";
             
             
             getMedicList();
             getTestList();
             getDrugList();
             orderSetTab.getElementsByTagName("ul")[0].innerHTML = "";
             getOrderset();
             
             orderMenuBar.getElementsByTagName("a")[0].click();
          }else{
             Swal.fire({
               title: "오더세트를 등록하지 못했습니다.",
               icon: "error",
                 confirmButtonColor: '#3085d6',
                 confirmButtonText: '확인',
                   backdrop: true,
                 }) 
          }
       }
      
   })
})


function getOrderset(){
// 아작스로 오더세트 가져와서 리스트 뿌려주는 함수
   $.ajax({
      method: 'post',
       url: '/medic/selectOrderSetList',
       contentType : "application/json;charset=utf-8",
      processData : false,
       dataType: 'json',
       success: function (result) {
          if(result != ""){
             
             for(let i = 0; i < result.length; i++){
                let cloneLi = ordersetLi.cloneNode(true);
                
                cloneLi.id += result[i].orderNm;
                cloneLi.className += " ordersetLi";
                cloneLi.getElementsByTagName("button")[0].setAttribute("data-bs-target", "#order-collapse" + result[i].orderNm); 
                cloneLi.getElementsByTagName("div")[0].id = "order-collapse" + result[i].orderNm;
                cloneLi.getElementsByTagName("button")[0].innerHTML = "<b>" + result[i].orderName + "</b>";
                cloneLi.getElementsByTagName("span")[0].innerHTML = result[i].orderCon;
                
                let tBody = cloneLi.getElementsByTagName("tbody")[0];
                for(let j = 0; j < result[i].orderDetailVOList.length; j++){
                   let temp = result[i].orderDetailVOList[j];
                   let type = "";
                   
                   if(temp.orderDtType == "disease"){ type = "질병"; }
                   else if(temp.orderDtType == "test"){ type = "검사"; }
                   else{ type = "약품"; }
                   
                   let td =    `<tr id="\${temp.orderCd}">
                              <td id="\${temp.orderDtType}">\${type}</td>
                              <td id="\${temp.drugIo}">\${temp.orderDtName}</td>
                           </tr>`;
                           
                  tBody.innerHTML += td; 
                }
                cloneLi.style.display="";
                
                orderSetTab.getElementsByTagName("ul")[0].append(cloneLi);
             }
          }
       }
   })
}

//질병/약품/검사 검색 창
$('#searchOSDetail').keyup(function () {
    let $value = $(this).val();
    $("#medicDiseaseTableOS").DataTable().search($value).draw();
    $("#medicTestTableOS").DataTable().search($value).draw();
    $("#medicDrugTableOS").DataTable().search($value).draw();
});


//질병/약품/검사 검색 창
$('#searchOS').keyup(function () {
   const ordersetLiClass= document.querySelectorAll(".ordersetLi");
   
   for(let i = 0; i<ordersetLiClass.length; i++){
      ordersetLiClass[i].style.display="none";
   }
   
   let searchData = this.value;
   for(let i = 0; i< ordersetLiClass.length; i++){
      let orderNm = ordersetLiClass[i].getElementsByTagName("button")[0].innerText;
      if(orderNm.indexOf(searchData) != -1){
         ordersetLiClass[i].style.display="";
      }
   }
});

function insertPre(btn){
   let tr = btn.parentElement.previousElementSibling.getElementsByTagName("tr");
   
   for(let i = 1; i < tr.length; i++){
   
       if(tr[i].children[0].id == "drug"){
         let drugNm = tr[i].id;
         let drugIo = tr[i].children[1].id;
         let itemName = tr[i].children[1].innerHTML;
         medicAppendModal("drug", JSON.stringify({ drugNm, drugIo, itemName } ))
       }else if(tr[i].children[0].id == "disease"){
         let disCd = tr[i].id;
         let disKorName = tr[i].children[1].innerHTML;
         medicAppendModal("disease", JSON.stringify({ disCd, disKorName }) )
       }else{
         let testCd = tr[i].id;
         let testName = tr[i].children[1].innerHTML;
         medicAppendModal("test", JSON.stringify({ testCd, testName } ))
       }
   }
    
   document.getElementById("medicNewOrderBtn").click();
//    btn.parentNode.parentNode.previousSibling.click();
    medicAdd();
    
}




$(function(){
   getOrderset();
   
   getMedicList();
   getTestList();
   getDrugList();   
})

</script>