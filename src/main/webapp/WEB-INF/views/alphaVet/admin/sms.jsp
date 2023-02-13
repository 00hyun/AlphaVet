<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- 메세지 전송 예제 시작 (MessageController)-->
<script>
function sendMessage(){
	let data = {
		phoneNumber : document.testSMS.phoneNumber.value,
		content : document.testSMS.content.value
	}
	$.ajax({
		method : "post",
		url : "/sendMSG",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		dataType : "text",
		processData : false,
		success : function(){
			alert("메세지 전송 완료!");
		}
	});
}
</script>
<!-- 메세지 전송 예제 끝 -->
문자
<form name="testSMS">
	<input type="text" name="phoneNumber" value="01044579605">
	<textarea rows="15" cols="20" name="content"></textarea>	
	<input type="button" onclick="sendMessage()" value="문자 전송"/>
</form>
