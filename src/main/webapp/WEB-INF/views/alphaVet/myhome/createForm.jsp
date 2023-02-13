<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 공지사항 -->
<form method="post" id = "createForm1" style = "display: none">
	<p class="card-title-desc">개인정보, 명예회손 및 욕설, 혐오 등의 내용이 포함된 경우 임의 삭제될 수 있습니다.</p>
	<!-- 제목 -->
	<div class="row mb-3">
		<label for="example-text-input" class="col-sm-2 col-form-label"><h4>제목</h4></label>
		<div class="col-sm-10">
        	<input class="form-control" type="text" placeholder="제목을 입력해주세요." id="noticeFormTitle" name = "boTitle">
        </div>
	</div>
	<!-- 내용 -->
	<textarea id="elm1" name="boCon"></textarea>
	<!-- <input type="file" id = "baby" multiple="multiple"> -->
	<input type = "hidden" value = "1689013" name = "empId">
	<button class="btn btn-primary" type="button" id = "noticeFormBtn">등록</button>
</form>


<!-- 경조사 -->
<form method="post" id = "createForm2" style = "display: none">
	<p class="card-title-desc">개인정보, 명예회손 및 욕설, 혐오 등의 내용이 포함된 경우 임의 삭제될 수 있습니다.</p>
	<!-- 제목 -->
	<div class="row mb-3">
		<label for="example-text-input" class="col-sm-2 col-form-label"><h4>제목</h4></label>
		<div class="col-sm-10">
        	<input class="form-control" type="text" placeholder="제목을 입력해주세요." id="gyeongjosaFormTitle" name = "boTitle">
        </div>
	</div>
	<!-- 내용 -->
	<textarea id="elm2" name="boCon"></textarea>
	<!-- <input type="file" id = "baby" multiple="multiple"> -->
	<input type = "hidden" value = "1689013" name = "empId">
	<button class="btn btn-primary" type="button" id = "gyeongjosaFormBtn">등록</button>
</form>


<!-- 건의사항 -->
<form method="post" id = "createForm3" style = "display: none">
	<p class="card-title-desc">개인정보, 명예회손 및 욕설, 혐오 등의 내용이 포함된 경우 임의 삭제될 수 있습니다.</p>
	<!-- 제목 -->
	<div class="row mb-3">
		<label for="example-text-input" class="col-sm-2 col-form-label"><h4>제목</h4></label>
		<div class="col-sm-10">
        	<input class="form-control" type="text" placeholder="제목을 입력해주세요." id="complainFormTitle" name = "boTitle">
        </div>
	</div>
	<!-- 내용 -->
	<textarea id="elm3" name="boCon"></textarea>
	<!-- <input type="file" id = "baby" multiple="multiple"> -->
	<input type = "hidden" value = "1689013" name = "empId">
	<button class="btn btn-primary" type="button" id = "complainFormBtn">등록</button>
</form>


<!-- 학술 -->
<form method="post" id = "createForm4" style = "display: none">
	<p class="card-title-desc">개인정보, 명예회손 및 욕설, 혐오 등의 내용이 포함된 경우 임의 삭제될 수 있습니다.</p>
	<!-- 제목 -->
	<div class="row mb-3">
		<label for="example-text-input" class="col-sm-2 col-form-label"><h4>제목</h4></label>
		<div class="col-sm-10">
        	<input class="form-control" type="text" placeholder="제목을 입력해주세요." id="academicFormTitle" name = "boTitle">
        </div>
	</div>
	<!-- 내용 -->
	<textarea id="elm4" name="boCon"></textarea>
	<!-- <input type="file" id = "baby" multiple="multiple"> -->
	<input type = "hidden" value = "1689013" name = "empId">
	<button class="btn btn-primary" type="button" id = "academicFormBtn">등록</button>
</form>

<script>
$(document).ready(function(){
	$("#elm1").length&&tinymce.init({
		selector:"textarea#elm1",
		height:300,plugins:
			["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
			"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
			"save table contextmenu directionality emoticons template paste textcolor"],
			toolbar:"insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
			style_formats:
				[{title:"Bold text",inline:"b"},
				{title:"Red text",inline:"span",
				styles:{color:"#ff0000"}},
					{title:"Red header",block:"h1",styles:{color:"#ff0000"}},
				{title:"Example 1",inline:"span",classes:"example1"},
				{title:"Example 2",inline:"span",classes:"example2"},
				{title:"Table styles"},
				{title:"Table row 1",selector:"tr",classes:"tablerow1"}]
				
				})

	$("#elm2").length&&tinymce.init({
		selector:"textarea#elm2",
		height:300,plugins:
			["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
			"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
			"save table contextmenu directionality emoticons template paste textcolor"],
			toolbar:"insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
			style_formats:
				[{title:"Bold text",inline:"b"},
				{title:"Red text",inline:"span",
				styles:{color:"#ff0000"}},
					{title:"Red header",block:"h1",styles:{color:"#ff0000"}},
				{title:"Example 1",inline:"span",classes:"example1"},
				{title:"Example 2",inline:"span",classes:"example2"},
				{title:"Table styles"},
				{title:"Table row 1",selector:"tr",classes:"tablerow1"}]
				
				})

	$("#elm3").length&&tinymce.init({
		selector:"textarea#elm3",
		height:300,plugins:
			["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
			"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
			"save table contextmenu directionality emoticons template paste textcolor"],
			toolbar:"insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
			style_formats:
				[{title:"Bold text",inline:"b"},
				{title:"Red text",inline:"span",
				styles:{color:"#ff0000"}},
					{title:"Red header",block:"h1",styles:{color:"#ff0000"}},
				{title:"Example 1",inline:"span",classes:"example1"},
				{title:"Example 2",inline:"span",classes:"example2"},
				{title:"Table styles"},
				{title:"Table row 1",selector:"tr",classes:"tablerow1"}]
				
				})

	$("#elm4").length&&tinymce.init({
		selector:"textarea#elm4",
		height:300,plugins:
			["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
			"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
			"save table contextmenu directionality emoticons template paste textcolor"],
			toolbar:"insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
			style_formats:
				[{title:"Bold text",inline:"b"},
				{title:"Red text",inline:"span",
				styles:{color:"#ff0000"}},
					{title:"Red header",block:"h1",styles:{color:"#ff0000"}},
				{title:"Example 1",inline:"span",classes:"example1"},
				{title:"Example 2",inline:"span",classes:"example2"},
				{title:"Table styles"},
				{title:"Table row 1",selector:"tr",classes:"tablerow1"}]
				
				})

	$("#mailTa").length&&tinymce.init({
		selector:"textarea#mailTa",
		height:300,plugins:
			["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
			"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
			"save table contextmenu directionality emoticons template paste textcolor"],
			toolbar:"insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
			style_formats:
				[{title:"Bold text",inline:"b"},
				{title:"Red text",inline:"span",
				styles:{color:"#ff0000"}},
					{title:"Red header",block:"h1",styles:{color:"#ff0000"}},
				{title:"Example 1",inline:"span",classes:"example1"},
				{title:"Example 2",inline:"span",classes:"example2"},
				{title:"Table styles"},
				{title:"Table row 1",selector:"tr",classes:"tablerow1"}]
				
				})
});
</script>
