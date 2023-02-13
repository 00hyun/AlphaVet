<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authentication property="principal" var="principal" />


<style>

#board {
	width: 50%; 
	height: 50%; 
}

#empStyle{
/* 	margin-top: 10%; */
	text-align: center; 
	opacity: 0.9;
	font-size: 310%;
	color: white;
}

#back {
	background: url("${pageContext.request.contextPath}/resources/images/메인.jpg");
	background-size: cover;
	height: 1200px;
	opacity: 0.7;
}

#good {
 	margin-top: 12%;  
	color: white;
	opacity: 0.99;
	font-size: 130%;
	font-weight: 400;
}

#changeImgDiv {
    width: 525px;
    height: 130px;
    z-index: 2;
    position: absolute;
    padding: 3px;
    background-color: #f4f5ff99;
    box-shadow: none;
    margin-left: 69%; 
    margin-top: -190px;
}

.changeBtn{
	font-size: 3em;
	color: #d8d7d7;
	margin-right: 2%;
	margin-top: -100px;
	cursor: pointer;	
}

.backDiv{
	display: inline-block;
}

.backSize{
	width: 70px;
	height: 60px;
	border-radius: 5px;
	border: 2px solid #a9a8a9;
	cursor: pointer;
}

#hosStyle{
	margin-top: 10%;
	text-align: center; 
	opacity: 0.9;
	font-size: 250%;
	color: white;
	}

</style>



<div class="page-content" id="back">
	<!-- start page title -->
	<!-- end page title -->

	<div class="col-xl-12" style="height: 100%; position: relative; z-index: 1;">
	
<%-- 		<%@include file="main/todoList.jsp"%> --%>
		<%@include file="main/weather.jsp"%>
		
				<%@include file="main/goodSentances.jsp"%>

		<div align="center">
			<div id="board">
				<h2 id="hosStyle">대덕인재 동물병원</h2>
				<h1 id="empStyle" ><b>${principal.empVO.empName }님,
					환영합니다.</b></h1>
					<hr style="border: 3px; color: white;">
				<%@include file="main/clock.jsp"%>
			</div>
		</div>
		
		<div align="right" style="margin-top: 15%;">
			<i class="ri-settings-5-fill changeBtn"></i>
			<div class="card" id="changeImgDiv" style="display: none;">
				<h4 style="color: #462d93;"><b><i class="ri-mac-line" style="margin-top: 5px;"></i> 배경화면 설정</b></h4><hr>
				<div class="backDiv"><img class="backSize" id="img1" src="${pageContext.request.contextPath}/resources/images/backImg222.png"></div>
				<div class="backDiv"><img class="backSize" id="img2" src="${pageContext.request.contextPath}/resources/images/아리.JPG"></div>
				<div class="backDiv"><img class="backSize" id="img3" src="${pageContext.request.contextPath}/resources/images/mainBack66.jpg"></div>
				<div class="backDiv"><img class="backSize" id="img4" src="${pageContext.request.contextPath}/resources/images/vetvet.jpg"></div>
				<div class="backDiv"><img class="backSize" id="img5" src="${pageContext.request.contextPath}/resources/images/mainBack33.jpg"></div>
				<div class="backDiv"><img class="backSize" id="img6" src="${pageContext.request.contextPath}/resources/images/home/greenCat.jpg"></div>
				<div class="backDiv"><img class="backSize" id="img7" src="${pageContext.request.contextPath}/resources/images/메인.jpg"></div>
			</div>
		</div>
	</div>

</div>

<script>
$(function(){
	document.getElementById("headerSearchBar").style.display="none";
   
	let back = document.querySelector("#back");
	
})

$(document).ready(function() {
		$('.changeBtn').click(function(){
			   if($(".changeBtn").hasClass("ri-settings-5-fill")){
			      $("#changeImgDiv").css("display", "block");
			      $('.changeBtn').removeClass("ri-settings-5-fill").addClass('ri-settings-4-fill');
			   }else{
				  $("#changeImgDiv").css("display", "none");
			      $('.changeBtn').removeClass("ri-settings-4-fill").addClass('ri-settings-5-fill');
			   }
		   })
		   
		$(document).on('click', '#img1', function(){
		      $("#back").css({"background":"url(${pageContext.request.contextPath}/resources/images/backImg222.png)"}); 
		      $("#back").css({"background-size":"cover"}); 	
		      $("#back").css({"opacity":"0.9"}); 	
		   })	   
		   
		$(document).on('click', '#img2', function(){
		      $("#back").css({"background":"url(${pageContext.request.contextPath}/resources/images/아리.JPG)"}); 	
		      $("#back").css({"background-size":"cover"});
		      $("#back").css({"opacity":"0.9"}); 	

		   })	   
		   
		$(document).on('click', '#img3', function(){
		      $("#back").css({"background":"url(${pageContext.request.contextPath}/resources/images/mainBack66.jpg)"}); 
		      $("#back").css({"background-size":"cover"});
		      $("#back").css({"opacity":"0.9"}); 	
		   })	   
		   
		$(document).on('click', '#img4', function(){
		      $("#back").css({"background":"url(${pageContext.request.contextPath}/resources/images/vetvet.jpg)"}); 	
		      $("#back").css({"background-size":"cover"}); 	
		      $("#back").css({"opacity":"0.9"}); 	
		   })	   
		   
		$(document).on('click', '#img5', function(){
		      $("#back").css({"background":"url(${pageContext.request.contextPath}/resources/images/mainBack33.jpg)"}); 	
		      $("#back").css({"background-size":"cover"}); 	
		      $("#back").css({"opacity":"0.9"}); 	
		   })	   
		   
		$(document).on('click', '#img6', function(){
		      $("#back").css({"background":"url(${pageContext.request.contextPath}/resources/images/home/greenCat.jpg)"}); 	
		      $("#back").css({"background-size":"cover"}); 	
		      $("#back").css({"height":"1200px"}); 	
		      $("#back").css({"opacity":"0.62"}); 	
		   })	   
		   
		$(document).on('click', '#img7', function(){
		      $("#back").css({"background":"url(${pageContext.request.contextPath}/resources/images/메인.jpg)"}); 	
		      $("#back").css({"background-size":"cover"}); 	
		   })	   
		   
	})

</script>
