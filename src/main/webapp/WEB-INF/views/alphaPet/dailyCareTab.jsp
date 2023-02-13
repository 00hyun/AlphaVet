<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	#enterFixImg{
		width: 200px;
		opacity: 0.11;
		position: fixed;
		top: 300px;
		text-align: center;
		margin-left: -90px;
	}
	
	.careListDiv{
		background-color: #fffbed;
		width: 90%;
		height: 50px;
		color : white;
		font-size: 15px;
		border-radius: 10px;
	}
	
	.vaccineDiv{
	    background-color: #f8fbff;
   		border: 2.5px solid #d4e6f5;
   		border-radius : 30px;
   		margin-left: 10px;
	}
</style>	
	
<!-- 데일리케어 메인 -->
<div class="card row" id="careMain">
	<div class="card-body" id="myPet">
		<div class="row mb-3">
			<div class="col-sm-4">
				<select class="form-select" aria-label="Default select example"
					id="selectPet">
				</select>
			</div>
		</div>
	</div>
	<ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
<!-- 		<li class="nav-item"><a class="nav-link active" -->
<!-- 			data-bs-toggle="tab" href="#allList" role="tab"> <span -->
<!-- 				class="d-none d-sm-block"><h4>전체</h4></span> -->
<!-- 		</a></li> -->
		<li class="nav-item"><a class="nav-link active" data-bs-toggle="tab"
			href="#medicList" role="tab"> <span class="d-none d-sm-block"><h4>내원</h4></span>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
			href="#vaccineList" role="tab"> <span class="d-none d-sm-block">
			<h4>백신</h4></span>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
			href="#stayList" role="tab"> <span class="d-none d-sm-block">
			<h4>입원</h4></span>
		</a></li>
	</ul>
	<div class="tab-content p-3 text-muted careList">
		<!-- 전체 -->
<!-- 		<div class="tab-pane active" id="allList" role="tabpanel"> -->
<!-- 			<table id="allListTable"> -->
<!-- 				<tr> -->
<!-- 					<td>내역이 존재하지 않습니다.</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
		<!-- 내원 -->
		<div class="tab-pane active" id="medicList" role="tabpanel">
			<table id="medicListTable">
			</table>
		</div>
		<!-- 백신 -->
		<div class="tab-pane" id="vaccineList" role="tabpanel">
		    <div class="col-12" style="box-sizing:border-box;" align="center">
				<table id="vaccineListTable">
				</table>
			</div>
		</div>
		<!-- 입원 -->
		<div class="tab-pane" id="stayList" role="tabpanel">
			<div class="col-md-12" style="box-sizing:border-box;" align="center">
		
			<table id="stayListTable">
			</table>
			</div>
		</div>
	</div>
</div>
<!-- 백신상세 -->
<div id="vaccineDetailDiv">
	<!-- 상단..? -->
	<div class="card row">
		<div class="card-body row col-md-5">
			<strong class = "col-md-2"><i class="dripicons-chevron-left" id="vaccineDetailBack"> </i></strong>			
			<h4 class="col-md-10" style="color: #445990;">
				<strong><i class="fas fa-syringe"></i> 백신 상세</strong>
			</h4>
		</div>
		<div align="center">
			<img id="enterFixImg" src='${pageContext.request.contextPath }/resources/images/appImg/logoFix.png'>
		</div>
		<div id="vaccineDetailDiv2"></div>
	</div>
</div>
<!-- 입원상세 -->
<div id="stayDetailDiv">
	<!-- 일차별 상세 -->
	<div class='card row'>
		<div class="card-body row col-md-5">
			<strong class = "col-md-2"><i class="dripicons-chevron-left" id="stayDetailBack"></i></strong>			
			<h4 class="col-md-10" style="color: #445990;">
				<strong><i class="mdi mdi-seat-individual-suite"></i> 입원 상세</strong>
			</h4>
		</div>
		<div align="center">
			<img id="enterFixImg" src='${pageContext.request.contextPath }/resources/images/appImg/logoFix.png'>
		</div>
		<div class='card-body'>
			<div id="carouselExampleInterval"
				class="carousel slide review-carousel" data-bs-ride="carousel">
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<i class="mdi mdi-chevron-left carousel-control-icon"></i>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<i class="mdi mdi-chevron-right carousel-control-icon"></i>
				</button>
				<div class="carousel-inner" id="stayOneDay"></div>
			</div>
		</div>
	</div>
	
	<!-- 최종 금액 -->
	<div id="stayPrice"></div>
	<br><br><br><br>
</div>