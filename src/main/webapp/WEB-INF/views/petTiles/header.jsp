<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#headerDiv{
	position : absolute;
	top : 17px;
	left : 95%;
	z-index : 10;
	display : none;
}
#zoomIframe{
	position : absolute;
	top : -200px;
	left : 0px;
	z-index : 11;
}
#zoomSettingDiv{
	position : absolute;
	top : 70px;
	left : 95%;
	z-index : 56;
}
.flexDiv{
	display : flex;
}
#rotateZoomBtn{
	margin-right: 10px;
}


 .logo2 { 
     width: 18%; 
     margin-top: 1.35%; 
}

/* .HEADER{ */
/*   POSITION: STICKY; */
/*   TOP: 0PX; */
/* } */

 .headerbar {
     background-color: #fbfbfb; 
     width: 100%; 
     height: 50px; 
     position: fixed; 
     top: 0; 
     z-index: 30;
} 

</style>

<div id="headerDiv" style="display:none">
	<button class="btn btn-light btn-rounded waves-effect" id="camBtn"><i class="ri-camera-line" style="zoom:1.5"></i></button>
</div>
<div id="zoomSettingDiv" class="flexDiv" style="display:none;">
	<button class="btn btn-light btn-rounded waves-effect" id="closeZoomBtn"><i class="ri-close-line" style="zoom:1.5"></i></button>
</div>

<iframe src="/zoom" style="width:526px; height:1400px;display:none;" id="zoomIframe">

</iframe>

<div class="header" align="center" >
	<div class="headerbar">
		<img class="logo2 logoLogin" src="${pageContext.request.contextPath }/resources/images/appImg/alphaPet.png" />
	</div>
</div>
		

<script>

document.getElementById("camBtn").addEventListener("click", (e)=>{
	let petName = document.getElementById("selectPet").value;
	document.getElementById('zoomIframe').contentWindow.document.zoomForm.joinBtn.click();
// 	cloneSelector();
	
	Swal.fire({
		title: petName + "의 상태를 살펴보시겠습니까?",
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        reverseButtons: true
	 }).then((result) => {
		 if(result.isConfirmed){
			 let patId = $("#headerPatSelector option:selected").attr("data-patId");
		 }
 			document.getElementById('zoomIframe').contentWindow.document.getElementById("join-btn").click();
			setTimeout(() => setZoom(), 2000);
		 })
})
// function cloneSelector(){
// 	let cloneSelector = document.getElementById("selectPet2").cloneNode("true");
// 	cloneSelector.id="headerPatSelector";
// 	cloneSelector.style.display = "";
// 	document.getElementById("cloneDiv").appendChild(cloneSelector);
// }

function setZoom(){
	document.getElementById("zoomIframe").style.display="";
	document.getElementById("zoomSettingDiv").style.display="";
}

document.getElementById("closeZoomBtn").addEventListener("click", (e) =>{
	document.getElementById("zoomIframe").style.display="none";
	document.getElementById("zoomSettingDiv").style.display="none";
	
	Swal.fire({
        title: "영상이 종료되었습니다.",
        showCancelButton: false,
        confirmButtonColor: '#3085d6',
        confirmButtonText: '확인',
        reverseButtons: true
    })
})
</script>