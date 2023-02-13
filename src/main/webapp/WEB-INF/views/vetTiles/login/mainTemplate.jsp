<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AlphaVet</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
<meta content="Themesdesign" name="author" />
<!-- App favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/icon_mini.ico" />

<%-- <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> --%>
<%-- <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" /> --%>
<%-- <link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" /> --%>

<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath }/resources/assets/js/pages/form-validation.init.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<!-- 폰트 끝-->

<style type="text/css">
html, body {
	height: 100%;
	font-family: 'IBM Plex Sans KR', sans-serif;
}

html { 

}

</style>

</head>

<!-- <body class="authentication-bg d-flex align-items-center min-vh-100 py-5"> -->
<!-- JAVASCRIPT -->
	<div class="container">
		<div class="row">
<!-- 	        <div class="col-lg-12"> -->
<!-- 	            <div class="text-center"> -->
<!-- 	                <a href="index.html" class="d-block auth-logo"> -->
<%-- 	                    <img src="${pageContext.request.contextPath }/resources/assets/images/vetLogo.png" alt="" height="80" class="logo logo-dark mx-auto"> --%>
<!-- 	                </a> -->
<!-- 	            </div> -->
<!-- 	        </div> -->
	    </div>
	    <div class="row justify-content-center">
	       	<div class="col-md-8 col-lg-6 col-xl-5">
	        	<div class="p-4">
	    			<tiles:insertAttribute name="content"/>
	    		</div>
	   		</div>
		</div>
	</div>

</body>




</html>