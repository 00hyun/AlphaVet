<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"

	prefix="sec"%>
<sec:authentication property="principal" var="principal" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


<style>
#resSearchBox {
	width: 20%;
}

.hide_me {
 	display: none;
 }

.textSize{
	font-size: 1.1em;
}

#resTable{
	text-align: center;
}

input:focus, select:focus, textarea:focus {
    border: 2px solid #989ae7 !important;
    outline: none;
}

/* .resBtn{ */
/* align-content: flex-end; */
/* } */

</style>

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

		// 문자 메세지 창 나오기. 숨기기
		   $(document).on('click', '#sendSms', function(){
			      if($('#smsForm').is(":visible")){
				     	$("#smsForm").css("display", "none");
					}else{
						$("#smsForm").css("display", "block");
					}
		   })
		   

		
		
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
							
							let table = $('#resTable').DataTable();
							let row = table.row(td);
							
							td.each(function(i) {
								tdArr.push(td.eq(i).text());
							});

							console.log("배열에 담긴 값 : " + tdArr);
							
							
							var patName = td.eq(2).text();
							var patId = row.data()['patId'];
							var memTel = row.data()['memTel'];

							str += "<input type='text' class='form-control' value='"+  patName + "' name='patName'/>";
							str += "<input type='hidden' class='form-control' value='"+  patId + "' name='patId'/>";

							str2 = "<input type='text' class='form-control' value='"+  memTel + "' name='phoneNumber'/>";
							
							console.log("patId : ", patId);
							console.log("patName : ", patName);
							console.log("memTel : ", memTel);

							$("#patInfoSms").html(str);
							$("#smsValueNm").html(str2);

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
											pageLength : 5,
											info : false,
											lengthChange : false,
											scrollX : false,
											autoWidth : false,
											ordering : false,
											orderable: false,
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
											info : false,
											data : rslt,
											destroy: true,
											columns : [ 
												{
												data : 'resStartDate',
												"defaultContent" : ""
											},
											{
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
												, "visible": false
												
											}, {
												data : 'memTel',
												"defaultContent" : ""
												, "visible": false
											}


											]
										})
										$('.dataTables_filter').remove(); // dataTable 자체 search input 없애기

					}
				})
				
				$("#resTable").DataTable( {
   					 aoColumnDefs: [ { "sClass": "hide_me", "aTargets": [ 5 ] } ],
   					 responsive: true
				} );

		
	$('#resSearch').keyup(function () {
        // input의 값대로 search
        let $value = $(this).val();
        $("#resTable").DataTable().search($value).draw();
    });
	}
	
	
	$(document).ready(function() {
		//예약 목록 불러오기 ajax
		resList();
	})
	
	
</script>



<div class="page-content">
	<div class="container-fluid">
	
		<div class="row">
		
			<div class="col-xl-5">

				<div class="row">
					<!-- 메인 콘텐츠 -->
					<div class="col-xl-12">
						<!-- 왼쪽 콘텐츠 -->
						<!-- 왼쪽 1열 끝 -->

							<div class="card overflow-hidden card-h-100">
								<div class="card-body">
									<div class="table-responsive">
										<h4 class="card-title">
											<a class='form-label h5'><i
												class='ri-calendar-check-fill'></i><b>&nbsp;예약목록</b></a>
										</h4>
									<div>
										<div>
											<div align="right">
												<i class="mdi mdi-magnify search-icon"></i> <input type="text" id="resSearch" placeholder=""
													style="width: 110px; height: 35px; border: 1px solid #ced4da; border-radius: 0.25rem;" />
												<button style="margin-left: 1%;" type="button" id="sendSms"
													class="btn btn-light btn-sm waves-effect waves-light">
													<i class='ri-message-2-line'></i> 문자
												</button>
											</div>
										</div>
									</div>
									<div style="width: 97%">
											<table class="table mb-1 table-hover textSize" id="resTable" data-ordering="false">
												<thead>
													<tr>
														<th>예약날짜</th>
														<th>시간</th>
														<th>환자명</th>
														<th>구분</th>
														<th>담당</th>
														<th class="hide_me">no</th>
														<th class="hide_me">tel</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>



								</div>
							</div>

						</div>
					</div>
					<div class="col-xl-12 textSize" id="smsForm" style="display: none;">

							<!-- 왼쪽 1열 -->
							<%@include file="message.jsp"%>

					</div>

			</div>
			<!-- 왼쪽 1열 끝 -->

			<!-- 오른쪽 콘텐츠 -->
			<div class="col-xl-7">
				<div class="col-xl-12">
					<div class="card overflow-hidden">
						<div class="card-body">

							<%@include file="calendar.jsp"%>

						</div>

					</div>
				</div>
				<!-- 오른쪽 콘텐츠 끝 -->
			</div>
		</div>
		<!-- 메인 콘텐츠 -->


	</div>

</div>
<!-- Modal -->

<script>
$(function(){
	document.getElementById("headerSearchBar").style.display="none";
})
</script>