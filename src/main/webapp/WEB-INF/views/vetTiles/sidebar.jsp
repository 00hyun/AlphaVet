<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sec:authentication property="principal" var="principal" />

<style>
.menuStyle{
	font-size: 1.15em;
 	font-family: 'IBM Plex Sans KR', sans-serif;
 	font-weight: 600;
}

.vertical-menu{
	background: #ffffff;
}

.metismenu li {
	margin : 0px;
}

.metismenu li a i{
	background-color: rgb(108 111 245 / 0%)!important;
}

.metismenu li >a {
    border-radius: 0.25rem;
}
</style>

<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu" style="position:fixed;">

    <!-- LOGO -->
    <div class="navbar-brand-box">
        <a href="#" class="logo logo-dark">
            <span class="logo-sm">
                <img src="${pageContext.request.contextPath }/resources/assets/images/vetMini.png" alt="" width="40">
            </span>
            <span class="logo-lg">
                <img src="${pageContext.request.contextPath }/resources/assets/images/vetLogo.png" alt="" height="13" style="zoom:3">
            </span>
        </a>

        <a href="#" class="logo logo-light">
            <span class="logo-sm">
                <img src="${pageContext.request.contextPath }/resources/assets/images/vetMini.png" alt="" width="40">
            </span>
            <span class="logo-lg">
                <img src="${pageContext.request.contextPath }/resources/assets/images/vetLogo.png" alt="" height="13">
            </span>
        </a>
    </div>

    <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
        <i class="fa fa-fw fa-bars"></i>
    </button>

    <div data-simplebar class="sidebar-menu-scroll">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
            
            <!--                 /////////////////////////////////////////// -->
            
<!--               <li class="menu-title">Menu</li> -->

				<li><a href="/" class="waves-effect"> <i
						class="fas fa-home"></i>  <span class="menuStyle"><b>홈</b></span>
				</a></li>
				
					<li>
						<a href="/wonmu" onclick="return checkAuth('/wonmu', 'ROLE_WONMU');" class="waves-effect"><i class="fas fa-desktop"></i> <span class="menuStyle"><b>원무</b></span></a>
					</li>
				
				<li>
					<a href="/medic" onclick="return checkAuth('/medic', 'ROLE_MEDIC');" class="waves-effect"> <i class="fas fa-hospital-user"></i>  <span class="menuStyle"><b>진료</b></span></a>
				</li>
				
				<li>
					<a href="/reservation" onclick="return checkAuth('/reservation', 'ROLE_RES');" class="waves-effect"> <i class="fas fa-calendar-alt"></i>  <span class="menuStyle"><b>예약</b></span></a>
				</li>
				
				<li>
					<a href="/enter" onclick="return checkAuth('/enter', 'ROLE_ENTER');" class="waves-effect"> <i class="fas fa-bed"></i>  <span class="menuStyle"><b>입원</b></span></a>
				</li>
				
				<li>
					<a href="/admin" onclick="return checkAuth('/admin', 'ROLE_ADMIN');" class="waves-effect"> <i class="fas fa-tools"></i>  <span class="menuStyle"><b>관리</b></span></a>
				</li>
<!--             //////////////////////////////// -->

<!--                 <li> -->
<!--                     <a href="javascript: void(0);" class="has-arrow waves-effect"> -->
<!--                         <i class="ri-profile-line"></i> -->
<!--                         <span>Utility</span> -->
<!--                     </a> -->
<!--                     <ul class="sub-menu" aria-expanded="false"> -->
<!--                         <li><a href="pages-starter.html">Starter Page</a></li> -->
<!--                         <li><a href="pages-maintenance.html">Maintenance</a></li> -->
<!--                         <li><a href="pages-comingsoon.html">Coming Soon</a></li> -->
<!--                         <li><a href="pages-timeline.html">Timeline</a></li> -->
<!--                         <li><a href="pages-faqs.html">FAQs</a></li> -->
<!--                         <li><a href="pages-pricing.html">Pricing</a></li> -->
<!--                         <li><a href="pages-404.html">Error 404</a></li> -->
<!--                         <li><a href="pages-500.html">Error 500</a></li> -->
<!--                     </ul> -->
<!--                 </li> -->
			</ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->

<script>
const authArray = [];

<c:forEach items="${principal.empVO.empAuthVOList}" var="empAuth">
	authArray.push('<c:out value="${empAuth.empAuthName}"/>')		
</c:forEach>
function checkAuth(url, auth){
	
	for(let i=0; i<authArray.length; i++){
		if(auth === authArray[i]) return true;
	}
		
	Swal.fire({
          title: "해당 메뉴에 접근 권한이 없습니다.",
			icon: 'warning',
          showCancelButton: true,
           confirmButtonColor: '#3085d6',
           confirmButtonText: '확인',
           reverseButtons: true
       })
	return false;
}
</script>