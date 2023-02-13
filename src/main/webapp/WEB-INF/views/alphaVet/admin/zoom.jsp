<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
zoom Test 입니당.<br/>
<input type="button" value="카메라버튼" id="camBtn"/>
<iframe src="/zoom" style="width:100%; height:700px;display:none;" id="zoomIframe">

</iframe>


<script>
document.getElementById("camBtn").addEventListener("click", (e)=>{
	document.getElementById('zoomIframe').contentWindow.document.zoomForm.joinBtn.click();
	setTimeout(() => document.getElementById("zoomIframe").style.display="", 1000);
})
</script>