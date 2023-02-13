<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="card">
	<div class="card-body">
	
		<form name="appContentForm" action="/insertAppContent" method="post">
			<select name="abType" id="sendType" class="form-select">
				<option value="병원 Check">병원 Check</option>
				<option value="생활 Check">생활 Check</option>
				<option value="펫과사전">펫과사전</option>
			</select>	
		
			<label>제목</label>
			<input name="abTitle" class="form-control" placeholder="제목"/>
	
			<label>작성자</label>
			<input name="abWriter" value="ALPHA_PET" class="form-control"/>
	
			<label>내용</label>
			<textarea id="abCon" name="abCon" class="form-control" rows="14"></textarea>
			
<!-- 			<label>타이틀 이미지</label> -->
<!-- 			<input type="file" id="abImgFile" name="abImgFile" value="" onchange="readURL(this);"/> -->
			
			<input type="submit" value="떠언쏭" />
		</form>
	
	</div>
</div>

<script>
$(function(){
	CKEDITOR.replace('abCon',{
		uiColor: '#ffffff',
		defaultLanguage: 'ko',
		language: 'ko',
		extraPlugins: 'editorplaceholder',
		editorplaceholder: 'Start typing here...!',
		width: '100%',
		height: 600,
		extraPlugins: 'easyimage',
	    removePlugins: 'image',
	    footnotesPrefix: 'a'
// 	    cloudServices_tokenUrl: 'https://91531.cke-cs.com/token/dev/[내프로젝트(대시보드) 토큰]?limit=10',
// 		cloudServices_uploadUrl: 'https://91531.cke-cs.com/easyimage/upload/'
	})
});

// const appContentForm = document.appContentForm;

// appContentForm.addEventListener("submit", (e) => {
// 	e.preventDefault();
	
// 	let data =  new FormData($("#appContentForm")[0]);
// 	data.append("abImgFile", $("#appContentForm")[0].abImgFile.files[0]);
	
// 	let data =  $("#appContentForm").serialize();

// 	$.ajax({
// 		method : "post",
// 		url : "/insertAppContent",
// 		data : data,
// 		dataType : "text",
// 		contentType : "application/json;charset=utf-8",
// 		processData : false,
// 		success : function(rslt){
// 			alert();
// 		}
// 	})
// })

</script>