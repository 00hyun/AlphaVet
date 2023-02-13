<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.accessForm{
	margin-top: 35px;
	margin-right: 20px;
	box-shadow: 0 0 10px rgb(197 207 221 / 44%);
	position: relative;
	z-index: 1;
	opacity: 8;
}

#dogFix{
	z-index: 2;
	position: relative;
}
</style>


<!-- 병원 리스트 -->
	<div class="card row" id="clinicDiv" style="display: none"></div>
<!-- 디테일 -->
<div class="card row" id="clinicInfo" style="display: none">
</div>
<!-- 병원 인증 진행 -->
<div class="card row" id="showDiv" style="display: none">
	<div class="card overflow-hidden card-h-100">
		<div class='card-body' align='center'>
<%--      		<img class='logo logoLogin' src='${pageContext.request.contextPath }/resources/images/appImg/alphaPet.png' width='200px' /> --%> 
<!--      		<h4><b>동물 병원 인증</b></h4> --> 
</div>

	<div id="progrss-wizard" class="twitter-bs-wizard">
		<ul class="twitter-bs-wizard-nav nav-justified">
			<li class="nav-item"><a href="#progress-seller-details"
				class="nav-link" data-toggle="tab"> <span class="step-number"><b>01</b></span>
					<span class="step-title"><h4><b>정보입력</b></h4></span>
			</a></li>
			<li class="nav-item"><a href="#progress-confirm-detail"
				class="nav-link" data-toggle="tab"> <span class="step-number"><b>02</b></span>
					<span class="step-title"><h4><b>확인</b></h4></span>
			</a></li>
		</ul>

		<div id="bar" class="progress mt-4">
			<div
				class="progress-bar bg-success progress-bar-striped progress-bar-animated"></div>
		</div>
		<div class="tab-content twitter-bs-wizard-tab-content">
			<div class="tab-pane" id="progress-seller-details">
				<form>
					<div align="center">
					<h4>해당 동물병원 정보 연동을 위해 <b>인증</b>을 진행해주세요.</h4>
					<h5>※ 병원 첫 방문시에는 <b>최대 1시간 이후</b> 인증이 가능합니다.</h5>
					</div>
					
					<div id="dogFix" align="right">
						<img  src='${pageContext.request.contextPath }/resources/images/appImg/cutePuppy4.png' width='80px' style='margin-bottom:-73px; margin-right: 30px;' />
					</div>
					<div class="card accessForm">
					<div class="row card-body col-md-12">
						<div class="md-4">
							<label class="form-label"
								for="progress-basicpill-firstname-input"><h5><b>이름</b></h5></label> <input
								type="text" class="form-control col-md-8" id="memName"
								name="memName" placeholder="병원에 등록된 이름을 입력해주세요.">
						</div>
					</div>
					<!-- </div> -->

					<!-- <div class=""> -->
					<div class="card-body row col-md-12">
						<div class="md-4">
							<label class="form-label" for="progress-basicpill-phoneno-input"><h5><b>전화번호</b></h5></label>
							<input type="text" class="form-control col-md-8" id="memTel" placeholder="병원에 등록된 전화번호를 입력해주세요."
								name="memTel">
						</div>
					</div>
<!-- 					<div class="card-body row col-md-12"> -->
<!-- 						<div class="md-4"> -->
<!-- 							<label class="form-label" for="progress-basicpill-email-input"><h5><b>Email</b></h5></label> -->
<!-- 							<input type="email" class="form-control md-8" id="memTel" -->
<!-- 								name="memTel"> -->
<!-- 						</div> -->
<!-- 					</div> -->
					</div>
				</form>
			</div>
			<div class="tab-pane" id="progress-confirm-detail">
				<div class="justify-content-center">
					<div>
						<div class="text-center" id="resultDiv"></div>
					</div>
				</div>
			</div>
		</div>
		<ul class="pager wizard twitter-bs-wizard-pager-link" style = "margin-bottom: 20px;">
			<li class="previous"><a href="javascript: void(0);">이전</a></li>
			<li class="next" id="nextBtn"><a href="javascript: void(0);">다음</a></li>
			<li class="next" id="resBtn" style="display: none"><button
					class="btn btn-info waves-effect waves-light" type="button">닫기</button></li>
		</ul>
	</div>
	</div>
</div>
