<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 			1. 환자수(pie : 동물별 ) -->
<!-- 			2. 환자수 추이(bar, line) -->
<!-- 			2.5 매출 -->
<!-- 			3. 약품 -->
<!-- 			4. 질병 -->
<!-- 			5. 의사별 -->
			<div class="row">
					<input type="button" id="downChartBtn" class="btn btn-primary waves-effect waves-light" value="다운로드" style="width:100px;margin-left:95%;"/>
			
				<div class="col-lg-3">
					<div class="card selectChart" data-chartId='myChart'>
						<div class="card-body">
							<div class="flexDiv">
								<h4 class="card-title mb-4" style="display:inline-block"><b>동물별 진료수</b></h4>
								<div>
		        					<h5 style="display:inline-block;margin-left:5px;"><i id="" class='ri-calendar-check-line'></i></h5>
									<input type="text" id="datePeriod1" name="demo" value="" class="font08 bottomBorder" style="width:190px"/>
								</div>
							</div>
							<div id="myChartDiv">
								<canvas id="myChart" class="plot-container" height="400" width="350"></canvas>
							</div>

						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="card selectChart" data-chartId='myChart5'>
						<div class="card-body">

        					<div class="flexDiv">
								<h4 class="card-title mb-4" style="display:inline-block"><b>의사별 진료수</b></h4>
								<div>
		        					<h5 style="display:inline-block;margin-left:5px;"><i id="" class='ri-calendar-check-line'></i></h5>
									<input type="text" id="datePeriod5" name="demo" value="" class="font08 bottomBorder" style="width:190px"/>
								</div>
							</div>
        					<div id="myChartDiv5">
								<canvas id="myChart5" class="plot-container" height="400" width="350"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card selectChart" data-chartId='myChart2'>
						<div class="card-body">

							<div class="flexDiv">
								<h4 class="card-title mb-4" style="display:inline-block"><b>일별 매출</b></h4>
								<div>
		        					<h5 style="display:inline-block;margin-left:5px;"><i id="" class='ri-calendar-check-line'></i></h5>
									<input type="text" id="datePeriod2" name="demo" value="" class="font08 bottomBorder" style="width:190px"/>
								</div>
							</div>
        					<div id="myChartDiv2">		
								<canvas id="myChart2" class="plot-container" height="400" width="800"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
			
				<div class="col-lg-6">
					<div class="card selectChart" data-chartId='myChart3'>
						<div class="card-body">

							<div class="flexDiv">
								<h4 class="card-title mb-4" style="display:inline-block"><b>환자수</b></h4>
								<div>
		        					<h5 style="display:inline-block;margin-left:5px;"><i id="" class='ri-calendar-check-line'></i></h5>
									<input type="text" id="datePeriod3" name="demo" value="" class="font08 bottomBorder" style="width:190px"/>
								</div>
							</div>
	        				<div id="myChartDiv3">		
								<canvas id="myChart3" class="plot-container" height="400" width="800"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card selectChart" data-chartId='myChart4'>
						<div class="card-body">

							<div class="flexDiv">
								<h4 class="card-title mb-4" style="display:inline-block"><b>원내 사용 약품</b></h4>
								<div>
		        					<h5 style="display:inline-block;margin-left:5px;"><i id="" class='ri-calendar-check-line'></i></h5>
									<input type="text" id="datePeriod4" name="demo" value="" class="font08 bottomBorder" style="width:190px"/>
								</div>
							</div>
        					<div id="myChartDiv4">
								<canvas id="myChart4" class="plot-container" height="400" width="800"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>

<script>
// const ctx = document.getElementById('myChart').getContext('2d');
// const ctx2 = document.getElementById('myChart2').getContext('2d');
// const ctx3 = document.getElementById('myChart3').getContext('2d');
// const ctx4 = document.getElementById('myChart4').getContext('2d');
// const ctx5 = document.getElementById('myChart5').getContext('2d');
// const Excel = require('exceljs');

document.getElementById("chartLi").addEventListener("click", function(){
	makeAnimalTypeChart('2023-02-01','2023-02-15');
	makeDaysPaymentChart('2023-02-01','2023-02-15');
	makedaysPraChart('2023-02-01','2023-02-15');
	makedrugCntChart('2023-02-01','2023-02-15');
	makepraCntByEmpListChart('2023-02-01','2023-02-15');
})

let downChartBtnClick = false;
let imageData = {};

document.getElementById("downChartBtn").addEventListener("click", function(){
	if(!downChartBtnClick){
		this.value = "선택완료";
		downChartBtnClick = true;
	}else{
// 		$.ajax({
// 			type :'post',
// 			datatpe : 'json',
// 			data : JSON.stringify(Ajaxdata),
// 			contentType : 'application/json',
// 			url:'/PostExcelExport',
// 			success : function(rslt){
// 				alert("hi");
// 			}
// 		})
		
		this.value = "다운로드";
		downChartBtnClick = false;
	}
})

$(".selectChart").on("click", function(){
	if(downChartBtnClick){
		let chart = document.getElementById(this.getAttribute("data-chartId"));
		let dataURL1 = chart.toDataURL(1.0);
		let workbook = new ExcelJS.Workbook();
		
		let sheetOne = workbook.addWorksheet('Sheet One');
		
// 		sheetOne.mergeCells('A1:J20');
		
		let imageId = workbook.addImage({
			base64 : dataURL1,
			extension : 'png'	
		});
		
		sheetOne.addImage(imageId, 'A1:J20');
		
		workbook.xlsx.writeBuffer().then(function(data){
			let blob = new Blob([data], {type : "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"});
			let url = window.URL.createObjectURL(blob);
			const anchor = document.createElement('a');
		  	anchor.href = url;
		  	// 파일명
		  	anchor.download = `대덕병원_통계차트.xlsx`;
		  	anchor.click();
		  	window.URL.revokeObjectURL(url);
		})

	}
})

// 1번 차트
function makeAnimalTypeChart(start, end){
   document.getElementById("myChartDiv").innerHTML = "";
   document.getElementById("myChartDiv").innerHTML = '<canvas id="myChart" class="plot-container" height="400" width="350"></canvas>';
   
   let periodData = {
         startDate : start,
         endDate : end
      }

   let dataArr= [];
   let labelArr = [];
   let color = [];
   
   $.ajax({
      method : "post",
      url : "/chart/animalTypeList",
      dataType : "json",
      data : JSON.stringify(periodData),
      contentType : "application/json;charset=utf-8",
      processData : false,
      success : function(rslt){
         $.each(rslt, function(i, v){
            dataArr.push("'" + v.ANIMALTYPE + "'");
            labelArr.push(v.PRACNT);
            color.push(makeRandomColor());
         })

         let ctxTemp = document.getElementById("myChart");
         
         let myChart = new Chart(ctxTemp, {
        	 
             type: 'pie',
             data: {
                 labels: dataArr,
                 datasets: [{
                     label: '# of Votes',
                     data: labelArr,
                     borderWidth: 1,
                     backgroundColor: color
                 }]
             },
             options: {
                responsive : false,
                 scales: {
                     y: {
                         beginAtZero: true
                     }
                 }
             }
             
             
//              chart: {
//             	    type: 'pie',
//             	    zoom:{
//             	    	enabled : true
//             	    }
//             	  },
//            	  series: [{
//            	    name: 'sales',
//            	    data: [3,4,5]
//            	  }],
//            	  xaxis: {
//            	    categories: ['r','g','b']
//            	  }
//          }).render();
      })
      }
   })
}

//2번 차트
function makeDaysPaymentChart(start, end){
	document.getElementById("myChartDiv2").innerHTML = "";
	document.getElementById("myChartDiv2").innerHTML = '<canvas id="myChart2" class="plot-container" height="400" width="800"></canvas>';
	
	let periodData = {
			startDate : start,
			endDate : end
		}

	let dataArr= [];
	let labelArr = [];
	let color = [];
	
	$.ajax({
		method : "post",
		url : "/chart/daysPaymentList",
		dataType : "json",
		data : JSON.stringify(periodData),
		contentType : "application/json;charset=utf-8",
		processData : false,
		success : function(rslt){
			$.each(rslt, function(i, v){
				dataArr.push(v.PAYDATE);
				labelArr.push(v.PAYTOTAL);
				color.push(makeRandomColor());
			})
			let ctxTemp = document.getElementById("myChart2");
			
			let myChart = new Chart(ctxTemp, {
			    type: 'line',
			    data: {
			        labels: dataArr,
			        datasets: [{
			            data: labelArr,
			            borderWidth: 3,
			            backgroundColor: color,
			            fill: true
			        }]
			    },
			    options: {
			    	responsive : false,
			        scales: {
			            y: {
			                beginAtZero: true
			            }
			        },
			        plugins:{
		                legend: {
		                    display: false
		                },
		            }
			    }
			
			})
		}
	})
}

// // 3번 차트
function makedaysPraChart(start, end){
	document.getElementById("myChartDiv3").innerHTML = "";
	document.getElementById("myChartDiv3").innerHTML = '<canvas id="myChart3" class="plot-container" height="400" width="800"></canvas>';
	
	let periodData = {
			startDate : start,
			endDate : end
		}

	let dataArr= [];
	let labelArr = [];
	let color = [];
	
	$.ajax({
		method : "post",
		url : "/chart/daysPraList",
		dataType : "json",
		data : JSON.stringify(periodData),
		contentType : "application/json;charset=utf-8",
		processData : false,
		success : function(rslt){
			$.each(rslt, function(i, v){
				dataArr.push(v.PRADATE);
				labelArr.push(v.PRACNT);
				color.push(makeRandomColor());
			})
			let ctxTemp = document.getElementById("myChart3");
			
			let myChart = new Chart(ctxTemp, {
			    type: 'line',
			    data: {
			        labels: dataArr,
			        datasets: [{
			            data: labelArr,
			            borderWidth: 3,
			            backgroundColor: color,
			            fill: true
			        }]
			    },
			    options: {
			    	responsive : false,
			        scales: {
			            y: {
			                beginAtZero: true
			            }
			        },
			        plugins:{
		                legend: {
		                    display: false
		                },
		            }
			    }
			
			})
		}
	})
}

// // 4번 차트
function makedrugCntChart(start, end){
	document.getElementById("myChartDiv4").innerHTML = "";
	document.getElementById("myChartDiv4").innerHTML = '<canvas id="myChart4" class="plot-container" height="400" width="800"></canvas>';
	
	let periodData = {
			startDate : start,
			endDate : end
		}

	let dataArr= [];
	let labelArr = [];
	let color = [];
	
	$.ajax({
		method : "post",
		url : "/chart/drugCntList",
		dataType : "json",
		data : JSON.stringify(periodData),
		contentType : "application/json;charset=utf-8",
		processData : false,
		success : function(rslt){
			$.each(rslt, function(i, v){
				dataArr.push(v.ITEMNAME);
				labelArr.push(v.DRUGCNT);
				color.push(makeRandomColor());
			})
			let ctxTemp = document.getElementById("myChart4");
			
			let myChart = new Chart(ctxTemp, {
			    type: 'bar',
			    data: {
			        labels: dataArr,
			        datasets: [{
			            data: labelArr,
			            borderWidth: 1,
			            backgroundColor: color
			        }]
			    },
			    options: {
			    	responsive : false,
			        scales: {
			            y: {
			                beginAtZero: true
			            }
			        },
			        plugins:{
		                legend: {
		                    display: false
		                },
		            }
			    }
			
			})
		}
	})
}

// // 5번 차트
function makepraCntByEmpListChart(start, end){
	document.getElementById("myChartDiv5").innerHTML = "";
	document.getElementById("myChartDiv5").innerHTML = '<canvas id="myChart5" class="plot-container" height="400" width="350"></canvas>';
	
	let periodData = {
			startDate : start,
			endDate : end
		}

	let dataArr= [];
	let labelArr = [];
	let color = [];
	
	$.ajax({
		method : "post",
		url : "/chart/praCntByEmpList",
		dataType : "json",
		data : JSON.stringify(periodData),
		contentType : "application/json;charset=utf-8",
		processData : false,
		success : function(rslt){
			$.each(rslt, function(i, v){
				dataArr.push(v.EMPNAME);
				labelArr.push(v.PRACNT);
				color.push(makeRandomColor());
			})
			let ctxTemp = document.getElementById("myChart5");
			
			let myChart = new Chart(ctxTemp, {
			    type: 'doughnut',
			    data: {
			        labels: dataArr,
			        datasets: [{
			            label: '# of Votes',
			            data: labelArr,
			            borderWidth: 1,
			            backgroundColor: color
			        }]
			    },
			    options: {
			    	responsive : false,
			        scales: {
			            y: {
			                beginAtZero: true
			            }
			        }
			    }
			
			})
		}
	})
}


function makeRandomColor(){
	var RGB_1 = Math.floor(Math.random() * (255 + 1))
	var RGB_2 = Math.floor(Math.random() * (255 + 1))
	var RGB_3 = Math.floor(Math.random() * (255 + 1))
	var strRGBA = 'rgba(' + RGB_1 + ',' + RGB_2 + ',' + RGB_3 + ',0.3)'
	
	return strRGBA;
}


// function drawChart(canvasId, type, label, data){
// 	let ctxTemp = document.getElementById(canvasId).getContext('2d');
	
// 	let myChart = new Chart(ctxTemp, {
// 	    type: type,
// 	    data: {
// 	        labels: [label],
// 	        datasets: [{
// 	            label: '# of Votes',
// 	            data: data ,
// 	            borderWidth: 1
// 	        }]
// 	    },
// 	    options: {
// 	    	responsive : false,
// 	        scales: {
// 	            y: {
// 	                beginAtZero: true
// 	            }
// 	        }
// 	    }
// 	});
// }








// 달력
$(function () {
    $('#datePeriod1').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
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
        "startDate": "2023-02-01",
        "endDate": "2023-02-15",
        "drops": "down"
    }, function (start, end, label) {
    	makeAnimalTypeChart(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
    });
    
    $('#datePeriod2').daterangepicker({
        "locale": { "format": "YYYY-MM-DD", "separator": "~", "applyLabel": "확인", "cancelLabel": "취소", "fromLabel": "From", "toLabel": "To", "customRangeLabel": "Custom", "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate": "2023-02-01", "endDate": "2023-02-15", "drops": "down"
    }, function (start, end, label) {
    	makeDaysPaymentChart(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
    });
    $('#datePeriod3').daterangepicker({
        "locale": { "format": "YYYY-MM-DD", "separator": "~", "applyLabel": "확인", "cancelLabel": "취소", "fromLabel": "From", "toLabel": "To", "customRangeLabel": "Custom", "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate": "2023-02-01", "endDate": "2023-02-15", "drops": "down"
    }, function (start, end, label) {
    	makedaysPraChart(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
    });
    
    $('#datePeriod4').daterangepicker({
        "locale": { "format": "YYYY-MM-DD", "separator": "~", "applyLabel": "확인", "cancelLabel": "취소", "fromLabel": "From", "toLabel": "To", "customRangeLabel": "Custom", "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate": "2023-02-01", "endDate": "2023-02-15", "drops": "down"
    }, function (start, end, label) {
    	makedrugCntChart(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
    });
    
    $('#datePeriod5').daterangepicker({
        "locale": { "format": "YYYY-MM-DD", "separator": "~", "applyLabel": "확인", "cancelLabel": "취소", "fromLabel": "From", "toLabel": "To", "customRangeLabel": "Custom", "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate": "2023-02-01", "endDate": "2023-02-15", "drops": "down"
    }, function (start, end, label) {
    	makepraCntByEmpListChart(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
    });
});
</script>