<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
table{
	text-align : center;
}
</style>
<div class="col-sm-2">
	<div class="card">
		<div class="card-body textSize">
					
			<h4 class="card-title mb-0"><b>미입고</b></h4>
			<table class="table dt-responsive nowrap w-100" style="margin:0px;">
				<thead>
					<tr>
<!-- 						<th>번호</th> -->
						<th style="width:60%;">날짜</th>
						<th>상태</th>
					</tr>
				</thead>
			</table>
			<div style="height:230px;overflow:auto">
				<table id="daListTable1" class="table dt-responsive nowrap w-100">
					<tbody id="daListTbody1">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-body textSize">
			<h4 class="card-title mb-0" onclick="openSSM(this)" style="display:inline-block"><b>입고완료<i class="ri-arrow-down-s-line"></i></b></h4>
			<div id="">
			<h5 style="display:inline-block;margin:10px 0px 0px 40px;"><i id="" class='ri-calendar-check-line'></i></h5>
			<input type="text" id="datePeriod" name="demo" value="" class="font08 bottomBorder" style="width:170px"/>
				<table class="table dt-responsive nowrap w-100" style="margin:0px;">
					<thead>
						<tr>
	<!-- 						<th>번호</th> -->
							<th style="width:60%;">날짜</th>
							<th>상태</th>
						</tr>
					</thead>
				</table>
				<div style="height:280px;overflow:auto;">
					<table id="daListTable2" class="table dt-responsive nowrap w-100">
						<tbody id="daListTbody2">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
</div>
<div class="col">
		<div class="card">
			<div class="card-body textSize" id="asdf">
				<div class="flexDiv">
					<h4 class="card-title mb-0"><b>약품 목록</b></h4>
					<div class="search-box mb-0">
		                <div class="position-relative">
		                    <input
		                        type="text"
		                        id="drugSearch"
		                        class="form-control rounded"
		                        placeholder="약품 검색"
		                    />
		                    <i class="mdi mdi-magnify search-icon"></i>
		                </div>
		            </div>
				</div>
				<table id="drugTable" class="table dt-responsive nowrap w-100" style="padding:10px">
					<thead>
						<tr>
							<th>재고 번호</th>
							<th>약품 번호</th>
							<th>거래처</th>
							<th>약품명</th>
							<th>약품 영문명</th>
							<th>가격</th>
							<th>수량</th>
							<th>최종 입고일</th>
						</tr>
					</thead>
<!-- 					<tbody id="drugTbody"> -->
<!-- 					</tbody> -->
				</table>
			</div>
	</div>
		<div class="card">
			<div class="card-body textSize" id="asdf">
				<h4 class="card-title mb-0">
					<span><b>재고 신청</b></span>
					<span style="float:right;">
						<button type="button" id="drugApplyBtn" class="btn btn-primary waves-effect waves-light">신청</button>
					</span>
				</h4>
				<form name="drugApplyForm" id="drugApplyForm">
				<table id="daTable" class="table dt-responsive nowrap w-100 table-hover">
					<thead>
						<tr>
							<th width="40px">약품 번호</th>
							<th width="40px">업체명</th>
							<th width="130px">약품명</th>
							<th width="80px">약품 영문명</th>
							<th width="20px">약품가격</th>
							<th width="20px">재고수량</th>
							<th width="20px">신청수량</th>
							<th width="10px">삭제</th>
						</tr>
					</thead>
					<tbody id="daTbody" style="height:100px;overflow-y:auto;">
					</tbody>
				</table>
				</form>
			</div>
	</div>
</div>

<script>
function openSSM(btn){
	let icon = btn.getElementsByTagName("i")[0];
	if(icon.className == "ri-arrow-up-s-line"){
		icon.className = "ri-arrow-down-s-line";
		$("#daListTable2").parent().parent().fadeIn("slow");
	}else{
		$("#daListTable2").parent().parent().fadeOut("slow");
		icon.className = "ri-arrow-up-s-line";
	}
}
</script>


<script>
function getDaList(start, end){
	let periodData = {
			startDate : start,
			endDate : end
		}
	
	$.ajax({
		method : "post",
		url : "/da/list",
		dataType : "json",
		data : JSON.stringify(periodData),
		contentType : "application/json;charset=utf-8",
		processData : false,
		success : function(rslt){
			data1 = "";
			data2 = "";
			$.each(rslt, function(i,v){
				if(v.daState=='N'){
// 					data1 += `<tr id='\${v.daNm}' onclick='detailDA(\${v.daNm})' class='daTr'>`;
// 					data1 += `<td style="width:60%">\${v.daDate}</td>`;
// 					data1 += `<td><div class="badge badge-soft-danger font-size-12">미입고</div></td>`;
// 					data1 += `</tr>`;
				}else{
					data2 += `<tr id='\${v.daNm}' onclick='detailDA(\${v.daNm})' class='daTr'>`;
					data2 += `<td style="width:60%">\${v.daDate}</td>`;
					data2 += `<td><div class="badge badge-soft-success font-size-18">입고완료</div></td>`;
					data2 += `</tr>`;
				}
				
			})
// 			$("#daListTbody1").html(data1);
			$("#daListTbody2").html(data2);
		}
	})
	
}

$(function () {
    $('#datePeriod').daterangepicker({
        "locale": {
            "format": "YY-MM-DD",
            "separator": "~",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate": "23-02-01",
        "endDate": "23-02-15",
        "drops": "down"
    }, function (start, end, label) {
    	getDaList(start.format('YY-MM-DD'), end.format('YY-MM-DD'));
    });
});
</script>