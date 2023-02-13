<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
.listTr {
	text-align: center;
}

.tdLongName1 {
/* 	text-overflow: ellipsis; */
	width: 300px;
}

.tdLongName2 {
/* 	text-overflow: ellipsis; */
	width: 220px;
}

.priceAlignCenter{
	text-align: center;
}

.box{
	width: 33.3%; 
}

#foodBtn{
	cursor: pointer;
	font-size: 1.25em;
}

#foodBtn:hover{
	color: #815efe;
}

</style>

<script>

$(function(){
	
		// 식이 버튼 클릭시
	   $(document).on('click', '#foodBtn', function(){
		   if($("#foodBtn").hasClass("ri-arrow-down-s-fill")){
		      $("#enterAllFoodList").css("display", "block");
		      $('#foodBtn').removeClass("ri-arrow-down-s-fill").addClass('ri-arrow-up-s-fill');
		   }else{
			      $("#enterAllFoodList").css("display", "none");
			      $('#foodBtn').removeClass("ri-arrow-up-s-fill").addClass('ri-arrow-down-s-fill');
		   }
		   })
	
})

// 중간 정산 테이블 템플릿
const enterPriceTemplate = data => {
	   var price1 = (data.preInTotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	   var price2 = (data.stFoodTotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	   var price3 = (data.stDays * 80000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	   var price4 = (data.preInTotal + data.stFoodTotal + (data.stDays * 80000)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	   return `
		   <table class="table mb-1 table-sm enterPriceTable">
			<thead>
				<tr>
					<th colspan="2">품목</th>
					<th colspan="2" class="priceAlignCenter">수량</th>
					<th colspan="2" class="priceAlign">금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2"> 입원비 <span class='font500'>(80,000원)</span></td>
					<td colspan="2" class="priceAlignCenter">\${data.stDays}</td>
					<th  colspan="2"class="priceAlign font500">\${price3}원</th>
				</tr>
				<tr>
					<td colspan="2"> 원내 처방비</td>
					<td colspan="2" class="priceAlignCenter">-</td>
					<th colspan="2" class="priceAlign font500">\${price1}원</th>
				</tr>
				<tr>
					<td colspan="2"> 식이 <i class="ri-arrow-down-s-fill" id="foodBtn"></i></td>
					<td colspan="2" class="priceAlignCenter">\${data.stFoodNum}</td>
					<th colspan="2" class="priceAlign font500">\${price2}원</th>
				<tr id="enterAllFoodList" style="display:none;">
				</tr>
				<tr>
					<th colspan="3"><b>현재 정산 금액</b></th>
					<th colspan="3" class="priceAlign"><b>\${price4}원</b></th>
				</tr>
			</tbody>
		</table>
	   `;
	   
}


// 총 식이 목록
const allFoodListTemplate = allFoodList => {
	   let code ="";

	   if(allFoodList.length == 0){
		   code=`<div style="width: 600%; padding: -2px;" align="center">
		   <span class='font500'>등록된 식이 목록이 존재하지 않습니다.</span>
		   <hr style="margin-top: -0.5px; margin-bottom: -0.5px;"> </div>
           `
	   }else{
		   for(var i = 0; i < allFoodList.length; i++){
          	   var foodPrice = (allFoodList[i].foodPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

			   code +=`
			   		<div style="width: 600%; padding: -2px;" >
	                  <span class="foodSpan" style="margin-left: 8%; width: 20%; font-size: 0.8em;">\${allFoodList[i].foodDate}</span>
	                  <span class="foodSpan"  style="font-weight: 500; width: 52%;">\${allFoodList[i].foodName}</span>
	                  <span class="foodSpan"  style="width: 3%; font-weight: 500;" align="center">1</span>
	                  <span class="foodSpan"  style="width: 14%; font-weight: 500; text-align:right;">\${foodPrice}원</span>
	                <hr style="margin-top: -0.5px; margin-bottom: -0.5px;">
	                </div>  
			   `;
		   }
		   console.log("총 식이 목록:",code);
	   }
		   return code;
}

// 일지 - 처방목록 템플릿
const enterMediListTemplate = enterMediInfo => {
	   let code ="";
// 	   console.log("enterMediInfo : ", enterMediInfo);
// 	   console.log("enterMediInfo : ", enterMediInfo.length);
	   
	   if(enterMediInfo.length == 0){
		   code =`<td colspan="5" style="text-align: center;"><span class='font500'>투약 내역이 존재하지 않습니다.</span></td></tr>`;
		   console.log("enterMediInfo : ", code);
	   }else{
		   for(var i = 0; i < enterMediInfo.length; i++){
			   code +=`
				   <tr>
	                  <th scope='row' style='text-align:center;'>\${enterMediInfo[i].injNm}</th>
	                  <td scope='row' >\${enterMediInfo[i].itemName}</td>
	                  <td style='text-align:center;'>\${enterMediInfo[i].injAmount}</td>
	                  <td style='text-align:center;'>\${enterMediInfo[i].injDate}</td>
	               </tr>
			   `;
		   }
		   console.log("디버깅:",code);
	   }
	   return code;
}


// 일지 - 식이목록 템플릿
const enterFoodListTemplate = enterFoodInfo => {
	   let code ="";
	   if(enterFoodInfo.length == 0){
		   code =`<td colspan="5" style="text-align: center;"><span class='font500'>식이 등록 내역이 존재하지 않습니다.</span></td></tr>`;
	   }else{
		   for(var i = 0; i < enterFoodInfo.length; i++){
			   var price = (enterFoodInfo[i].foodPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			   code +=`
				   <tr>
	                  <th scope='row' style='text-align:center;'>\${enterFoodInfo[i].foodDtNm}</th>
	                  <td scope='row' >\${enterFoodInfo[i].foodName}</td>
	                  <td style='text-align:center;'>\${enterFoodInfo[i].foodAmount}</td>
	                  <td style='text-align:right;' >\${price}원</td>
	                  <td  style='text-align:center;'>\${enterFoodInfo[i].foodDate}</td>
	               </tr>
			   `;
		   }
		   
		   console.log("디버깅:",code);
	   }
	   return code;
}

// mediList 템플릿
const mediInsertTemplate = mediList => {
	   let code ="";
	   if(mediList.length == 0){
		   code =`<tr><td colspan='4'style='text-align:center;'><span class='font500'>처방 목록이 존재하지 않습니다.</span></td></tr>`;
	   }else{
		   for(var i = 0; i < mediList.length; i++){
			   code +=`
				   <tr>
	                  <th scope='row' >\${mediList[i].drugNm}</th>
	                  <td scope='row'>\${mediList[i].itemName}</td>
	                  <td>\${mediList[i].preInAmount}</td>
	                  <td>\${mediList[i].preInCnt}</td>

	               </tr>
			   `;
		   }
		   console.log("디버깅:",code);
	   }
		   return code;
}


// 일지 상세 보기 템플릿
const recordTemplate = data => {
	   
	   return `
                <table class='table table-bordered mb-1'>
                   <thead>
                      <tr>
                         <th colspan='3' style='text-align: center;'><h3><b>입 원 일 지</b></h3></th>
                      </tr>
                   </thead>
                   <tbody>
                      <tr>
                         <td>입원일지 <b>no.\${data.snNm}</b></td>
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
                      <td colspan='3' style='text-align:center;'>진료메모 <br><b>\${data.praCon}</b>
                      </tr>
                      <tr>
                      <td style='text-align:center;' class="box">
	                         <div >체온<br>  <b>\${data.snTempState}</b></div>
                      </td >
                      <td style='text-align:center;' class="box">
	                         <div >건강상태<br> <b>\${data.snHealthState}</b></div>
                      </td>
                      <td style='text-align:center;' class="box">
	                         <div >배변상태<br> <b>\${data.snPooState}</b></div>
                      </td>
                      </tr>
                      <tr>
                         <td style='text-align:center;' colspan='2'>일지 내용 <br> <b>\${data.snCon}</b></td>
                         <td style='text-align:center;'>특이사항 <br><b>\${data.snSpecal}</td>
                      </tr>
                   </tbody>
                 </table>
                  
	   `;
}

// 등록 직원 이름 가져오기
const recordEmpWriter = data => {
	   return `
		<div style="text-align: right;">
			등록 직원 | <b>\${data.empWriter}</b>
		</div>
	   `;
}




// 오늘 투약 리스트 템플릿
   const todayMediTemplate = todayMediList => {
	   let code ="";
	   if(todayMediList.length == 0){
		   code =`<tr><td colspan='5' style='text-align: center;'><span class='font500'>오늘 등록한 투약 정보가 없습니다.</span></td></tr>`;

		   
	   }else{
		   for(var i = 0; i < todayMediList.length; i++){
			   code +=`
				     <tr>
				        <th align='center'>\${todayMediList[i].injNm }</th>
				        <td align='left' class='tdLongName1'>\${todayMediList[i].itemName }</td>
				        <td align='center'>\${todayMediList[i].injAmount }</td>
				        <td align='center'>\${todayMediList[i].injDate}</td>
				     </tr>
				   `;			
		   }
			   console.log("디버깅:",code);
   }
			   return code;
	   }
    
// 오늘 식이 리스트 템플릿   
   const todayFoodTemplate = todayFoodList => {
	   let code ="";
	   if(todayFoodList.length == 0){
		   code =`<tr><td colspan='5' style='text-align: center;'><span class='font500'> 오늘 등록한 식이 정보가 없습니다.</span></td></tr>`;
	   }else{
		   for(var i = 0; i < todayFoodList.length; i++){
			   var price = (todayFoodList[i].foodPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			   code +=`
				   <tr>
	                  <th scope='row'>\${todayFoodList[i].foodDtNm}</td>
	                  <td scope='row' class='tdLongName2'>\${todayFoodList[i].foodName}</td>
	                  <td style='text-align:center;'>\${todayFoodList[i].foodAmount}</td>
	                  <td style='text-align:center;'>\${price}원</td>
	                  <td style='text-align:center;'>\${todayFoodList[i].foodDate}</td>
	               </tr>
			   `;
		   }
		   
		   console.log("디버깅:",code);
	   }
		   return code;
   }
 


</script>

<ul class="nav nav-tabs" role="tablist">
	<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
		href="#foodRecord" role="tab" aria-selected="false"> <span
			class="d-block d-sm-none"><i class="fas fa-home"></i></span> <span
			class="d-none d-sm-block"><b>식이</b></span>
	</a></li>
	<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
		href="#mediRecord" role="tab" aria-selected="false"> <span
			class="d-block d-sm-none"><i class="far fa-user"></i></span> <span
			class="d-none d-sm-block"><b>투약</b></span>
	</a></li>
	<li class="nav-item active"><a class="nav-link active"
		data-bs-toggle="tab" href="#enterRecord" role="tab"
		aria-selected="true"> <span class="d-block d-sm-none"><i
				class="far fa-envelope"></i></span> <span class="d-none d-sm-block"><b>입원 기록</b></span>
	</a></li>
</ul>
</div>
<div class="tab-content p-3 text-muted textSize">


	<div class="tab-pane" id="foodRecord" role="tabpanel">
		<div class="row">
			<hr>
			<div class="col-xl-6">
				<div class="table-responsive" id="foodList">
					<!-- 식이 입력 창 -->
					<h4 class='card-title'>
						<b><i class="fas fa-comment-medical"></i> 식이 목록</b>
					</h4>
					<table class='table table-hover table-sm mb-1 ' id="foodTable">
						<thead>
							<tr class="listTr">
								<th></th>
								<th>식이명</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty readFood }">
									<tr>
										<td colspan="6" align="center"><span class='font500'> 등록된 입원일지가 없습니다.</span></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${readFood }" var="food">
										<tr>
										<tr>
											<th scope='row'>${food.foodNm}</th>
											<td>${food.foodName}</td>

											<td><fmt:formatNumber type="number"
													value="${food.foodPrice}" /></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-xl-6">
				<h4 class='card-title'>
					<b> 오늘 식이 목록</b>
				</h4>
				<table class='table table-hover table-sm mb-1'>
					<thead>
						<tr class="listTr">
							<th></th>
							<th>식이명</th>
							<th>양</th>
							<th>가격</th>
							<th>식이시간</th>
						</tr>
					</thead>
					<tbody id="todayFood">

						<tr>
						</tr>
					</tbody>
				</table>
			</div>

			<br>
			<br>
			<div class="col-xl-12">
				<h4 class='card-title' style="margin-top: 3%;">
					<b>식이 등록</b>
				</h4>
				<form id="foodInsert" method="post">
					<table class='table table-hover table-sm mb-1'>
						<thead>
							<tr class="listTr">
								<th></th>
								<th>식이명</th>
								<th>가격</th>
								<th>식이 시간</th>
							</tr>
						</thead>
						<tbody id="foodInsertInfo">
							<tr>
								<td colspan="4" style="text-align: center;"><span class='font500'> 등록할 식이정보를 클릭해주세요.</span></td>
							</tr>
						</tbody>
					</table>
					<div align="right">
						<input type='hidden' name='stCd' value='' id='hiddenId2' /> 
						<input type="button" class="btn btn-light btn-sm waves-effect waves-light"
							id="sa-params" value="등록" onclick="fFoodWrite(this)"
							style="margin-top: 10%;" /> 
						<input type="button" class="btn btn-light btn-sm waves-effect waves-light recordListBtn"
							id="sa-params" value="목록" style="margin-top: 10%;" /> 
					<br>
					</div>
			<br>
				</form>
			</div>
			<hr>
		</div>

	</div>

	<div class="tab-pane" id="mediRecord" role="tabpanel">
		<div class="row">
			<hr>
			<div class="col-xl-6">
				<div class="table-responsive">
					<h4 class='card-title'>
						<b><i class="fas fa-comment-medical"></i> 처방 목록</b>
					</h4>
					<table class='table table-hover table-sm mb-1' id="mediTable">
						<thead>
							<tr class="listTr">
								<th></th>
								<th>의약품명</th>
								<th>1회투여량</th>
								<th>1일투여횟수</th>
								<!--                                                    <th>처방 구분</th> -->
								<!--                                                    <th>약품 분류</th> -->
							</tr>
						</thead>
						<tbody id="mediInsert">
							<tr>
								<td colspan="4" style="text-align: center;"><span class='font500'> 처방 내용이 없습니다.</span></td>
							</tr>
						</tbody>
					</table>


					<!-- 투약 입력 창 -->
				</div>
			</div>

			<div class="col-xl-6">
				<div class="table-responsive">
					<h4 class='card-title'>
						<b> 오늘 투약 목록</b>
					</h4>
					<table class='table table-hover table-sm mb-1'>
						<thead>
							<tr class="listTr">
								<th></th>
								<th>약품명</th>
								<th>투여량</th>
								<th>투약시간</th>
							</tr>
						</thead>
						<tbody id="todayMedi">
							<tr>
								<td colspan="4" style="text-align: center;">
									<span class='font500'> 오늘 등록된 투약 정보가 없습니다.</span></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
			<br>
			<br>

			<div class="col-xl-12">
				<div class="row mb-3">
					<h4 class='card-title' style="margin-top: 3%;">
						<b>처방 등록</b>
					</h4>
					<form id="mediInsertInput" method="post">
						<table class='table table-hover table-sm mb-1'>
							<thead>
								<tr class="listTr">
									<th></th>
									<th>약품명</th>
									<th>1회투여량</th>
									<th>투약시간</th>
								</tr>
							</thead>
							<tbody id="drugInsertInfo">
								<tr>
									<td colspan="4" style="text-align: center;"><span class='font500'> 등록할 투약 정보를 클릭해주세요.</span></td>
								</tr>
							</tbody>
						</table>
						<div align="right">
							<input type='hidden' name='stCd' value='' id='hiddenId3' /> 
							<input type="button" class="btn btn-light btn-sm waves-effect waves-light"
								id="sa-params" value="등록" onclick="fRecordMedi(this)"
								style="margin-top: 10%;" /> 
							<input type="button" class="btn btn-light btn-sm waves-effect waves-light recordListBtn"
								id="sa-params" value="목록" style="margin-top: 10%;" />
						</div>
					</form>
				</div>

			</div>
			<hr>
		</div>
	</div>








	<div class="tab-pane active " id="enterRecord" role="tabpanel">
		<form id="insertNote" method="post">
			<div class="row">
				<hr>
				<h4 class="card-title">
					<b><i class="fas fa-comment-medical"></i> 일지 작성</b>
				</h4>
				<br>
				<br>
				<div class="col-xl-2">
					<div class="row mb-3">
						<h4 class="mb-3 textSize">
							<b>건강</b>
						</h4>
						<label> <input type="radio" name="snHealthState"
							value="좋음" class="form-check-input"> 좋음
						</label> <label><input type="radio" name="snHealthState"
							value="보통" class="form-check-input"> 보통</label> <label><input
							type="radio" name="snHealthState" value="나쁨"
							class="form-check-input"> 나쁨</label>
					</div>
					<div class="row mb-3">
						<div>
							<h4 class="mb-3 textSize" style="margin-top: 31px">
								<b>체온체크</b>
							</h4>
							<label> <input class="textST" name="snTempState"
								type="number" step="0.1" value="36.5" min="33" max="40">
								℃
							</label>
						</div>
					</div>



				</div>
				<div class="col-xl-2">
					<div class="row mb-3">
						<h4 class="textSize mb-3">
							<b>배변상태</b>
						</h4>
						<label> <input type="radio" name="snPooState" value="보통"
							class="form-check-input"> 보통
						</label> <label> <input type="radio" name="snPooState" value="딱딱함"
							class="form-check-input"> 딱딱함
						</label> <label> <input type="radio" name="snPooState" value="묽음"
							class="form-check-input"> 묽음
						</label> <label> <input type="radio" name="snPooState" value="안했음"
							class="form-check-input"> 안했음
						</label>
					</div>
					<div class="row mb-3">
						<h4 class="textSize mb-3">
							<b>특이사항</b>
						</h4>
						<textarea rows="2" cols="5" wrap="hard" class="form-control" name="snSpecal"
							placeholder="오늘은...."></textarea>
					</div>

				</div>
				<div class="col-xl-8">
					<h4 class="textSize mb-3">
						<b>일지 내용</b>
					</h4>
					<textarea rows="5" cols="5" wrap="hard" class="form-control"
						placeholder="오늘의 일지 내용을 작성해주세요.." name="snCon"></textarea>
						<input type="hidden" value="${principal.empVO.empId}" name="empId">
					<div align="right">
						<input type="button" class="btn btn-light btn-sm waves-effect waves-light"
							id="sa-params" onclick="fRecordWrite(this)" value="등록"
							style="margin-top: 10%;" /> 
						<input type="hidden" name="stCd" value="" id="hiddenId" /> 
						<input type="button" class="btn btn-light btn-sm waves-effect waves-light recordListBtn"
							id="sa-params" value="목록" style="margin-top: 10%;" />
					</div>
				</div>
				<hr>
			</div>
		</form>
		<!-- 일지 등록 폼 끝 -->


	</div>
</div>
