<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="card overflow-hidden mt-2">
    <div class="auth-logo text-center bg-primary position-relative">
        <div class="img-overlay"></div>
        <div class="position-relative pt-4 py-5 mb-1">
            <h5 class="text-white"><b>아이디 찾기</b></h5>
<!--         <p class="text-white-50 mb-0">Reset your Password with Medroc.</p> -->
        </div>
    </div>
    <div class="card-body position-relative">
        
        <div class="p-4 mt-n5 card rounded">

            <div class="alert alert-success text-center mb-4" role="alert">
                찾으시는 ID 정보의 이름과 핸드폰번호를 입력해주세요.
            </div>
            
            <form class="needs-validation" name="recoverIdForm" novalidate>

                <div class="mb-3">
                    <label>이름</label>
                    <input type="text" class="form-control" name="empName" value="" placeholder="이름을 입력해주세요." required>
                </div>
                <div class="mb-3">
                    <label>핸드폰 번호</label>
                    <input type="text" class="form-control" name="empTel" value="" placeholder="핸드폰 번호를 입력해주세요." required>
                </div>

                <div class="mt-4">
                    <button class="btn btn-primary w-100 waves-effect waves-light" type="submit"><b>확인</b></button>
                </div>
            </form>
        </div>
    </div>
</div>



<div class="mt-5 text-center">
    <p>Remember It ? <a href="/login" class="fw-bold">로그인하기</a> </p>
    <p>© <script>document.write(new Date().getFullYear())</script> AlphaVet. Crafted with <i class="mdi mdi-hospital text-primary"></i> by 가나다</p>
</div>




<script>
const recoverIdForm = document.recoverIdForm;

recoverIdForm.addEventListener("submit", (e) => {
	e.preventDefault();
	let data = {
		empName : recoverIdForm.empName.value,
		empTel : recoverIdForm.empTel.value
	}
	
	$.ajax({
		method : "post",
		url : "/recoverId",
		data : JSON.stringify(data),
		dataType : "text",
		contentType : "application/json;charset=utf-8",
		success : function(rslt){
			if(rslt==""){
				Swal.fire({
					title: "입력된 정보와 일치하는 ID가 없습니다.",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
			   		 backdrop: true,
			 		 }) 
			}else{
				Swal.fire({
					title: recoverIdForm.empName.value + "님의 ID는 [ " + rslt + " ] 입니다.",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
			   		 backdrop: true,
			 		 }) 
			}
		}
	});
})


</script>