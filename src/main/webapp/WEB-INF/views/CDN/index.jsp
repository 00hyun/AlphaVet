<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</head>
    <style>
        .sdk-select {
            height: 34px;
            border-radius: 4px;
        }
        .zoomNavBar{
        	background-color : white;
        }
    </style>
<body>
	
    <nav id="nav-tool" class="navbar navbar-inverse navbar-fixed-top zoomNavBar" style="height:100%;">
        <div class="container">
            <div id="navbar" class="websdktest">
                <form class="navbar-form navbar-rtdight" name="zoomForm" id="meeting_form">
                    <div class="form-group">
                        <input type="text" name="display_name" id="display_name" value="허소영" maxLength="100"
                            placeholder="Name" class="form-control" required>
                    </div>
                    <div class="form-group" style="display:none;">
                        <input type="text" name="meeting_number" id="meeting_number" value="4505050562" maxLength="200"
                            style="width:150px" placeholder="Meeting Number" class="form-control" required>
                    </div>
                    <div class="form-group" style="display:none;">
                        <input type="text" name="meeting_pwd" id="meeting_pwd" value="VM5QGGNQ7gblljYasv96V2wvXHnnzS.1" style="width:150px"
                            maxLength="32" placeholder="Meeting Password" class="form-control">
                    </div>
                    <div class="form-group" style="display:none;">
                        <input type="text" name="meeting_email" id="meeting_email" value="" style="width:150px"
                            maxLength="32" placeholder="Email option" class="form-control">
                    </div>

                    <div class="form-group">
                        <select id="meeting_role" class="sdk-select">
                            <option value=0>Attendee</option>
                            <option value=1>Host</option>
                        </select>
                    </div>
                    <div class="form-group" style="display:none;">
                        <select id="meeting_china" class="sdk-select">
                            <option value=0>Global</option>
                            <option value=1>China</option>
                        </select>
                    </div>
                    <div class="form-group" style="display:none;">
                        <select id="meeting_lang" class="sdk-select">
                            <option value="ko-KO">Korean 한국어</option>
                            <option value="en-US">English</option>
                            <option value="de-DE">German Deutsch</option>
                            <option value="es-ES">Spanish Español</option>
                            <option value="fr-FR">French Français</option>
                            <option value="jp-JP">Japanese 日本語</option>
                            <option value="pt-PT">Portuguese Portuguese</option>
                            <option value="ru-RU">Russian Русский</option>
                            <option value="zh-CN">Chinese 简体中文</option>
                            <option value="zh-TW">Chinese 繁体中文</option>
                            <option value="vi-VN">Vietnamese Tiếng Việt</option>
                            <option value="it-IT">Italian italiano</option>
                        </select>
                    </div>

                    <input type="hidden" value="" id="copy_link_value" />
                    <button type="submit" class="btn btn-primary" name="joinBtn" id="join_meeting">Join</button>
                    <button type="submit" class="btn btn-primary" id="clear_all">Clear</button>
                    <button type="button" link="" onclick="window.copyJoinLink('#copy_join_link')" style="display:none;" class="btn btn-primary" id="copy_join_link">Copy Direct join link</button>


                </form>
            </div>
            <!--/.navbar-collapse -->
        </div>
    </nav>

    <script>
//         document.getElementById('show-test-tool-btn').addEventListener("click", function (e) {
//             var textContent = e.target.textContent;
//             if (textContent === 'Show') {
//                 document.getElementById('nav-tool').style.display = 'block';
//                 document.getElementById('show-test-tool-btn').textContent = 'Hide';
//             } else {
//                 document.getElementById('nav-tool').style.display = 'none';
//                 document.getElementById('show-test-tool-btn').textContent = 'Show';
//             }
//         })
    </script>

    <script src="https://source.zoom.us/2.9.5/lib/vendor/react.min.js"></script>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/react-dom.min.js"></script>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/redux.min.js"></script>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/redux-thunk.min.js"></script>
    <script src="https://source.zoom.us/2.9.5/lib/vendor/lodash.min.js"></script>
    <script src="https://source.zoom.us/zoom-meeting-2.9.5.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/tool.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/index.js"></script>

</body>

</html>