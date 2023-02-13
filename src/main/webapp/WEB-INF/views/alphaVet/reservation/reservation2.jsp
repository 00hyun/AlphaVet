<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authentication property="principal" var="principal" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {

		// 문자 메세지 textbox 클릭 이벤트-----------------------------------
		var mytextbox = document.getElementById('smsContent');
		var mydropdown = document.getElementById('smsTitle');

		mydropdown.onchange = function() {
			// 			document.getElementById(mytextbox).value='';
			var mydropdownValue = mydropdown.options[mydropdown.selectedIndex].value;
			mytextbox.value;
			mytextbox.value = mytextbox.value + ' ' + mydropdownValue;
		}
		// 문자 메세지 textbox 클릭 이벤트------------------------------------

		// 예약 목록 이름 클릭 시 문자 보낼 환자명 입력
		$("#resTable").on(
						"click",
						"tr",
						function() {
							var str = ""
							var tdArr = [];
							// 현재 클릭된 Row(<tr>)
							var tr = $(this);
							var td = tr.children();
							console.log("클릭한 Row의 모든 데이터 : " + tr.text());

							td.each(function(i) {
								tdArr.push(td.eq(i).text());
							});

							console.log("배열에 담긴 값 : " + tdArr);

							var patName = td.eq(2).text();
							var patId = td.eq(5).text();

							str += "<input type='text' class='form-control' value='"+  patName + "' name='patName'/>";
							str += "<input type='hidden' class='form-control' value='"+  patId + "' name='patId'/>";

							console.log("patId : ", patId);
							console.log("patName : ", patName);

							$("#patInfoSms").html(str)

						})

	});

	// 예약 리스트
	function resList() {
		var reservationTable = $("#resTable").DataTable();
		reservationTable.destroy();
		$.ajax({
					method : "post",
					url : "/reservation/resList",
					dataType : "json",
					success : function(rslt) {
						$("#resTable").DataTable(
										{
											pageLength : 6,
											info : false,
											lengthChange : false,
											scrollX : false,
											autoWidth : false,
											ordering : false,
											language : {
												search : "<a><i class='ri-search-line'></i></a>",
												zeroRecords : "<a style='text-align:center;'>검색 결과가 없습니다.</a>",
												paginate : {
													first : "처음",
													last : "마지막",
													next : "다음",
													previous : "이전"
												}
											},
											columnDefs: [
												// 1번째 항목 열을 숨김 이거 안됨...
// 												{ targets: 5, visible: false },
											
												// n번째 항목의 넓이를 100px로 설정 - 이것도 의미 없네 뭐임
												{ targets: 1, width: 35}
											],
											info : false,
											data : rslt,
											destroy: true,
											columns : [ {
												data : 'resStartDate',
												"defaultContent" : ""
											}, {
												data : 'resTime',
												"defaultContent" : ""
											}, {
												data : 'patName',
												"defaultContent" : ""
											}, {
												data : 'resTitle',
												"defaultContent" : ""
											}, {
												data : 'empName',
												"defaultContent" : ""
											}, {
												data : 'patId',
												"defaultContent" : ""
											}

											]
										//									펫 번호 숨기기인데 안숨겨짐 		
																					,
																		            columnDefs: [{
																		            	targets: [5],
																		      			visible: false
																		            }]
										})
					}
				})

	}

	$(document).ready(function() {
		//예약 목록 불러오기 ajax
		resList();
	})
	
	
</script>



<div class="page-content">
	<div class="container-fluid">
		<div class="row">
			<!-- 예약 이름 -->
<!-- 			<div class="col-12"> -->
<!-- 				<div -->
<!-- 					class="page-title-box d-flex align-items-center justify-content-between"> -->
<!-- 					<h2 class="mb-0">예약</h2> -->
<!-- 					<div class="page-title-right"> -->
<!-- 						<ol class="breadcrumb m-0"> -->
<!-- 						</ol> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<!-- 예약 이름 끝 -->

		<div class="row mb-2">
			<!-- 메인 콘텐츠 -->
			<div class="col-xl-5">
				<!-- 왼쪽 콘텐츠 -->
				<!-- 왼쪽 1열 끝 -->

				<div class="row h-80">
					<div class="card overflow-hidden card-h-100">
						<div class="card-body">
							<div class="table-responsive">
								<h4 class="card-title">
									<a class='form-label h5'><i class='ri-calendar-check-fill'></i><b>&nbsp;예약목록</b></a>
<!-- 								<button style="margin-left: 90%" type="button" class="btn btn-light btn-sm waves-effect waves-light" onclick="fget(this)"> -->
<!-- 								<i class='ri-message-2-line'></i> -->
<!-- 								</button> -->
								</h4>
								
								<div style="width: 97%">
									<table class="table mb-1 table-hover" id="resTable">
										<thead>
											<tr>
												<th>예약날짜</th>
												<th>시간</th>
												<th>환자명</th>
												<th>구분</th>
												<th>담당</th>
												<th style="display: none;">no</th>
											</tr>
										</thead>
										<!-- 										<tbody> -->
										<%-- 										<c:choose> --%>
										<%-- 											<c:when test="${empty reservationList }"> --%>
										<!-- 												<tr> -->
										<!-- 													<td colspan="6" align="center">등록된 예약이 없습니다.</td> -->
										<!-- 												</tr> -->
										<%-- 											</c:when> --%>
										<%-- 											<c:otherwise> --%>
										<%-- 												<c:forEach items="${reservationList }" var="res"> --%>
										<!-- 													<tr> -->
										<%-- <%-- 														<td align="center" >${res.resNm }</td> --%>
										<!-- 														<td align="center"> -->
										<%-- 															<fmt:parseDate value="${res.resStartDate}" pattern="yy-MM-dd" var='resDate' />  --%>
										<%-- 															<fmt:formatDate value="${resDate}" pattern="yy-MM-dd" /></td> --%>
										<!-- 														<td align="center"> -->
										<%-- 															<fmt:parseDate value="${res.resStartDate}" pattern="yyyy-MM-dd" var='resDate' />  --%>
										<%-- 															<fmt:formatDate value="${resDate}" pattern="yyyy-MM-dd" /></td> --%>
										<%-- 														<td align="center">${res.patName }</td> --%>
										<%-- 														<td align="center">${res.resTitle }</td> --%>
										<%-- 														<td align="center">${res.empName }</td> --%>
										<%-- <%-- 														<td align="center">${res.resMemo }</td> --%>
										<!-- 													</tr> -->
										<%-- 												</c:forEach> --%>
										<%-- 											</c:otherwise> --%>
										<%-- 										</c:choose> --%>
										<!-- 										</tbody> -->
									</table>
								</div>
							</div>



						</div>
					</div>

				</div>

				<div class="col-xl-7">
				
					<div class="row h-50">
					<!-- 왼쪽 1열 -->
					   <%@include file="message.jsp"%>
					
					</div>
				</div>

			</div>
			<!-- 왼쪽 1열 끝 -->

			<!-- 오른쪽 콘텐츠 -->
			<div class="col-xl-7">
				<div class="card overflow-hidden">
					<div class="card-body">

						<%@include file="calendar.jsp"%>

					</div>

				</div>
				<!-- 오른쪽 콘텐츠 끝 -->

			</div>
			<!-- 메인 콘텐츠 -->

		</div>
	</div>

</div>
<!-- Modal -->


