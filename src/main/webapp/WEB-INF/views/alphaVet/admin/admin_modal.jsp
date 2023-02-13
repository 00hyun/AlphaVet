<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 직원 모달창 -->
<div class="modal fade textSize" id="composemodal" tabindex="-1" role="dialog" aria-labelledby="composemodalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="composemodalTitle"><h5>직원 등록</h5></h5>
				<input type="button" class="btn btn-primary" id="autoInput" value="자동입력"/>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" name="empForm" id="insertForm" action="/emp/insert" method="post" novalidate>
					<div class="row">
						<div class="col-xl-6">
							<div class="card">
								<div class="card-body">
									<div class="row mb-3" id="profileZone">
										<label for="example-search-input"
												class="col-sm-3 col-form-label"><b>프로필 사진</b></label>
										<img src="" name="empProfile" id="empProfile" style="width:250px; height:250px;"/>
										<div class="input-group">
											<input type="file" id="profileFile" class="form-control empInput" name="profile" value="" onchange="readURL(this);" disabled="disabled"/>
                                        </div>
									</div>
											<input name="cliCd" value="h001" class="form-control" type="hidden" placeholder="How do I shoot web" id="">
									<div class="row mb-3" style="display:none;">
										<label for="example-search-input"
											class="col-sm-2 col-form-label"><b>직원 ID</b></label>
										<div class="col-sm-10">
											<input name="empId" class="form-control" type="search" placeholder="의사인 경우 의사ID를 입력해주세요." id="empId">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input"
											class="col-sm-2 col-form-label"><b>비밀번호</b></label>
										<div class="col-sm-10">
											<input name="empPw" value="" class="form-control empInput" type="password" placeholder="" id="" disabled="disabled">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input"
											class="col-sm-2 col-form-label"><b>이름</b></label>
										<div class="col-sm-10">
											<input name="empName" class="form-control empInput" type="text" placeholder="" id="" disabled="disabled">
										</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"><b>전문과</b></label>
										<div class="col-sm-10">
											<select name="animalCd" class="form-select empInput" id="animalCd" aria-label="" disabled="disabled">
												<option selected="">과 선택</option>
												<option value="cat">고양이</option>
												<option value="dog">개</option>
												<option value="etc">기타</option>
											</select>
											<div id="etcDiv" style="display:none">
												<label class="col col-form-label">동물명(Eng) : </label>
												<input type="text" value="" name="etcAnimalCd" style="width:100px; border:none; border-bottom:1px solid gray;"/>
												&nbsp;&nbsp;&nbsp;
												<label class="col col-form-label">동물명(Kor) : </label>
												<input type="text" value="" name="etcAnimalType" style="width:100px; border:none; border-bottom:1px solid gray;"/>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"><b>직책</b></label>
										<div class="col-sm-10">
											<select name="empJob" id="empJob" class="form-select empInput" aria-label="Default select example" disabled="disabled">
												<option selected="">직책 선택</option>
												<option value="의사">의사</option>
												<option value="테크니션">테크니션</option>
												<option value="etc">기타</option>
											</select>
										</div>
									</div>
									<div class="row mb-3" style="display:none;">
										<label class="col-sm-2 col-form-label"><b>직속상사</b></label>
										<div class="col-sm-10">
											<select name="managerId" class="form-select empInput" aria-label="Default select example" disabled="disabled">
												<option selected="">상사 선택</option>
												<option value="20230102_01" selected>20230102_01</option>
												<option value="20230102_02">20230102_02</option>
												<option value="20230102_03">기타</option>
											</select>
										</div>
									</div>

								</div>
								<!-- end card -->
							</div>
							<!-- end col -->
						</div>

						<div class="col-xl-6">
							<div class="card">
								<div class="card-body">
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>전화번호</b></label>
										<div class="col-sm-10">
											<input name="empTel" class="form-control empInput" type="search" placeholder="01000000000" id="" disabled="disabled">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>메일주소</b></label>
										<div class="col-sm-10">
											<input name="empMail" class="form-control empInput" type="email" placeholder="realVet@alphaVet.com" id="" disabled="disabled">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>주소</b></label>
										<div class="col-sm-10">
											<input name="empAdd1" class="form-control empInput" type="search" placeholder="" id="empAdd1" placeholder="클릭해주세요." readonly="readonly">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>상세주소</b></label>
										<div class="col">
											<input name="empAdd2" class="form-control empInput" type="search" placeholder="" id="" disabled="disabled">
										</div>
										<div class="col-sm-3">
											<input name="empZipcode" class="form-control empInput" type="search" placeholder="우편번호" id="empZipcode" disabled="disabled">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-date-input" class="col-sm-2 col-form-label"><b>생년월일</b></label>
										<div class="col-sm-10">
											<input name="empBirth" class="form-control empInput" type="date" value="2023-02-14" id="" disabled="disabled">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-date-input" class="col-sm-2 col-form-label"><b>입사일</b></label>
										<div class="col-sm-10">
											<input name="empJoinDate" class="form-control empInput" type="date" value="2023-02-14" id="" disabled="disabled">
										</div>
									</div>
									<div class="mb-3 my-4">
										<label for="example-date-input" class="col-sm-2 col-form-label"><b>직원 권한</b></label>
										<table style="width:100%;text-align:center;">
											<tr style="width:100%">
												<td>원무</td>
												<td>진료</td>
												<td>예약</td>
												<td>입원</td>
												<td>관리</td>
											</tr>
											<tr >
												<td>
			                                       <div class="square-switch">
                                                       <input type="checkbox" class="empInput role" id="ROLE_WONMU" name="empAuth" value="ROLE_WONMU" switch="none" disabled="disabled"/>
                                                       <label for="ROLE_WONMU" data-on-label="On" data-off-label="Off"></label>
                                                   </div>
												</td>
												<td>
													<div class="square-switch">
                                                       <input type="checkbox" class="empInput role" id="ROLE_MEDIC" name="empAuth" value="ROLE_MEDIC" switch="none" disabled="disabled"/>
                                                       <label for="ROLE_MEDIC" data-on-label="On" data-off-label="Off"></label>
                                                   </div>
												</td>
												<td>
													<div class="square-switch">
                                                       <input type="checkbox" class="empInput role" id="ROLE_RES" name="empAuth" value="ROLE_RES" switch="none" disabled="disabled"/>
                                                       <label for="ROLE_RES" data-on-label="On" data-off-label="Off"></label>
                                                   </div>
												</td>
												<td>
													<div class="square-switch">
                                                       <input type="checkbox" class="empInput role" id="ROLE_ENTER" name="empAuth" value="ROLE_ENTER" switch="none" disabled="disabled"/>
                                                       <label for="ROLE_ENTER" data-on-label="On" data-off-label="Off"></label>
                                                   </div>
												</td>
												<td>
													<div class="square-switch">
                                                       <input type="checkbox" class="empInput role" id="ROLE_ADMIN" name="empAuth" value="ROLE_ADMIN" switch="none" disabled="disabled"/>
                                                       <label for="ROLE_ADMIN" data-on-label="On" data-off-label="Off"></label>
                                                   </div>
												</td>
											</tr>
										</table>
                                        
    
                                        
    													
                                        
    
                                        
    
                                        
    
                                    </div>
                                    
									<div class="form-check mb-3" id="msgCheckDiv" style="display:none;">
										<input class="form-check-input empInput" type="checkbox" value="" id="msgCheckInput" style="zoom:1.2" required disabled="disabled">
										<label class="form-check-label" for="invalidCheck"> 생성 후 문자 발송 </label>
										
										<select name="smsType" class="form-select smsInput" aria-label="Default select example" style="width:40%;display:none;">
										</select>
									</div>
	
								</div>
							</div>
							<!-- end card -->
						</div>
						<!-- end col -->
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<input type="button" id="empRegBtn" class="btn btn-primary" value="직원 등록"/>
				<input type="button" id="empUpdateBtn" class="btn btn-primary" value="정보 수정"/>
				<input type="button" id="empRetireBtn" class="btn btn-primary" value="퇴사"/>
<!-- 				<input type="button" id="empDeleteBtn" class="btn btn-primary" value="정보 삭제"/> -->
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>








<!-- 환자 모달창 시작 --> 
<div class="modal fade textSize" id="patModal" tabindex="-1" role="dialog" aria-labelledby="composemodalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="composemodalTitle2">환자 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" name="patForm" id="patForm" action="/pat/insert" method="post" novalidate>
					<input type="hidden" name="patChip" value="Y">
					<input type="hidden" name="patNew" value="Y">
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-body">
									<input name="cliCd" value="h001" class="form-control" type="hidden" id="">
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>환자 ID</b></label>
										<div class="col-sm-10">
											<input name="patId" class="form-control" type="text" placeholder="" id="patId">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>이름</b></label>
										<div class="col-sm-10">
											<input name="patName" class="form-control patInput" type="text" placeholder="" id="">
										</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"><b>환자유형</b></label>
										<div class="col-sm-10">
											<select name="animalCd" class="form-select patInput" aria-label="Default select example">
												<option selected="">과 선택</option>
												<option value="cat">고양이</option>
												<option value="dog">개</option>
												<option value="etc">기타</option>
											</select>
										</div>
									</div>
									<table style="width:100%;">
										<tr>
											<td><label class="form-check-label" for="invalidCheck"> <b>성별</b> </label></td>
											<td><label class="form-check-label" for="invalidCheck"> <b>중성화</b> </label></td>
											<td><label class="form-check-label" for="invalidCheck"> <b>임신</b> </label></td>
											<td><label class="form-check-label" for="invalidCheck"> <b>유기동물</b> </label></td>
										</tr>
										<tr>
											<td>
												<div class="square-switch">
	                                                <input type="checkbox" class="patInput" id="patGender" name="patGender" value="W" switch="none"/>
	                                                <label for="patGender" data-on-label="W" data-off-label="M"></label>
	                                            </div>
											</td>
											<td>
												<div class="square-switch">
	                                                <input type="checkbox" class="patInput" id="patRegnm" name="patRegnm" value="N" switch="none"/>
	                                                <label for="patRegnm" data-on-label="Y" data-off-label="N"></label>
	                                            </div>
											</td>
											<td>
												<div class="square-switch">
	                                                <input type="checkbox" class="patInput" id="pregnantCheck" name="pregnantCheck" value="N" switch="none"/>
	                                                <label for="pregnantCheck" data-on-label="Y" data-off-label="N"></label>
	                                            </div>
											</td>
											<td>
												<div class="square-switch">
	                                                <input type="checkbox" class="patInput" id="patAbandonhidden" name="patAbandonhidden" value="N" switch="none"/>
	                                                <label for="patAbandonhidden" data-on-label="Y" data-off-label="N"></label>
	                                            </div>
											</td>
										</tr>
									</table>
									<div class="row mb-3">
										<label for="example-date-input" class="col-sm-2 col-form-label"><b>생년월일</b></label>
										<div class="col-sm-10">
											<input name="patBirth" class="form-control patInput" type="date" value="2023-02-14" id="">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>보호자명</b></label>
										<div class="col-sm-10">
											<input name="memName" class="form-control patInput" type="text" placeholder="" id="">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>전화번호</b></label>
										<div class="col-sm-10">
											<input name="memTel" class="form-control patInput" type="text" placeholder="01000000000" id="">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>몸무게</b></label>
										<div class="col-sm-10">
											<input name="patWeight" class="form-control patInput" type="number" placeholder="몸무게" id="">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>주소</b></label>
										<div class="col-sm-10">
											<input name="patAdd1" class="form-control patInput" type="text" placeholder="" id="patAdd1" placeholder="클릭해주세요." readonly="readonly">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>상세 주소</b></label>
										<div class="col">
											<input name="patAdd2" class="form-control patInput" type="text" placeholder="" id="patAdd2">
										</div>
										<div class="col-sm-3">
											<input name="patZipcode" class="form-control patInput" type="text" placeholder="우편번호" id="patZipcode">
										</div>
									</div>
									<div class="row mb-3">
										<label for="example-search-input" class="col-sm-2 col-form-label"><b>환자 메모</b></label>
										<div class="col-sm-10">
											<input name="patMemo" class="form-control patInput" type="text" placeholder="" id="">
										</div>
									</div>
									<div class="form-check mb-3">
										<input class="form-check-input patInput" name="memAgree" type="checkbox" value="" required>
										<label class="form-check-label" for="invalidCheck"> SMS 수신 여부 </label>
										<div class="invalid-feedback">You must agree before submitting.</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
 				<input type="button" id="patRegBtn" class="btn btn-primary" value="환자 등록"/>
				<input type="button" id="patUpdateBtn" onclick="updatePat()" class="btn btn-primary" value="정보 수정"/>
				<input type="button" id="patDeleteBtn" onclick="deletePat()" class="btn btn-primary" value="정보 삭제"/>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 환자 모달창 끝 --> 








<!-- 약품 모달창 -->
<div class="modal fade textSize" id="composemodal3" tabindex="-1" role="dialog" aria-labelledby="composemodalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="composemodalTitle3">재고 신청 목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" name="daDtForm" id="daDtForm" novalidate>
					<input type="text" name="daNm" value="" style="display:none;"/>
					<div class="row">
								<div class="card-body">
								<table class="table" style="width:100%;">
									<thead>
										<tr>
											<th width="55px">번호</th>
											<th width="400px">약품명</th>
											<th width="200px">영문명</th>
											<th width="55px">수량</th>
											<th width="130px">금액</th>
											<th width="150px">거래처명</th>
											<th>입고유무</th>
										</tr>
									</thead>
								</table>
								<div style="max-height:400px;overflow:auto;">
									<table class="table" style="width:100%;">
										<tbody id="daDtTbody">
										</tbody>
									</table>
								</div>
								
								</div>
								<!-- end card -->
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<input type="button" id="daUpdateBtn1" class="btn btn-primary" value="변경" />
				<input type="button" id="daUpdateBtn2" class="btn btn-primary" value="등록" style="display:none;"/>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script>
document.getElementById("autoInput").addEventListener("click", (e)=>{
	document.empForm.empPw.value = "1234";
	document.empForm.empName.value = "허소영";
	document.empForm.empPw.value = "1234";
	document.empForm.empTel.value = "01012341234";
	document.empForm.empMail.value = "bomi9191@naver.com";
	document.empForm.empAdd1.value = "대전광역시";
	document.empForm.empAdd2.value = "대덕인재개발원";
	document.empForm.empZipcode.value = "123123";
})
</script>