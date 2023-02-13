<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sec:authentication property="principal" var="principal" />

<style>
    .app-search .form-control {
        background-color: white;
        border: 1px solid #bcbccc;
    }

    .position-relative > .searchResult {
        z-index: 999;
    }

	.searchResult > a {
		width: 250px;		
	}
	#page-topbar{
		z-index : 1;
	}
	.ui-menu ui-widget ui-widget-content ui-autocomplete ui-front{
		
	}
</style>
<header id="page-topbar">
    <div class="navbar-header">
        <div class="d-flex">
            <!-- LOGO -->
            <div class="navbar-brand-box">
                <a href="#" class="logo logo-dark">
                    <span class="logo-sm">
                        <img
                            src="${pageContext.request.contextPath }/resources/assets/images/로고.png"
                            alt=""
                            height="22"
                        />
                    </span>
                    <span class="logo-lg">
                        <img
                            src="${pageContext.request.contextPath }/resources/assets/images/로고.png"
                            alt=""
                            height="20"
                        />
                    </span>
                </a>

                <a href="#" class="logo logo-light">
                    <span class="logo-sm">
                        <img
                            src="${pageContext.request.contextPath }/resources/assets/images/로고.png"
                            alt=""
                            height="22"
                        />
                    </span>
                    <span class="logo-lg">
                        <img
                            src="${pageContext.request.contextPath }/resources/assets/images/로고big.png"
                            alt=""
                            height="20"
                        />
                    </span>
                </a>
            </div>

            <button
                type="button"
                class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn"
            >
                <i class="fa fa-fw fa-bars"></i>
            </button>
     <div style="vertical-align: center; padding: 10px; padding-top: 20px;">
		<span  style="text-align: center; color: gray;" id="toDayPtag0"></span> <span  id="toDayPtag" ></span>
	</div>
            <!-- App Search-->
<!--             <form class="app-search d-none d-lg-block"> -->
<!--                 <div class="position-relative" id="headerSearchBar"> -->
<!--                     <input -->
<!--                         type="text" -->
<!--                         class="form-control" -->
<!--                         id="search" -->
<!--                         placeholder="Search..." -->
<!--                     /> -->
<!--                     <span class="ri-search-line"></span> -->
<!--                    
<!-- 					<button class="ri-search-line" style="border: none;"> -->
<!-- 					</button> -->
<!-- 				    --> 
<!--                     <div -->
<!--                         id="searchResult" -->
<!--                         class="searchResult list-group position-absolute" -->
<!--                     ></div> -->
<!--                 </div> -->
<!--             </form> -->
        </div>

        <div class="d-flex">
            <div class="dropdown d-inline-block d-lg-none ms-2">
                <button
                    type="button"
                    class="btn header-item noti-icon waves-effect"
                    id="page-header-search-dropdown"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                >
                    <i class="ri-search-line"></i>
                </button>
                <div
                    class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                    aria-labelledby="page-header-search-dropdown"
                >
                    <form class="p-3">
                        <div class="mb-3 m-0">
                            <div class="input-group">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Search ..."
                                />
                                <div class="input-group-append">
                                    <button
                                        class="btn btn-primary"
                                        type="submit"
                                    >
                                        <i class="ri-search-line"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="dropdown d-none d-lg-inline-block ms-1">
                <button
                    type="button"
                    class="btn header-item noti-icon waves-effect"
                    data-bs-toggle="fullscreen" style="display:none;"
                >
                    <i class="ri-fullscreen-line"></i>
                </button>
            </div>

            <div class="dropdown d-inline-block d-lg-inline-block">
                <button
                    type="button"
                    class="btn header-item noti-icon waves-effect"
                    id="page-header-chatting-dropdown"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                >
                    <i class="ri-wechat-2-line"></i>
                    <span id="chatNotiDot" class=""></span>
                </button>
                <div
                    class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                    aria-labelledby="page-header-chatting-dropdown"
                    onclick="event.stopPropagation()"
                    style="width: 350px; height: 700px"
                >
                    <!-- 채팅방 시작-->
                    <div class="p-3" id="chatRoomsDiv">
                        <ul
                            class="nav nav-tabs nav-tabs-custom nav-justified"
                            role="tablist"
                        >
                            <li class="nav-item">
                                <a
                                    href="#chat"
                                    data-bs-toggle="tab"
                                    class="nav-link active"
                                    aria-selected="true"
                                >
                                    <span>ChatRoom</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a
                                    href="#group"
                                    data-bs-toggle="tab"
                                    class="nav-link"
                                    aria-selected="false"
                                >
                                    <span>emp</span>
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content pb-3">
                            <div
                                class="tab-pane active"
                                id="chat"
                                role="tabpanel"
                                data-simplebar="init"
                            >
                                <div style="height: 570px">
                                    <div class="tab-content py-3">
                                        <ul
                                            class="list-unstyled chat-list"
                                            id="chatRoomUl"
                                        ></ul>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <ul
                                        class="list-inline user-chat-nav text-end mb-0"
                                    >
<!--                                         										<li class="list-inline-item d-none d-sm-inline-block"> -->
<!--                                         											<input type="text" value="" name="searchEmpInput" id="searchEmp" style="display:none;border:none; border-bottom: 1px solid gray;"/> -->
<!--                                         										</li> -->
                                        <li
                                            class="list-inline-item d-none d-lg-inline-block"
                                        >
                                            <form
                                                class="app-search d-none d-md-block"
                                            >
                                                <div class="position-relative">
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        placeholder="Search..."
                                                    />
                                                    <span
                                                        class="ri-search-line"
                                                    ></span>
                                                </div>
                                            </form>
                                        </li>
                                        <li
                                            class="list-inline-item d-none d-lg-inline-block"
                                        >
                                            <div class="dropdown">
                                                <button
                                                    onclick="addChatRoomBtn()"
                                                    class="btn nav-btn"
                                                    type="button"
                                                >
                                                    <i
                                                        class="ri-wechat-2-line font-size-18"
                                                    ></i>
                                                </button>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div
                                class="tab-pane"
                                id="group"
                                role="tabpanel"
                                style="height: 600px"
                                data-simplebar="init"
                            >
                                <div class="tab-content py-3">
                                    <ul
                                        class="list-unstyled chat-list"
                                        id="chatEmpUl"
                                    >
                                        <li style="width: 100%">
                                            <a href="#">
                                                <div
                                                    class="d-flex align-items-center"
                                                >
                                                    <div
                                                        class="align-self-center me-3"
                                                    >
                                                        <i
                                                            class="mdi mdi-circle text-success font-size-10"
                                                        ></i>
                                                    </div>
                                                    <div
                                                        class="align-self-center me-3"
                                                    >
                                                        <img
                                                            class="rounded-circle header-profile-user"
                                                            src=""
                                                        />
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <h5
                                                            class="font-size-14 mb-0"
                                                        >
                                                            General
                                                        </h5>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <form
                                    name="chatEmpsForm"
                                    id="chatEmpsForm"
                                    style="display: none"
                                >
                                    <div class="flexDiv">
                                        <input
                                            type="text"
                                            name="chRoomName"
                                            value=""
                                            class="form-control"
                                            style="
                                                width: 100%;
                                                margin-right: 5px;
                                            "
                                            placeholder="채팅방 이름을 입력해주세요."
                                        />
                                        <input
                                            type="text"
                                            name="chatEmpId"
                                            value=""
                                            style="display: none"
                                        />
                                        <input
                                            type="submit"
                                            class="btn btn-light waves-effect"
                                            id="confirmChatEmpBtn"
                                            value="확인"
                                        />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--채팅방 끝 -->

                    <!-- 채팅 시작 -->
                    <div
                        class="p-3"
                        id="chatRoomDiv"
                        style="display: none"
                        data-roomNm=""
                        data-emps=""
                    >
                        <div class="row align-items-center">
                            <div class="col">
                                <i
                                    class="ri-arrow-left-line font-size-20"
                                    id="goChatRoomsDiv"
                                ></i>
                                <h5 class="m-0" style="display: inline-block">
                                    <span>Anthony Kelly</span>
                                </h5>
                            </div>
                            <div class="col-auto">	<!-- 채팅방 내용 검색 부분!!! -->
                                <ul
                                    class="list-inline user-chat-nav text-end mb-0" style="display:none;"
                                >
                                    <li
                                        class="list-inline-item d-none d-sm-inline-block"
                                    >
                                        <div class="dropdown">
                                            <button
                                                class="btn nav-btn dropdown-toggle"
                                                type="button"
                                                data-bs-toggle="dropdown"
                                                aria-haspopup="true"
                                                aria-expanded="false"
                                            >
                                                <i
                                                    class="mdi mdi-magnify font-size-18"
                                                ></i>
                                            </button>
                                            <div
                                                class="dropdown-menu dropdown-menu-end dropdown-menu-md"
                                            >
                                                <form class="p-3">
                                                    <div class="m-0">
                                                        <div
                                                            class="input-group"
                                                        >
                                                            <input
                                                                type="text"
                                                                class="form-control"
                                                                placeholder="Search ..."
                                                                aria-label="Recipient's username"
                                                            />
                                                            <button
                                                                class="btn btn-primary"
                                                                type="submit"
                                                            >
                                                                <i
                                                                    class="mdi mdi-magnify"
                                                                ></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div
                            class="chat-conversation p-3 my-4"
                            data-simplebar
                            style="height: 530px"
                        >
                            <ul
                                class="list-unstyled chat-list"
                                style="zoom: 0.9"
                            ></ul>
                        </div>
                        <div class="p-2 chat-input-section border-top">
                            <form name="chatForm" id="chatForm">
                                <div class="row">
                                    <div class="col-10">
                                        <div class="position-relative">
                                            <input
                                                type="text"
                                                name="chRoomNm"
                                                value=""
                                                style="display: none"
                                            />
                                            <input
                                                type="text"
                                                name="receiver"
                                                value=""
                                                style="display: none"
                                            />
                                            <input
                                                type="text"
                                                name="chCon"
                                                value=""
                                                class="form-control chat-input"
                                                placeholder="Enter Message..."
                                            />
                                            <div class="chat-input-links">
                                                <!-- 											<ul class="list-inline mb-0"> -->
                                                <!-- 												<li class="list-inline-item" id="tooltip-containeremoji"> -->
                                                <!-- 													<a href="#" data-bs-container="#tooltip-containeremoji" data-bs-toggle="tooltip" data-bs-placement="top" title="Emoji"> -->
                                                <!-- 													<i class="mdi mdi-emoticon-happy-outline"></i> -->
                                                <!-- 												</a> -->
                                                <!-- 												</li> -->

                                                <!-- 												<li class="list-inline-item" id="tooltip-containerimages"> -->
                                                <!-- 													<a href="#" data-bs-container="#tooltip-containerimages" data-bs-toggle="tooltip" data-bs-placement="top" title="Images">  -->
                                                <!-- 													<i class="mdi mdi-file-image-outline"></i> -->
                                                <!-- 												</a> -->
                                                <!-- 												</li> -->
                                                <!-- 											</ul> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1" style="padding: 0px">
                                        <button
                                            type="button"
                                            onclick="sendChat()"
                                            class="btn btn-primary btn-rounded chat-send w-sm waves-effect waves-light"
                                            style="min-width: 9px"
                                        >
                                            <i class="mdi mdi-send"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 채팅 끝 -->

            <div class="dropdown d-inline-block">
                <button
                    type="button"
                    class="btn header-item noti-icon waves-effect"
                    id="page-header-notifications-dropdown"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                >
                    <i class="ri-notification-3-line"></i>
                    <span id="alarmNotiDot" class=""></span>
                </button>

                <!--     알림 내역 시작 -->
                <div
                    class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                    aria-labelledby="page-header-notifications-dropdown"
                    onclick="event.stopPropagation()"
                >
                    <div class="p-3">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="m-0">알림</h6>
                            </div>
                            <div class="col-auto">
                                <a href="#!" class="small"></a>
                            </div>
                        </div>
                    </div>
                    <div
                        data-simplebar
                        id="alarmsDiv"
                        style="max-height: 230px"
                    >
                        <!-- 알림 세부 내역 -->
                        <h6 class="mt-0 mb-1">알람 내역이 없습니다.</h6>
                    </div>
                    <div class="p-2 border-top">
                        <div class="d-grid">
                            <a
                                class="btn btn-sm btn-link font-size-14 text-center"
                                href="/myHome"
                            >
                                <i class="mdi mdi-arrow-right-circle me-1"></i>
                                	더보기
                            </a>
                        </div>
                    </div>
                </div>
                <!--    알림 내역 끝 -->
            </div>

            <div class="dropdown d-inline-block user-dropdown">
                <button
                    type="button"
                    class="btn header-item waves-effect"
                    id="page-header-user-dropdown"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                >
                    <img
                        class="rounded-circle header-profile-user"
                        id="userProfile"
                        src="${pageContext.request.contextPath }${principal.empVO.empProfile }"
                        alt="Header Avatar"
                    />
                </button>
                <div
                    class="dropdown-menu dropdown-menu-lg dropdown-menu-end"
                    onclick="event.stopPropagation()"
                >
                    <!--                     <div class="p-3">
                        <div class="row align-items-center">
                        </div>
                    </div> -->
                    <div data-simplebar style="max-height: 230px">
                        <!-- 마이페이지 -->
                        <a href="/myHome" class="text-reset notification-item">
                            <div class="d-flex align-items-center">
                                <div class="avatar-xs me-3 mt-1">
                                    <span
                                        class="avatar-title bg-soft-primary rounded-circle font-size-16"
                                    >
                                        <i
                                            class="ri-user-line text-primary font-size-16"
                                        ></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 text-truncate">
                                    <h6 class="mb-1">마이페이지</h6>
                                </div>
                            </div>
                        </a>
                        <!-- item-->
                        <div class="pt-2 border-top">
                            <div class="d-grid">
                                <form
                                    action="/logout"
                                    method="post"
                                    style="text-align: center"
                                >
                                    <sec:csrfInput />
                                    <button
                                        class="btn btn-sm btn-link font-size-14 text-center"
                                    >
                                        <i
                                            class="ri-shut-down-line align-middle me-1"
                                        ></i>
                                        Logout
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="dropdown d-inline-block">
                    <button
                        type="button"
                        class="btn header-item noti-icon right-bar-toggle waves-effect" style="display:none;"
                    >
                        <i class="ri-settings-2-line"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 알람 클론용 a 태그 시작 -->
    <a
        id="alarmCloneA"
        href="#"
        class="text-reset notification-item"
        style="display: none"
    >
        <div class="d-flex align-items-center">
            <div class="avatar-xs me-3 mt-1">
                <span
                    class="avatar-title bg-primary rounded-circle font-size-16"
                >
                    <i class="ri-cake-2-line"></i>
                </span>
                <div class="noti-top-icon">
                    <i class="mdi mdi-heart text-white bg-danger"></i>
                </div>
            </div>
            <div class="flex-grow-1 text-truncate">
                <h6 class="mt-0 mb-1">
                    <span>제목</span>
                    <span class="mb-1 text-muted fw-normal"> 내용 </span>
                </h6>
                <p class="mb-0 font-size-12">
                    <i class="mdi mdi-clock-outline"></i>
                    <span>날짜</span>
                </p>
            </div>
            <div></div>
        </div>
    </a>
    <!-- 알람 클론용 a 태그 끝 -->

    <!-- 채팅 클론용 li 태그1 시작 -->
    <li style="width: 100%; display: none" class="chatEmpLi" id="chatEmpLi">
        <!-- id : chatEmp + empId -->
        <a href="#" class="" onclick="selectChatEmp(this)">
            <div class="d-flex align-items-center">
                <div class="align-self-center me-3">
                    <i class="mdi mdi-circle text-danger font-size-10"></i>
                </div>
                <div class="avatar-xs me-3">
                    <img class="rounded-circle header-profile-user" src="" />
                </div>
                <div class="flex-grow-1">
                    <h5 class="font-size-14 mb-0">General</h5>
                </div>
            </div>
        </a>
    </li>
    <!-- 채팅 클론용 li 태그1 끝 -->

    <!-- 채팅 클론용 li 태그 2 시작 -->
    <li
        style="width: 100%; display: none"
        class="chatRoomLi"
        id="chatRoomLi"
        onclick="showChat(this)"
    >
        <a href="#">
            <div class="d-flex">
                <div class="avatar-xs align-self-center me-3">
                    <span
                        class="avatar-title rounded-circle bg-soft-primary text-primary"
                        style="min-width: 35px"
                        >K</span
                    >
                </div>
                <div class="flex-grow-1 overflow-hidden">
                    <h5 class="text-truncate font-size-14 mb-1">Adam Miller</h5>
                    <input
                        type="text"
                        class="chRoomEmpsInput"
                        name="chRoomNm"
                        value=""
                        style="display: none"
                    />
                    <p class="text-truncate mb-0">
                        I've finished it! See you so
                    </p>
                </div>
                <div>
                    <div class="font-size-11">12 min</div>
                    <i class=""></i>
                </div>
            </div>
        </a>
    </li>
    <!-- 채팅 클론용 li 태그 2 끝 -->

    <!-- 클론용 상대방 채팅 말풍선 시작 -->
    <li id="yourChat" style="display: none; margin-left: -20px">
        <div class="conversation-list">
            <div class="d-flex">
                <img src="" class="rounded-circle avatar-xs" alt="" />
                <div class="flex-grow-1 arrow-left ms-1">
                    <p
                        class="conversation-name name"
                        style="margin: 3px; zoom: 0.9"
                    >
                        Anthony Kelly
                    </p>
                    <div class="flexDiv">
                        <div class="ctext-wrap" style="padding: 10px">
                            <p style="margin: 3px">Hello!</p>
                        </div>
                        <span style="zoom: 0.8">10:00</span>
                    </div>
                </div>
            </div>
        </div>
    </li>
    <!-- 클론용 상대방 채팅 말풍선 끝 -->

    <!-- 클론용 나의 채팅 말풍선 시작 -->
    <li id="myChat" class="right" style="display: none">
        <div class="conversation-list">
            <div class="d-flex">
                <span style="zoom: 0.8">10:02</span>
                <div class="flex-grow-1 arrow-right me-1">
                    <div class="ctext-wrap" style="padding: 10px">
                        <p class="conversation-name name"></p>
                        <p style="margin: 3px">
                            Hi, How are you? What about our next meeting?
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </li>
    <!-- 클론용 나의 채팅 말풍선 끝 -->

    <!-- 클론용 채팅 표시선 시작 -->
    <li id="chatDateLi" style="display: none">
        <div class="chat-day-title">
            <span class="title">Today</span>
        </div>
    </li>
    <!-- 클론용 채팅 표시선 끝 -->
</header>

<!-- <script>
$(function(){
	var userProfile = document.querySelector("#userProfile");
	
	$.ajax({
		url : "/myInfo",
		type : "post",
		data : {
			empId : `${principal.username }` 
		},
		success : function(empVO) {
			//var empProfile = empVO.empProfile
			console.log(empVO);
			console.log($(userProfile).attr("src"));
			console.log(empVO.empProfile);
			
		}
	})
})
</script> -->
