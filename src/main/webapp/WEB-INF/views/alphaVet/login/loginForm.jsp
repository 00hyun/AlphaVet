<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>   

 

<html>
<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
<style>
html { 
 	background: url(${pageContext.request.contextPath }/resources/images/gif/back44.gif); 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  overflow: hidden;
}

img{
  display: block;
  margin: auto;
  width: 100%;
  height: auto;
}

#login-button {
    cursor: pointer;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 30px;
    margin: auto;
    width: 230px;
    height: 230px;
    border-radius: 50%;
    background: rgb(16 52 39);
    overflow: hidden;
    opacity: 0.5;
    box-shadow: 10px 10px 30px #535855;
}

#login-button:hover{
  opacity: 0.4;
}

/* Login container */
#container {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    width: 500px;
    height: 500px;
    border-radius: 5px;
    background: #81a9abb3;
    box-shadow: 1px 1px 25px #5c525280;
    display: none;
}

.close-btn{
  position: absolute;
  cursor: pointer;
  font-family: 'Open Sans Condensed', sans-serif;
  line-height: 18px;
  top: 3px;
  right: 3px;
  width: 20px;
  height: 20px;
  text-align: center;
  border-radius: 10px;
  opacity: .2;
  -webkit-transition: all 2s ease-in-out;
  -moz-transition: all 2s ease-in-out;
  -o-transition: all 2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.close-btn:hover{
  opacity: .5;
}

.close-btn2{
  position: absolute;
  cursor: pointer;
  font-family: 'Open Sans Condensed', sans-serif;
  line-height: 18px;
  top: 3px;
  right: 3px;
  width: 20px;
  height: 20px;
  text-align: center;
  border-radius: 10px;
  opacity: .2;
  -webkit-transition: all 2s ease-in-out;
  -moz-transition: all 2s ease-in-out;
  -o-transition: all 2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.close-btn2:hover{
  opacity: .5;
}

/* Heading */
h1 {
    font-family: 'Open Sans Condensed', sans-serif;
    position: relative;
    margin-top: 0px;
    text-align: center;
    font-size: 40px;
    color: #f7f1f1;
    text-shadow: 3px 3px 10px #6e6c72;
}

/* Inputs */
/* a, */
input{
  font-family: 'Open Sans Condensed', sans-serif;
  text-decoration: none;
  position: relative;
  width: 80%;
  display: block;
  margin: 9px auto;
  font-size: 17px;
  color: #fff;
  padding: 8px;
  border-radius: 6px;
  border: none;
  background: rgba(3,3,3,.1);
  -webkit-transition: all 2s ease-in-out;
  -moz-transition: all 2s ease-in-out;
  -o-transition: all 2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

input:focus{
  outline: none;
  box-shadow: 3px 3px 10px #333;
  background: rgba(3,3,3,.18);
}

/* Placeholders */
::-webkit-input-placeholder {
   color: #ddd;  }
:-moz-placeholder { /* Firefox 18- */
   color: red;  }
::-moz-placeholder {  /* Firefox 19+ */
   color: red;  }
:-ms-input-placeholder {  
   color: #333;  }

/* Link */
button{
/*   font-family: 'Open Sans Condensed', sans-serif; */
  text-align: center;
  padding: 4px 8px;
  background: #5594fba6;
  cursor:pointer;
}

button:hover{
  opacity: 0.7;
}

a:hover{
  opacity: 0.7;
}

#remember-container{
  position: relative;
  margin: -5px 20px;
}

.checkbox {
  position: relative;
  cursor: pointer;
	-webkit-appearance: none;
	padding: 5px;
	border-radius: 4px;
  background: rgba(3,3,3,.2);
	display: inline-block;
  width: 16px;
  height: 15px;
}

.checkbox:checked:active {
	box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.checkbox:checked {
  background: rgba(3,3,3,.4);
	box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.5);
	color: #fff;
}

.checkbox:checked:after {
	content: '\2714';
	font-size: 10px;
	position: absolute;
	top: 0px;
	left: 4px;
	color: #fff;
}

#remember{
  position: absolute;
  font-size: 13px;
  font-family: 'Hind', sans-serif;
  color: rgba(255,255,255,.5);
  top: 7px;
  left: 20px;
}

.forgotten2{
/*   position: absolute; */
  font-size: 12px;
  text-decoration: none;
  font-weight: 500;
  margin-right: 20px;
  color: #0d2422bf;
  cursor: pointer;
  -webkit-transition: all 2s ease-in-out;
  -moz-transition: all 2s ease-in-out;
  -o-transition: all 2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.forgotten3{
/*   position: absolute; */
  text-decoration: none;
  font-size: 12px;
  font-weight: 500;
  margin-right: 30px;
  color: #0d2422bf;
  cursor: pointer;
  -webkit-transition: all 2s ease-in-out;
  -moz-transition: all 2s ease-in-out;
  -o-transition: all 2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.forgotten2:hover{
  color: rgba(255,255,255,.6);
}
.forgotten3:hover{
  color: rgba(255,255,255,.6);
}

#forgotten-container{
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
  width: 500px;
  height: 600px;
  border-radius: 10px;
  background: #81a9abb3;
  box-shadow: 1px 1px 25px #5c525280;
  display: none;
}

#forgotten-container2{
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
  width: 500px;
  height: 600px;
  border-radius: 10px;
  background: #81a9abb3;
  box-shadow: 1px 1px 25px #5c525280;
  display: none;
}

.orange-btn{
  background: rgba(87,198,255,.5);
}


.btn-login{
    font-family: 'Open Sans Condensed', sans-serif;
    text-decoration: none;
    position: relative;
    width: 80%;
    display: block;
    margin: 9px auto;
    font-size: 17px;
    color: #fff;
    padding: 8px;
    border-radius: 6px;
    border: none;
    background: #0b0e03a6;
    -webkit-transition: all 2s ease-in-out;
    -moz-transition: all 2s ease-in-out;
    -o-transition: all 2s ease-in-out;
    transition: all 0.2s ease-in-out;
}

.title{
	color:white;
}

.title1{
	font-size: 1.5em;
	font-weight: 600px;
	color: white;
}
.title3{
	font-size: 1.05em;
	font-weight: 500px;
	color: white;
}

.whiteFont{
	color: white;
	font-style: none;
}

.logoImg{
	width: 30%;
	opacity: 0.4;
    box-shadow: 10px 10px 30px #535855;
    border-radius: 50%;
    background: rgb(16 52 39);
    margin-left: 34.5%;
}

</style>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/parsley.js/2.9.2/parsley.js" integrity="sha512-Fq/wHuMI7AraoOK+juE5oYILKvSPe6GC5ZWZnvpOO/ZPdtyA29n+a5kVLP4XaLyDy9D1IBPYzdFycO33Ijd0Pg==" crossorigin="anonymous"></script> -->
<!-- <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> -->





<body>
	<div id="login-button" >
<!--   <img src="https://dqcgrsy5v35b9.cloudfront.net/cruiseplanner/assets/img/icons/login-w-icon.png"> -->
  <img src="${pageContext.request.contextPath }/resources/images/vetIcon.png">
	</div>
<div id="container">
  <span class="close-btn">
    <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
  </span>
<div align="center">
	<br><br>
            <span class="title1"><b>수의사</b>와 <b>반려동물</b>을 위한 서비스</span>
            <h1 class="title2">Alpha,Vet</h1>
            <hr>
            <br>
            <span class="title3">서비스를 이용하시려면 <b>로그인</b>을 해주세요.</span><br>
<%--         <c:out value="${error }"/>  --%>
            <br>
<%--         <c:out value="${logout }"/>  --%>
</div>
  <form action="/login" method="post">
    <input type="text" name="username" id="username" value="" placeholder="회원 아이디를 입력해주세요.">
    <input type="password" name="password" id="userpassword" value="" placeholder="비밀번호를 입력해주세요.">
    <div id="remember-container" align="center">
      
      <br>
      <a id="forgottenId" class="text-muted forgotten2"><i class="fa-solid fa-unlock-keyhole"></i> 아이디 찾기</a>
      <a id="forgottenPass" class="text-muted forgotten3"><i class="fa-solid fa-unlock-keyhole"></i> 비밀번호 찾기</a>
    </div>
    <br>
    <button class="btn-login" type="submit"><b>로그인</b></button>
    <sec:csrfInput/>
    
</form>
</div>



<!-- Forgotten Id Container 아이디 찾기-->
	<div id="forgotten-container">
		<br><br>
		<h2 class="title1" align="center">아이디 찾기</h2>
	   	<hr><br>
	   	<div class='logoImg' align="center">
			<img src="${pageContext.request.contextPath }/resources/images/vetIcon.png">
	   	</div>
	   <br>
	  <span class="close-btn2">
	    <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
	  </span>
	  
	<form class="needs-validation" name="recoverIdForm" novalidate>
	    <input type="text" class="form-control" name="empName" value="" placeholder="등록된 회원의 이름을 입력해주세요." required>
	    <input type="text" class="form-control" name="empTel" value="" placeholder="핸드폰 번호를 입력해주세요." required>
	  	<br>
	    <button class="btn-login" type="submit"><b>확인</b></button>
	</form>
<!-- 	    <p class="whiteFont">Remember It ? <a href="/login" class="fw-bold whiteFont">로그인하기</a> </p> -->
			<br><br>
	</div>




<!-- Forgotten Password Container 비밀번호 찾기 -->
	<div id="forgotten-container2">
		<br><br>
	   <h2 class="title1" align="center">비밀번호 찾기</h2>
	    <hr><br>
	   	<div class='logoImg' align="center">
			<img src="${pageContext.request.contextPath }/resources/images/vetIcon.png">
	   	</div>
	   
		<span class="close-btn2">
		   <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
		</span>
			<br>
	
		<form class="needs-validation" name="recoverPasswordForm" novalidate>
		      <input type="text" name="empId" id="empId" placeholder="회원 아이디를 입력해주세요.">
		      <input type="email" class="form-control" name="empMail" placeholder="Email 주소를 입력해주세요." required>
		      	  	<br>
		    <button class="btn-login" type="submit"><b>확인</b></button>
		</form>
		<br><br>
	</div>
</body>

<script>
//아이디 찾기
const recoverIdForm = document.recoverIdForm;
const recoverPasswordForm = document.recoverPasswordForm;




$(document).ready(function () {
	$('#login-button').click(function(){
	  $('#login-button').fadeOut("slow",function(){
	    $("#container").fadeIn();
	  });
	});
	

	$(".close-btn").click(function(){
	  $("#container").fadeOut("slow", function(){
	    $("#login-button").fadeIn();
	  });
	});

	$(".close-btn2").click(function(){
	  $("#forgotten-container, #forgotten-container2").fadeOut("slow", function(){
	    $("#container").fadeIn();
	  });
	});

	/* 아이디 찾기 */
	$('#forgottenId').click(function(){
	  $("#container").fadeOut(function(){
	    $("#forgotten-container").fadeIn();
	  });
	});
	
	/* 비밀번호 찾기 */
	$('#forgottenPass').click(function(){
	  $("#container").fadeOut(function(){
	    $("#forgotten-container2").fadeIn();
	  });
	});
})	


// 비밀번호 찾기


recoverPasswordForm.addEventListener("submit", (e) => {
	e.preventDefault();

	let data = {
		empId : recoverPasswordForm.empId.value,
		empMail : recoverPasswordForm.empMail.value
	}
	
	console.log("왜 안떠유", data);
	
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
								input: 'password',
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
				text:"새로운 비밀번호로 다시 로그인 해주세요.",
		        confirmButtonColor: '#3085d6',
		        confirmButtonText: '확인',
	   		 	backdrop: true,
		 	 }).then((result) => {
				location.href="/login";
		 	 })
		}
	})
	
}



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
					text:"다시 입력해주세요.",
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


</html>