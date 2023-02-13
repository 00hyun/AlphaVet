<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<style>
	.tableFoodNm {
		width: 7%;	
		text-align: center;
	}
	.tableFoodName {
		width: 55%;	
		text-align: center;
	}
	.tableFoodAmount {
		width: 7%;
		text-align: center;	
	}
	.tableFoodPrice {
		width: 10%;
		text-align: center;		
	}
	.tableFoodTime {
		width: 21%;	
		text-align: center;
	}

	.tableMediNm {
		width: 7%;	
		text-align: center;
	}
	.tableMediName {
		width: 65%;	
		text-align: center;
	}
	.tableMediAmount {
		width: 7%;
		text-align: center;	
	}
	.tableMediTime {
		width: 21%;	
		text-align: center;
	}
	
	#enterFixImg{
		width: 250px;
		opacity: 0.11;
		position: fixed;
		top: 400px;
		text-align: center;
		margin-left: -120px;
	}

</style>


<script>
function print_btn(target_id){
	var initBody = document.body.innerHTML;
	window.onbeforeprint = function(){
		document.body.innerHTML = document.getElementById(target_id).innerHTML;
	}
	window.onafterprint = function(){
		document.body.innerHTML = initBody;
	}
window.print();   
}

</script>

							<div class='row'>
									<div class='col-xl-12'>
										<div class='card card-h-50'>
											<div class='card-body'>
												<div class='table-responsive textSize enterInfoPrint'>

													<!-- 입원 일지 상세 정보 -->
													<div>
													<input type="button" onclick="print_btn('docDiv');" value="프린트"  class="btn btn-secondary btn-sm waves-light waves-effect" id="page_print"/>
													</div>
													
													<div id="empWriter" style="text-align: right;">
														등록 직원 | 왜 안나왕
													</div>
													<div align="center">
														<img id="enterFixImg" src='${pageContext.request.contextPath }/resources/images/appImg/logoFix.png'>
													</div>
													<table class='table table-bordered mb-1' id="enterNoteContent">


													</table>
													<br> <br> <a class="form-label h5" style="margin-bottom: 2%;"> 
													<i class="fas fa-hand-holding-medical"></i> 
													<b style="margin-bottom: 10%;">투약 정보</b></a>
													<table class='table table-bordered mb-1 table-sm'>
														<thead style="text-align: center">
															<tr>
																<th class="tableMediNm">번호</th>
																<th class="tableMediName">의약품명</th>
																<th class="tableMediAmount">투여량</th>
<!-- 																<th>약품 구분</th> -->
																<th class="tableMediTime">투약 시간</th>
																<!-- 																<td>가격</td> -->
															</tr>
														</thead>
														<tbody id="enterMediInfo">
															<tr>
															<td colspan="4" style="text-align: center;"><b>등록된 투약 기록이 없습니다.</b></td>
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
														<tbody id="enterfoodInfo">
															<tr>
																<td colspan="5" style="text-align: center;"><b>등록된 식이 기록이 없습니다.</b></td>
															</tr>
														</tbody>
													</table>


													<!-- 끝 -->


												</div>
													<div align="right" style="margin-top: 5%">
														<input type='submit'
															class='btn btn-light btn-sm waves-effect waves-light'
															id='recordModyBtn' onclick="fgetRecordMody(this)" value='수정'/>
														<input type='hidden' name='snNm' value='' id='hiddenSnNm' />
														<input type='button' class='btn btn-light btn-sm waves-effect waves-light' id='recordDelBtn' onclick='recordDel(this)' value='삭제'
															style='margin-left: 0.5%;' /> 
														<input type='button' class='btn btn-light btn-sm waves-effect waves-light recordListBtn' onclick="fgetEnterNoteList(this)" value='목록'
															style='margin-left: 0.5%;' />
													</div>
											</div>
										</div>
									</div>
								</div>