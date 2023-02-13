<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
    <title>Zoom WebSDK</title>
    <meta charset="utf-8" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.9.5/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.9.5/css/react-select.css" />
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="origin-trial" content="">
</head>
<style>
.upperDiv{
	position:fixed;
	z-index:100;
	top:0px;
	left:0px;
	width:100%;
	height:100%;
	background-color : white;
	}
</style>
<body>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/react.min.js"></script>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/react-dom.min.js"></script>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/redux.min.js"></script>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/redux-thunk.min.js"></script>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/lodash.min.js"></script>
    <script src="https://source.zoom.us/zoom-meeting-2.9.5.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/tool.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/vconsole.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/meeting.js"></script>
    
<!--     <div class="upperDiv"> -->
<!-- 		<input type="button" id="joinBtn" value="영상보기"/> -->
<!-- 	</div>  -->

</body>
<script>
// document.getElementById("joinBtn").addEventListener("click", (e)=>{
// 	document.getElementById("join-btn").click();
// 	setTimeout(() => document.querySelectorAll(".upperDiv")[0].style.display="none", 2000);
// })
</script>
</html>