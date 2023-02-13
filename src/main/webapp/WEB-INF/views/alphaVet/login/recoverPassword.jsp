<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="card overflow-hidden mt-2">
    <div class="auth-logo text-center bg-primary position-relative">
        <div class="img-overlay"></div>
        <div class="position-relative pt-4 py-5 mb-1">
            <h5 class="text-white"><b>비밀번호 찾기</b></h5>
<!--         <p class="text-white-50 mb-0">Reset your Password with Medroc.</p> -->
        </div>
    </div>
    <div class="card-body position-relative">
        
        <div class="p-4 mt-n5 card rounded">

            <div class="alert alert-success text-center mb-4" role="alert">
                찾으시는 계정의 ID와 Email 주소를 입력해주세요.
            </div>
            
            <form class="needs-validation" name="recoverPasswordForm" novalidate>

                <div class="mb-3">
                    <label for="empId">ID</label>
                    <input type="text" class="form-control" name="empId" placeholder="ID를 입력해주세요." required>
                </div>
                <div class="mb-3">
                    <label for="empMail">Email</label>
                    <input type="email" class="form-control" name="empMail" placeholder="Email 주소를 입력해주세요." required>
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
const recoverPasswordForm = document.recoverPasswordForm;

recoverPasswordForm.addEventListener("submit", (e) => {
	e.preventDefault();
	let data = {
		empId : recoverPasswordForm.empId.value,
		empMail : recoverPasswordForm.empMail.value
	}
	
	$.ajax({
		method : "post",
		url : "/recoverPassword",
		data : JSON.stringify(data),
		dataType : "text",
		contentType : "application/json;charset=utf-8",
		success : function(rslt){
			if(rslt==""){
				Swal.fire({
					title: "입력된 정보와 일치하는 회원이 없습니다.",
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
		   		 	backdrop: true,
			 		 }) 
			}else{
				sendConfirmCode(rslt);
				
				Swal.fire({
					title: "이메일로 임시 비밀번호가 발송되었습니다.",
					input: 'text',
			        inputPlaceholder: '인증번호를 입력해주세요.',
			        confirmButtonColor: '#3085d6',
			        confirmButtonText: '확인',
		   		 	backdrop: true,
			 		 }).then((result) => {
			 			 if(result.value == rslt){
			 				 Swal.fire({
			 					title: "새로운 비밀번호를 입력해주세요.",
								input: 'text',
						        inputPlaceholder: '인증번호를 입력해주세요.',
						        confirmButtonColor: '#3085d6',
						        confirmButtonText: '확인',
					   		 	backdrop: true,
			 				 }).then((result2) =>{
			 					 updatePassword(result2.value);
			 				 })
			 			 }else{
			 				Swal.fire({
								title: "인증번호가 틀렸습니다.",
								icon: "error",
						        confirmButtonColor: '#3085d6',
						        confirmButtonText: '확인',
					   		 	backdrop: true,
						 		 }) 
			 			 }
			 		 }) 
			}
		}
	});
})

function sendConfirmCode(rslt){
	let data = {
			confirmCode : rslt,
			empMail : recoverPasswordForm.empMail.value
	}
	
	$.ajax({
		method : "post",
		url : "/sendConfirmCode",
		data : JSON.stringify(data),
		dataType : "text",
		contentType : "application/json;charset=utf-8",
		success : function(rslt){
		
		}
	})
	
}

function updatePassword(newPassword){
	let data = {
		empId : recoverPasswordForm.empId.value,
		empPw : newPassword
	}
	
	$.ajax({
		method : "post",
		url : "/updateEmpPw",
		data : JSON.stringify(data),
		dataType : "text",
		contentType : "application/json;charset=utf-8",
		success : function(rslt){
			Swal.fire({
				icon: "successs",
				title: "비밀번호가 변경되었습니다.",
		        confirmButtonColor: '#3085d6',
		        confirmButtonText: '확인',
	   		 	backdrop: true,
		 	 }).then((result) => {
				location.href="/login";
		 	 })
		}
	})
	
}

</script>