<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.banner{ 
	width: 98%; 
	height: 130px; 
/* 	margin-top: -30px; */
	border-radius: 20px;
	}
</style>


	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	    <div class="carousel-inner" role="listbox" align="center">
	        <div class="carousel-item">
	            <img class="d-block img-fluid banner" src="${pageContext.request.contextPath}/resources/images/app/catbanner.jpg" alt="First slide">
	        </div>
	        <div class="carousel-item active carousel-item-start">
	            <img class="d-block img-fluid banner" src="${pageContext.request.contextPath}/resources/images/app/dogbanner.jpg" alt="Second slide">
	        </div>
	        <div class="carousel-item carousel-item-next carousel-item-start">
	            <img class="d-block img-fluid banner" src="${pageContext.request.contextPath}/resources/images/app/dogdogd.jpg" alt="Third slide">
	        </div>
	    </div>
	    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
	        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	    </a>
	    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
	        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	    </a>
	</div>