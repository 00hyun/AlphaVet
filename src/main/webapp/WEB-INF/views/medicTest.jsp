<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사</title>
</head>

<link href="${pageContext.request.contextPath }/resources/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
body {
/* 	background-color: #d1d1d1; */
	background-color: black;
}

.container2 {
 	margin-left : 15px; 
	display: grid;
	grid-template-columns: 250px 250px 250px 250px 250px;
	grid-template-rows: 300px 300px 300px;
}

.item {
	width: 210px;
	height: 210px;
	margin: 10px;
	background-color: #e9e9e9;
	border: 2px dashed #aba7a7;
	border-radius : 4px;
	color: #aba7a7;
	font-size: 2em;
	text-align: center;
}

.item:nth-child(7) { 
	grid-column: auto / span 3; 
}

.mainImg {
	width: 650px;
	height: 350px;
	background-color: transparent;
	border: none;
 	margin-top: -7.5%; 
 	margin-left: 3%;
/* 	margin-bottom: 2%; */
 	z-index: 1; 
}
button, input {
	margin-top : 1%;
	margin-left: 73%;
	margin-bottom: 1%;
}
#imageZoomDiv{
	position : absolute;
	width : 100%;
	height : 100%;
	top : 0px;
	left : 0px;
	z-index : 10;
	background-color : rgba(0, 0, 0, 0.8);
}
#imageDiv{
	width : 800px;
	height : 800px;
	margin : auto;
}
.flexDiv{
	display: flex;
}
#imageZoomHeader{
	margin : 20px 10px;
}
#test{
	margin-left : 35%;
}
</style>



<body>

	<!-- <div class="page-content"> -->
	<!--    <div class="container-fluid"> -->
<!-- 		<button type="button" class="btn btn-light btn-sm waves-effect waves-light"> -->
<!-- 			<i class="ri-camera-fill"></i> 사진 등록 -->
<!-- 		</button>		 -->
<!-- 		<input type="file" id="fileInput" multiple onchange="f_chg(this)"> -->
<!-- <button onclick="myFunction()">Click me</button> -->

<br>
<!-- <img src="/resources/profile/fill.jpg" alt='프로필사진.jpg'> -->
<br>
<div id="profileImg"></div>


	<div class="col-xl-12">
<!-- 			<div class="card"> -->
<!-- 			</div> -->
					<a class="btn btn-primary btn-rounded waves-effect waves-light" style="margin-left:90%;" onclick="submitPraImgs()">등록</a>
					<div id="praCd" style="display:none;">${praCd }</div>
		<div class="container2">
			
			<c:choose>
				<c:when test="${empty praImgVO.praImg1 }">
					<button name="praImg1" id="praImgFile1" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg1" id="praImgFile1" class="item content" style="background-image:url(${praImgVO.praImgFile1});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg2 }">
					<button name="praImg2" id="praImgFile2" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg2" id="praImgFile2" class="item content" style="background-image:url(${praImgVO.praImg2});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg3 }">
					<button name="praImg3" id="praImgFile3" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg3" id="praImgFile3" class="item content" style="background-image:url(${praImgVO.praImg3});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg4 }">
					<button name="praImg4" id="praImgFile4" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg4" id="praImgFile4" class="item content" style="background-image:url(${praImgVO.praImg4});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg5 }">
					<button name="praImg5" id="praImgFile5" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg5" id="praImgFile5" class="item content" style="background-image:url(${praImgVO.praImg5});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg6 }">
					<button name="praImg6" id="praImgFile6" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg6" id="praImgFile6" class="item content" style="background-image:url(${praImgVO.praImg6});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
				
				
			<img class="mainImg item" src='${pageContext.request.contextPath }/resources/assets/images/mediPhoto/catWhite.png'>
<%-- 						<img class="mainImg item" src='${pageContext.request.contextPath }/resources/assets/images/mediPhoto/dogSergery.png'> --%>
			
			
			<c:choose>
				<c:when test="${empty praImgVO.praImg7 }">
					<button name="praImg7" id="praImgFile7" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg7" id="praImgFile7" class="item content" style="background-image:url(${praImgVO.praImg7});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg8 }">
					<button name="praImg8" id="praImgFile8" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg8" id="praImgFile8" class="item content" style="background-image:url(${praImgVO.praImg8});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg9 }">
					<button name="praImg9" id="praImgFile9" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg9" id="praImgFile9" class="item content" style="background-image:url(${praImgVO.praImg9});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg10 }">
					<button name="praImg10" id="praImgFile10" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg10" id="praImgFile10" class="item content" style="background-image:url(${praImgVO.praImg10});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg11 }">
					<button name="praImg11" id="praImgFile11" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg11" id="praImgFile11" class="item content" style="background-image:url(${praImgVO.praImg11});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty praImgVO.praImg12 }">
					<button name="praImg12" id="praImgFile12" class="item content"><i class="ri-camera-line"></i></button>
				</c:when>
				<c:otherwise>
					<button name="praImg12" id="praImgFile12" class="item content" style="background-image:url(${praImgVO.praImg12});border:none;background-size:100%;background-color:gray;outline-offset:-10px;"></button>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
	
	
	
	
	
	<div id="imageZoomDiv" style="display:none;">
		<div id="test">
			<div id = "imageZoomHeader">
				<div></div>
				<a class="btn btn-primary btn-rounded waves-effect waves-light" onclick="clearCanvas()">지우기</a>
				<a class="btn btn-primary btn-rounded waves-effect waves-light" onclick="saveCanvas()">저장</a>
				<a class="btn btn-primary btn-rounded waves-effect waves-light" onclick="closeImageZoom()">닫기</a>
			</div>
			
			
			<canvas id="imageDiv" width="800" height="800">
			</canvas>
		</div>
	</div>
	
	
	
	
<script>
// const f_chg = pthis => {
// 	  console.log(pthis.files);
// 	  console.log(pthis.files[0]);
// 	  let formData = new FormData();  // multi-part/formData
// 	  formData.append("photoFile",pthis.files[0]);  
	  
// 	  $.ajax({
// 		  method:"post",
// 		  url:"/mediTest/fileUp",
// 		  data:formData,
// 		  contentType:false,
// 		  processData:false,
// 		  beforeSend : function(xhr){
// 				xhr.setRequestHeader(header, token);
// 			},
// 		  success:function(rslt){
// 			  console.log("성공!" , rslt);
// 		  }
// 	  })
// }

// function myFunction() {
	
// 	let profileImg = document.getElementById("profileImg");
	
// 	let code = "";
// 	$.ajax({
// 		method:"get",
// 		url:"/mediTest/fileDisplay",
// 		dataType : "json",
// 		success	: function(result){
// 			console.log(result);
// 			for(let i = 0; i < result.length; i++){
// 					code += `<img src="\${result[i].tfPicture}" alt='검사사진[\${i}].jpg'>`;
// 			}
// 			profileImg.innerHTML = code;
// 		},
// 		error : function(){

// 		}
// 	})
	 
// }

$('.content')
  .on("dragover", dragOver)
  .on("dragleave", dragOver)
  .on("drop", uploadFiles);

function dragOver(e){
  e.stopPropagation();
  e.preventDefault();
  if (e.type == "dragover") {
    $(e.target).css({
      "background-color": "black",
      "outline-offset": "-20px"
    });
  } else {
      $(e.target).css({
      "background-color": "gray",
      "outline-offset": "-10px"
    });
    }
}

const formData = new FormData();

function uploadFiles(e) {
    e.stopPropagation();
    e.preventDefault();
    dragOver(e);
    
    let id = this.id;
  
    e.dataTransfer = e.originalEvent.dataTransfer;
    var files = e.target.files || e.dataTransfer.files;
  
    console.log(e.dataTransfer.files[0]);
    
    if (files.length > 1) {
        alert('하나만 올려라.');
        return;
    }
    if (files[0].type.match(/image.*/)) {
        $(e.target).css({
            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
            "font-size": "0px",
            "border": "none",
            "background-size": "100% 100%"
        });
                
    	formData.append(`\${id}`, files[0]); 
                
    }else{
      alert('이미지가 아닙니다.');
      return;
    }
}

function submitPraImgs(){
	formData.append("praCd", document.querySelector("#praCd").innerHTML);
	$.ajax({
		method : "post",
		url : "/insertPraImgs",
		data : formData,
		contentType : false,
		processData : false,
		success : function(rslt){
			Swal.fire({
				title: "사진 등록이 완료되었습니다.",
		        confirmButtonColor: '#3085d6',
		        confirmButtonText: '확인',
		   		 backdrop: true,
	 		 }) 
		}
	})
}







const imageZoomDiv = document.getElementById("imageZoomDiv");

const canvas = document.getElementById("imageDiv");
const context = canvas.getContext("2d");

$(".content").on("click", function(){
	let bgImg = this.style.backgroundImage;
	if(bgImg == ""){ return false; }
	
// 	let backImg = new Image();
// 	backImg.url = bgImg;
// 	context.drawImage(backImg, 0, 0, 800, 800);
	
	clearCanvas();
	
	canvas.style.backgroundImage = bgImg;
	canvas.style.backgroundSize = "100% 100%";
	
	imageZoomDiv.style.display = "";
})
canvas.addEventListener("mousedown", function(me) { mDown(me) }, false);
canvas.addEventListener("mousemove", function(me) { mMove(me) }, false);
canvas.addEventListener("mouseup", function(me) { mUp(me) }, false);
canvas.addEventListener("mouseout", function(me) { mOut(me) }, false);

var stX = 0;
var stY = 0;
var drag = false;

function mDown(me) {
	stX = me.offsetX;
	stY = me.offsetY;
	console.log("stX : " + stX + ", stY : " + stY);
	drag = true;
}

function mMove(me) {
	if (!drag) {
		return;
	}
	var nowX = me.offsetX;
	var nowY = me.offsetY;
	canvasDraw(nowX, nowY);
	stX = nowX;
	stY = nowY;
	console.log("stX : " + stX + ", stY : " + stY);
}

function canvasDraw(currentX, currentY) {
	context.beginPath();
	context.strokeStyle = "red";
	context.lineWidth = 3;
	
	context.moveTo(stX, stY);
	context.lineTo(currentX, currentY);
	context.stroke();
	console.log("drawing");
}

function mUp(me) {
	drag = false;
}

function mOut(me) {
	drag = false;
}

document.getElementById("fileInput").addEventListener("click", (e) =>{
	console.log(e.value);
})


function closeImageZoom(){
	imageZoomDiv.style.display = "none";
}

function clearCanvas(){
	context.clearRect(0, 0, canvas.width, canvas.height)
}
function saveCanvas(){
	const medicImage = canvas.toDataURL();
    const link = document.createElement("a");
    link.href = medicImage;
    link.download = "medicImage";
    link.click();
}
</script>
</body>
</html>