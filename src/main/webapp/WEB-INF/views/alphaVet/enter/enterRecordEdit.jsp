<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<script>

//일지 상세 보기 수정 템플릿
const recordEditTemplate = data => {
	   var snCon = (data.snCon).replaceAll("<br>", "\r\n");
	   var snSpecal = (data.snSpecal).replaceAll("<br>", "\r\n");
	   return `
                <table class='table table-bordered mb-1 enterInfo'>
                   <thead>
                      <tr>
                         <th colspan='3' style='text-align: center;'><h3><b>입 원 일 지</b></h3></th>
                      </tr>
                   </thead>
                   <tbody>
                      <tr>
                         <td>입원일지<b> no.\${data.snNm}</b></td>
                         <td style='text-align:center;'></td>
                         <td style='text-align:right;'>등록일자  <b>\${data.snDate}</b></td>
                      </tr>
                      <tr>
	                      <td class="box" style='text-align:center;'>입원날짜 <b>\${data.stStartDate}</b></td>
	                      <td class="box" style='text-align:center;'><b>\${data.patName} / \${data.stCd}</b>
	                      </td>
	                      <td class="box" style='text-align:center;'>담당의사 <b>\${data.empName}</b></td>
                 	  </tr>
                      <tr>
                      <td colspan='3' style='text-align:center;'>진료메모 <b>\${data.praCon}</b>
                      </tr>
                      <form name='noteEditForm' id='noteEditForm'>
                      <tr>
                      <td style='text-align:center;'>
	                         <div >체온<br><input class='textST' name='snTempState2' type='number' step='0.1' value='\${data.snTempState}' min='33' max='40'> ℃  <b></b></div>
                      </td>
                      <td style='text-align:center;'>
	                         <div >건강상태<br> 
	                         <select class='textST' name='snHealthState2'>
		                         <option value='좋음' >좋음</option>
		                         <option value='보통'>보통</option>
		                         <option value='나쁨'>나쁨</option>
	                    	 </select>
	                    	 </div>
                      </td>
                      <td style='text-align:center;'>
	                         <div >배변상태<br>
	                         <select class='textST' name='snPooState2'>
		                         <option value='보통'>보통</option>
		                         <option value='딱딱함'>딱딱함</option>
		                         <option value='묽음'>묽음</option>
		                         <option value='안했음'>안했음</option>
	                         </select>
	                         </div>
                      </td>
                      </tr>
                      <tr>
                         <td style='text-align:center;' colspan='2'>일지 내용  
                       	  <textarea rows='2' cols='5' wrap="hard" class='form-control' name='snCon2'>\${snCon}</textarea>
                       	</td>
                         <td style='text-align:center;'>특이사항
                       	  <textarea rows='2' cols='5' wrap="hard" class='form-control' name='snSpecal2'>\${snSpecal}</textarea>
                         </td>
                      </tr>
                      <tr>
                      <td colspan='3'><input type='submit' class='btn btn-light btn-sm waves-effect waves-light'
  						id='recordModyBtn' onclick="fgetNoteEdit(this)" value='수정' style='margin-left: 95%;' />
 							<input type='hidden' name='snNm' value='\${data.snNm}' id='hiddenSnNm' /></td>
                      </tr>
                 </form> 
                   </tbody>
                 </table>
	   `;
}
</script>

<div class='row'>
									<div class='col-xl-12'>
										<div class='card card-h-50'>
											<div class='card-body'>
												<div class='table-responsive'>

													<!-- 입원 일지 상세 정보 -->
													<div style="text-align: right;">
														등록 직원 | <b>${principal.empVO.empName}</b>
													</div>
													<table class='table table-bordered mb-1' id="enterNoteContent2">

													</table>
													<br> <br> <a class="form-label h5"
														style="margin-bottom: 2%;"> <i
														class="fas fa-hand-holding-medical"></i> <b
														style="margin-bottom: 10%;">투약 정보</b></a>
													<table class='table table-bordered mb-1 table-sm'>
														<thead>
															<tr>
																<th class="tableMediNm">번호</th>
																<th class="tableMediName">의약품명</th>
																<th class="tableMediAmount">투여량</th>
<!-- 																<th>약품 구분</th> -->
																<th class="tableMediTime">투약 시간</th>
																<!-- 																<td>가격</td> -->
															</tr>
														</thead>
														<tbody id="enterMediInfo2">
															<tr>
															</tr>
														</tbody>
													</table>
													<br> <br> <a class="form-label h5"
														style="margin-bottom: 2%;"> <i
														class="fas fa-hand-holding-medical"></i> <b
														style="margin-bottom: 10%;">식이 정보</b>
													</a>

													<table class='table table-bordered mb-1 table-sm'>
														<thead>
															<tr>
																<th class="tableFoodNm">번호</th>
																<th class="tableFoodName">식이명</th>
																<th class="tableFoodAmount">용량</th>
																<th class="tableFoodPrice">가격</th>
																<th class="tableFoodTime">식이시간</th>
															</tr>
														</thead>
														<tbody id="enterfoodInfo2">
															<tr>
															</tr>
														</tbody>
													</table>


													<!-- 끝 -->


													<div align="right" style="margin-top: 5%">
														<input type='hidden' name='snNm' value='' id='hiddenSnNm' />
														<input type='button'
															class='btn btn-light btn-sm waves-effect waves-light recordListBtn'
															onclick="fgetEnterNoteList(this)"  value='목록'
															style='margin-left: 0.5%;' />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>