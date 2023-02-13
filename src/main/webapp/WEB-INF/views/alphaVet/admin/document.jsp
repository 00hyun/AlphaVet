<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authentication property="principal" var = "principal"/>
<style>
table{
	table-layout: fixed;
}
.smsTr{
	height : 50px;
}
.smsTd{
	height : 50px;
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
.printBtnClass{
	display : none;
}
</style>
<div class="col-sm-2">
	<div class="card textSize">
		<div class="card-body">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	            <a class="nav-link mb-2 active" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true"><b>문자</b></a>
	            <a class="nav-link mb-2" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"><b>문서</b></a>
            </div>
		</div>
	</div>
</div>
<div class="col textSize">
	<div class="tab-content text-muted mt-4 mt-md-0" id="v-pills-tabContent">
		<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
			<div class="row">
			    <div class="col">
					<div class="card">
						<div class="card-body">
						<table class="table dt-responsive nowrap w-100 table-hover">
							<thead>
								<tr>
									<th width="130px">번호</th>
									<th width="100px">분류</th>
									<th width="150px">제목</th>
									<th width="500px">내용</th>
								</tr>
							</thead>
							<tbody id="smsTbody">
							</tbody>
						</table>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="card">
						<div class="card-body">
							<form name="smsForm" id="smsForm">
								<div class="mb-3">
									<div class="flexDiv">
										<label class="form-label" for="title">제목</label> 
				<!-- 						<button type="button" class="btn btn-outline-primary waves-effect waves-light " id="newFormBtn">New</button> -->
										<div>
											<button type="button" class="btn btn-outline-light waves-effect btn-sm" id="delFormBtn">
												<i class="ri-delete-bin-6-line" id="delBtn"></i>
											</button>
											<button type="button" class="btn btn-outline-light waves-effect btn-sm" id="newFormBtn">
												<i class="ri-add-box-line" id="saveIcon"></i>
											</button>
										</div>
									</div>
									<input name="smsTitle" id="smsTitle" type="text" class="input-large form-control smsInput" placeholder="Enter a title ..." />
								</div>
								<div class="mb-3">
									<label class="form-label" for="message">내용</label>
									<textarea name="smsContent" id="smsContent" class="input-large form-control smsInput" rows="17" placeholder="문자 내용을 입력해주세요."></textarea>
								</div>
								<div class="flexDiv">
									<select name="smsType" class="form-select smsInput" aria-label="Default select example" style="width:40%;">
										<option selected="">문자 분류</option>
										<option value="예약안내" selected="selected">예약안내</option>
										<option value="예방접종">예방접종</option>
										<option value="(직원)휴무">휴무(직원)</option>
										<option value="(직원)등록">휴무(직원)</option>
										<option value="etc">기타</option>
									</select>
									<input id="smsCd" name="smsCd" value="" type="text" style="display:none;"/>
									<textarea name="cliCd" hidden="hidden">${principal.empVO.cliCd }</textarea>
									<input type="button" id="smsBtn" class="btn btn-primary waves-effect waves-light " value="등록"/>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
			<div class="row">
				
				
				<div class="col">
					<div class="card">
						<div class="card-body">
							<label id="explainLabel" style="font-size:1.5em;margin:5% 22%;">문서를 확인하시려면 상세보기 버튼을 눌러주세요.</label>
							<iframe name="docIframe" width="100%" height="700px;"></iframe>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<div class="card-body">
						<table class="table dt-responsive nowrap w-100 table-hover">
							<thead>
								<tr>
									<th>문서명</th>
									<th>가격</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="docTbody">
							</tbody>
						</table>
						</div>
					</div>
				</div>





			
<!-- 				<div class="col-sm-3"> -->
<!-- 					<div class="card"> -->
<!-- 						<div class="card-body flexDiv"> -->
<!-- 							<h4 class="mt-2 mb-2"><b>처방전</b></h4> -->
<!-- 							<div> -->
<!-- 								<button type=button" class="btn btn-primary waves-light waves-effect"> -->
<!-- 									<i class="fa fa-inbox"></i> -->
<!-- 								</button> -->
<!-- 								<a href="javascript:void(0);" onclick="resOpenPopup('document1');return false;" class="btn btn-primary waves-light waves-effect">상세보기</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="card"> -->
<!-- 						<div class="card-body flexDiv"> -->
<!-- 							<h4 class="mt-2 mb-2"><b>진단서</b></h4> -->
<!-- 							<div> -->
<!-- 								<button type=button" class="btn btn-primary waves-light waves-effect"> -->
<!-- 									<i class="fa fa-inbox"></i> -->
<!-- 								</button> -->
<!-- 								<a href="javascript:void(0);" onclick="resOpenPopup('document2');return false;" class="btn btn-primary waves-light waves-effect">상세보기</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
				
				
				
				
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	docList();
})





// 문서 팝업창으로 여는 스크립트 시작
function resOpenPopup(doc_name){
    var pop = window.open("/document?path="+doc_name,"resPopup","width=200px%,height=600px;, scrollbars=yes, resizable=yes"); 
    pop.focus();
}
// 문서 팝업창으로 여는 스크립트 끝


const docTbody = document.querySelector("#docTbody");

function docList(){
	$.ajax({
		method : "post",
		url : "/document/docList",
		dataType : "json",
		processData : false,
		success : function(rslt){
			console.log(rslt);
			
			let data = "";
			$.each(rslt, function(i, v){
				let commaPrice = Number(v.docPrice).toLocaleString();
// 				<a href="/php/intro" target="frame_target">PHP 수업 확인하러 가기 =></a>
				data += `<tr onclick="showDocument('\${v.docCd}')">
							<td>\${v.docName}</td>
							<td>\${commaPrice}</td>
							<td><a class='btn btn-outline-primary waves-effect waves-light addBtn' href='/document?path=\${v.docPath}' onclick="return emptyLabel()" target="docIframe">상세보기</a></td>
						</tr>`;
			})
			docTbody.innerHTML = data;
		}
	})
}

function emptyLabel(){
	document.getElementById("explainLabel").remove();
}

function showDocument(docCd){
// 	document.getElementById('docIframe').contentWindow.document.querySelectorAll('.a4Page')[0].style.height="100%";
	
}







const smsTbody = document.querySelector("#smsTbody");
const smsContent = document.querySelector("#smsContent");
const smsForm = document.smsForm;

const newFormBtn = document.querySelector("#newFormBtn");
const delFormBtn = document.querySelector("#delFormBtn");

const smsInput = document.querySelectorAll(".smsInput");
const smsBtn = document.querySelector("#smsBtn");

var $smsForm = $("#smsForm");

function smsList(){
	$.ajax({
		method : "post",
		url : "/sms/list",
		dataType : "json",
		processData : false,
		success : function(rslt){
// 			console.log(rslt);
			data = "";
			$.each(rslt, function(i,v){
				data += `<tr onclick='smsDetail(this)' id='\${v.smsCd}' class='smsTr'>                 `;
				data += `<td class="smsTd">\${v.smsCd}</td>                          `;
				data += `<td class="smsTd">\${v.smsType}</td>                          `;
				data += `<td class="smsTd">\${v.smsTitle}</td>                          `;
				data += `<td class="smsTd alignLeft">\${v.smsContent}</td>                          `;
				data += `</tr>					         `;
			})
			smsTbody.innerHTML = data;
		}
	});
}

function smsDetail(smsTr) {
	console.log("디테일 : " + smsTr);
	smsFormDisabled(true);
	
	smsForm.smsCd.value = smsTr.children[0].innerHTML;
	smsForm.smsType.value = smsTr.children[1].innerHTML;
	smsForm.smsTitle.value = smsTr.children[2].innerHTML;
	smsForm.smsContent.value = smsTr.children[3].innerHTML;
	console.log(smsTr.children[3].innerHTML);
	
	smsBtn.value = "수정";
}

function resetSmsForm(){
	smsForm.reset();
	smsForm.smsContent.innerHTML = "";
}

function smsFormDisabled(status){
	for(let i = 0; i<smsInput.length; i++){
		smsInput[i].disabled = status;
	}
}

function insertSms(){
	let formData = new FormData($smsForm[0]);
	
	$.ajax({
		method : "post",
		url : "/sms/insert",
		data : formData,
		dataType : "text",
		contentType : false,
		processData : false,
		success : function(rslt){
			if(rslt > 0){
				Swal.fire({
					icon: "successs",
					title: "새로운 문자형식을 등록하였습니다.",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
		   		 	backdrop: true,
			 	 })
			}else{
				Swal.fire({
					title: "새로운 문자를 등록하지 못했습니다.",
					icon: "error",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
		   		 	backdrop: true,
			 		 })
			}
			smsList();
			setTimeout(() => smsDetail(smsTbody.children[0]), 50);
		}
	})
}

function updateSms(){
	let formData = new FormData($smsForm[0]);
		
	$.ajax({
		method : "post",
		url : "/sms/update",
		data : formData,
		dataType : "text",
		contentType : false,
		processData : false,
		success : function(rslt){
			if(rslt > 0){
				Swal.fire({
					icon: "successs",
					title: "문자 수정이 완료되었습니다.",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
		   		 	backdrop: true,
			 	 })
			}else{
				Swal.fire({
					title: "문자를 수정하지 못했습니다.",
					icon: "error",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
		   		 	backdrop: true,
			 		 })
			}
			smsList();
			setTimeout(() => smsDetail(document.getElementById($("#smsCd").val())), 50);
		}
	})
	
}

smsBtn.addEventListener("click", (e) => {
	let status = smsBtn.value;
	if(status == "등록"){
		if(smsForm.smsCd.value == ""){ insertSms(); }
		else{ updateSms(); }
	}else{
		smsFormDisabled(false);
		smsBtn.value = "등록";
	}
});

newFormBtn.addEventListener("click", (e) =>{
	resetSmsForm();
	smsBtn.value = "등록";
	smsFormDisabled(false);
});

delFormBtn.addEventListener("click", (e) => {
	$.ajax({
		method : "post",
		url : "/sms/delete",
		data : "smsCd="+$("#smsCd").val(),
		dataType : "text",
// 		contentType : false,
		processData : false,
		success : function(rslt){
			if(rslt > 0){
				Swal.fire({
					icon: "successs",
					title: "선택한 문자가 삭제되었습니다.",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
		   		 	backdrop: true,
			 	 })
			}else{
				Swal.fire({
					icon: "error",
					title: "문자를 삭제하지 못했습니다.",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
		   		 	backdrop: true,
			 		 })
			}
			smsList();
			newFormBtn.click();
		}
	})
})

</script>