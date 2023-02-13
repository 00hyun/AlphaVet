<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-2">
	<div class="card">
		<div class="card-body textSize">
			<div class="flexDiv">
				<h4 class="card-title mb-2"><b>직원 관리</b></h4>
				<div>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" id="downEmpExcelBtn">
						<i class=" ri-file-excel-2-line" id="excelIcon"></i>
					</button>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-bs-toggle="modal" data-bs-target="#composemodal" id="empModalBtn">
						<i class=" ri-user-add-fill" id="editIcon"></i>
					</button>
				</div>
			</div>
			<hr>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">전체직원</label>
				<div class="col-sm-8">
					<input name="" id="empCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">수의사</label>
				<div class="col-sm-8">
					<input name="" id="vetCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">테크니션</label>
				<div class="col-sm-8">
					<input name="" id="techCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">직원</label>
				<div class="col-sm-8">
					<input name="" id="etcCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<hr/>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">퇴사자</label>
				<div class="col-sm-8">
					<input name="" id="retireCnt" value="" class="form-control alignRight" type="" placeholder="" disabled="disabled">
				</div>
			</div>
			<hr>
			<div class="search-box mb-3">
                <div class="position-relative">
                    <input
                        type="text"
                        id="employeesSearch"
                        class="form-control rounded"
                        placeholder="직원 검색"
                    />
                    <i class="mdi mdi-magnify search-icon"></i>
                </div>
            </div>
		</div>
	</div>
</div>
<div class="col">
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="col-12">
				
					<table id="empTable" class="table dt-responsive nowrap w-100 textSize table-hover">
						<thead>
							<tr>
								<th>직원ID</th>
								<th>직원명</th>
								<th>직책</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>입사일</th>
								<th>진료가능여부</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- end col -->
			</div>
<!-- end row -->
		</div>
	</div>
</div>

<script>
// document.getElementById("downEmpExcelBtn").addEventListener("click", (e)=>{
// 	document.querySelector(".downEmpExcelBtn")[0].click();
// })
</script>
