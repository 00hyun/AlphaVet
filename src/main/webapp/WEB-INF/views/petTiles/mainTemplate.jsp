<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/appImg/petpet.ico">
<link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery-ui-dist/jquery-ui.min.js"></script>

<script src="${pageContext.request.contextPath }/resources/assets/libs/chart.js/Chart.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>



<!-- twitter-bootstrap-wizard js -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/twitter-bootstrap-wizard/prettify.js"></script>

<!-- form wizard init -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/form-wizard.init.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300&display=swap" rel="stylesheet">
<!-- 폰트 끝-->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/core/main.min.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/daygrid/main.min.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/bootstrap/main.min.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@fullcalendar/timegrid/main.min.css" type="text/css"/>

<!-- Development -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>



<style>
body{
	zoom : 2.0;
	font-family: 'IBM Plex Sans KR', sans-serif;
	background-color: #e6eef7;
}

/*로딩*/
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.8;
	background: white;
	z-index: 99999;
	text-align: center;
}

#load > img {
	position: absolute;
	top: 35%;
	left: 37%;
	z-index: 100;
	width: 150px;
}

/*스크롤바 없애는 기능 // 이동할 때 틀어져서 해놓음*/
body{
 -ms-overflow-style: none;
 }
::-webkit-scrollbar {
  display: none;
}

option{
	zoom : 0.6;
	font-size : 1.1em;
}

select{
	font-size : 1.1em;
}

#main{
	padding-top: 50px;
	padding-bottom: 150px;
}

/*로딩 끝*/

/* 	#head{
		position : fixed;
		margin : auto;
		background-color : lightgray;
		width : 100%;
		height : 120px;
		z-index: 1;
	} */
/* 	#main{
		position : relative;
		top : 120px;
		z-index: -1;
	} */
/* 	#foot{
		position : fixed;
		top : 900px;
		background-color : lightgray;
		width : 100%;
		height : 100px;
	} */
	
#camBtn{
	margin-top: 50px;
}
</style>
<meta charset="UTF-8">
<title>alphaPet</title>
</head>
<body>
    <!-- 로딩 -->
    <div id="load" align="left">
		<img src="${pageContext.request.contextPath }/resources/images/dogdog.gif" alt="loading">
	</div>
	<!-- 로딩 끝-->
	<div id="head">
		<tiles:insertAttribute name="header" /> 
	</div>
	<div id="main">
		<tiles:insertAttribute name="content" />
	</div>
	<div id="foot">
		<tiles:insertAttribute name="footer" />
	</div>
	
	
	
	
	
	

</body>

<script>
//실험중.. 로딩

$(window).on('load', function() {
    setTimeout(function(){
        $("#load").fadeOut();
    }, 1000);
});



</script>

</html>