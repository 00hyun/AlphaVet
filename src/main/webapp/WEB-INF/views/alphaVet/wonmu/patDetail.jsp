<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authentication property="principal" var="principal" />

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/table-edits/build/table-edits.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/pages/table-editable.init.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<sec:authentication property="principal" var="principal" />




<div style="position: relative;" class="col-md-6 col-xl-8">
	<!-- 원무의 첫화면 / 검색하면 아래 디테일 none을 수정하는거 -->
	<div id="wonmuMain" style="position: absolute; width: 100%;">
		<div style="height: 150px; align-items: center; margin: 0px auto;">
			<img alt="cat"
				<%-- 				src="${pageContext.request.contextPath }/resources/images/cat.png" style="width: 80%;margin-left:400px;"> --%>
				src="${pageContext.request.contextPath }/resources/images/gif/wonmuBack.gif"
				style="width: 40%; margin-left: 400px;">


		</div>
		<!--  	공백줌 -->
		<div class="m-3 ">&nbsp &nbsp</div>
		<div class="m-3 ">&nbsp &nbsp</div>
		<div class="m-3 ">&nbsp &nbsp</div>
		<div class="row" style="float: none; margin: 0 auto;">

			<div class="row" style="margin: 0 auto;">
				<div class="col-md-6" style="margin: 0 auto;">
					<form class="app-search d-none d-lg-block">
						<div class="position-relative" id="headerSearchBar">
							<input type="text" class="form-control" id="search"
								placeholder="Search..." /> <span class="ri-search-line"></span>
							<div id="searchResult"
								class="searchResult list-group position-absolute"></div>
						</div>
					</form>
				</div>
			</div>

			<div class="row" style="float: none; margin: 0 auto;">
				<div class="col-md-6">
					<div class="card"
						style="width: 135%; height: 110%; left: 35%; border-radius: 15px;">
						<div class="card-body" style="padding-bottom: 0px;">
							<h3 class="card-title" style="font-weight: bolder;">수납실</h3>
							<p class="card-text">
								<input type="hidden" id="praCdSpan"> <input
									type="hidden" id="idSpan"> <span
									style="font-size: 1.5em;" id="nameSpan"></span>, <span
									id="genderSpan"></span> <span id="birthSpan"></span>
							</p>
							<p class="card-text">
								<span id="memoSpan"></span>
							</p>
							<div class="d-flex flex-wrap gap-2 justify-content-end">
								<button type="button"
									class="btn btn-primary waves-effect waves-light" id="progress">진행하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="m-1 ">&nbsp &nbsp</div>
			<div class="row d-flex justify-content-center"
				style="float: none; margin: 0 auto; margin-top: 20px;">
				<div class="col-lg-4">
					<div class="card" style="border-radius: 15px">
						<div class="card-body">
							<h4 class="card-title" style="font-weight: bolder;">신규등록</h4>
							<p class="card-text">신규환자를 등록하시겠습니까?</p>
							<div class="d-flex flex-wrap gap-2 justify-content-end">
								<!-- 						<button type="button" class="btn btn-light waves-effect">신규등록</button> -->
								<button type="button"
									class="btn btn-light waves-effect waves-light"
									data-bs-toggle="modal" data-bs-target=".bs-example-modal-lg">신규등록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4" id="test">
					<div class="card" style="border-radius: 15px;">
						<div class="card-body" style="padding-top: 0px;">
							<span class="card-title"
								style="font-weight: bolder; display: inline-block;"> 접수신청
								[<span id="appReceipt" style="font-weight: bolder;"></span>건]
							</span>
							<button type="button" style="padding: 0px; padding-left: 10px;"
								class="btn header-item noti-icon waves-effect"
								id="page-header-notifications-dropdown"
								data-bs-toggle="dropdown" aria-expanded="false">
								<i
									style="color: #f7d24c; text-shadow: 2px 2px 2px #a39191c9; font-size: 1.5em;"
									class="ri-notification-3-fill fa-lg"></i> <span
									id="alarmNotiDot2" class=""></span>
							</button>


							<p class="card-text" id="appInfo" style="margin: 0px;"></p>
							<p class="card-text" id="appInfo2" style="margin: 0px;"></p>
							<input type="hidden" id="appMemTel" value=""> <input
								type="hidden" id="appPatId" value=""> <input
								type="hidden" id="appPatName" value="">
							<div class="d-flex flex-wrap gap-2 justify-content-end">
								<button type="button" class="btn btn-light waves-effect"
									id="appBtn">접수하기</button>
								<button type="button" class="btn btn-primary waves-effect"
									id="appCancel">접수취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 원무의 첫화면 / 검색하면 아래 디테일 none을 수정하는거 -->

	<!--   id="receipt !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<div class="col-md-6 col-xl-12"
		style="height: 100%; background-color: white; display: none;"
		id="receipt">
		<div class="card">
			<div class="card-body" style="padding-bottom: 0px;">

				<h3 class="card-title">&nbsp;접수</h3>

				<div class="table-responsive">
					<table
						class="table table-editable table-nowrap align-middle table-edits"
						style="border: 1px solid white;">
						<thead>
							<tr>
								<th colspan="5" style="font-size: 1.1em;">최근 내원일 [ <span
									id="spanDate"></span> ]
								</th>
							</tr>
							<tr style="">
								<td colspan="8" style="height: 10px; padding-bottom: 5px;">
									<span id="patName"
									style="font-size: 1.5em; font-weight: bolder; text-align: center;">김메디</span>
									<span id="patGender" style="font-weight: bolder;">여,</span> <span
									id="patAge" style="font-weight: bolder;"></span> <span
									style="display: inline-block; width: 200px;"></span>
								</td>
							</tr>
							<tr style="padding-top: 5px;">
								<td colspan="8" style="padding-top: 0px;"><span
									id="patMemo" style="font-weight: bolder;"></span></td>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>

			<!-- 여기수상함 // 안수상한거였음ㅎ.ㅎ -->
			<div class="row">

				<div class="table-responsive">
					<div class="row" style="margin: 0px auto;">

						<div class="tab-pane active textSize" id="animalInfo"
							role="tabpanel">
							<div style="text-align: right;">
								<button type="button" id="infoEdit" style="margin-left: 95%;"
									class="btn btn-light btn-sm waves-effect waves-light">
									<i class="fas fa-pencil-alt"></i>
								</button>
								<button type="button" style="margin-left: 95%; display: none;"
									class="btn btn-light btn-sm waves-effect waves-light ri-save-3-line"></button>
							</div>
							<div class="row">

								<div class="col-xl-5">
									<table class="table mb-1 textSize"
										style="text-align: center; border: 1px solid white;">
										<thead>
											<tr>
												<th colspan="2" style="text-align: center;"><img
													id="patProfile" src="${pageContext.request.contextPath }"
													class="rounded-circle img-thumbnail avatar-lg"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td
													style="font-weight: 700; text-align: left; padding: auto 0px;">(kg)</td>
												<td id="weightTd"
													style="font-size: 0.8em; text-align: left; font-weight: 700; padding-left: 0px;">[<span
													id="startW"></span>-<span id="lastW"></span>]
												</td>
											</tr>
											<tr style="position: center;">
												<td id="chartDiv" colspan="2">
													<canvas id="myChart2"></canvas>
												</td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="col-xl-7">
									<form action="patUpdate" method="post" id="patUpdateForm">
										<!-- 								업데이트 할 때 사용할 아뒤 -->
										<input type="hidden" value="" id="patIdHidden" name="patId">
										<table class="table mb-1">
											<tbody>
												<tr>
													<th style="width: 120px;">보호자명</th>
													<td id="memName">24</td>
												</tr>
												<tr>
													<th>보호자 연락처</th>
													<td style="padding: 0px center;" data-field="age"
														id="memTel">22</td>
												</tr>
												<tr>
													<th rowspan="2">주소</th>
													<td id="addr1">26</td>
													<br>
												</tr>
												<tr>
													<td id="addr2">26</td>
												</tr>
												<tr>
													<th>임신여부</th>
													<!-- 												<td> <input type="checkbox"> </td> -->
													<td><input type="hidden" name="pregnantCheck"
														id="switch5hidden" /> <input type="checkbox" id="switch5"
														switch="warning" /> <label for="switch5"
														data-on-label="Yes" data-off-label="No"></label></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 여기수상함 -->


			<div class="card-body" style="padding-top: 0px;">

				<h4 class="card-title"></h4>

				<div class="table-responsive">
					<!-- 		//접수폼 -->
					<form method="post" id="receiptForm">
						<!-- 						<input type="hidden" name="recNm" value=1>  -->
						<input type="hidden" name="patId" id="receiptFormPatId" value="">
						<input type="hidden" name="animalCd" id="animalCd" value="">
						<input type="hidden" name="praRoomNm" id="praRoNum">
						<table
							class="table table-editable table-nowrap align-middle table-edits"
							style="border: 1px solid white;" id="recTable">
							<thead>
								<tr>
									<th style="font-size: 1.1em;" colspan="5">접수정보</th>
								</tr>
							</thead>
							<tbody>
								<tr style="font-weight: 500; color: #445990; margin: 0px auto;">
									<td>방문목적</td>
									<td>진료실 선택</td>
									<td>몸무게(Kg)</td>
								</tr>
								<tr style="font-size: 11px; color: gray">
									<td><input class="form-control" type="text"
										name="recPurpose" id="recPurpose"
										placeholder="진료 목적을 입력해주세요. "></td>
									<td><select class="form-select" id="selectRoom"
										name="praRoomNm">
											<option>-선택-</option>
											<c:forEach items="${praList }" var="i">
												<option value="${i.praRoomNm }">진료실 ${i.praRoomNm }</option>
											</c:forEach>
									</select></td>
									<td><input class="form-control" type="text"
										style="width: 30%;" name="patWeight" id="patWeight"></td>

								</tr>
							</tbody>
						</table>
					</form>


					<!--			
		 < div style="display: inline-block; margin: 0 5px; float: right;">
			<div class="btn-group me-1 mt-1">
				<button type="button"
					class="btn btn-light waves-effect waves-light "
					style="margin-right: -5px;">
					<span style="font-weight: 500;">대기열</span>
				</button>
			</div>
			<div class="btn-group me-1 mt-1">
				<button type="button" id="praNum"
					class="btn btn-light waves-effect waves-light"
					style="margin-right: -5px; margin-left: -5px;">
					<span style="font-weight: 500;">　</span>
				</button>
			</div>
			<div class="btn-group me-1 mt-1">
				<button type="button" class="btn btn-light waves-effect"
					style="margin-left: -5px;">
					<span style="font-weight: 500;">대기</span>
				</button>
			</div>
			<button type="button" id="receiptBtn"
				class="btn btn-success waves-effect waves-light">
				<i class="ri-check-line align-middle me-2"></i>접수
			</button>
		</div>  -->
					<br /> <br />
					<div class="col-xl-12">
						<div class="card">
							<div class="card-body">
								<table
									class="table table-editable table-nowrap align-middle table-edits"
									style="border: 1px solid white;">
									<thead>
										<!-- <tr style="cursor: pointer;">
										<th colspan="5">내원이력</th>
									</tr> -->
									</thead>
									<tbody></tbody>
								</table>
								<div id="Accordiondiv">
									<div class="row">
										<div class="col-xl-12">
											<div class="card">
												<div class="card-body">

													<!-- Nav tabs -->
													<ul class="nav nav-tabs nav-tabs-custom nav-justified"
														role="tablist">
														<li class="nav-item"><a class="nav-link active"
															data-bs-toggle="tab" href="#home" role="tab"> <span
																class="d-block d-sm-none"><i class="fas fa-home"></i></span>
																<span class="d-none d-sm-block">진료내역</span>
														</a></li>
														<li class="nav-item"><a class="nav-link"
															data-bs-toggle="tab" href="#profile" role="tab"> <span
																class="d-block d-sm-none"><i class="far fa-user"></i></span>
																<span class="d-none d-sm-block">접종내역</span>
														</a></li>


													</ul>

													<!-- 내원내역ㄹ -->
													<div class="tab-content p-3 text-muted">
														<div class="tab-pane active" id="home" role="tabpanel">
															<table class="table table-borderless mb-0"
																style="text-align: center;">
																<thead style="font-size: 1.2em;">
																	<tr>
																		<!-- 																		<th></th> -->
																		<th>내원일</th>
																		<th>처방전</th>
																		<th>청구서</th>
																	</tr>
																</thead>
																<tbody id="visitList">
																</tbody>
															</table>
														</div>

														<!--                                             접종기록 -->
														<div class="tab-pane" id="profile" role="tabpanel">
															<table class="table table-borderless mb-0"
																style="text-align: center;">
																<thead style="font-size: 1.2em;">
																	<tr>
																		<th>접종일자</th>
																		<th>접종명</th>
																		<th>회차</th>
																	</tr>
																</thead>
																<tbody id="vaccineList">
																	<tr>
																		<td style="font-size: 1.2em;">접종 이력이 없습니다.</td>
																	</tr>
																</tbody>
															</table>
														</div>

													</div>
													<!-- 													-- -->

												</div>
											</div>
										</div>


									</div>

								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>

		<!-- /// -->
		<div style="display: inline-block; margin: 0 5px; float: right;">


			<div class="btn-group me-1 mt-1">
				<button type="button"
					class="btn btn-light waves-effect waves-light "
					style="margin-right: -5px;">
					<span style="font-weight: 500;">대기열</span>
				</button>
			</div>
			<div class="btn-group me-1 mt-1">


				<button type="button" id="praNum"
					class="btn btn-light waves-effect waves-light"
					style="margin-right: -5px; margin-left: -5px;">
					<span style="font-weight: 500;"> </span>
				</button>
			</div>
			<div class="btn-group me-1 mt-1">
				<button type="button" class="btn btn-light waves-effect"
					style="margin-left: -5px;">
					<span style="font-weight: 500;">대기</span>
				</button>
			</div>

			<button type="button" id="receiptBtn"
				class="btn btn-success waves-effect waves-light">
				<i class="ri-check-line align-middle me-2"></i>접수
			</button>
		</div>


		<!-- 		/// -->




	</div>
	<!--   id="receipt !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->




	<!-- 수납하기 -->
	<div class="col-md-6 col-xl-12"
		style="height: auto; display: none; border: 2px solid none;"
		id="progressReceipt">
		<div class="card">
			<div class="card-body">

				<h4 class="card-title" style="font-size: 1.3em;">
					수납내역 [<span id="praCodeName"></span> ] <span style="color: white;"
						id="praCode"></span>
				</h4>

				<div class="table-responsive">
					<form action="/statusUpdate" method="post" id="statusForm">
						<input type="hidden" id="hiddenId" name="patId"> <input
							type="hidden" id="hiddenPraCd" name="praCd">
					</form>
					<table
						class="table table-editable table-nowrap align-middle table-edits"
						style="border: 1px solid white;">

						<thead>
							<tr style="cursor: pointer;">
								<th colspan="5" style="font-size: 1.1em;">받을금액</th>
							</tr>
						</thead>
						<tbody id="receiptTbody" style="border: 1px solid white;">
							<tr>
								<td
									style="width: 60%; height: 10px; font-weight: 600; font-size: 1.2em;"><i
									class="ri-arrow-down-s-fill" onclick="openCloseToc()"></i>환자부담
									총액</td>
								<td
									style="height: 10px; font-weight: bolder; width: 40%; font-size: 1.2em;"
									id="sum"></td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="sumTotal"
										style="width: 70%; padding: 10px; border-radius: 10px; background-color: #edeff2; opacity: 0.9; height: auto;"
										align="center">
										<table style="width: 100%;">
											<tr>
												<td
													style="font-weight: bolder; font-size: 1.2em; width: 30%;">-진료비</td>
												<td></td>
												<td></td>
												<td
													style="font-weight: bolder; text-align: right; font-size: 1.2em;"
													id="praPrice"></td>
											</tr>

											<tr>
												<td id="preInTotalSpan"
													style="font-weight: bolder; font-size: 1.2em;">-원내처방</td>
												<td></td>
												<td></td>
												<td colspan="1"
													style="font-weight: bolder; text-align: right; font-size: 1.2em;"
													id="preInTotal"></td>
											</tr>
											<tbody id="preInTotalTbody">
											<colgroup>
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
											</colgroup>
											</tbody>
											<tr>
												<td id="vaccineTotalSpan"
													style="font-weight: bolder; font-size: 1.2em;">-접종비</td>
												<td></td>
												<td></td>
												<td
													style="font-weight: bolder; text-align: right; font-size: 1.2em;"
													id="vaccineTotal"></td>
											</tr>
											<tbody id="vaccineTotalTbody">
											<colgroup>
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
											</colgroup>
											</tbody>
											<tr>
												<td id="testTotalSpan"
													style="font-weight: bolder; font-size: 1.2em;">-검사비</td>
												<td></td>
												<td></td>
												<td
													style="font-weight: bolder; text-align: right; font-size: 1.2em;"
													id="testTotal"></td>
											</tr>
											<tbody id="testTotalTbody">
											<colgroup>
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
											</colgroup>
											</tbody>
											<tr>
											</tr>
											<tr>
												<td id="stTotalSpan"
													style="font-weight: bolder; font-size: 1.2em;">-입원비</td>
												<td></td>
												<td></td>
												<td
													style="font-weight: bolder; text-align: right; font-size: 1.2em;"
													id="stTotal"></td>
											</tr>
											<tbody id="stTotalTbody">
											<colgroup>
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
											</colgroup>
											</tbody>
											<tr>
												<td id="stFoodTotalSpan"
													style="font-weight: bolder; font-size: 1.2em;">-입원식비</td>
												<td></td>
												<td></td>
												<td
													style="font-weight: bolder; text-align: right; font-size: 1.2em;"
													id="stFoodTotal"></td>
											</tr>
											<tbody id="stFoodTotalTbody">
											<colgroup>
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
												<col width="25%;">
											</colgroup>
											</tbody>
										</table>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 	</div> -->



		<!-- 수납하기 -->
		<div class="row">


			<div class="col-xl-6">
				<div class="row h-80">
					<div class="col-xl-12">
						<div class="card">
							<div class="card-body">

								<h4 class="card-title"></h4>

								<div class="table-responsive">
									<!-- 					문서발급 -->
									<table
										class="table table-editable table-nowrap align-middle table-edits"
										style="border: 1px solid white;">
										<thead>
											<tr>
												<th colspan="4"><span style="font-size: 1.1em;">문서발급</span>
													[<span id="praYY"></span>년 <span id="praMM"></span>월 <span
													id="praDD"></span>일]</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<button type="button" class="btn btn-light waves-effect"
														id="diagnosis"
														onclick="resOpenPopup2('document2',this);return false;">
														<i class="fas fa-user-md fa-lg"></i>
													</button><span style="font-weight: 500;"> 진단서를 확인해주세요</span>　
													<input type="hidden" class="hiddenPraCd" value="">
													<span style="font-weight: 500;" id="diagnosisDes"></span>
												</td>
											</tr>
											<tr>
												<td>
													<button type="button" class="btn btn-light waves-effect"
														id="prescription"
														onclick="resOpenPopup('document1',this);return false;">
														<i class="fas fa-pills fa-lg"></i>
													</button> <input type="hidden" class="hiddenPraCd" value="">
													<span style="font-weight: 500;" id="prescriptionDes"></span>
												</td>
											</tr>
											<tr>
												<td style="font-weight: 500;">
													<button type="button" class="btn btn-light waves-effect"
														id="giveReceipt"
														onclick="resOpenPopup1('document3',this);return false;">
														<i class="fas fa-won-sign fa-lg"></i>
													</button> <input type="hidden" class="hiddenPraCd" value="">영수증
												</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="row h-80">
					<div class="col-xl-12">
						<!-- 	<div class="col-md-6 col-xl-6" -->
						<!-- 		style="height:auto; background-color: white;border: 2px solid white;"> -->
						<!-- <!-- 		id="progressReceipt" -->
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table
										class="table table-editable table-nowrap align-middle table-edits"
										style="border: 1px solid white;">
										<thead>
											<tr style="cursor: pointer;">
												<th style="width: 80%; font-weight: 700; font-size: 1.1em;">수납금액</th>
												<!-- 								<th style="width: 20%; text-align: right;" id="total"><span
									id="wonSpan"></span>원</th> -->
												<th><input type="hidden" id="wonSpanHidden"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
											</tr>
											<tr>
												<td style="width: 80%; font-weight: 500; font-size: 1.2em;"><i
													class="ri-bank-card-fill fa-lg"></i> CARD <input
													type="text" id="moneyTotal" name="moneyTotal"
													class="form-control"
													style="display: inline-block; width: 30%; border: 1px solid white; border-bottom: 3px solid #f0f0f0; color: blue; font-weight: bolder; width: 100px;">원
												</td>
												<td style="height: 10px; width: 20%;" align="right">
													<button type="button" id="check_module"
														class="btn btn-primary waves-effect waves-light">
														카드결제 <i class="ri-arrow-right-line align-middle ms-2"></i>
													</button>
												</td>
											</tr>
											<tr>
												<th>
													<div
														style="width: 20%; height: 40px; border-radius: 0.25rem; float: left; border-right: none; font-size: 1.2em;">
														<i class="fas fa-coins fa-lg" style="font-weight: bolder;">
														</i>&nbsp;&nbsp;
														<!-- 										  background-color:#f0f0f0; -->
														<span>CASH</span> <input type="text" id="change"
															class="form-control"
															style="display: inline-block; width: 30%; border: 3px solid white; border-bottom: 3px solid #f0f0f0; color: blue; font-weight: bolder; width: 100px;">&nbsp;&nbsp;원
													</div>
												</th>
												<td><button type="button" id="successBtn"
														class="btn btn-success waves-effect waves-light">
														<!-- 			접수 버튼을 누르면 접수에 인서트된다! -->
														수납완료 <i class="ri-check-line align-middle me-2"></i>
													</button></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>



</div>


<!-- </div> -->



<!-- 신규환자 등록 버튼-모달 -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myLargeModalLabel">
					<i class=" fas fa-cat"></i><i class="dripicons-plus"></i> 신규환자 등록<input
						type="button" value="입력" id="modalInput"
						class="btn btn-light waves-effect">
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="post" id="addForm">
					<input type="hidden" name="patId" id="patId"> <input
						type="hidden" name="memId"> <input type="hidden"
						name="cliCd" value="h001"> <input type="hidden"
						name="patChip" value="Y">
					<!-- 					<input type="hidden" name="patRegnm" value="0001"> -->
					<input type="hidden" name="patNew" value="Y">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">

									<div class="row mb-3">
										<label for="example-text-input"
											class="col-sm-2 col-form-label modalName"><p>이름*</p></label>
										<div class="col-sm-10">
											<input class="form-control" type="text" name="patName"
												id="formName">
										</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label modalName"><p>환자유형</p></label>
										<div class="col-sm-10">
											<select class="form-select"
												aria-label="Default select example" name="animalCd">
												<option selected="">-선택-</option>
												<option value="cat">CAT</option>
												<option value="dog">DOG</option>
												<option value="etc">ETC.</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label"></label>
									<div class="col-sm-10">
										<table style="width: 90%;">
											<tr>
												<td style="width: 25%;" class="modalName"><h6>성별</h6></td>
												<td style="width: 25%;" class="modalName"><h6>중성화여부</h6></td>
												<td style="width: 25%;" class="modalName"><h6>임신여부</h6></td>
												<td style="width: 25%;" class="modalName"><h6>유기동물여부</h6></td>
											</tr>
											<tr>
												<td>
													<div class="square-switch">
														<input type="checkbox" id="square-switch0"
															class="patGender" switch="none" /> <label
															for="square-switch0" data-on-label="W" data-off-label="M"></label>
														<input type="hidden" name="patGender" id="patGenderhidden"
															value="M">
													</div>
												</td>
												<td>
													<div class="square-switch">
														<input type="checkbox" id="square-switch1"
															class="patRegnm" switch="none" /> <label
															for="square-switch1" data-on-label="Y" data-off-label="N"></label>
														<input type="hidden" name="patRegnm" id="patRegnmhidden"
															value="N">
													</div>
												</td>
												<td><div class="square-switch">
														<input type="checkbox" id="square-switch2"
															class="pregnantCheck" switch="none" /> <label
															for="square-switch2" data-on-label="Y" data-off-label="N"></label>
														<input type="hidden" name="pregnantCheck"
															id="pregnantCheckhidden" value="N">
													</div></td>
												<td><div class="square-switch">
														<input type="checkbox" id="square-switch3"
															class="patAbandon" switch="none" /> <label
															for="square-switch3" data-on-label="Y" data-off-label="N"></label>
														<input type="hidden" name="patAbandon"
															id="patAbandonhidden" value="N">
													</div></td>
											</tr>
										</table>
									</div>
								</div>
								<div class="row mb-3">
									<label for="example-date-input"
										class="col-sm-2 col-form-label modalName"><p>생년월일</p></label>
									<div class="col-sm-10">
										<input class="form-control" type="date" name="patBirth"
											id="patBirth">
									</div>
								</div>
								<div class="row mb-3">
									<label for="example-search-input"
										class="col-sm-2 col-form-label modalName"><p>보호자명</p></label>
									<div class="col-sm-10">
										<input class="form-control" type="search" name="memName"
											id="memNameM">
									</div>
								</div>
								<div class="row mb-3">
									<label for="example-search-input "
										class="col-sm-2 col-form-label modalName"><p>보호자
											연락처</p></label>
									<div class="col-sm-10">
										<input class="form-control" type="text" name="memTel"
											id="formTel">
									</div>
								</div>

								<div class="row mb-3">
									<label for="example-search-input"
										class="col-sm-2 col-form-label modalName"><p>몸무게</p></label>
									<div class="col-sm-10">
										<input class="form-control" type="number" name="patWeight"
											id="patWeightM">
									</div>
								</div>


								<div class="row mb-3">
									<label for="example-tel-input"
										class="col-sm-2 col-form-label modalName"><p>주소</p></label>
									<div class="col-sm-10">
										<input class="form-control" type="text" id="address_kakao"
											name="patAdd1" readonly placeholder="클릭해주세요"> <input
											class="form-control" type="text" name="patAdd2" id="patAdd2M" />
										<input value="Y" type="hidden" name="memAgree">
									</div>
								</div>
								<div class="row mb-3">
									<label for="example-password-input"
										class="col-sm-2 col-form-label modalName"><p>
											<i class="fas fa-paw">환자 메모</i>
										</p></label>
									<div class="col-sm-10">
										<input class="form-control" type="text" id="tag"
											placeholder="태그입력">
										<ul id="tag-list"></ul>
										<input type="hidden" name="patMemo" id="tagArray" value="" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end col -->
				</form>
			</div>
			<div class="d-flex flex-wrap gap-2"
				style="margin: auto; padding-bottom: 40px;">
				<input type="button" value="취소" id="modalClose"
					class="btn btn-danger waves-effect waves-light"> <input
					type="button" value="등록" id="alertStart"
					class="btn btn-success waves-effect waves-light">
			</div>
		</div>
	</div>
</div>
<!-- /.modal -->









<script>
	var testData = "";
$(function() {////시작
	
	countAppReceipt()
	appReceiptList()
	
	var confirmWeight;
	var Rval;
	var selectedRoom="";
	$("#selectRoom").on("change",function(){
		selectedRoom = $("#selectRoom").val()
	})
	
	
	   	    
	$("#modalInput").on("click", function(){
		
		$("#formName").val("복덩이")
		$("#patBirth").val("2021-08-21")
		$("#memNameM").val("이철희")
		$("#formTel").val("01027272727")
		$("#patWeightM").val("2.3")
		$("#address_kakao").val("대전 서구 가마절길 80")
		$("#patAdd2M").val("1층")
		
	})

	
	//appBtn누르면 앱테이블 상태 y로 바꿈 + 접수바로될 수 있게
	$("#appBtn").on("click",function(){
		
		Swal.fire({
			title: "접수 신청을 승인하시겠습니까?",
			icon: "success",
	        confirmButtonColor: '#3085d6',
	        confirmButtonText: '확인',
	   		 backdrop: true,
	 		 }).then((result) => {
	 			
	 			appPatId = $(this).parents(".card-body").find("#appPatId").val()
	 			appMemTel = $(this).parents(".card-body").find("#appMemTel").val()
	 			appPatName = $(this).parents(".card-body").find("#appPatName").val()
	 			$("#search").val(appPatName+"("+appMemTel+")");
	 			$(".ri-search-line").trigger('click');
	 			
	 			//업데이트appUpdate
	 			$.ajax({
	 				url : "/appUpdate",
	 				type : "POST",
	 				data : {patId : appPatId},
	 				async : true,
	 				cache : false,
	 				dataType : "text",
	 				success : function(data) { // 성공
	 					console.log("appUpdate",data);
	 					countAppReceipt()
	 					appReceiptList()
	 					},
	 				error : function(request, status, error) {
	 					console.log("appUpdate:" + request.status + "\n"
	 							+ "message:" + request.responseText + "\n"
	 							+ "error:" + error);
	 				}
	 			});
	 			 
		        }) 
		
	})
	
	$("#appCancel").on("click",function(){
	appPatId = $(this).parents(".card-body").find("#appPatId").val()
		Swal.fire({
		title: "접수 신청을 반려하시겠습니까?",
		icon: "warning",
		confirmButtonColor: '#3085d6',
		confirmButtonText: '확인',
		 backdrop: true,
		 }).then((result) => {
			//업데이트appUpdate
				$.ajax({
					url : "/appUpdate",
					type : "POST",
					data : {patId : appPatId},
					async : true,
					cache : false,
					dataType : "text",
					success : function(data) { // 성공
						countAppReceipt()
						appReceiptList()
						console.log("appUpdate",data);
						},
					error : function(request, status, error) {
						console.log("appUpdate:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				});
	    }) 	
		
		
	})



	
// 	환자정보 수정
$(document).on("click",".ri-save-3-line",function(){
	
	$(".ri-save-3-line").attr('style', "display:none;");
	$("#infoEdit").attr('style', "display:inline;");

	
	 Swal.fire({
		title: "수정이 완료되었습니다. ",
		icon: "success",
        confirmButtonColor: '#3085d6',
        confirmButtonText: '확인',
   		 backdrop: true,
 		 }) 
	
 	var pCheck = $("#switch5").prop("checked")? "Y" :"N";
	$("#switch5").val(pCheck)
	
	if($("#switch5").prop("checked")){
		$("#switch5hidden").val("Y")
	}else{
		$("#switch5hidden").val("N")
	}

	var patIdH = $("#patIdHidden").val(); //제대로 찍임
	
	var patUpdateForm = $("#patUpdateForm");
	var formData = patUpdateForm.serialize();
	console.log("formData",formData)
	
	
		$.ajax({
			url : "/updatePat",
			type : "POST",
			data : formData,
			processData : false,
			dataType : "json",
			success : function(data) { // 성공
				console.log(data);
				console.log(data.memName);
				$("#memName").text(data.memName)
				$("#memTel").text(data.memTel)
				$("#addr1").text(data.patAdd1);
				$("#addr2").text(data.patAdd2);
				$("#switch5").text(data.pregnantCheck)
				
				
			},
			error : function(request, status, error) {
				console.log("업데이트code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	
	
	
})



// 	console.log("memName",memName)
	$("#infoEdit").on("click",function(){//t수정버튼 누르면 인풋텍스트 뜰래memName")
	   let memName = $("#memName").text()
	   let memTel = $("#memTel").text()
	   let addr1 = $("#addr1").text()
	   let addr2 = $("#addr2").text()
	   ///////////여기에 form태그 넣어보자
	   
		$("#memName").html('<input class="form-control" type="text"  name="memName" id="memNameEdit">')
		$("#memTel").html('<input class="form-control" type="text" name="memTel" id="memTelEdit">')
		$("#addr1").html('<input  class="form-control" type="text" name="patAdd1" id="addrEdit1" style="width:60%; display:inline-block; float: left" ><input type="button" class="btn btn-light waves-effect" value="주소검색" id="addrBtn" style = "float:left">')/////여기고쳐addrBtn
		$("#addr2").html('<input class="form-control" type="text" name="patAdd2" id="addrEdit2">')/////여기고쳐
// 		console.log("memName",$("#memName"))
// 		console.log("memNameEdit",$("#memNameEdit"))
		 
		$("#memNameEdit").val(memName)
		$("#memTelEdit").val(memTel)
		$("#addrEdit1").val(addr1)
		$("#addrEdit2").val(addr2)
		
		$("#infoEdit").attr('style', "display:none;");
		$(".ri-save-3-line").attr('style', "display:inline;");
		
		
		
		
	})

	
	
	//pdf
	 $("#button_pdf").on("click", function() {
		  
		  	window.scrollTo(0,0); 

		    //capture하고자 하는 영역 아이디 값 넣어주기
		    html2canvas($('#capture')[0]).then(function(canvas) {

		      	
		      
		      var myImg = canvas.toDataURL("image/jpg",1.0);
		      console.log(myImg);
		      
		      var pagewidth = 210;
		      var pageheight = 290;
		      var imgWidth = pagewidth;
		      var imgHeight = canvas.height * imgWidth / canvas.width; 
		      var heightLeft = imgHeight;
		      
		      var doc = new jsPDF("p", "mm", "a4");
		      
		      // 한 페이지 이상일 경우 루프 돌면서 출력
		      while (heightLeft >= 0) {
		        position = heightLeft - imgHeight;
		        doc.addImage(myImg, "jpg", 0, position, imgWidth, imgHeight);
		        heightLeft -= pageheight;
				if(heightLeft > 0){
			        doc.addPage();
				}
		      }
		      
		      doc.save("result.pdf");

		    });

		  });
	
	
	
	//결제완료 버튼 (남은 금액이 0이어야 완!)
	$("#successBtn").on("click", function(e){

		e.preventDefault();
		//진호천재
   	    document.querySelector("#receipt2fix").classList.remove("animate__animated");
   	    document.querySelector("#receipt2fix").classList.remove("animate__backInDown");
		var hiddenId = $("#hiddenId").val();
		var praCode = $(this).parents("#progressReceipt").find("#praCode").text()
		$("#memoBar").hide();
		
		
// 		PRA_STATUS = '2'
		$.ajax({//결제하기 버튼 누르면 진료상태 2번으로 업데이트//이전까지는 1이라는 소리
			
			url : "/praStatusUpdate",
			type : "POST",
			data : {praCd : praCode},
			async : false,
			cache : false,
			dataType : "text",
			success : function(data) { // 성공
				console.log("praStatusUpdate",data)
				Swal.fire({
        		title: "결제가  완료되었습니다.",
        		text : "환자를 내보내시겠습니까?",
				icon: "success",
	            confirmButtonColor: '#3085d6',
	            confirmButtonText: '확인',
	            backdrop: true,
	          }).then((result) => {
	           	 if (result.isConfirmed) {
	           		 
	                 var trLength = $("#receiptsil tr").length //예약 tr갯수
	                 
	                 for(var i=0; i<trLength; i++){
	                    if($("#receiptsil tr").eq(i).find(".praCdHidden").val() == praCode){
	                       $("#receiptsil tr").eq(i).fadeOut("slow")
	                    }
	                 }
	           		 
// 	                setTimeout(receiptListAni, 1000); 
	            	receiptListAni()
	            	changeStatus(praCode)
  	            	
  	            	//원무메인
  	            	$("#moneyTotal").empty()
  	            	$("#sum").empty()
  	            	$("#wonmuMain").show();
	    		  	window.scrollTo(0,0); 
  	            	$("#progressReceipt").hide()
	            }
	        })
				},
			error : function(request, status, error) {
				console.log("praStatusUpdatecode:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
		
		
		
		
		
		
		var sum = $("#sum").text().replace("원","").replace(",","");
		var change = $("#change").val().replace("원","").replace(",","");
		var moneyTotal = $("#moneyTotal").val();
		var totalSum = Number(change)+Number(moneyTotal)
		
		//수납테이블 인서트
		$.ajax({
			url : "/paymentInsert",
			type : "POST",
			data : {
				praCd : praCode,//진료코드
				praTotal :  Number(sum),//진료총액
				payCash :  Number(change),//현금결제
				payCard : Number(moneyTotal),//카드결제
				payTotal :  totalSum //결제금액
			},
			async : false,
			cache : false,
			dataType : "text",
			success : function(data) { // 성공
				console.log("paymentInsert",data)
				},
			error : function(request, status, error) {
				console.log("paymentInsert:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
		
	})	
	
	
	
	
	
	
	//주소api
// 	window.onload = function(){
// 	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
// 	        //카카오 지도 발생
// 	        new daum.Postcode({
// 	            oncomplete: function(data) { //선택시 입력값 세팅
// 	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
// 	                document.querySelector("input[name=patAdd2]").focus(); //상세입력 포커싱
// 	            }
// 	        }).open();
// 	    });
// 	}
	$(document).on("click","#address_kakao",function(){
		new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=patAdd2]").focus();
            }
        }).open();
		
	})
	
	/* //수정지도검색 =>죽임
	$(document).on("click","#addrBtn",function(){
		new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("addrEdit1").value = data.address; // 주소 넣기
            }
        }).open();
		
	}) */
	
	
	////최근내원일
	$(".ri-search-line").on("click", function(e) {
		e.preventDefault();
		window.scrollTo(0,0); 
		
// 		document.querySelector(".animate__animated").classList.remove("animate__animated");
// 		document.querySelector(".animate__flash").classList.remove("animate__flash");

		   	    
		
		$(".ri-save-3-line").attr('style', "display:none;");
		$("#infoEdit").attr('style', "display:inline;");
		$('a[href="#home"]').tab('show');

		$("#receipt").show();
		
		searchb = $("#search").val()
				
		getPatientData(searchb);	
		
		// 환자 검색해서 화면에 출력하는 함수 -> getPatientData 함수로 따로 빼서 옮겨뒀습니다 ( _ _ )	2000번줄쯤 위치.
				})
	////최근내원일
	
	
	
	
// 아임포트 결제// 아임포트 결제// 아임포트 결제// 아임포트 결제// 아임포트 결제// 아임포트 결제// 아임포트 결제
    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp45282573'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'html5_inicis', // version 1.1.0부터 지원.
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명:결제테스트',
            amount: cardsum, 
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
            m_redirect_url: '/wonmu'
         }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                  Swal.fire({
                	title: "결제가  완료되었습니다.",
      				icon: "success",
      	            confirmButtonColor: '#3085d6',
      	            confirmButtonText: '확인',
                    backdrop: true,
                  })
              
              } else {
                Swal.fire({
                  icon: "error",
                  title: "결제가 실패되었습니다.",
                  timer: 1000,
                  backdrop: true,
                });
//                 router.push("/wonmu");
              }
         })  
    });
// 아임포트 결제// 아임포트 결제// 아임포트 결제// 아임포트 결제// 아임포트 결제// 아임포트 결제// 아임포트 결제
	
  	  
	//수납-진행하기//버튼을 눌렀을 때 !@
	$("#progress").on("click",function(){	
		$("#moneyTotal").empty()
		$("#sum").empty()
		$("#wonmuMain").hide()
// 		$("#progressReceipt").show()
// 		receiptId = $("#hiddenId").val()
		var praCdHidden = $(this).parents(".card-body").find("#praCdSpan").val() //진료코드
		$("#receiptsil .status-btn").eq(0).trigger("click")
		
	//수납진행하기버튼끝	
	})
	
	
	
	
	
	
	
	
	
	//수납-진행하기//수납-진행하기//수납-진행하기//수납-진행하기//수납-진행하기//수납-진행하기

	//진료실선택
	$("#selectRoom").on("change", function(){
		Rval= $("#selectRoom").val()
		$("#praNum").text("진료실"+Rval)
		$("#praRoNum").val(Rval)
	})
	
		//검색창 끝 */
		$("#modalClose").click(function(){
			$("#myModal").modal('hide')
			
			//모달리셋
			$('#myModal').on('hidden.bs.modal', function(e) {
                $(this).find('form')[0].reset();
                $("#tag-list").empty();

             });
		})
		
		//신규환자등록
		$("#alertStart").click(function () {
			//신규환자 등록 시에 체크박스 넣어주기
			//임신
			var pregnantCheck = $(".pregnantCheck").prop("checked")? "Y" :"N";
			$("#pregnantCheckhidden").val(pregnantCheck);
			//유기
			var patAbandon = $(".patAbandon").prop("checked")? "Y" :"N";
			$("#patAbandonhidden").val(patAbandon);
			//성별
			var patGender = $(".patGender").prop("checked")? "W" :"M";
			$("#patGenderhidden").val(patGender);
			//중성화
			var patRegnm = $(".patRegnm").prop("checked")? "Y" :"N";
			$("#patRegnmhidden").val(patRegnm);
			
			var addForm = $("#addForm");
			var formData = addForm.serialize();
			
			
			 $.ajax({
		         method : "post",
		         url : "/addPat",
		         data : formData,
		         dataType : "text",
		         processData : false,
		         success : function(){
				Swal.fire({
    	            title: "신규환자 등록이 완료되었습니다 :) ",
    				text: "접수까지 바로 진행하시겠습니까?",
    				icon: "success",
    	            showCancelButton: true,
    	            confirmButtonColor: '#3085d6',
    	            cancelButtonColor: '#d33',
    	            confirmButtonText: '승인',
    	            cancelButtonText: '취소',
    	            reverseButtons: true
    	        }).then((result) => {
    	            if (result.isConfirmed) {
    	            	 var formName = $("#formName").val();
    	                 var formTel = $("#formTel").val();
    	                 keyword = formName+"("+formTel+")";
    	                 $("#search").val(keyword);
    	                 $("#myModal").modal('hide');
//      	                 setTimeout(() =>  $(".ri-search-line").trigger("click"), 4000);
							$(".ri-search-line").trigger("click")
    	            }else if (result.isDismissed) {
   	               	  $("#myModal").modal('hide');

    	            }
    	        })

		         },
		         error : function(request, status, error) {
						console.log("code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
		      })
		      //모달리셋
		      $('#myModal').on('hidden.bs.modal', function(e) {
                  $(this).find('form')[0].reset();
                  $("#tag-list").empty();
               });
		   

		})
// 		신규환자 등록 끝



//접수 등록
		$("#receiptBtn").click(function () {
			
			$(".jinryo").removeClass("animate__animated animate__heartBeat");

			
			var receiptForm = $("#receiptForm");
			var formData = receiptForm.serialize();
// 			var roomNum = $('#selectRoom option:selected').val();
			var roomNum = selectedRoom;
			
			var patListId = $("#receiptForm").find("#receiptFormPatId").val()

			 $.ajax({
		         method : "post",
		         url : "/startReceipt",
		         data : formData,
		         dataType : "json",
		         processData : false,
		         success : function(rslt){
		        	 console.log("접수한 아이의 결과!!",rslt);
		        	 	if(rslt == "0"){
		        	 		Swal.fire({
			    	            title: "이미 접수된 환자입니다. ",
			    				icon: "warning",
			    	            showCancelButton: true,
			    	            confirmButtonColor: '#3085d6',
			    	            confirmButtonText: '확인',
			    	        })
		        	 	}else{
		        	 		Swal.fire({
		    	            title: "접수되었습니다 :) ",
		    				icon: "success",
		    	            showCancelButton: true,
		    	            confirmButtonColor: '#3085d6',
		    	            confirmButtonText: '확인',
		    	        }).then((result) => {
		    	            if (result.isConfirmed) {
		    	            	
		    	            	$(".jinryo").eq(roomNum-1).addClass("animate__animated animate__heartBeat");
		    	            	
		    	            	
		    	            	
		    	            	
		    	            	//접수실 추가로 만들경우
		    	            	 var countSil = document.querySelectorAll(".jinryosil").length;
// 		    	            	console.log("countSil",countSil)
		    	            	
		    	            	for(var i=0; i<countSil; i++){
	 		    	            	showPatiList(i+1);  //리스트 실행
		    	            	}
// 		    	            	showPatiList(1);  //리스트 실행
// 		    	            	showPatiList(2);  //리스트 실행
// 		    	            	alert("룸넘버",Rval)
		      	            	$("#progressReceipt").hide();
		      	            	$("#receipt").hide();
		      	            	$("#wonmuMain").show();
		      	            	$("#search").val("")

		      	            var jinryoTable = document.querySelectorAll(".jinryo");
		      	            var tlength = jinryoTable[roomNum-1].children.length;
		      	          	
		      	            console.log("patListId",patListId)
		      	            var length = $(".jinryo tr").length;
		      	            console.log("length",length);
		      	            
		      	            	
		      	            
		      	            
		      	            
		      	            
		    	            }
		    	        })
		    	        
		        	 	}
		    	        
		    	        //확인 버튼을 누르면 진료실이 업데이트 된다
		         },
		         error : function(request, status, error) {
						console.log("접수한code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
		      })
		      
		      
		 /*      
            	//접수번호와 같으면 효과
				var trLength = $(".jinryo tr").length; //진료실의 tr 개수
				arr = [];
				 for(var i=0; i<trLength; i++){
					recNm = $(".jinryo tr").eq(i).find(".patListRecNm").val();
					arr.push(recNm)
		          }
				var max = findMinNum(arr) //현재 접수하는 아이 직전까지 접수된 번호 중 가장 큰 번호
				
				//1초 뒤에
				setTimeout(function() { 
				var trLength = $(".jinryo tr").length; //진료실의 tr 개수
				 for(var i=0; i<trLength; i++){
						recNm = $(".jinryo tr").eq(i).find(".patListRecNm").val();
						if( recNm > max ){
							$(".jinryo tr").eq(i).attr('class','animate__animated animate__bounce')
						}
						
			          }
				}, 2000);
				 */
				
		      
		      
		      
			 $.ajax({
		         method : "post",
		         url : "/updateWeight",
		         data : formData,
		         dataType : "json",
		         processData : false,
		         success : function(rslt){
		        	 console.log(rslt)
		         },
		         error : function(request, status, error) {
						console.log("updateWeight:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
		      })
		      
		      
		      //
		      
		})
		
		// 	차트
// const ctx2 = document.getElementById('myChart2').getContext('2d');
// const myChart2 = new Chart(ctx2, {
//     type: 'line',
//     data: {
//         labels: [0],
//         datasets: [{
//             label: '# of Votes',
//             data: [0],
//             borderColor: [
//                 'rgba(153, 102, 255, 1)'
//             ],
//             borderWidth: 1
//         }]
//     },
//     options: {
//         responsive: false,
//         plugins: {
//           title: {
//             display: true,
//             text: (ctx) => 'Point Style: ' + ctx.chart.data.datasets[0].pointStyle,
//           }
//         }
//       }
// });
		
	
// 	차트
		
		
		
		
		
		
		
		
		
		
				
			})//마지막 괄호 
			
			
	//
	
	function popup(){
		window.open( "/document", "진단서", "width=500, height=700, top=50, left=50" );

		}
			
	//수납정보 접펼		
	 function openCloseToc() {
		  $("#sumTotal").slideToggle("normal"); // 2초에 걸쳐서 진행
		  }		
	//수납정보 접펼
	
	
	
	//최대값
	function findMinNum(arr) {
  
	  let maxNum = arr[0];
	  let length = arr.length;
	  
	  // for 문을 돌면서 값을 minNum과 비교해 적은 수를 minNum에 대입한다. 
	  for (let i = 0; i < length; i++) {
	  
	 // 부등호 위치를 바꾸면 maxNum을 구할 수 있다. 
	    if (arr[i] > maxNum) {
	      maxNum = arr[i];
	    }
	  }
	  return maxNum;
	}
		
		
	
	
	
	
	//결제 완료 후 상태 변경 :"결제완료"
	function changeStatus(praCd){
// 		hId = $("#hiddenId").val(); //수납하는 환자의 아뒤
		praCode = $("#praCode").text(); //수납하는 환자의 아뒤
		
		this.timer = setTimeout(function () {
		$.ajax({
			url : "/statusUpdate",
			type : "POST",
			data : {praCd : praCode},
// 			data : patId,
//  		contentType : "application/json;charset=utf-8",
// 			async : true,
// 			cache : false,
			dataType : "text",
			context: this,
			success : function(data) { // 성공
				console.log("statusUpdate",data);
// 				receiptListAdni();
				receiptList();
				
				
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
		}, 500);
		
	}
	
	function countAppReceipt(){
		$.ajax({
			url : "/countAppReceipt",
			type : "POST",
			dataType : "text",
			context: this,
			success : function(data) { // 성공
				console.log("countAppReceipt",data);
				$("#appReceipt").text(data)
			},
			error : function(request, status, error) {
				console.log("countAppReceipt code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	}
	
	
	
	
	
	
	
	function appReceiptList(){
		$.ajax({
			url : "/appReceiptList",
			type : "POST",
			dataType : "json",
			context: this,
			success : function(data) { // 성공
				console.log("appReceiptList",data);
				if(data.length > 0){
					$("#appInfo").text(data[0].patName+","+data[0].patGender)
					$("#appInfo2").text(data[0].patMemo)
					$("#appMemTel").val(data[0].memTel)
					$("#appPatName").val(data[0].patName)
					$("#appPatId").val(data[0].patId)
					
				}else{
					$("#appInfo").text("어플 접수 대기 환자가 없습니다.")
					$("#appInfo2").empty()
				} 
			},
			error : function(request, status, error) {
				console.log("appReceiptList code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	}
	
	
	// 문서 팝업창으로 여는 스크립트 시작-진단서
	function resOpenPopup2(doc_name,popup){
		hiddenPraCd = popup.closest("tr").getElementsByClassName("hiddenPraCd")[0].value //진료코드
		
		var pop = window.open("/document?path="+doc_name,"resPopup","width=750,height=900, scrollbars=yes, resizable=yes"); 
	    pop.focus();
	    
   		$.ajax({
   			url : "/doc2select",
   			type : "POST",
   			data : {praCd : hiddenPraCd},
   			dataType : "json",
   			context: this,
   			success : function(data) { // 성공\
   				console.log("진단서",data)
   				pop.document.getElementById("doc2Id").innerHTML = data.vo1.memName
   				pop.document.getElementById("doc2addr").innerHTML = data.vo1.patAdd1 + data.vo1.patAdd2
   				pop.document.getElementById("doc2kind").innerHTML = data.vo1.animalCd
   				pop.document.getElementById("doc2dfBreed").innerHTML = data.vo2[0].dfBreed 
   				pop.document.getElementById("doc2patName").innerHTML = data.vo1.patName
   				pop.document.getElementById("doc2gender").innerHTML = data.vo1.patGender
   				pop.document.getElementById("doc2age").innerHTML = data.vo1.patBirth2
   				pop.document.getElementById("doc2dfFeature").innerHTML = data.vo2[0].dfFeature
   				code="";
   				for(var i=0; i<data.vo2.length; i++){
   				code += data.vo2[i].disName + ","
   				}
   				pop.document.getElementById("doc2disName").innerHTML = code;
   				pop.document.getElementById("doc2dfOutBreak").innerHTML = data.vo2[0].dfOutBreak
   				pop.document.getElementById("doc2praDate").innerHTML = data.vo2[0].praDate
   				pop.document.getElementById("doc2dfPrognosis").innerHTML = data.vo2[0].dfPrognosis
   				pop.document.getElementById("doc2dfEtc").innerHTML = data.vo2[0].dfEtc
   				pop.document.getElementById("doc2dfFurColor").innerHTML = data.vo2[0].dfFurColor
   				
   				

   			},
   			error : function(request, status, error) {
   				console.log("doc2select:" + request.status + "\n"
   						+ "message:" + request.responseText + "\n"
   						+ "error:" + error);
   			}
   		});
	    
	    
	    
	    
	    
	    
	}
	////진단서끝
	
	
	
	
	
	
	// 문서 팝업창으로 여는 스크립트 시작-처방전
	function resOpenPopup(doc_name,popup){
		hiddenPraCd = popup.closest("tr").getElementsByClassName("hiddenPraCd")[0].value //진료코드
		
		var pop = window.open("/document?path="+doc_name,"resPopup","width=750,height=900, scrollbars=yes, resizable=yes"); 
	    pop.focus();
	    
// 	    pop.document.getElementById("receiptTable").innerHTML="";
	    
	    //원외처방
	    this.timer = setTimeout(function () {
		$.ajax({
			url : "/praCdPreOut",
			type : "POST",
			data : {praCd : hiddenPraCd},
			dataType : "json",
			context: this,
			success : function(data) { // 성공\
// 				console.log("praCdPreOut",data)
				code =""
				if(data.length > 0){
					for(var i=0; i < data.length; i++){
						code += `
							<tr>
								<td>\${data[i].itemName}</td>
								<td>\${data[i].preOutAmount}</td>
								<td>\${data[i].preOutCnt}</td>
								<td>\${data[i].preOutDays}</td>
								<td></td>
							</tr>
							`
					}
				}
					pop.document.getElementById("receiptTable").innerHTML=code;
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	    }, 100);
	    
	    //처방전 기본 정보
	    this.timer = setTimeout(function () {
		$.ajax({
			url : "/docReceipt",
			type : "POST",
			data : {praCd : hiddenPraCd},
			dataType : "json",
			context: this,
			success : function(data) { // 성공\
// 				console.log("docReceipt수정",data)
				pop.document.getElementById("receiptEmpName").innerHTML=data.empName;
				pop.document.getElementById("receiptEmpId").innerHTML=data.empId;
				
				pop.document.getElementById("receiptPatKind").innerHTML=data.animalCd;
				pop.document.getElementById("receipMemTel").innerHTML=data.memTel;
				pop.document.getElementById("receiptMemName").innerHTML=data.memName;
				pop.document.getElementById("receiptAge").innerHTML=data.patBirth;
				pop.document.getElementById("receiptGender").innerHTML=data.patGender;
				pop.document.getElementById("receiptPatName").innerHTML=data.patName;
				pop.document.getElementById("receiptWeight").innerHTML=data.patWeight;
			
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	    }, 100);
	    //처방전 날짜
	    this.timer = setTimeout(function () {
		$.ajax({
			url : "/praCdDate",
			type : "POST",
			data : {praCd : hiddenPraCd},
			dataType : "json",
			context: this,
			success : function(data) { // 성공\
				pop.document.getElementById("receiptYear").innerHTML=data.YY
				pop.document.getElementById("receiptMonth").innerHTML=data.MM
				pop.document.getElementById("receiptDay").innerHTML=data.DD;
				pop.document.getElementById("receipPracd").innerHTML=data.praCd
			
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	    }, 100);
	    
	    
	}
	
	
	// 문서 팝업창으로 여는 스크립트 시작-청구서
	function resOpenPopup1(doc_name,popup){
		console.log("팝업",popup)
		hiddenPraCd = popup.closest("tr").getElementsByClassName("hiddenPraCd")[0].value
		
		
	    var pop = window.open("/document?path="+doc_name,"resPopup","width=450,height=900, scrollbars=yes, resizable=yes"); 
	    pop.focus();
	    
	    //검사
	    this.timer = setTimeout(function () {
		$.ajax({
			url : "/praCdTest",
			type : "POST",
			data : {praCd : hiddenPraCd},
			dataType : "json",
			context: this,
			success : function(data) { // 성공\
				console.log("praCdTest",data)
				var code = "";
			if(data.length > 0){
				for(var i=0; i<data.length; i++){
					var testPrice = (data[i].testPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
					code+=`
						<tr>
						<td>(검사)\${data[i].testName}</td>
						<td style="text-align: right;">\${testPrice}</td>
						<td style="text-align: right;">1</td>
						<td style="text-align: right;">\${testPrice}</td>
						</tr>
					`
				}
			}
				
			pop.document.getElementById("praCdTest").innerHTML=code;
			
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	    }, 100);
	    
	    //원내
	    this.timer = setTimeout(function () {
		$.ajax({
			url : "/praCdDrug",
			type : "POST",
			data : {praCd : hiddenPraCd},
			dataType : "json",
			context: this,
			success : function(data) { // 성공\
				console.log("praCdDrug",data)
				var code = "";
			if(data.length > 0){
				for(var i=0; i<data.length; i++){
					var drugPrice = (data[i].drugPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
					var cnt = data[i].preInCnt * data[i].preInCnt * data[i].preInDays
					
					// 					var preInAmount = (data[i].preInAmount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
					var price = (data[i].drugPrice*cnt).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

					code+=`
					<tr>
					<td>\${data[i].itemName}</td>
					<td style="text-align: right;">\${drugPrice}</td>
					<td style="text-align: right;">\${cnt}</td>
					<td style="text-align: right;">\${price}</td>
					</tr>
					
					`
				}
			}
				
			pop.document.getElementById("praCdDrug").innerHTML=code;
			
			},
			error : function(request, status, error) {
				console.log("praCdDrugcode:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	    }, 100);
	    
	    //기본정보 (필))
	    this.timer = setTimeout(function () {
		$.ajax({
			url : "/praCdPra",
			type : "POST",
			data : {praCd : hiddenPraCd},
			dataType : "json",
			context: this,
			success : function(data) { // 성공\
				console.log("praCdPra",data)
				code = ""
				patId = data[0].patId
				patName = data[0].patName
				praPrice = (data[0].praPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
				praDate = data[0].praDate
				
			pop.document.getElementById("docPatId").innerText = patId
			pop.document.getElementById("docPraDate").innerText = praDate
			pop.document.getElementById("docPatName").innerText = patName

			code += 
			`<tr>
			<td>진료비</td>
			<td  style="text-align: right;">\${praPrice}</td>
			<td  style="text-align: right;" >1</td>
			<td  style="text-align: right;">\${praPrice}</td>
			</tr>`	
			
			pop.document.getElementById("praCdPra").innerHTML = code;

			
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	    }, 100);
	    
	    
	    //접종
	    this.timer = setTimeout(function () {
		$.ajax({
			url : "/praCdVaccine",
			type : "POST",
			data : {praCd : hiddenPraCd},
			dataType : "json",
			context: this,
			success : function(data) { // 성공\
				console.log("praCdVaccine",data)
				var code = "";
			if(data.length > 0){
				for(var i=0; i<data.length; i++){
					var vdPrice = (data[i].vdPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

					code+=`
						<tr>
						<td>(접종)\${data[i].vdName}</td>
						<td style="text-align: right;">\${vdPrice}</td>
						<td style="text-align: right;">1</td>
						<td style="text-align: right;">\${vdPrice}</td>
						</tr>
					`
				}
			}
				
			pop.document.getElementById("praCdVaccine").innerHTML=code;
			
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
	    }, 100);
	    

  	    //입원여부를 체크한 후에 입원전의 금액 or 입원까지 모두 마친 금액을 산출함
   	    this.timer = setTimeout(function () {
   		$.ajax({
   			url : "/totalSum",
   			type : "POST",
   			data : {praCd : hiddenPraCd},
   			dataType : "json",
   			context: this,
   			success : function(data) { // 성공\
   				console.log("입원전/후의 금액",data)
   				sum = data.praPrice+data.preInTotal+data.testTotal+data.vaccinePrice+data.stTotal
				
   				pop.document.getElementById("finalSum").innerHTML=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

   			},
   			error : function(request, status, error) {
   				console.log("totalSumcode:" + request.status + "\n"
   						+ "message:" + request.responseText + "\n"
   						+ "error:" + error);
   			}
   		});
   	    }, 100);
	    
	}

	function countPreOut(trPraCd, trBtn){
		
		$.ajax({
  			url : "/countPreOut",
  			type : "POST",
  			data : {praCd : trPraCd},
  			dataType : "text",
  			context: this,
  			success : function(data) { // 성공\
//   			console.log("trBtn",typeof data)
//   			console.log("trBtn", trBtn)
  			if( data != "0" ){
  				trBtn.attr("disabled", false);
  				
  			}else{
  				trBtn.attr("disabled", true);
  				trBtn.removeClass("btn-primary");
  				trBtn.addClass("btn-light");
  			}
  			
  			},
  			error : function(request, status, error) {
  				console.log("code:" + request.status + "\n"
  						+ "message:" + request.responseText + "\n"
  						+ "error:" + error);
  			}
  		});
		
	}


// 최근 내원(환자 검색시 뜨는 정보들) 시작
function getPatientData(searchb){
	searchbo = searchb.replace("(", "/")
	searchbox = searchbo.replace(")", "") // 탱이/1 형태로 바꿈

	searchSplit = searchbox.split("/")
	console.log(searchSplit[0])//탱이
	console.log(searchSplit[1]) //1
	

	var patData = {
		patName : searchSplit[0],
		memTel : searchSplit[1]
	}

		$.ajax({
			url : "/ajax/praDate",
			type : "POST",
			data : JSON.stringify(patData),
			contentType : "application/json",
			async : true,
			cache : false,
//				dataType : "json",//값이 없을 때가 있어서 테이터 타입을 없앤다...?
			success : function(data) { // 성공
				if(data.length > 0){
					$("#spanDate").text(data[0].praDate2);
					
					code = "";
					 for(var i = 0; i<data.length; i++){
						var praCode = data[i].praCd;
						
						code += 
						`
						 <tr>
					        <td>\${data[i].praDate2}</td>
					        <input type="hidden" class="hiddenPraCd" value="\${data[i].praCd}">
					        <td>
					        <input type="button" onclick="resOpenPopup('document1',this);return false;" class="btn btn-primary waves-light waves-effect receiptPreOut" value="상세보기">
							</td>
					        <td>
					        <a href="javascript:void(0);" onclick="resOpenPopup1('document3',this);return false;" class="btn btn-primary waves-light waves-effect receiptPrint">상세보기</a>
							</td>
					    </tr>
						`

					 }
					$("#visitList").html(code);
					 
					
				}else{
					code = "";
					code += 
						`
						 <tr   style="font-size: 1.2em; font-weight : 500; text-align:center;">
					        <td>내원이력이 없습니다.</td>
					    </tr>
						`
					$("#spanDate").text("초진환자입니다.")
					$("#visitList").html(code);

				}
			
			
				var trLength= $("#visitList tr").length
				
				for(var i=0; i<trLength; i++){
					var trPraCd = $("#visitList tr").eq(i).find(".hiddenPraCd").val()
					var trBtn = $("#visitList tr").eq(i).find(".receiptPreOut")
					console.log("trBtn",trBtn);
					countPreOut(trPraCd,trBtn)						
					
				}
			
			
				

				
			$("#search").val("")
			

			},
			error : function(request, status, error) {
				console.log("praDatecode:" + request.status + "\n"
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
			
		});
	
	//////////
	
		
			$("#patMemo").empty();
			$("#startW").empty();
			$("#lastW").empty();
	
			

			$.ajax({
				url : "/ajax/patDetail",
				type : "POST",
				data : JSON.stringify(patData),
				contentType : "application/json",
				async : true,
				cache : false,
				dataType : "json",
				success : function(data) { // 성공
					$("#recPurpose").val("");
					$("#selectRoom").val("-선택-");
					$("#patWeight").val("");

//						console.log("디테일,",data);
//						console.log(data['patName']);
					$("#receiptFormPatId").val(data['patId'])
					$("#patIdHidden").val(data['patId'])
					$("#animalCd").val(data['animalCd'])
					$("#patName").html(data['patName'])
					$("#patGender").html(data['patGender'] + ",")
  					$("#patProfile").attr('src', data.patProfile);
					if(data['patBirth'] == null){
						$("#patAge").html("등록된 생년월일 정보가 없습니다.")
					}else{
						$("#patAge").html(data['patBirth'])
					}
					$("#patMemo").html(data['patMemo'])
					
					 if(data['pregnantCheck'] == "N"){
						$("#switch5").prop("checked", false);
					}else{
						$("#switch5").prop("checked", true);
					} 
					
					

					$("#memName").html(data['memName'])
					$("#memTel").html(data['memTel'])
					$("#addr1").html(data['patAdd1']);
					$("#addr2").html(data['patAdd2']);
					$("#sms").html(data['memAgree']);
					
					

				},
				error : function(request, status, error) {
					console.log("code:" + request.status + "\n"
							+ "message:" + request.responseText + "\n"
							+ "error:" + error);
				}
			});
			$("#wonmuMain").hide()
			$("#receipt").show()
			$("#search").val("");
			
			///백신아작스
			$.ajax({
				url : "/vaccineList",
				type : "POST",
				data : JSON.stringify(patData),
				contentType : "application/json",
				async : true,
				cache : false,
				dataType : "json",
				success : function(data) { // 성공
					console.log("백신",data)
					///////////백신 정보 업데이트하기
					codeVaccine = ""
					if(data.length > 0){
						for(var i=0; i<data.length; i++){
							codeVaccine += 
								`
								<tr>
									<td>\${data[i].praDate2}</td>
									<td>\${data[i].vaccineName}</td>
									<td>\${data[i].vaccineCount}</td>
								</tr>
								`
						}
						$("#vaccineList").html(codeVaccine);
					}else{
						codeMent = "<tr   style='font-size: 1.2em; font-weight : 500; text-align:center;'><td>접종이력이 없습니다.</td></tr>"
						$("#vaccineList").html(codeMent);

					}
					
					

				},
				error : function(request, status, error) {
					console.log("백신아작스code:" + request.status + "\n"
							+ "message:" + request.responseText + "\n"
							+ "error:" + error);
				}
			});
			///환자기록
			$.ajax({
				url : "/searchPatMemo",
				type : "POST",
				data : JSON.stringify(patData),
				contentType : "application/json",
				async : true,
				cache : false,
				dataType : "json",
				success : function(data) { // 성공
					console.log("searchPatMemo ", data[0])
					$("#memoBar").show();
					$("#memoPatName").text(searchSplit[0])
					$("#memoPatId").val(data)
				
					var rec = document.getElementById('receipt')
					var recHeight = rec.clientHeight
					var memoBar = document.getElementById("memoBar")
					memoBar.style.height = recHeight +"px";
					showMemo(data[0])
					
				},
				error : function(request, status, error) {
					console.log("searchPatMemocode:" + request.status + "\n"
							+ "message:" + request.responseText + "\n"
							+ "error:" + error);
				}
			});
			
			//몸무게 업데이트
			$.ajax({
				url : "/confirmWeight",
				type : "POST",
				data : JSON.stringify(patData),
				contentType : "application/json",
				async : true,
				cache : false,
				dataType : "json",
				success : function(data) { // 성공
					console.log("몸무게길길",data.length)
					confirmWeight = new Array();
					confirmDate = new Array();
					
					if(data.length > 0){
						
						for(var i=0; i<data.length; i++){
							console.log("몸무게 길이",data.length)
							confirmWeight.push(data[i].praWeight);
							confirmDate.push(data[i].praDate2);
							
							if( i == 0 ){
								console.log(data[i].praDate3);
								$("#startW").text(data[i].praDate3)
							}
							if( i == (data.length)-1 ){
								console.log(data[i].praDate3);
								$("#lastW").text(data[i].praDate3)
							}
						}
					}
					
					if(data.length == 0){
						$("#startW").text("등록된 체중정보가 없습니다.")
						$("#lastW").text("")
					}
						
						

					
					$('#myChart2').remove(); // this is my <canvas> element
						 $('#chartDiv').append('<canvas id="myChart2"><canvas>');
						const ctx2 = document.getElementById('myChart2').getContext('2d');
					myChart2 = new Chart(ctx2, {
					    type: 'line',
					    data: {
					        labels: confirmDate,
					        datasets: [{
//						            label: '몸무게 변화 추이',
					            data: confirmWeight,
					            borderColor: [
					                'rgba(153, 102, 255, 1)'
					            ],
					            borderWidth: 1
					        }]
					    },
					    options: {
					        responsive: false,
					        scales:{
					            x: {
					                display: false
					            }
					        },
					        plugins: {
					        	legend: {
				                    display: false
				                },
					        	datalabels: {
				                    display: false
				                },
					          title: {
					            display: false,
//						            text: (ctx) => 'Point Style: ' + ctx.chart.data.datasets[0].pointStyle,
					          },
					          
					        },
					      }
					});
				},
				error : function(request, status, error) {
					console.log("confirmWeight:" + request.status + "\n"
							+ "message:" + request.responseText + "\n"
							+ "error:" + error);
				}
			});
}
//최근 내원(환자 검색시 뜨는 정보들) 끝
	
</script>


<!-- 해시태그 스크립트 -->
<script>
$(document).ready(function () {

  var tag = {};
  var counter = 0;

  // 태그를 추가한다.
  function addTag(value) {
    tag[counter] =value; // 태그를 Object 안에 추가
    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
  }

  // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
  function marginTag() {
    return Object.values(tag)
      .filter(function (word) {
        return word !== "";
      });
  }

  $("#tag").on("keyup", function (e) {
      var self = $(this);
      console.log("keypress");

      // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
      if (e.keyCode == 32) {

        var tagValue = self.val(); // 값 가져오기

        // 값이 없으면 동작 안합니다.
        if (tagValue !== "") {

          // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
          var result = Object.values(tag)
            .filter(function (word) {
              return word === tagValue;
            })

          // 태그 중복 검사
          if (result.length == 0) {
            $("#tag-list")
              .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
            addTag(tagValue);
            self.val("");
          } else {
            alert("태그값이 중복됩니다.");
          }
        }
        e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
      }
      
      console.log("stringify"+ JSON.stringify(tag))//얘가 최종배열임
	
	memo=""; //memo 는 #해시태그의 문자열 ㅠㅠ 엉엉
   var keys = Object.keys(tag);
	for (var i=0; i<keys.length; i++) {
   	var key = keys[i];;
   	memo += "#"+tag[key];
	
	console.log(memo)
   $("#tagArray").val(memo)
 }
    });

  // 삭제 버튼
  // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
  $(document).on("click", ".del-btn", function (e) {
      var index = $(this)
        .attr("idx");
      tag[index] = "";
      $(this)
        .parent()
        .remove();
    });
})


</script>

<style>
.modalName {
	font-size: 1.2em;
	font-weight: 600;
	margin-right: -20px;
	margin-left: 10px;
}

.avatar-lg {
	height: 9rem;
	width: 9rem;
}

#memoSpan {
	font-weight: 500;
}

#ui-id-1 {
	position: absolute;
	z-index: 1;
}

.navbar-header {
	/* 	position: absolute; */
	/* 	z-index: 2; */
	
}

/* 해시태그 */
#tag * {
	list-style: none;
}

/* ul { */
/* 	padding: 16px 0; */
/* } */

/* ul li { */
/* 	display: inline-block; */
/* 	margin: 0 5px; */
/* 	font-size: 14px; */
/* 	letter-spacing: -.5px; */
/* } */
#tag-list {
	padding: 16px 0;
}

.tag-item {
	display: inline-block;
	margin: 0 5px;
	font-size: 14px;
	letter-spacing: -.5px;
}

form {
	padding-top: 16px;
}

ul li.tag-item {
	padding: 4px 8px;
	background-color: #e2e2e2;
	color: #000;
}

.tag-item:hover {
	background-color: #262626;
	color: #fff;
}

.del-btn {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
}

/* //// */
.slideDown {
	-webkit-animation-name: slideDown;
	animation-name: slideDown;
}

@
-webkit-keyframes slideDown { 0% {
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

100




















%
{
-webkit-transform-origin




















:




















0




















0


















;
transform-origin




















:




















0




















0


















;
-webkit-transform




















:




















translateY


















(




















100


















%
)


















;
transform




















:




















translateY


















(




















100


















%
)


















;
}
}
@
keyframes slideDown { 0% {
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

100




















%
{
-webkit-transform-origin




















:




















0




















0


















;
transform-origin




















:




















0




















0


















;
















0














;
0;
-webkit-transform




:

translateY(100%);
transform:



















translateY
translateY

















(




















100


















%
)


















;
transform




















:




















translateY


















(




















100


















%
)


















;













(
















100














%
)














;
transform
















:
















translateY














(
















100














%
)














;
=======
translateY (100%);
}
}

/* 그림자 없애기 */
* {
	box-shadow: white;
}

.col-md-6 {
	box-shadow: white;
}

.card-title {
	font-size: 1.3em;
}

#myModal {
	top: 50%;
	margin-top: -50px;
}
</style>






