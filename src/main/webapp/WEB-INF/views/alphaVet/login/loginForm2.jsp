<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
.fontSize{
	font-size: 1.1em;
	font-weight: 500;
}

.title{
	font-size: 1.55em;
	font-weight: 400;
}

.title2{
	font-size: 1.08em;
	font-weight: 300;
}

input:focus, select:focus {
    border: 2px solid #989ae7 !important;
    outline: none;
}

.form-item input:focus + label {
    color: #6c6ff5;
}

.remember{
	font-size: 0.8em;
}

</style>

<div class="card overflow-hidden mt-2">
    <div class="auth-logo text-center bg-primary position-relative">
        <div class="img-overlay"></div>
        <div class="position-relative pt-4 py-5 mb-1">
            <a class="text-white title">수의사와 반려동물을 위한 서비스</a><br>
            <a class="text-white title2"><b>Alpha,Vet</b>에 오신 것을 환영합니다!</a>
<!--         <p class="text-white-50 mb-0">서비스를 이용하시려면 로그인해주세요.</p> -->
        <c:out value="${error }"/> 
        <c:out value="${logout }"/> 
        </div>
    </div>
    <div class="card-body position-relative">
        <div class="p-4 mt-n5 card rounded">
            <form class="form-horizontal form-item" action="/login" method="post">

                <div class="mb-3 fontSize">
                    <label for="username" class="form-label">회원 ID</label>
                    <input type="text" class="form-control" name="username" id="username" value="e001" placeholder="아이디를 입력해주세요.">
                </div>

                <div class="mb-3 fontSize">
                    <label for="userpassword">비밀번호</label>
                    <input type="password" class="form-control" name="password" id="userpassword" value="1234" placeholder="비밀번호를 입력해주세요.">        
                </div>

                <div class="form-check mt-3 remember">
                    <input type="checkbox" class="form-check-input" id="auth-remember-check">
                    <label class="form-check-label" for="auth-remember-check">로그인 정보 기억하기</label>
                </div>

                <div class="mt-3">
                    <button class="btn btn-primary w-100 waves-effect waves-light" type="submit"><b>로그인</b></button>
                </div>

                <div class="mt-4 text-center">
                    <a href="/recoverId" class="text-muted"><i class="mdi mdi-lock me-1"></i> 아이디 찾기</a>
                    <a href="/recoverPassword" class="text-muted"><i class="mdi mdi-lock me-1"></i> 비밀번호 찾기</a>
                </div>
                
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>
<div class="mt-5 text-center">
<!--     <p>Don't have an account ?<a href="auth-register.html" class="fw-bold"> Register</a> </p> -->
    <p>© <script>document.write(new Date().getFullYear())</script> AlphaVet. Crafted with <i class="mdi mdi-hospital text-primary"></i> by 가나다, ddit-404</p>
</div>