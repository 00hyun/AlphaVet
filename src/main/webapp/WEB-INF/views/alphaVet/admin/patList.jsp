<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-2">
	<div class="card">
		<div class="card-body textSize">
			<div class="flexDiv">
				<h4 class="card-title mb-2"><b>환자 관리</b></h4>
				<div>
					<button type="button" id="patModalBtn" class="btn btn-outline-light waves-effect btn-sm" data-bs-toggle="modal" data-bs-target="#patModal">
						<i class=" ri-user-add-fill" id="editIcon" style="zoom:1"></i>
					</button>
				</div>
			</div>
			<hr>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">전체환자</label>
				<div class="col-sm-8">
					<input name="" id="patCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">dog</label>
				<div class="col-sm-8">
					<input name="" id="dogCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">cat</label>
				<div class="col-sm-8">
					<input name="" id="catCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">etc</label>
				<div class="col-sm-8">
					<input name="" id="patEtcCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">입원환자</label>
				<div class="col-sm-8">
					<input name="" id="stayCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<hr>
			<div class="search-box mb-3">
                <div class="position-relative">
                    <input
                        type="text"
                        id="patientSearch"
                        class="form-control rounded"
                        placeholder="환자 검색"
                    />
                    <i class="mdi mdi-magnify search-icon"></i>
                </div>
            </div>
		</div>
	</div>
</div>
<div class="col">
	<div class="card">
		<div class="card-body textSize">
			<div class="row">
				<div class="col-12">
					<table id="patTable" class="table dt-responsive nowrap w-100 table-hover">
						<thead>
							<tr>
								<th>환자아이디</th>
								<th>동물코드</th>
								<th>환자명</th>
								<th>생년월일</th>
								<th>보호자명</th>
								<th>연락처</th>
								<th>주소</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- end col -->
			</div>
		</div>
	</div>
</div>

<script>

function updatePat(){
	let $patForm = $("#patForm");
	let formData = new FormData($patForm[0]);
	
	console.log($patForm);
	console.log(formData);
	$.ajax({
		method : "post",
		url : "/pat/update",
		data : formData,
		contentType : false,
		processData : false,
		success : function(rslt){
			if(rslt > 0){
				alert("환자 정보 수정이 완료되었습니다.");
			}else{
				alert("환자 정보 수정 실패!");
			}
			patLi.trigger("click");
			$("#patModal").modal('hide');
			$patForm[0].reset();
		}
	})
}

function deletePat(){
	
}
</script>