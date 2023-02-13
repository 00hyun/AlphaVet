<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.dragRoom{
	cursor: move;
}
</style>
<div class="col-sm-2">
	<div class="card">
		<div class="card-body textSize">
			<div class="flexDiv">
				<h4 class="card-title mb-2"><b>시설물 관리</b></h4>
				
			</div>
			<hr style="">
			<div class="search-box ms-2">
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">진료실</label>
				<div class="col-sm-8">
					<input name="" id="praRoomCnt" value="" class="form-control praRoomEdit cntInput" type="number" placeholder="" disabled>
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">수술실</label>
				<div class="col-sm-8">
					<input name="" id="surRoomCnt" value="" class="form-control surRoomEdit cntInput" type="number" placeholder="" disabled>
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">병동</label>
				<div class="col-sm-8">
					<input name="" id="wardCnt" value="" class="form-control wardEdit cntInput" type="number" placeholder="" disabled>
				</div>
			</div>
			<div class="row mb-3">
				<label for="example-search-input" class="col-sm-4 col-form-label">입원실</label>
				<div class="col-sm-8">
					<input name="" id="cageCnt" value="" class="form-control cageInput cntInput" type="number" placeholder="" disabled>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="col">
	<div class="card textSize">
		<form name="praRoomForm" id="praRoomForm" class="card-body">
			<div class="flexDiv">
				<h4 class="card-title mb-4"><b>진료실</b></h4>
				<div>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-room="praRoom" onclick="editFacility(this)">
						<i class="ri-edit-fill" id="editIcon"></i>
					</button>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-room="praRoom" id="" onclick="saveFacility(this)" style="display:none;">
						<i class="ri-save-3-fill" id="saveIcon"></i>
					</button>
				</div>
			</div>
			<div id="praRoomsDiv">
			</div>
			<div class="card" id="">
				<button type="button" onclick="addRoom(this)" id="praRoomBtn" class="btn btn-primary waves-effect waves-light addBtn" style="display:none">진료실 +</button>
			</div>
		</form>
	</div>
</div>
<div class="col">
	<div class="card textSize">
		<form name="surRoomForm" id="surRoomForm" class="card-body">
			<div class="flexDiv">
				<h4 class="card-title mb-4"><b>수술실</b></h4>
				
				<div>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-room="surRoom" id="" onclick="editFacility(this)">
						<i class="ri-edit-fill" id="editIcon"></i>
					</button>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-room="surRoom" id="" onclick="saveFacility(this)" style="display:none;">
						<i class="ri-save-3-fill" id="saveIcon"></i>
					</button>
				</div>
			</div>
			<div  id="surRoomsDiv">
			</div>
			
			<div class="card" id="">
				<button type="button" onclick="addRoom(this)" id="surRoomBtn" class="btn btn-outline-primary waves-effect waves-light addBtn" style="display:none">수술실 +</button>
			</div>
		</form>
	</div>
</div>
<div class="col">
	<div class="card textSize">
		<div class="card-body">
			<div class="flexDiv">
				<h4 class="card-title mb-4"><b>병동</b></h4>
				<div>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-room="ward" id="" onclick="editFacility(this)">
						<i class="ri-edit-fill" id="editIcon"></i>
					</button>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-room="ward" id="" onclick="saveFacility(this)" style="display:none;">
						<i class="ri-save-3-fill" id="saveIcon"></i>
					</button>
				</div>
			</div>
			<form name="wardForm" id="wardsDiv">
			</form>
			
			<div class="card" id="">
				<button type="button" onclick="addRoom(this)" id="wardBtn" class="btn btn-outline-primary waves-effect waves-light addBtn" style="display:none">병동 +</button>
			</div>
		</div>
	</div>
</div>
<div class="col">
	<div class="card textSize">
		<div class="card-body">
			<div class="flexDiv">
				<h4 class="card-title mb-4"><b>입원실</b></h4>
				<div>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-room="cage" id="" onclick="editFacility(this)">
						<i class="ri-edit-fill" id="editIcon"></i>
					</button>
					<button type="button" class="btn btn-outline-light waves-effect btn-sm" data-room="cage" id="" onclick="saveFacility(this)" style="display:none;">
						<i class="ri-save-3-fill" id="saveIcon"></i>
					</button>
				</div>
			</div>
			<form name="cageForm" id="cagesDiv">
			</form>
			
			<div class="card" >
				<button type="button" onclick="addRoom(this)" id="cageBtn" class="btn btn-primary waves-effect waves-light addBtn" style="display:none">입원실 +</button>
			</div>
		</div>
	</div>
</div>




<!-- 각 방별로 클론 할 애들 -->

<!-- 진료실입니당 -->
<div class="card praRoomDiv praRoomClass dragRoom textSize" id="praRoomDiv" style="display:none" draggable="false">
	<div class="btn btn-outline-light waves-effect waves-light">
			<div id="" class="d-none d-sm-block">진료실</div>
			<div class="flexDiv">
<!-- 				<div class="animalSelect"></div> -->
			</div>
			<input type="hidden" name="praRoomNm" value="9999"/>
	</div>
</div>
<!-- 수술실입니당 -->
<div class="card surRoomDiv surRoomClass dragRoom textSize" id="surRoomDiv" style="display:none"  draggable="false">
	<div class="btn btn-outline-light waves-effect waves-light">
			<div class="flexDiv">
				<span id="" class="d-none d-sm-block">수술실</span>
<!-- 				<div class="animalSelect"></div> -->
			</div>
			<input type="hidden" name="surNm" value="9999"/>
	</div>
</div>
<!-- 병동입니당 -->
<div class="card wardDiv wardClass dragRoom textSize" id="wardDiv" onclick="showWard(this)" style="display:none" draggable="false">
	<div class="btn btn-outline-light waves-effect waves-light">
			<span id="" class="d-none d-sm-block">병동</span>
			<div class="flexDiv">
<!-- 				<div class="animalSelect"></div> -->
				<input name="wardName" value="" class="form-control wardEdit cntInput" type="text" style="width:35%;" disabled>
				<input name="wardAmount" value="0" class="form-control cntInput" type="number" style="width:20%;" disabled>
			</div>
			<input type="hidden" name="wardNm" value="9999"/>
	</div>
</div>

<!-- 입원실입니당 -->
<div class="card wardDiv cageDiv cageClass dragRoom textSize" id="cageDiv" style="display:none" draggable="false">
	<div class="btn btn-outline-light waves-effect waves-light">
			<span id="" class="d-none d-sm-block">입원실</span>
			<div class="flexDiv">
				<select name="cageSize" class="form-select cageEdit " aria-label="Default select example" style="width:40%;" disabled>
					<option value="S">S</option>
					<option value="M">M</option>
					<option value="L">L</option>
					<option value="XL">XL</option>
				</select>
				<input name="cageCon" id="cageCnt" value="" class="form-control cageEdit " type="text" style="width:55%;" disabled>
			</div>
			<input type="hidden" name="cageNm" value="9999"/>
	</div>
</div>

<!-- 진료과 셀렉트문 -->
<select name="animalCd" class="form-select animalSelect textSize" aria-label="Default select example" onchange="changeAnimalCd(this)" style="width:35%;display:none;" disabled >
	<option value="0"selected="">선택</option>
</select>

<!-- 담당의 셀렉트문 -->
<select name="empName" class="form-select empSelect praRoomEdit textSize" aria-label="Default select example" style="width:55%;display:none" disabled>
	<option value="nothing" selected="">선택</option>
</select>